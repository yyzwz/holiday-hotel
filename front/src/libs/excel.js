import XLSX from 'xlsx';

function auto_width(ws, data){
    const colWidth = data.map(row => row.map(val => {
        if (val == null) {
            return {'wch': 10};
        }
        else if (val.toString().charCodeAt(0) > 255) {
            return {'wch': val.toString().length * 2};
        } else {
            return {'wch': val.toString().length};
        }
    }))
    let result = colWidth[0];
    for (let i = 1; i < colWidth.length; i++) {
        for (let j = 0; j < colWidth[i].length; j++) {
            if (result[j]['wch'] < colWidth[i][j]['wch']) {
                result[j]['wch'] = colWidth[i][j]['wch'];
            }
        }
    }
    ws['!cols'] = result;
}

function json_to_array(key, jsonData){
    return jsonData.map(v => key.map(j => { return v[j] }));
}

function fixdata(data) {
    let o = ''
    let l = 0
    const w = 10240
    for (; l < data.byteLength / w; ++l) o += String.fromCharCode.apply(null, new Uint8Array(data.slice(l * w, l * w + w)))
    o += String.fromCharCode.apply(null, new Uint8Array(data.slice(l * w)))
    return o
}

function get_header_row(sheet) {
    const headers = []
    const range = XLSX.utils.decode_range(sheet['!ref'])
    let C
    const R = range.s.r
    for (C = range.s.c; C <= range.e.c; ++C) { 
        var cell = sheet[XLSX.utils.encode_cell({ c: C, r: R })] 
        var hdr = 'UNKNOWN ' + C 
        if (cell && cell.t) hdr = XLSX.utils.format_cell(cell)
        headers.push(hdr)
    }
    return headers
}

export const export_table_to_excel= (id, filename) => {
    const table = document.getElementById(id);
    const wb = XLSX.utils.table_to_book(table);
    XLSX.writeFile(wb, filename);
}

export const export_json_to_excel = ({data, key, title, filename, autoWidth}) => {
    const wb = XLSX.utils.book_new();
    data.unshift(title);
    const ws = XLSX.utils.json_to_sheet(data, {header: key, skipHeader: true});
    if(autoWidth){
        const arr = json_to_array(key, data);
        auto_width(ws, arr);
    }
    XLSX.utils.book_append_sheet(wb, ws, filename);
    XLSX.writeFile(wb, filename + '.xlsx');
}

export const export_array_to_excel = ({key, data, title, filename, autoWidth}) => {
    const wb = XLSX.utils.book_new();
    const arr = json_to_array(key, data);
    arr.unshift(title);
    const ws = XLSX.utils.aoa_to_sheet(arr);
    if(autoWidth){
        auto_width(ws, arr);
    }
    XLSX.utils.book_append_sheet(wb, ws, filename);
    XLSX.writeFile(wb, filename + '.xlsx');
}

export const read = (data, type) => {
    const workbook = XLSX.read(data, { type: type });
    const firstSheetName = workbook.SheetNames[0];
    const worksheet = workbook.Sheets[firstSheetName];
    const header = get_header_row(worksheet);
    const results = XLSX.utils.sheet_to_json(worksheet);
    return {header, results};
}

export default {
  export_table_to_excel,
  export_array_to_excel,
  export_json_to_excel,
  read
}
