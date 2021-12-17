<template>
  <div class="file-group">
    <div class="file-item">
      <div class="row no-gutters wd-100p">
        <div class="col-9 col-sm-5 d-flex align-items-center">
          <i class="fa fa-file-pdf-o"></i>
          <slot name="file"></slot>
          <!-- <a href="">IMG_12292017.jpg</a> -->
        </div>
        <!-- col-6 -->
        <div class="col-3 col-sm-2 tx-right tx-sm-left">
          <slot name="size"></slot>
        </div>
        <div class="col-6 col-sm-4 mg-t-5 mg-sm-t-0">
          <slot name="date"></slot>
        </div>
        <div class="col-6 col-sm-1 tx-right mg-t-5 mg-sm-t-0">
          <a href=""><i class="icon ion-more"></i></a>
        </div>
      </div>
      <!-- row -->
    </div>
    <!-- file-item -->
  </div>
</template>