import 'dart:async';

import 'contact_data.dart';

class MockContactRepository implements ContactRepository {

  Future<List<Contact>> fetch() {
    return Future.value(kContacts);
  }

}

const kContacts = <Contact>[
    Contact(
      fullName: 'Romain Hoogmoed',
      email:'romain.hoogmoed@example.com',
      imageUrl: 'https://randomuser.me/api/portraits/women/35.jpg',
    ),
    Contact(
      fullName: 'Emilie Olsen',
      email:'emilie.olsen@example.com',
      imageUrl: 'https://randomuser.me/api/portraits/women/5.jpg'
    ),
    Contact(
      fullName: 'Téo Lefevre',
      email:'téo.lefevre@example.com',
      imageUrl: 'https://randomuser.me/api/portraits/women/50.jpg'
    ),
    Contact(
      fullName: 'Nicole Cruz',
      email:'nicole.cruz@example.com',
      imageUrl: 'https://randomuser.me/api/portraits/women/60.jpg'
    ),
    Contact(
      fullName: 'Ramna Peixoto',
      email:'ramna.peixoto@example.com',
      imageUrl: 'https://randomuser.me/api/portraits/women/72.jpg'
    ),
    Contact(
      fullName: 'Jose Ortiz',
      email:'jose.ortiz@example.com',
      imageUrl: 'https://randomuser.me/api/portraits/women/93.jpg'
    ),
    Contact(
      fullName: 'Alma Christensen',
      email:'alma.christensen@example.com',
      imageUrl: 'https://randomuser.me/api/portraits/women/49.jpg'
    ),
    Contact(
      fullName: 'Sergio Hill',
      email:'sergio.hill@example.com',
      imageUrl: 'https://randomuser.me/api/portraits/women/30.jpg'
    ),
    Contact(
      fullName: 'Malo Gonzalez',
      email:'malo.gonzalez@example.com',
      imageUrl: 'https://randomuser.me/api/portraits/women/91.jpg'
    ),
    Contact(
      fullName: 'Miguel Owens',
      email:'miguel.owens@example.com',
      imageUrl: 'https://randomuser.me/api/portraits/women/40.jpg'
    ),
    Contact(
      fullName: 'Lilou Dumont',
      email:'lilou.dumont@example.com',
      imageUrl: 'https://randomuser.me/api/portraits/women/95.jpg'
    ),
    Contact(
      fullName: 'Ashley Stewart',
      email:'ashley.stewart@example.com',
      imageUrl: 'https://randomuser.me/api/portraits/women/43.jpg'
    ),
    Contact(
      fullName: 'Roman Zhang',
      email:'roman.zhang@example.com',
      imageUrl: 'https://randomuser.me/api/portraits/women/8.jpg'
    ),
    Contact(
      fullName: 'Ryan Roberts',
      email:'ryan.roberts@example.com',
      imageUrl: 'https://randomuser.me/api/portraits/women/59.jpg'
    ),
    Contact(
      fullName: 'Sadie Thomas',
      email:'sadie.thomas@example.com',
      imageUrl: 'https://randomuser.me/api/portraits/women/1.jpg'
    ),
    Contact(
      fullName: 'Belen Serrano',
      email:'belen.serrano@example.com ',
      imageUrl: 'https://randomuser.me/api/portraits/women/2.jpg'
    )
  ];
