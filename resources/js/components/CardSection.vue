<template>
    <div class="col-12 col-md-6 col-lg-4">
    <div class="card card-secondary">
        <div class="card-header">
            <slot name="title"/>
            <div class="card-header-action">
                <div class="dropdown">
                    <a href="#" data-toggle="dropdown" class="btn btn-outline-dark dropdown-toggle"
                        aria-expanded="false">Acciones</a>
                    <div class="dropdown-menu" x-placement="top-start"
                        style="position: absolute; transform: translate3d(-6px, -144px, 0px); top: 0px; left: 0px; will-change: transform;">
                        <slot name="actions"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="card-body">
            <slot name="body"/>
        </div>
    </div>
</div>
</template>