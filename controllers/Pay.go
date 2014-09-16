package controllers

import (
	"github.com/alipay"
	e "ibookings/entity"
)

type PayController struct {
	e.HTTP
}

var (
	aliRequest = alipay.Request{
		NotifyUrl: `http://127.0.0.1/dirpay/notify_url.php`, // 付款后异步通知页面
		ReturnUrl: `http://127.0.0.1/dirpay/return_url.php`, // 付款后返回页面
		// OutTradeNo:  `138329153`,                              // 订单号
		SellerEmail: `jjjachyty@163.com`,         // 支付宝用户名
		Service:     `create_direct_pay_by_user`, // 不可改
		PaymentType: `1`,                         // 不可改
		// Subject:     `测试`,                                     // 商品名称
		// TotalFee:    1.03,                                     // 价格
	}
	aliConfig = alipay.Config{
		Partner: `2088302474149945`,                 // 支付宝合作者身份 ID
		Key:     `3be72cacdyeo1ulhtuvdkv8x64uo257u`, // 支付宝交易安全校验码
	}
)

/**
 * AliPay即时支付
 */
func (this *PayController) Alipay() {
	r := this.Request
	w := this.ResponseWriter
	r.ParseForm()
	var orderid = r.FormValue("orderid")

	aliRequest.OutTradeNo = orderid
	aliRequest.Subject = "1002"
	aliRequest.TotalFee = 60
	// 输出的是 html 页面，会自动跳转到支付界面
	alipay.NewPage(aliConfig, aliRequest, w)
}
