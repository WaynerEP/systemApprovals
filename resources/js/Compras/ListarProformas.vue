<template>
  <div class="manager-wrapper">
    <div class="manager-right">
      <label class="section-label">Pedido 1</label>
      <div class="file-group">
        <div class="file-item">
          <div class="row no-gutters wd-100p">
            <div class="col-9 col-sm-5 d-flex align-items-center">
              <i class="fa fa-file-pdf-o"></i>
              <a href="">Getting_Started.pdf</a>
            </div>
            <!-- col-6 -->
            <div class="col-3 col-sm-2 tx-right tx-sm-left">31kb</div>
            <div class="col-6 col-sm-4 mg-t-5 mg-sm-t-0">2 hours ago</div>
            <div class="col-6 col-sm-1 tx-right mg-t-5 mg-sm-t-0">
              <a href=""><i class="icon ion-more"></i></a>
            </div>
          </div>
          <!-- row -->
        </div>
      </div>
      <!-- file-group -->
      <!-- load-more-wrapper -->
    </div>
    <!-- manager-right -->
    <div class="manager-left">
      <a :href="'/compras-proformas'" class="btn btn-contact-new"
        >Registrar proformas</a
      >
      <nav class="nav">
        <a href="" class="nav-link active">
          <span>Todos</span>
          <span>120</span>
        </a>
      </nav>
    </div>
    <!-- manager-left -->
  </div>
</template>