<template>
  <div class="section-wrapper mg-t-20">
    <label class="section-title">Bordered Form Group Wrapper</label>
    <p class="mg-b-20 mg-sm-b-40">
      A bordered form group wrapper with a label on top of each form control.
    </p>

    <div class="form-layout form-layout-2">
      <div class="row no-gutters">
        <div class="col-md-4">
          <div class="form-group">
            <label class="form-control-label"
              >Firstname: <span class="tx-danger">*</span></label
            >
            <input
              class="form-control"
              type="text"
              name="firstname"
              value="John Paul"
              placeholder="Enter firstname"
            />
          </div>
        </div>
        <!-- col-4 -->
        <div class="col-md-4 mg-t--1 mg-md-t-0">
          <div class="form-group mg-md-l--1">
            <label class="form-control-label"
              >Lastname: <span class="tx-danger">*</span></label
            >
            <input
              class="form-control"
              type="text"
              name="lastname"
              value="McDoe"
              placeholder="Enter lastname"
            />
          </div>
        </div>
        <!-- col-4 -->
        <div class="col-md-4 mg-t--1 mg-md-t-0">
          <div class="form-group mg-md-l--1">
            <label class="form-control-label"
              >Email address: <span class="tx-danger">*</span></label
            >
            <input
              class="form-control"
              type="text"
              name="email"
              value="johnpaul@yourdomain.com"
              placeholder="Enter email address"
            />
          </div>
        </div>
        <!-- col-4 -->
        <div class="col-md-8">
          <div class="form-group bd-t-0-force">
            <label class="form-control-label"
              >Mail address: <span class="tx-danger">*</span></label
            >
            <input
              class="form-control"
              type="text"
              name="address"
              value="Market St., San Francisco"
              placeholder="Enter address"
            />
          </div>
        </div>
        <!-- col-8 -->
        <div class="col-md-4">
          <div class="form-group bd-t-0-force">
            <label class="form-control-label"
              >Mail address: <span class="tx-danger">*</span></label
            >
            <input
              class="form-control"
              type="text"
              name="address"
              value="Market St., San Francisco"
              placeholder="Enter address"
            />
          </div>
        </div>
        <!-- col-4 -->
      </div>
      <!-- row -->
      <div class="form-layout-footer bd pd-20 bd-t-0">
        <button class="btn btn-primary bd-0">Submit Form</button>
        <button class="btn btn-secondary bd-0">Cancel</button>
      </div>
      <!-- form-group -->
    </div>
    <!-- form-layout -->
  </div>
</template>