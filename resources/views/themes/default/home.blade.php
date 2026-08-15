@php
    $seo = GlobalHelper::get_page_seo('Home');
@endphp
@extends(themeBlade('layout.master'))
@section('title', "Home | $siteSetting->title")
@section('image', $seo->image_three ?? '')
@section('type', 'text/html')
@section('url', url()->full())
@section('tag', is_array($seo->meta_tag ?? '') ? implode(', ', $seo->meta_tag ?? '') : $seo->meta_tag ?? '')
@section('description', $seo->meta_description ?? '')

@section('content')
    @include(themeBlade('components.banner'))
    @include(themeBlade('components.about'))
    @include(themeBlade('components.services'))
    @include(themeBlade('components.choose_us'))
    {{-- @include(themeBlade('components.advantage')) --}}
    {{-- @include(themeBlade('components.stats')) --}}
    {{-- @include(themeBlade('components.projects')) --}}
    {{-- @include(themeBlade('components.working_process')) --}}
    @include(themeBlade('components.testomonial'))
    {{-- @include(themeBlade('components.pricing')) --}}
    @include(themeBlade('components.contact_section'))
@endsection
