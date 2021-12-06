<div class="wizard clearfix">
    <div class="steps clearfix">
      <ul role="tablist">
        <li :class="classes.first[step]">
          <a href="#wizard1-h-0">
            <span class="current-info audible"> current step: </span>
            <span class="number">1</span>
            <span class="title">Personal Information</span></a
          >
        </li>
        <li :class="classes.second[step]">
          <a id="wizard1-t-1" href="#wizard1-h-1">
            <span class="number">2</span>
            <span class="title">Billing Information</span>
          </a>
        </li>
        <li :class="classes.third[step]">
          <a id="wizard1-t-2" href="#wizard1-h-2">
            <span class="number">3</span>
            <span class="title">Payment Details</span>
          </a>
        </li>
      </ul>
    </div>
    <div class="content clearfix">
      <h3 id="wizard1-h-0" tabindex="-1" class="title current">
        Personal Information
      </h3>
      <section id="wizard1-p-0" class="body current">
        <div class="d-flex justify-content-end">
          <div class="form-group col-md-6">
            <label for="inputEmailLastName">Nro.</label>
            <input
              type="text"
              name="apellidos"
              id="inputEmailLastName"
              placeholder=""
              value=""
              class="form-control form-control-sm"
            />
          </div>
        </div>

        <div class="row">
          <div class="col-sm-6">
            <div class="form-group row justify-align-center">
              <label
                for="inputEmail3"
                class="col-sm-3 col-form-label text-right"
                >Contacto</label
              >
              <div class="col-sm-9">
                <input
                  type="text"
                  class="form-control"
                  id="inputEmail3"
                  placeholder="Search"
                />
              </div>
            </div>
            <div class="form-group row justify-align-center">
              <label
                for="inputEmail3"
                class="col-sm-3 col-form-label text-right"
                >Identificación</label
              >
              <div class="col-sm-9">
                <input type="text" class="form-control" id="inputEmail3" />
              </div>
            </div>
            <div class="form-group row justify-align-center">
              <label
                for="inputEmail3"
                class="col-sm-3 col-form-label text-right"
                >Telefono</label
              >
              <div class="col-sm-9">
                <input type="text" class="form-control" id="inputEmail3" />
              </div>
            </div>
          </div>
          <div class="col-sm-6">
            <div class="form-group row">
              <label
                for="inputEmail3"
                class="col-sm-3 col-form-label text-right"
                >Fecha</label
              >
              <div class="col-sm-9">
                <input
                  type="date"
                  class="form-control"
                  id="inputEmail3"
                  placeholder="Email"
                />
              </div>
            </div>
            <div class="form-group row">
              <label
                for="inputEmail3"
                class="col-sm-3 col-form-label text-right"
                >Plazo</label
              >
              <div class="col-sm-9">
                <input
                  type="date"
                  class="form-control"
                  id="inputEmail3"
                  placeholder="Email"
                />
              </div>
            </div>
          </div>
        </div>
        <div class="table-responsive">
          <table class="table table-sm">
            <thead class="thead-light">
              <tr>
                <th scope="col">Concepto</th>
                <th scope="col">Precio</th>
                <th scope="col">Descuento (%)</th>
                <th scope="col">Cantidad</th>
                <th scope="col">Observaciones</th>
                <th class="px-4 text-center" scope="col">Total</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td scope="row">
                  <input
                    type="text"
                    class="form-control"
                    id="inputEmail3"
                    placeholder="Search"
                  />
                </td>
                <td>
                  <input
                    type="number"
                    class="form-control"
                    id="inputEmail3"
                    placeholder="0"
                  />
                </td>
                <td>
                  <input
                    type="number"
                    class="form-control"
                    id="inputEmail3"
                    placeholder="0"
                  />
                </td>
                <td>
                  <input
                    type="number"
                    class="form-control"
                    id="inputEmail3"
                    placeholder="1"
                  />
                </td>
                <td>
                  <input
                    type="number"
                    class="form-control"
                    id="inputEmail3"
                    placeholder="1"
                  />
                </td>
                <td class="text-center">S/.0.00</td>
              </tr>
            </tbody>
          </table>
        </div>
        <button type="submit" class="btn btn-outline-primary btn-sm">
          <i class="fas fa-plus"></i> Add new row
        </button>

        <div class="row mt-4">
          <div class="col-lg-8"></div>
          <div class="col-lg-4 text-right">
            <div class="invoice-detail-item">
              <div class="invoice-detail-name">Subtotal</div>
              <div class="invoice-detail-value">$670.99</div>
            </div>
            <div class="invoice-detail-item">
              <div class="invoice-detail-name">Shipping</div>
              <div class="invoice-detail-value">$15</div>
            </div>
            <hr class="mt-2 mb-2" />
            <div class="invoice-detail-item">
              <div class="invoice-detail-name">Total</div>
              <div class="invoice-detail-value invoice-detail-value-lg">
                $685.99
              </div>
            </div>
          </div>
        </div>
        <div class="form-group mt-5">
          <label
            >Notas <i class="far fa-question-circle text-success"></i> :
          </label>
          <textarea class="form-control"></textarea>
          <small
            >Utiliza las notas para agregar información importante. No son
            visibles en la impresión.</small
          >
        </div>
      </section>
    </div>
    <div class="actions clearfix">
      <ul>
        <li :class="classes.button_left[step]">
          <a href="#previous" @click="previous_step">Anterior</a>
        </li>
        <li>
          <a href="#next" @click="next_step" v-show="step < 2">Siguiente</a>
        </li>
        <li v-show="step == 2">
          <a href="#finish">Finalizar</a>
        </li>
      </ul>
    </div>
  </div>