// TODO: singleQuote Parameter

// TODO: System Package
import 'dart:async';
import 'dart:math';

import 'package:nss_core/nss_core.dart';

import 'nss_core_service.dart';

final NssCoreService nssCoreService = NssCoreService();
final QuoteSubscriber quoteSubscriber = new QuoteSubscriber('SingleQuote');
final List<StreamSubscription> subscription = List<StreamSubscription>();

double nominal = 54.450;
Random random = new Random();
Timer timer;
String change;

// TODO: Local-nssCore_Data
/// In the Future -> Those Data should be store as a SharePreference
String fidCurrency;

/// localStorage of dataStream[FID_CURRENCY]
String fidNominal;

/// localStorage of dataStream[FID_NOMINAL]
String findChange;

/// localStorage of dataStream[FID_CHANGE]
String findPerChange;

/// localStorage of dataStream[FID_PER_CHANGE]
String fidHigh;

/// localStorage of dataStream[FID_HIGH]
String fidOpen;

/// localStorage of dataStream[FID_OPEN]
String fidLow;

/// localStorage of dataStream[FID_LOW]
String fidClose;

/// localStorage of dataStream[FID_CLOSE]
bool stockIsUp = true;


String transaction_date;
String transaction_status;
String transaction_volume;
String transaction_dealPrice;
String transaction_dealVol;


double diffPriceInPercent = 1.23;
double highPrice = 1.6720;
double openPrice = 1.6720;
double lowPrice = 1.620;
double beforePrice = 1.620;
double updatePrice = 1.641;

String stockCode;
String stockName = "經濟日報集團";

// TODO: DataFlow Control
bool isHigher = true;
bool isMarketClose = false;
bool isStockUp = true;
bool isStockPriceGood = true;

// TODO: Up/Down Symbol Control
bool needColor = false;
int colorController;

// TODO: Immutable DataSet (HardCode Control)
// TODO: Pre-Define Stock Information

final List<String> stockDetailGridViewKey = [
  "成交金額",
  "成交股數",
  "交易宗數",
  "每手股數",
  "買賣差價",
  "入場費",
  "帳面淨值",
  "每股派息",
  "市盈率",
  "周息率",
  "預測市盈",
  "預測息率",
  "1個月高",
  "52周高",
  "1個月低",
  "52周高低",
  "14天 RSI",
  "10天平均",
  "市值",
  "20天平均",
  "沽空（上午）",
  "50天平均",
  "沽空%",
  "250天平均"
];
//Immutable List  for store the Detail of the Stock -> Corresponding to the Key of the Stock Detail
final List<String> stockDetailGridViewValue = [
  "92.00K",
  "56.06K",
  "21",
  "2000",
  "0.010/0.010",
  "3280",
  "HKD 2.109",
  "HKD 0.085",
  "9.90",
  "5.18%",
  " ",
  " ",
  "1.700",
  "1.750",
  "1.550",
  "1.240",
  "46.732",
  "1.617",
  "707.82M",
  " ",
  " ",
  " ",
  " ",
  " "
];

///An Inputting Data, and it will be used to update the price of the stock
///Corresponding to the price of the stock within different periods (per 1 seconds)
final List<double> futurePrice = [
  1.641,
  1.999,
  1.665,
  1.672,
  1.681,
  1.654,
  1.665,
  1.676,
  1.747,
  1.653,
  1.631,
  1.639,
  1.636,
  1.541,
  1.499,
  1.433,
  1.587,
  1.642,
  1.644,
  1.666,
  1.689,
  1.685,
  1.675,
  1.677,
  1.659,
  1.590,
  1.548
];

List sectionTabs = ["報價", "經紀掛盤", "資金流向", "相關新聞", "同行比較", "公司資料"];

// TODO: StockInfoTableName
final List<String> stockInfoTableName = [
  "成交金額",
  "成交股數",
  "交易宗數",
  "每手股數",
  "帳面淨值",
  "每股派息",
  "市盈率",
  "周息率",
  "預測市盈",
  "預測周息",
  "1個月高",
  "52周高",
  "1個月低",
  "52周低",
  "14天RSI",
  "10天平均",
  "市值",
  "20天平均",
  "沽空",
  "50天平均"
];

