class YamListModel {
  // final String yamId;
  // final String accountId;
  final String restrId;
  // final Set<dynamic> foods;
  // final Set<dynamic> tags;
  final String memo;
  // final List<dynamic> comment;
  YamListModel(this.restrId, this.memo);
}

List<YamListModel> loadYamList() {
  List items = <YamListModel>[
    YamListModel("매드포갈릭", "신규"),
    YamListModel("버거킹", "신규"),
    YamListModel("연안식당", "신규"),
    YamListModel("런드리피자", "신규"),
    YamListModel("맘스터치", "신규"),
    YamListModel("쿠차라", "신규"),
    YamListModel("엔칠라다", "신규"),
    YamListModel("부쳐스컷", "신규"),
    YamListModel("바토", "신규"),
    YamListModel("그릭조이", "신규"),
    YamListModel("산토리니", "신규"),
    YamListModel("서서갈비", "신규"),
    YamListModel("페트라", "신규"),
    YamListModel("클레오", "신규"),
    YamListModel("강가", "신규"),
  ];
  return items;
}

// public class Yam {
//   @Id
//   @GeneratedValue
//   @Column(name = "yam_id")
//   private long id;
//   private LocalDate genTime;
//
//   @ManyToOne
//   @JoinColumn(name = "account_id")
//   private Account account;
//
//   @ManyToOne
//   @JoinColumn(name = "restr_id")
//   private Restaurant restaurant;
//
//   @ManyToMany
//   @JoinTable(name = "yam_food_table")
//   private Set<Food> foods;
//
//   @ManyToMany
//   @JoinTable(name = "yam_tag_table")
//   private Set<Tag> tags;
//
//   private String memo;
//   private boolean closed;
//
//   @OneToOne(mappedBy = "yam")
//   private Review review;
//
// }
