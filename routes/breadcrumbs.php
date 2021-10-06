<?php

// dashboard
Breadcrumbs::for('dashboard', function ($trail) {
    $trail->push('dashboard', route('dashboard'));
});

//Provinsi
Breadcrumbs::for('province', function ($trail) {
    $trail->parent('dashboard');
    $trail->push('province', route('province.index'));
});

Breadcrumbs::for('tambah data provinsi', function ($trail) {
    $trail->parent('dashboard');
    $trail->push('province', route('province.index'));
    $trail->push('tambah data', route('province.create'));
});

Breadcrumbs::for('edit data provinsi', function ($trail, $province) {
    $trail->parent('dashboard');
    $trail->push('province', route('province.index'));
    $trail->push('edit data', route('province.edit', $province));
});

//City
Breadcrumbs::for('kabupaten/kota', function ($trail, $province) {
    $trail->parent('dashboard');
    $trail->push('province', route('province.index'));
    $trail->push('kabupaten/kota', route('city.index', $province));
});

Breadcrumbs::for('tambah data', function ($trail, $province) {
    $trail->parent('dashboard');
    $trail->push('province', route('province.index'));
    $trail->push('kabupaten/kota', route('city.index', $province));
    $trail->push('tambah data', route('city.create', $province));
});

Breadcrumbs::for('edit data kabupaten/kota', function ($trail, $province, $city) {
    $trail->parent('dashboard');
    $trail->push('province', route('province.index'));
    $trail->push('kabupaten/kota', route('city.index', $province));
    $trail->push('edit data kabupaten/kota', route('city.edit', [$province, $city]));
});

//content
Breadcrumbs::for('content', function ($trail) {
    $trail->parent('dashboard');
    $trail->push('content', route('content.index'));
});

Breadcrumbs::for('tambah data content', function ($trail) {
    $trail->parent('dashboard');
    $trail->push('content', route('content.index'));
    $trail->push('tambah data content', route('content.create'));
});

Breadcrumbs::for('edit data content', function ($trail, $content) {
    $trail->parent('dashboard');
    $trail->push('content', route('content.index'));
    $trail->push('edit data content', route('content.edit', $content));
});

//publish
Breadcrumbs::for('edit data status', function ($trail, $content) {
    $trail->parent('dashboard');
    $trail->push('content', route('content.index'));
    $trail->push('edit data status', route('content.editStatus', $content));
});

Breadcrumbs::for('lihat data content', function ($trail, $content) {
    $trail->parent('dashboard');
    $trail->push('content', route('content.index'));
    $trail->push('lihat data content', route('content.show', $content));
});

//user
Breadcrumbs::for('user', function ($trail) {
    $trail->parent('dashboard');
    $trail->push('user', route('user.index'));
});

Breadcrumbs::for('tambah data user', function ($trail) {
    $trail->parent('dashboard');
    $trail->push('user', route('user.index'));
    $trail->push('tambah data user', route('user.index'));
});

Breadcrumbs::for('edit data user', function ($trail, $user) {
    $trail->parent('dashboard');
    $trail->push('user', route('user.index'));
    $trail->push('edit data user', route('user.edit', $user));
});