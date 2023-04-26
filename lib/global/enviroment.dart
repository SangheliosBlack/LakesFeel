import 'dart:ui';

import 'package:cashless/models/artista.dart';
import 'package:cashless/models/producto.dart';

class Statics {

  static String apiUrl = 'https://server-delivery-production.herokuapp.com/api';
  // static String apiUrl = 'http://192.168.0.10:3000/api';

  static Map<int, Color> color = {
    50: const Color.fromRGBO(255, 255, 255, .1),
    100: const Color.fromRGBO(255, 255, 255, .2),
    200: const Color.fromRGBO(255, 255, 255, .3),
    300: const Color.fromRGBO(255, 255, 255, .4),
    400: const Color.fromRGBO(255, 255, 255, .5),
    500: const Color.fromRGBO(255, 255, 255, .6),
    600: const Color.fromRGBO(255, 255, 255, .7),
    700: const Color.fromRGBO(255, 255, 255, .8),
    800: const Color.fromRGBO(255, 255, 255, .9),
    900: const Color.fromRGBO(255, 255, 255, 1),
  };

  static List<dynamic> listaRecargas = [
    {"cantidad": 100},
    {"cantidad": 200},
    {"cantidad": 300},
    {"cantidad": 400},
    {"cantidad": 500},
    {"cantidad": 600},
    {"cantidad": 700},
    {"cantidad": 800},
    {"cantidad": 900},
    {"cantidad": 1000},
  ];

