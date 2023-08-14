<nav class="hb-navbar navbar navbar-expand-lg hb-bg-black fixed-top">
    <div class="container">
        <a class="navbar-brand" href="/house_of_barber">
            <img src="assets/images/logo-invertida.png" alt="logo" class="logo" />
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#menu"
            aria-controls="conteudoNavbarSuportado" aria-expanded="false" aria-label="Alterna navegação">
            <i class="fa fa-times icon-close"></i>
            <i class="fa fa-bars icon-open"></i>
        </button>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
        <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
        <script>
            const swiper = new Swiper(".mySwiper", {
                slidesPerView: 1,
                spaceBetween: 30,
                loop: true,
                pagination: {
                    el: ".swiper-pagination",
                    clickable: true,
                },
                navigation: {
                    nextEl: ".swiper-button-next",
                    prevEl: ".swiper-button-prev",
                },
            });

        </script>

        <div class="collapse navbar-collapse" id="menu">
            <ul class="navbar-nav ml-auto hb-txt-secondary hb-w-700">
                <li class="nav-item align-self-center">
                    <a class="nav-link" href="/house_of_barber">HOME</a>
                </li>
                <li class="nav-item align-self-center">
                    <a class="nav-link" id="scroll-sobre" href="#sobre">SOBRE</a>
                </li>
                <li class="nav-item align-self-center">
                    <a class="nav-link" id="scroll-vantagens" href="#vantagens">VANTAGENS</a>
                </li>
                <li class="nav-item align-self-center">
                    <a class="nav-link hb-btn-outline-secondary hb-w-700 pr-3 pl-3" href="cliente/login">
                        SOU CLIENTE
                    </a>
                <li class="nav-item align-self-center">
                    <a class="nav-link hb-btn-outline-secondary hb-w-700 pr-3 pl-3" href="barbearia/login">
                        SOU BARBEIRO
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>



<section class="gap-to-menu container">
    <div class="align-self-center text-center" id="header-text">
        <h3 class="hb-txt-white hb-w-900">
            SEU MARKETPLACE DE BARBEARIAS
        </h3>
        <h5 class="hb-txt-white hb-w-700 pt-1">
            Gerencie sua barbearia na palma da sua mão
            <br></br>
        </h5>
    </div>

    <div class="area-cliente">
        <div class="row" id="cards-barbearias">
            <div class="swiper mySwiper">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">Slide 1</div>
                    <div class="swiper-slide">Slide 2</div>
                    <div class="swiper-slide">Slide 3</div>
                    <div class="swiper-slide">Slide 4</div>
                    <div class="swiper-slide">Slide 5</div>
                </div>
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-pagination"></div>
            </div>

        </div>
    </div>
    <!-- <button class="btn-pesquisa btn-position-fixed" data-toggle="modal" data-target="#modal-pesquisa">
            <i class="fa fa-search" aria-hidden="true"></i>
        </button> -->
</section>
<section class="content-index mt-3">
    <div class="container">
        <div class="sobre" id="sobre">
            <div class="row">
                <div class="col-sm-12 col-md-5 align-self-center">
                    <h3 class="hb-txt-secondary hb-w-700 pb-2">
                        Sobre
                    </h3>
                    <p class="hb-txt-white hb-w-500 text-justify">
                        O House of Barber é um sistema online e 100% gratuito que possibilita aos donos de barbearia o
                        <span> gerenciamento e divulgação </span> de suas barbearias. Além disso, a plataforma oferta
                        aos clientes os serviços dos diversos estabelecimentos cadastrados.
                    </p>
                </div>
                <div class="col-sm-12 col-md-7 align-self-center">
                    <img class="sobre-img p-4" src="assets/images/layout-index.png" alt="Imagem da seção sobre" />
                </div>
            </div>
        </div>

        <div class="vantagens hb-mt-50" id="vantagens">
            <div class="row">
                <div class="col-md-4 col-sm-12">
                    <img src="assets/icons/calendar-outline.svg" class="mb-3">
                    <h3 class="hb-txt-secondary hb-w-700 pb-2">
                        Organização
                    </h3>
                    <p class="hb-txt-white hb-w-400 text-justify">
                        Tenha um melhor controle e organização dos seus serviços e dos seus clientes fazendo com que o
                        seu estabelecimento seja muito mais produtivo.
                    </p>
                </div>
                <div class="col-md-4 col-sm-12">
                    <img src="assets/icons/eye-outline.svg" class="mb-3">
                    <h3 class="hb-txt-secondary hb-w-700 pb-2">
                        Divulgação
                    </h3>
                    <p class="hb-txt-white hb-w-400 text-justify">
                        Exiba o seu estabelecimento para diversas pessoas potencialmente interessadas no seu serviço e
                        aumente o seu número de clientes.
                    </p>
                </div>
                <div class="col-md-4 col-sm-12">
                    <img src="assets/icons/time-outline.svg" class="mb-3">
                    <h3 class="hb-txt-secondary hb-w-700 pb-2">
                        Facilidade
                    </h3>
                    <p class="hb-txt-white hb-w-400 text-justify">
                        O House of Barber é um sistema simples e intuitivo, onde todas a ações são de simples
                        coomprensão e execução. Chega de mais dores de cabeça!
                    </p>
                </div>
            </div>
        </div>
    </div>
</section>