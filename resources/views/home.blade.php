@extends('layouts.app')

@section('content')
    <div class="row row-sm">
        <div class="col-lg-12 mg-t-20 mg-lg-t-0">
            <div class="card card-table">
                <div class="card-header">
                    <h6 class="slim-card-title">User Transaction History</h6>
                </div><!-- card-header -->
                <div class="table-responsive">
                    <table class="table mg-b-0 tx-13">
                        <thead>
                            <tr class="tx-10">
                                <th class="wd-10p pd-y-5">&nbsp;</th>
                                <th class="pd-y-5">User</th>
                                <th class="pd-y-5">Type</th>
                                <th class="pd-y-5">Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="pd-l-20">
                                    <img src="http://via.placeholder.com/500x500" class="wd-36 rounded-circle" alt="Image">
                                </td>
                                <td>
                                    <a href="" class="tx-inverse tx-14 tx-medium d-block">Mark K. Peters</a>
                                    <span class="tx-11 d-block">TRANSID: 1234567890</span>
                                </td>
                                <td class="tx-12">
                                    <span class="square-8 bg-success mg-r-5 rounded-circle"></span> Email verified
                                </td>
                                <td>Just Now</td>
                            </tr>
                            <tr>
                                <td class="pd-l-20">
                                    <img src="http://via.placeholder.com/500x500" class="wd-36 rounded-circle" alt="Image">
                                </td>
                                <td>
                                    <a href="" class="tx-inverse tx-14 tx-medium d-block">Karmen F. Brown</a>
                                    <span class="tx-11 d-block">TRANSID: 1234567890</span>
                                </td>
                                <td class="tx-12">
                                    <span class="square-8 bg-warning mg-r-5 rounded-circle"></span> Pending verification
                                </td>
                                <td>Apr 21, 2017 8:34am</td>
                            </tr>
                            <tr>
                                <td class="pd-l-20">
                                    <img src="http://via.placeholder.com/500x500" class="wd-36 rounded-circle" alt="Image">
                                </td>
                                <td>
                                    <a href="" class="tx-inverse tx-14 tx-medium d-block">Gorgonio Magalpok</a>
                                    <span class="tx-11 d-block">TRANSID: 1234567890</span>
                                </td>
                                <td class="tx-12">
                                    <span class="square-8 bg-success mg-r-5 rounded-circle"></span> Purchased success
                                </td>
                                <td>Apr 10, 2017 4:40pm</td>
                            </tr>
                            <tr>
                                <td class="pd-l-20">
                                    <img src="http://via.placeholder.com/500x500" class="wd-36 rounded-circle" alt="Image">
                                </td>
                                <td>
                                    <a href="" class="tx-inverse tx-14 tx-medium d-block">Ariel T. Hall</a>
                                    <span class="tx-11 d-block">TRANSID: 1234567890</span>
                                </td>
                                <td class="tx-12">
                                    <span class="square-8 bg-warning mg-r-5 rounded-circle"></span> Payment on hold
                                </td>
                                <td>Apr 02, 2017 6:45pm</td>
                            </tr>
                            <tr>
                                <td class="pd-l-20">
                                    <img src="http://via.placeholder.com/500x500" class="wd-36 rounded-circle" alt="Image">
                                </td>
                                <td>
                                    <a href="" class="tx-inverse tx-14 tx-medium d-block">John L. Goulette</a>
                                    <span class="tx-11 d-block">TRANSID: 1234567890</span>
                                </td>
                                <td class="tx-12">
                                    <span class="square-8 bg-pink mg-r-5 rounded-circle"></span> Account deactivated
                                </td>
                                <td>Mar 30, 2017 10:30am</td>
                            </tr>
                        </tbody>
                    </table>
                </div><!-- table-responsive -->
                <div class="card-footer tx-12 pd-y-15 bg-transparent">
                    <a href=""><i class="fa fa-angle-down mg-r-5"></i>View All Transaction History</a>
                </div><!-- card-footer -->
            </div><!-- card -->
        </div><!-- col-6 -->
    </div>
@endsection
