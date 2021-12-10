@extends('layouts.App')

@section('title')
    Mi Perfil
@endsection
@section('navigation')
    <li class="breadcrumb-item"><a href="#">Inicio</a></li>
    <li class="breadcrumb-item"><a href="#">Info</a></li>
    <li class="breadcrumb-item active" aria-current="page">Perfil</li>
@endsection

@section('content')
    <div class="row row-sm">
        <div class="col-lg-8">
            <div class="card card-profile">
                <div class="card-body">
                    <div class="media">
                        <img src="http://via.placeholder.com/500x500" alt="">
                        <div class="media-body">
                            <h3 class="card-profile-name">Katherine Lumaad</h3>
                            <p class="card-profile-position">Executive Director at <a href="">ThemePixels, Inc.</a></p>
                            <p>San Francisco, California</p>

                            <p class="mg-b-0">A consummate human capital management professional with international
                                training and talent management implementations experience across the entire universe...<a
                                    href="">Read more</a></p>
                        </div><!-- media-body -->
                    </div><!-- media -->
                </div><!-- card-body -->
                <div class="card-footer">
                    <a href="" class="card-profile-direct">http://thmpxls.me/profile?id=katherine</a>
                    <div>
                        <a href="{{ route('settings') }}">Profile Settings</a>
                    </div>

                </div>
            </div><!-- card -->
            <div class="section-wrapper mg-t-20">
                <label class="section-title">Bordered Form Group Wrapper</label>
                <p class="mg-b-20 mg-sm-b-40">A bordered form group wrapper with a label on top of each form control.</p>

                <div class="form-layout form-layout-2">
                    <div class="row no-gutters">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="form-control-label">Firstname: <span class="tx-danger">*</span></label>
                                <input class="form-control" type="text" name="firstname" value="John Paul"
                                    placeholder="Enter firstname">
                            </div>
                        </div><!-- col-4 -->
                        <div class="col-md-4 mg-t--1 mg-md-t-0">
                            <div class="form-group mg-md-l--1">
                                <label class="form-control-label">Lastname: <span class="tx-danger">*</span></label>
                                <input class="form-control" type="text" name="lastname" value="McDoe"
                                    placeholder="Enter lastname">
                            </div>
                        </div><!-- col-4 -->
                        <div class="col-md-4 mg-t--1 mg-md-t-0">
                            <div class="form-group mg-md-l--1">
                                <label class="form-control-label">Email address: <span
                                        class="tx-danger">*</span></label>
                                <input class="form-control" type="text" name="email" value="johnpaul@yourdomain.com"
                                    placeholder="Enter email address">
                            </div>
                        </div><!-- col-4 -->
                        <div class="col-md-8">
                            <div class="form-group bd-t-0-force">
                                <label class="form-control-label">Mail address: <span
                                        class="tx-danger">*</span></label>
                                <input class="form-control" type="text" name="address" value="Market St., San Francisco"
                                    placeholder="Enter address">
                            </div>
                        </div><!-- col-8 -->
                        <div class="col-md-4">
                            <div class="form-group bd-t-0-force">
                                <label class="form-control-label">Mail address: <span
                                        class="tx-danger">*</span></label>
                                <input class="form-control" type="text" name="address" value="Market St., San Francisco"
                                    placeholder="Enter address">
                            </div>
                        </div><!-- col-4 -->
                    </div><!-- row -->
                    <div class="form-layout-footer bd pd-20 bd-t-0">
                        <button class="btn btn-primary bd-0">Submit Form</button>
                        <button class="btn btn-secondary bd-0">Cancel</button>
                    </div><!-- form-group -->
                </div><!-- form-layout -->
            </div>

        </div><!-- col-8 -->

        <div class="col-lg-4 mg-t-20 mg-lg-t-0">

            <div class="card pd-25">
                <div class="slim-card-title">Contact &amp; Personal Info</div>

                <div class="media-list mg-t-25">
                    <div class="media">
                        <div><i class="icon ion-link tx-24 lh-0"></i></div>
                        <div class="media-body mg-l-15 mg-t-4">
                            <h6 class="tx-14 tx-gray-700">Websites</h6>
                            <a href="" class="d-block">http://themepixels.me</a>
                            <a href="" class="d-block">http://themeforest.net</a>
                        </div><!-- media-body -->
                    </div><!-- media -->
                    <div class="media mg-t-25">
                        <div><i class="icon ion-ios-telephone-outline tx-24 lh-0"></i></div>
                        <div class="media-body mg-l-15 mg-t-4">
                            <h6 class="tx-14 tx-gray-700">Phone Number</h6>
                            <span class="d-block">+1 234 5678 910</span>
                        </div><!-- media-body -->
                    </div><!-- media -->
                    <div class="media mg-t-25">
                        <div><i class="icon ion-ios-email-outline tx-24 lh-0"></i></div>
                        <div class="media-body mg-l-15 mg-t-4">
                            <h6 class="tx-14 tx-gray-700">Email Address</h6>
                            <span class="d-block">yourname@sample.com</span>
                        </div><!-- media-body -->
                    </div><!-- media -->
                    <div class="media mg-t-25">
                        <div><i class="icon ion-social-twitter tx-18 lh-0"></i></div>
                        <div class="media-body mg-l-15 mg-t-2">
                            <h6 class="tx-14 tx-gray-700">Twitter</h6>
                            <a href="#" class="d-block">@themepixels</a>
                        </div><!-- media-body -->
                    </div><!-- media -->
                </div><!-- media-list -->
            </div><!-- card -->
        </div><!-- col-4 -->
    </div>
@endsection
