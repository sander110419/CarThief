///ex_db_load([filename1],[filename2],...)
/*
    Description:    Loads an item database in csv format
    Arguments:      sep: csv separator (usually ',')
                    filename: up to 15 file names of csv database files
*/

//var file_name,sep,file,headers,types;

sep = ",";

for(var arg=0; arg < argument_count; arg++) {

    var filename, file, headers, types;
    
    filename = argument[arg];
    file = file_text_open_read(filename);

    //read the column names of the database (first row)
    headers = csv_parse_line(file_text_read_string(file),sep);
    file_text_readln(file);

    //read the types of the database (second row)
    types = csv_parse_line(file_text_read_string(file),sep);
    file_text_readln(file);

    //read the rest of the data into the database
    while(!file_text_eof(file)) {
        var line = csv_parse_line(file_text_read_string(file),sep);
        var data = ds_map_create();
    
        for(var i=0;i<ds_list_size(line);i++) {   
            var value = line[| i];
            if(types[| i] == "real") {value = real(value);}
            data[? headers[| i]] = value;
        }
        
        //add default attributes
        data[? "unique"] = false;
        data[? "base_key"] = data[? "key"];
        
        ds_map_add_map(_ex_db,data[? "key"],data);
        ds_list_add(_ex_keys, line[| 0]); //add key to the keys list
        
        ds_list_destroy(line);
        file_text_readln(file);
    }

    file_text_close(file);

    //cleanup
    ds_list_destroy(types);
    ds_list_destroy(headers);

}