  static List<Artista> listaParticipantes = [
    Artista(
        imgUrl: 'assets/images/artistas/chile.png',
        instagram: 'https://www.instagram.com/eduardoelchile/',
        nombre: 'Chile',
        spotify:
            'https://open.spotify.com/artist/0BnmjviyW0BAR2kK67AOPQ?si=O7qqYJgmSOC0O4bfSaaYxQ',
        instagramUserName: 'eduardoelchile'),
    Artista(
        imgUrl: 'assets/images/artistas/shanti.png',
        instagram: 'https://www.instagram.com/shantidj_/',
        nombre: 'Shanti',
        spotify:
            'https://open.spotify.com/artist/2M61yLIBBytyKJvB6saLmt?si=kRYvJUMtQsW5rvIJG_W65Q',
        instagramUserName: 'shantidj'),
    Artista(
        imgUrl: '',
        instagram: 'https://www.instagram.com/2lionsofficial/',
        nombre: '2Lions',
        spotify:
            'https://open.spotify.com/artist/1TlQDvo1nnM3Oyczb0UFjM?si=tdBPj0qHT_KkNK1BzQnsSQ',
        instagramUserName: '2lionsofficial'),
    Artista(
        imgUrl: 'assets/images/artistas/abril_vega.png',
        instagram: 'https://www.instagram.com/abrilvegamusic/',
        nombre: 'Abril Vega',
        spotify: '',
        instagramUserName: 'abrilvegamusic'),
    Artista(
        imgUrl: 'assets/images/artistas/bryan_tavarez.png',
        instagram: 'https://www.instagram.com/soybrayantavares/',
        nombre: 'Brayan Tavares',
        spotify: '',
        instagramUserName: 'soybrayantavares'),
    Artista(
        imgUrl: 'assets/images/artistas/caro_rivas.png',
        instagram: 'https://www.instagram.com/caro_rivas_18/',
        nombre: 'Caro Rivas',
        spotify: '',
        instagramUserName: 'caro_rivas_18'),
    Artista(
        imgUrl: 'assets/images/artistas/chpe.png',
        instagram: 'https://www.instagram.com/chpe_official/',
        nombre: 'Chpe',
        spotify: '',
        instagramUserName: 'chpe_official'),
    Artista(
        imgUrl: 'assets/images/artistas/don_dany.png',
        instagram: 'https://www.instagram.com/don_dany.mx/',
        nombre: 'Don Dany',
        spotify: '',
        instagramUserName: 'don_dany.mx'),
    Artista(
        imgUrl: 'assets/images/artistas/fakers.png',
        instagram: 'https://www.instagram.com/fakersmusic/',
        nombre: 'Fakers',
        spotify:
            'https://open.spotify.com/artist/1SoCo4hOon1z3JLvEO8Heg?si=8iwCljRdQC6ELgqCwp795w',
        instagramUserName: 'fakersmusic'),
    Artista(
        imgUrl: 'assets/images/artistas/house_tumblr.png',
        instagram: 'https://www.instagram.com/house_tumblr_music_oficial/',
        nombre: 'House & Tumblr',
        spotify:
            'https://open.spotify.com/user/21mql7ueau2lmbx3tzkim7opq?si=5632aef4970b45fa',
        instagramUserName: 'house_tumblr_music_oficial'),
    Artista(
        imgUrl: 'assets/images/artistas/jdez.png',
        instagram: 'https://www.instagram.com/jdez.mx/',
        nombre: 'Jdez',
        spotify: '',
        instagramUserName: 'jdez.mx'),
    Artista(
        imgUrl: 'assets/images/artistas/koude.png',
        instagram: 'https://www.instagram.com/koude_music/',
        nombre: 'Koude',
        spotify:
            'https://open.spotify.com/artist/4nfGTIbp4dKd72NsYhjMcg?si=CaEi8hS9QfydOg3CDK4asQ',
        instagramUserName: 'koude_music'),
    Artista(
        imgUrl: 'assets/images/artistas/jorge_escalante.png',
        instagram: 'https://www.instagram.com/jl.escalante/',
        nombre: 'Jorge Escalante',
        spotify:
            'https://open.spotify.com/artist/3HI4nYJbYBRufLP4zFTIwQ?si=w1qCtq_uTNWGw3ib6stmbQ',
        instagramUserName: 'jl.escalante'),
    Artista(
        imgUrl: 'assets/images/artistas/la_shei.png',
        instagram: 'https://www.instagram.com/lasheimx/',
        nombre: 'La Shei',
        spotify:
            'https://open.spotify.com/artist/5yB5onTa64t5wPrzVH4EkM?si=NLWjxYV7Q1axaKY-c1v1zg',
        instagramUserName: 'lasheimx'),
    Artista(
        imgUrl: 'assets/images/artistas/loretta.png',
        instagram: 'https://www.instagram.com/lorettamaciasdj/',
        nombre: 'Loretta',
        spotify:
            'https://open.spotify.com/user/12165422412?si=6d506f044bbe4087',
        instagramUserName: 'lorettamaciasdj'),
    Artista(
        imgUrl: 'assets/images/artistas/manuel_ridde.png',
        instagram: 'https://www.instagram.com/_manuel_ridde_dj/',
        nombre: 'Manuel Ride',
        spotify: '',
        instagramUserName: '_manuel_ridde_dj'),
        
    Artista(
        imgUrl: 'assets/images/artistas/neon_de_luz.png',
        instagram: 'https://www.instagram.com/neondeluzmusic/',
        nombre: 'Neon deLuz',
        spotify: 'https://open.spotify.com/artist/07imWI9ER2YJO1oLccN8wm?si=80uDJ_oUTZys4SK6zUkY-w',
        instagramUserName: 'neondeluzmusic'),
    Artista(
        imgUrl: 'assets/images/artistas/pelon.png',
        instagram: 'https://www.instagram.com/_pelon____/',
        nombre: 'Pelon',
        spotify: '',
        instagramUserName: '_pelon____'),
    Artista(
        imgUrl: 'assets/images/artistas/seneca.png',
        instagram: 'https://www.instagram.com/seneca.mx/',
        nombre: 'Seneca',
        spotify: '',
        instagramUserName: 'seneca.mx'),
    Artista(
        imgUrl: 'assets/images/artistas/rebeld.png',
        instagram: 'https://www.instagram.com/rebeld_music/',
        nombre: 'Rebeld',
        spotify: 'https://open.spotify.com/artist/5nV4fUZOdiXdQTmCWoCGme?si=yJfrl-xmQ5uYhiSjRi-RlQ',
        instagramUserName: 'rebeld_music'),
    Artista(
        imgUrl: 'assets/images/artistas/st_glez.png',
        instagram: 'https://www.instagram.com/st.glez/',
        nombre: 'St Glez',
        spotify: 'https://open.spotify.com/artist/0t4NRFAvujuxTENfgUagWa?si=_lsgdvUySa-5V6Szti2XEg',
        instagramUserName: 'st.glez'),
    Artista(
        imgUrl: 'assets/images/artistas/toxic_rabbit.png',
        instagram: 'https://www.instagram.com/toxic_rabbit14/',
        nombre: 'Toxic Rabbit',
        spotify: '',
        instagramUserName: 'toxic_rabbit14'),
    Artista(
        imgUrl: 'assets/images/artistas/traxx.png',
        instagram: 'https://www.instagram.com/traxxdjxxart/',
        nombre: 'Traxx',
        spotify: '',
        instagramUserName: 'traxxdjxxart'),
    Artista(
        imgUrl: 'assets/images/artistas/wild_dog.png',
        instagram: 'https://www.instagram.com/wilddog_la/',
        nombre: 'Wild Dog',
        spotify: '',
        instagramUserName: 'wilddog_la'),
    Artista(
        imgUrl: 'assets/images/artistas/yeimi_spinelli.png',
        instagram: 'https://www.instagram.com/y.s.dj/',
        nombre: 'Yeimi Spinelli',
        spotify: 'https://open.spotify.com/artist/0wvsDS2N8JLn0CaI4Kl7kB?si=4OpKVbBLQJSEC2UxOeUiJg',
        instagramUserName: 'y.s.dj'),
  ];

