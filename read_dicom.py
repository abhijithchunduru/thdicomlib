import dicom
import numpy

def get_dicom_data(file):
	obj = dicom.read_file(file)
	dct = {};
	for key in obj.dir():
		value = getattr(obj,key,'')
		if key == 'PixelData':
			continue
		dct[key] = value
	return obj.pixel_array.astype(numpy.float32),dct
