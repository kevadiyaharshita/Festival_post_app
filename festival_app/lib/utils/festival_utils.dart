import '../modals/Festival_Modal.dart';

List<Map> allFestivals = [
  {
    'title ': "republic day",
    'Network_image':
        'https://i.pinimg.com/564x/8a/64/c0/8a64c0c6fde5678c6620fb951d34dd44.jpg',
    'assets_image':
        List.generate(10, (index) => 'assets/Baisakhi/${index + 1}.jpg')
  },
  {
    'title': 'Diwali',
    'Network_image':
        'https://i.pinimg.com/564x/8a/64/c0/8a64c0c6fde5678c6620fb951d34dd44.jpg',
    'assets_image':
        List.generate(10, (index) => 'assets/Diwali/${index + 1}.jpg')
  },
  {
    'title': 'Raksha Bandhan',
    'Network_image':
        'https://i.pinimg.com/564x/5d/1e/3b/5d1e3b77ade3c90a15dc9cf926c47973.jpg',
    'assets_image':
        List.generate(10, (index) => 'assets/Raksha Bandhan/${index + 1}.jpg')
  },
  {
    'title': 'Makar Sakranti',
    'Network_image':
        'https://i.pinimg.com/564x/29/be/1b/29be1be165d945cf94be13bd7de49770.jpg',
    'assets_image':
        List.generate(10, (index) => 'assets/Makar_Sankranti/${index + 1}.jpg')
  },
  {
    'title': 'Pongal',
    'Network_image':
        'https://i.pinimg.com/564x/2c/84/a9/2c84a9f9bc5a5a64812a09123e83551b.jpg',
    'assets_image':
        List.generate(10, (index) => 'assets/pongal/${index + 1}.jpg')
  },
  {
    'title': 'Basant Panchami',
    'Network_image':
        'https://i.pinimg.com/564x/17/89/14/178914e075b9598e3b8e160191d88326.jpg',
    'assets_image':
        List.generate(10, (index) => 'assets/Basant Panchami/${index + 1}.jpg')
  },
  {
    'title': 'Maha Shivratri',
    'Network_image':
        'https://i.pinimg.com/564x/96/45/8e/96458edf74790a466ac6a0bd654402ce.jpg',
    'assets_image':
        List.generate(10, (index) => 'assets/Maha Shivratri/${index + 1}.jpg')
  },
  {
    'title': 'Navratri',
    'Network_image':
        'https://i.pinimg.com/736x/6e/20/0d/6e200d35a6ddae7c042c77f8a41ce91c.jpg',
    'assets_image':
        List.generate(10, (index) => 'assets/Navratri/${index + 1}.jpg')
  },
  {
    'title': 'Durga Puja',
    'Network_image':
        'https://i.pinimg.com/564x/27/71/66/277166fd4c9682389c73ddd0577fd3ae.jpg',
    'assets_image':
        List.generate(10, (index) => 'assets/Durga Puja/${index + 1}.jpg')
  },
  {
    'title': 'Holi',
    'Network_image':
        'https://i.pinimg.com/564x/3d/d4/c6/3dd4c6c1c5b140bfcf279506b6c5d45c.jpg',
    'assets_image': List.generate(10, (index) => 'assets/Holi/${index + 1}.jpg')
  },
  {
    'title': 'Baisakhi',
    'Network_image':
        'https://i.pinimg.com/564x/e4/c5/ec/e4c5ec4af01ae24b79e47b62d4b2ad69.jpg',
    'assets_image':
        List.generate(10, (index) => 'assets/Baisakhi/${index + 1}.jpg')
  },
  {
    'title': 'Buddha Jayanti',
    'Network_image':
        'https://i.pinimg.com/564x/c9/97/b1/c997b1a2c40a224722b4a65b00446595.jpg',
    'assets_image':
        List.generate(10, (index) => 'assets/Buddha Jayanti/${index + 1}.jpg'),
  },
  {
    'title': 'Eid Ul Fitr',
    'Network_image':
        'https://i.pinimg.com/564x/a2/32/ac/a232ac7f229b6690197d7a583cf0c7c0.jpg',
    'assets_image':
        List.generate(10, (index) => 'assets/Eid Ul Fitr/${index + 1}.jpg'),
  },
  {
    'title': 'Ratha Yatra',
    'Network_image':
        'https://i.pinimg.com/564x/5e/59/bd/5e59bd23d309401c9fc04aafe84e7292.jpg',
    'assets_image':
        List.generate(10, (index) => 'assets/Ratha Yatra/${index + 1}.jpg'),
  },
  {
    'title': 'Janmashtmi',
    'Network_image':
        'https://i.pinimg.com/564x/8f/9d/cd/8f9dcd2abdb954c68b44710f264db136.jpg',
    'assets_image':
        List.generate(10, (index) => 'assets/Janmastmi/${index + 1}.jpg'),
  },
  {
    'title': 'Independence Day',
    'Network_image':
        'https://i.pinimg.com/564x/9c/fa/12/9cfa129e4eee4727d65701e849598783.jpg',
    'assets_image': List.generate(
        10, (index) => 'assets/Independence Day/${index + 1}.jpg'),
  },
  {
    'title': 'Onam',
    'Network_image':
        'https://i.pinimg.com/564x/27/14/7c/27147ca95e99356aeb9f220201fa06a4.jpg',
    'assets_image':
        List.generate(10, (index) => 'assets/Onam/${index + 1}.jpg'),
  },
  {
    'title': 'Ganesh Chaturthi',
    'Network_image':
        'https://i.pinimg.com/564x/0e/54/d7/0e54d7d7738c9f0e7a9d8eea00aabd32.jpg',
    'assets_image': List.generate(
        10, (index) => 'assets/Ganesh Chaturthi/${index + 1}.jpg'),
  },
  {
    'title': 'Dussehra',
    'Network_image':
        'https://i.pinimg.com/564x/ae/8c/72/ae8c725cc4e85d98d33ce9fb365278fd.jpg',
    'assets_image':
        List.generate(10, (index) => 'assets/Dussehra/${index + 1}.jpg'),
  },
  {
    'title': 'Gurupurab',
    'Network_image':
        'https://i.pinimg.com/564x/c0/b3/24/c0b32409ded86ad305bcb76da7a107fd.jpg',
    'assets_image':
        List.generate(10, (index) => 'assets/Gurupurab/${index + 1}.jpg'),
  },
  {
    'title': 'Christmas',
    'Network_image':
        'https://i.pinimg.com/564x/7c/f5/83/7cf583554d04373b869256a565d137f4.jpg',
    'assets_image':
        List.generate(10, (index) => 'assets/Christmas/${index + 1}.jpg'),
  },
];

