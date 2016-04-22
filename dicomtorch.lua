local py = require('fb.python')

py.exec([=[
import sys
sys.path.append(os.getcwd())
import read_dicom
]=])

function read_file(file_name)
	local data,attr;
	data,attr = py.eval('read_dicom.get_dicom_data(f)',{f=file_name})
	return data,attr
end

data  = read_file('sampleout.dcm')


--[=[
function get_pixel_data(obj_name)
	pixel_data = py.eval('obj.pixel_array',{obj = obj_name})
	return pixel_data
end

function get_attribute_list(obj_name)
	attribute_list = py.eval('obj.dir()',{obj = obj_name})
	return attribute_list
end

function get_attribute(obj_name,attribute)
	val = py.eval('obj.data_element(attr)',{obj = obj_name,attr = attribute})
	return val
end
]=]--
