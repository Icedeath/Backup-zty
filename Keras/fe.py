# -*- coding: utf-8 -*-
"""
Created on Wed Jul  6 12:45:57 2016

@author: hit411
"""

num_classes = 10
num_snr = 21
num = Y_test.size/num_classes**2/num_snr
stride = Y_test.size/num_snr/num_classes

def get_fe(n,j):
    return [numpy.mean(f_out[i*num + j*stride: (i+1)*num+j*stride, n]) for i in xrange(num_classes)]

def accuracy(j):
    return [numpy.mean(numpy.equal(test_set_y[i*num + j*stride: (i+1)*num+j*stride],classes[i*num + j*stride: (i+1)*num+j*stride])) for i in xrange(num_classes)]

#fe1 = numpy.array([get_fe(0,j) for j in xrange(num_snr)])

#fe2 = numpy.array([get_fe(1,j) for j in xrange(num_snr)])

#fe3 = numpy.array([get_fe(2,j) for j in xrange(num_snr)])

#fe4 = numpy.array([get_fe(3,j) for j in xrange(num_snr)])

ace = numpy.array([accuracy(j) for j in xrange(num_snr)])

#sio.savemat('result.mat', {'fe1':fe1, 'fe2':fe2, 'fe3':fe3, 'fe4':fe4, 'ac':ac, 'train_loss':train_loss, 'val_loss':val_loss})
#sio.savemat('result.mat', {'fe1':fe1, 'fe2':fe2})