// List<Festival> allFestivaList =
//     allFestivals.map((e) => Festival.frommap(data: e)).toList();

// List<String> allFestival = [
//   ' ',
//
//
//   'Makar Sakranti',
//   'Pongal',
//   'Basant Panchami',
//   'Maha Shivratri',
//   'Navratri',
//   'Durga Puja',
//   'Holi',
//   'Baisakhi',
//   'Buddha Jayanti',
//   'Eid Ul Fitr',
//   'Ratha Yatra',
//   'Janmashtmi',
//   'Independence Day',
//   'Onam',
//   'Ganesh Chaturthi',
//   'Dussehra',
//   'Gurupurab',
//   'Christmas',
// ];
//
// List<String> Network_Image = [
//   '',
//
//   'https://i.pinimg.com/564x/29/be/1b/29be1be165d945cf94be13bd7de49770.jpg',
//   'https://i.pinimg.com/564x/2c/84/a9/2c84a9f9bc5a5a64812a09123e83551b.jpg',
//   'https://i.pinimg.com/564x/17/89/14/178914e075b9598e3b8e160191d88326.jpg',
//   'https://i.pinimg.com/564x/96/45/8e/96458edf74790a466ac6a0bd654402ce.jpg',
//   'https://i.pinimg.com/736x/6e/20/0d/6e200d35a6ddae7c042c77f8a41ce91c.jpg',
//   'https://i.pinimg.com/564x/27/71/66/277166fd4c9682389c73ddd0577fd3ae.jpg',
//   'https://i.pinimg.com/564x/3d/d4/c6/3dd4c6c1c5b140bfcf279506b6c5d45c.jpg',
//   'https://i.pinimg.com/564x/e4/c5/ec/e4c5ec4af01ae24b79e47b62d4b2ad69.jpg',
//   'https://i.pinimg.com/564x/c9/97/b1/c997b1a2c40a224722b4a65b00446595.jpg',
//   'https://i.pinimg.com/564x/a2/32/ac/a232ac7f229b6690197d7a583cf0c7c0.jpg',
//   'https://i.pinimg.com/564x/5e/59/bd/5e59bd23d309401c9fc04aafe84e7292.jpg',
//   'https://i.pinimg.com/564x/8f/9d/cd/8f9dcd2abdb954c68b44710f264db136.jpg',
//   'https://i.pinimg.com/564x/9c/fa/12/9cfa129e4eee4727d65701e849598783.jpg',
//   'https://i.pinimg.com/564x/27/14/7c/27147ca95e99356aeb9f220201fa06a4.jpg',
//   'https://i.pinimg.com/564x/0e/54/d7/0e54d7d7738c9f0e7a9d8eea00aabd32.jpg',
//   'https://i.pinimg.com/564x/ae/8c/72/ae8c725cc4e85d98d33ce9fb365278fd.jpg',
//   'https://i.pinimg.com/564x/c0/b3/24/c0b32409ded86ad305bcb76da7a107fd.jpg',
//   'https://i.pinimg.com/564x/7c/f5/83/7cf583554d04373b869256a565d137f4.jpg',
// ];