//final List<Function> stockInfoStreamName = [fallbackFilter<double>(dataStream[HK_FID_TURNOVER]), fallbackFilter<double>(dataStream[HK_FID_VOLUME]),
//  fallbackFilter<double>(dataStream[HK_FID_NO_OF_TRANS]), fallbackFilter<double>(dataStream[HK_FID_BOARDLOT]), fallbackFilter<double>(dataStream[HK_FID_BOARDLOT]),
//  fallbackFilter<double>(dataStream[HK_FID_DPS]), fallbackFilter<double>(dataStream[HK_FID_PE_RATIO]), fallbackFilter<double>(dataStream[HK_FID_PERCENT_YIELD]),
//  fallbackFilter<double>(dataStream[HK_FID_EXPECT_PE_RATIO]), fallbackFilter<double>(dataStream[HK_FID_EXPECT_PERCENT_YIELD]), fallbackFilter<double>(dataStream[HK_FID_1M_HIGH]),
//  fallbackFilter<double>(dataStream[HK_FID_52W_HIGH]), fallbackFilter<double>(dataStream[HK_FID_1M_LOW]), fallbackFilter<double>(dataStream[HK_FID_52W_LOW]),
//  fallbackFilter<double>(dataStream[HK_FID_RSI14]), fallbackFilter<double>(dataStream[HK_FID_SMA_10]), fallbackFilter<double>(dataStream[HK_FID_MARKET_CAP]),
//  fallbackFilter<double>(dataStream[HK_FID_SMA_20]), fallbackFilter<double>(dataStream[HK_FID_SHORTSELL]), fallbackFilter<double>(dataStream[HK_FID_SMA_50]),
//];

final List<String> stockInfoStreamName = [
  HK_FID_TURNOVER,
  HK_FID_VOLUME,
  HK_FID_NO_OF_TRANS,
  HK_FID_BOARDLOT,
  " ",
  HK_FID_DPS,
  HK_FID_PE_RATIO,
  HK_FID_PERCENT_YIELD,
  HK_FID_EXPECT_PE_RATIO,
  HK_FID_EXPECT_PERCENT_YIELD,
  HK_FID_1M_HIGH,
  HK_FID_52W_HIGH,
  HK_FID_1M_LOW,
  HK_FID_52W_LOW,
  HK_FID_RSI14,
  HK_FID_SMA_10,
  HK_FID_MARKET_CAP,
  HK_FID_SMA_20,
  HK_FID_SHORTSELL,
  HK_FID_SMA_50
];

// FID_EXPECT_PERCENT_YIELD -> FID_EPY

// TODO: Actually the CodeList should be the user input StockCodeList
List<String> codeList = ['1', '700', '5', '386'];
int position = 0;
final String username = "DEV49";
final String password = "IQDEV49";
Map<String, dynamic> dataStream = Map<String, dynamic>();

fallbackFilter<V>(V value, [String predicate(V v)]) {
  if (value != null) {
    if (predicate != null) {
      return predicate(value);
    } else {
      // TODO: When There is no a pair data -> It will return the corresponding values of the fields
      return value.toString();
    }
  } else {
    return "";
  }
}

final fields = [
  HK_FID_TC_NAME,
  HK_FID_SC_NAME,
  HK_FID_EN_NAME,
  HK_FID_BID,
  HK_FID_ASK,
  HK_FID_OPEN,
  HK_FID_HIGH,
  HK_FID_LOW,
  HK_FID_SMA_250,
  HK_FID_MARKET,
  HK_FID_INDUSTRY_REL,
  HK_FID_INDEX_REL,
  HK_FID_SECURITY_TYPE,
  HK_FID_HV20,
  HK_FID_NBV,
  HK_FID_CLOSE,
  HK_FID_BOARDLOT,
  HK_FID_PER_CHANGE,
  HK_FID_CHANGE,
  HK_FID_TURNOVER,
  HK_FID_NO_OF_TRANS,
  HK_FID_VOLUME,
  HK_FID_NOMINAL,
  HK_FID_CURRENCY,
  HK_FID_1M_HIGH,
  HK_FID_1M_LOW,
  HK_FID_52W_HIGH,
  HK_FID_52W_LOW,
  HK_FID_RSI14,
  HK_FID_MARKET_CAP,
  HK_FID_SHORTSELL,
  HK_FID_SMA_10,
  HK_FID_SMA_20,
  HK_FID_SMA_50,
  HK_FID_PE_RATIO,
  HK_FID_EXPECT_PE_RATIO,
  HK_FID_DPS,
  HK_FID_EXPECT_DPS,
  HK_FID_PERCENT_YIELD,
  HK_FID_EXPECT_PERCENT_YIELD,
  HK_FID_EPS,
  HK_FID_EXPECT_EPS,
  HK_FID_TRANSQUEUE,
];