  static List<Producto> listaProductoLakesFeel = [
    // Producto(
    //     fechaVenta: DateTime.now(),
    //     id: 'id',
    //     precio: 100,
    //     nombre: 'Litros',
    //     descripcion: '',
    //     descuentoP: 0,
    //     descuentoC: 0,
    //     disponible: true,
    //     tienda: 'tienda',
    //     cantidad: 0,
    //     sku: 'sku',
    //     hot: 0,
    //     extra: 0,
    //     sugerencia: false,
    //     imagen: '',
    //     apartado: true,
    //     opciones: []),
    // Producto(
    //     fechaVenta: DateTime.now(),
    //     id: 'id',
    //     precio: 45,
    //     nombre: 'Cerveza',
    //     descripcion: '',
    //     descuentoP: 0,
    //     descuentoC: 0,
    //     disponible: true,
    //     tienda: 'tienda',
    //     cantidad: 0,
    //     sku: 'sku',
    //     hot: 0,
    //     extra: 0,
    //     sugerencia: false,
    //     imagen: '',
    //     apartado: true,
    //     opciones: []),
    // Producto(
    //     fechaVenta: DateTime.now(),
    //     id: 'id',
    //     precio: 50,
    //     nombre: 'Bebida Energetica',
    //     descripcion: '',
    //     descuentoP: 0,
    //     descuentoC: 0,
    //     disponible: true,
    //     tienda: 'tienda',
    //     cantidad: 0,
    //     sku: 'sku',
    //     hot: 0,
    //     extra: 0,
    //     sugerencia: false,
    //     imagen: '',
    //     apartado: true,
    //     opciones: []),
    // Producto(
    //     fechaVenta: DateTime.now(),
    //     id: 'id',
    //     precio: 50,
    //     nombre: 'Agua Mineral 2lt',
    //     descripcion: '',
    //     descuentoP: 0,
    //     descuentoC: 0,
    //     disponible: true,
    //     tienda: 'tienda',
    //     cantidad: 0,
    //     sku: 'sku',
    //     hot: 0,
    //     extra: 0,
    //     sugerencia: false,
    //     imagen: '',
    //     apartado: true,
    //     opciones: []),
    // Producto(
    //     fechaVenta: DateTime.now(),
    //     id: 'id',
    //     precio: 40,
    //     nombre: 'Coca Cola 1lt',
    //     descripcion: '',
    //     descuentoP: 0,
    //     descuentoC: 0,
    //     disponible: true,
    //     tienda: 'tienda',
    //     cantidad: 0,
    //     sku: 'sku',
    //     hot: 0,
    //     extra: 0,
    //     sugerencia: false,
    //     imagen: '',
    //     apartado: true,
    //     opciones: []),
    Producto(
        fechaVenta: DateTime.now(),
        id: 'id',
        precio: 300,
        nombre: 'Entrada general',
        descripcion: '',
        descuentoP: 0,
        descuentoC: 0,
        disponible: true,
        tienda: 'tienda',
        cantidad: 0,
        sku: 'sku',
        hot: 0,
        extra: 0,
        sugerencia: false,
        imagen: '',
        apartado: true,
        opciones: []),
    Producto(
        fechaVenta: DateTime.now(),
        id: 'id',
        precio: 50,
        nombre: 'EcoVaso',
        descripcion: '',
        descuentoP: 0,
        descuentoC: 0,
        disponible: true,
        tienda: 'tienda',
        cantidad: 0,
        sku: 'sku',
        hot: 0,
        extra: 0,
        sugerencia: false,
        imagen: '',
        apartado: true,
        opciones: [])
  ];
}
