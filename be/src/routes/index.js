const express = require('express');

const adminRouter = require('./admin');
const customerRouter = require('./customer');
const colourRouter = require('./colour');
const sizeRouter = require('./size');
const categoryRouter = require('./category');
const productRouter = require('./product');
const product_variantRouter = require('./product_variant');
const order = require('./order');
const feedback = require('./feedback');
<<<<<<< HEAD
=======
const report = require('./report');
const post = require('./post');
>>>>>>> 55443dae98fa1d04415528a372a95857fc393a22

function setRoute(server) {

    server.use('/api/admin', adminRouter);

    server.use('/api/customer', customerRouter);

    server.use('/api/colour', colourRouter);

    server.use('/api/size', sizeRouter);

    server.use('/api/category', categoryRouter);

    server.use('/api/product', productRouter);

    server.use('/api/product-variant', product_variantRouter);

    server.use('/api/order', order);

    server.use('/api/feedback', feedback);

<<<<<<< HEAD
=======
    server.use('/api/report' , report);

    server.use('/api/post', post);

>>>>>>> 55443dae98fa1d04415528a372a95857fc393a22
}

module.exports = setRoute;
