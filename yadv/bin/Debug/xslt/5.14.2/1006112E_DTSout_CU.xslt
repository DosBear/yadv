<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:DTSout_CU="urn:customs.ru:Information:CustomsDocuments:DTSout_CU:5.14.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.14.0" xmlns:cat_EDTS_cu="urn:customs.ru:CUESADDTSCommonAggregateTypes:5.14.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.0" xmlns:RUDECLcat="urn:customs.ru:RUDeclCommonAggregateTypesCust:5.14.0" xmlns:cltESAD_cu="urn:customs.ru:CUESADCommonLeafTypes:5.12.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
   <!-- Версия 1.0 от 25.11.2008.  -->
   <!-- Для  xmlns=urn:customs.ru:Information:CustomsDocuments:DTSout_CU:4.7.0  -->
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
   <xsl:variable name="eng">
		ABCDIFG
    </xsl:variable>
   <xsl:variable name="rus">
		АБВГДЕЖ
    </xsl:variable>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template name="russian_date">
      <xsl:param name="dateIn"/>
      <xsl:choose>
         <xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
            <xsl:value-of select="substring($dateIn,9,2)"/>.<xsl:value-of select="substring($dateIn,6,2)"/>.<xsl:value-of select="substring($dateIn,1,4)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dateIn"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template name="russian_date_gtd">
      <xsl:param name="dateIn"/>
      <xsl:choose>
         <xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
            <xsl:value-of select="substring($dateIn,9,2)"/>
            <xsl:value-of select="substring($dateIn,6,2)"/>
            <xsl:value-of select="substring($dateIn,3,2)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dateIn"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="DTSout_CU:DTSout_CU">
      <html>
         <head>
            <title>Декларация таможенной стоимости</title>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
            <style type="text/css">
              body {
              text-align: center;
              background: #cccccc;
              }

              div.page {
              width: 210mm;
              height: 297mm;
              margin-top: 6pt;
              margin-bottom: 6pt;
              padding:	10mm;
              padding-left:	20mm;
              background: #ffffff;
              border: solid 1pt #000000;
              page-break-before: always;
              }

              div.page.nobreak {
              page-break-before: avoid;
              }

              /*Стиль для удаления чёрной границы вокруг нарисованной "страницы" при печати*/
              @media print {div.page {border: none; margin: 0; padding: 0;}}

              div.goods {
              background: #ffffff;
              }

              .bordered {
              border: solid 1pt #000000;
              padding-top:4pt;
              padding-bottom:4pt;
              font-family: Arial;
              font-size: 9pt;
              font-weight: bold;
              }

              .underlined {
              border-bottom: solid 0.8pt #000000;
              }

              p.NumberDate {
              font-weight: bold;
              }

              .graph {
              font-family: Arial;
              font-size: 7pt;
              }

              .graphBold {
              font-family: Arial;
              font-size: 7pt;
              font-weight: bold;
              }

              td {
              font-family:Courier;
              }

              .graphMain {
              font-family: Arial;
              font-size: 9pt;
              font-weight: bold;
              }

              .graphNo {
              font-size: 10pt;
              font-weight: bold;
              }					
              </style>
         </head>
         <body>
            <xsl:choose>
               <xsl:when test="DTSout_CU:FormDTS=1">
                  <div class="page nobreak">
                     <table cellpadding="0" cellspacing="0" style="width:100%; border:solid 0pt #000000;">
                        <tbody>
                           <tr>
                              <td align="right" class="graphNo">ДЕКЛАРАЦИЯ ТАМОЖЕННОЙ СТОИМОСТИ</td>
                           </tr>
                           <tr>
                              <td align="right" class="graph">Форма ДТС-1</td>
                           </tr>
                        </tbody>
                     </table>
                     <table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0.8pt #000000;">
                        <tbody>
                           <tr>
                              <td class="graph" style="width:100mm;border-left:solid 0.8pt #000000;border-top:solid 0.8pt #000000;">
                                 <span class="graphNo">1 </span>
                                 <span class="graph">Продавец (поставщик)</span>
                                 <br/>
                                 <xsl:apply-templates mode="org" select="DTSout_CU:DTSoutSeller"/>
                              </td>
                              <td class="graph" rowspan="3" style="width:80mm;border-left:solid 2pt #000000;border-top:solid 1.5pt #000000;border-right:solid 0.8pt #000000;border-bottom:solid 1.5pt #000000;" valign="top">
                                 <span class="graph">ДЛЯ ОТМЕТОК ТАМОЖЕННОГО ОРГАНА</span>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" style="width:100mm;border-left:solid 0.8pt #000000;border-top:solid 0.8pt #000000;">
                                 <span class="graphNo">2 </span>
                                 <span class="graph">(а) Покупатель (получатель)</span>
                                 <br/>
                                 <xsl:apply-templates mode="org" select="DTSout_CU:DTSoutBuyer"/>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" style="width:100mm;border-left:solid 0.8pt #000000;border-top:solid 0.8pt #000000;">
                                 <span class="graphNo">2 </span>
                                 <span class="graph">(б) Декларант</span>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" style="width:100mm;border-left:solid 0.8pt #000000;">
                                 <xsl:apply-templates mode="org" select="DTSout_CU:DTSoutDeclarant"/>
                              </td>
                              <td class="graph" style="width:80mm;border:solid 0.8pt #000000;" valign="top">
                                 <span class="graphNo">3 </span>
                                 <span class="graph">Условия поставки</span>
                                 <br/>
                                 <xsl:for-each select="DTSout_CU:DeliveryTerms">
                                    <xsl:value-of select="cat_ru:DeliveryTermsStringCode"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:for-each select="cat_ru:DeliveryPlace">
                                       <xsl:value-of select="."/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:for-each>
                                    <xsl:for-each select="cat_ru:DeliveryTermsRBCode">
                                       <xsl:value-of select="."/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:for-each>
                                    <xsl:for-each select="cat_ru:TransferPlace">
                                       <xsl:value-of select="."/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:for-each>
                                 </xsl:for-each>
                              </td>
                           </tr>
                           <tr>
                              <td class="graphBold" rowspan="2" style="width:100mm;border-left:solid 1.5pt #000000;border-top:solid 2pt #000000;border-right:solid 1.5pt #000000;border-bottom:solid 1.5pt #000000;">
                                 <xsl:text>ВАЖНАЯ ИНФОРМАЦИЯ</xsl:text>
                                 <br/>
                                 <xsl:text>В соответствии с пунктом 2 статьи 84 ТК ЕАЭС декларант либо </xsl:text>
                                 <br/>
                                 <xsl:text>таможенный представитель несет ответственность за указание в декларации таможенной</xsl:text>
                                 <br/>
                                 <xsl:text>стоимости недостоверных сведений. Декларант обязан также представить при </xsl:text>
                                 <br/>
                                 <xsl:text>необходимости соответствующую дополнительную информацию и необходимые</xsl:text>
                                 <br/>
                                 <xsl:text> документы, подтверждающие использованные для определения заявленной таможенной</xsl:text>
                                 <br/>
                                 <xsl:text> стоимости сведения.</xsl:text>
                              </td>
                              <td class="graph" style="width:80mm;border-left:solid 0.8pt #000000;border-right:solid 0.8pt #000000;" valign="top">
                                 <span class="graphNo">4 </span>
                                 <span class="graph">Номер и дата счета (счетов)</span>
                                 <br/>
                                 <xsl:for-each select="DTSout_CU:DTSInvoiceDocuments">
                                    <xsl:if test="cat_EDTS_cu:PositionNumber = '4'">
                                       <xsl:value-of select="cat_EDTS_cu:PresentedDocumentModeCode"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													№ <xsl:value-of select="cat_ru:PrDocumentNumber"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													от <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                       </xsl:call-template>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="cat_ru:PrDocumentName"/>
                                       <br/>
                                    </xsl:if>
                                 </xsl:for-each>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" style="width:80mm;border-left:solid 0.8pt #000000;border-right:solid 0.8pt #000000;border-top:solid 0.8pt #000000;" valign="top">
                                 <span class="graphNo">5 </span>
                                 <span class="graph">Номер и дата контракта</span>
                                 <br/>
                                 <xsl:for-each select="DTSout_CU:DTSInvoiceDocuments">
                                    <xsl:if test="cat_EDTS_cu:PositionNumber = '5'">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="cat_EDTS_cu:PresentedDocumentModeCode"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="cat_ru:PrDocumentNumber"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                       </xsl:call-template>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="cat_ru:PrDocumentName"/>
                                       <br/>
                                    </xsl:if>
                                 </xsl:for-each>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" colspan="2" style="width:180mm;border:solid 0.8pt #000000;" valign="top">
                                 <span class="graphNo">6 </span>
                                 <span class="graph">Номер и дата документа с принятыми таможенными органами решениями, применимыми к графам 7-9</span>
                                 <br/>
                                 <xsl:for-each select="DTSout_CU:DTSInvoiceDocuments">
                                    <xsl:if test="cat_EDTS_cu:PositionNumber = '6'">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="cat_EDTS_cu:PresentedDocumentModeCode"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="cat_ru:PrDocumentNumber"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                       </xsl:call-template>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="cat_ru:PrDocumentName"/>
                                       <br/>
                                    </xsl:if>
                                 </xsl:for-each>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" colspan="2" style="width:180mm;border:solid 0.8pt #000000;" valign="top">
                                 <table cellpadding="0" cellspacing="0" style="width:100%;">
                                    <tbody>
                                       <tr>
                                          <td class="graph" style="width:140mm;" valign="top">
                                             <span class="graphNo">7 </span>
                                             <span class="graph">(а) Имеется ли ВЗАИМОСВЯЗЬ между продавцом и покупателем в значении, указанном в статье 37 ТК ЕАЭС? *</span>
                                          </td>
                                          <td class="graph" colspan="4" style="width:40mm;" valign="top">
                                             <table cellpadding="0" cellspacing="0" style="width:100%;">
                                                <tbody>
                                                   <tr>
                                                      <td align="center" class="graph" style="width:30mm;border-left:solid 0.8pt #000000;border-bottom:solid 0.8pt #000000;" valign="top">
                                                         <span class="graphBold">Верное отметить</span>
                                                      </td>
                                                      <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                                         <span class="graphBold">х</span>
                                                      </td>
                                                      <td align="center" class="graph" style="width:5mm;border-bottom:solid 0.8pt #000000;">
                                                         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                      </td>
                                                   </tr>
                                                </tbody>
                                             </table>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:140mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph"><xsl:text disable-output-escaping="yes"> &amp;lt;*&amp;gt; - В случае ответа НЕТ, далее к графе 8”</xsl:text></span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="(number(DTSout_CU:DTSBuyerSellerDependence/cat_EDTS_cu:Column7A)=1) or (DTSout_CU:DTSBuyerSellerDependence/cat_EDTS_cu:Column7A='t')">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <span class="graph">ДА</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="(number(DTSout_CU:DTSBuyerSellerDependence/cat_EDTS_cu:Column7A)=0) or (DTSout_CU:DTSBuyerSellerDependence/cat_EDTS_cu:Column7A='f')">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <span class="graph">НЕТ</span>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:140mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">(б) Оказала ли взаимосвязь между продавцом и покупателем влияние на цену ввозимого товара</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="(number(DTSout_CU:DTSBuyerSellerDependence/cat_EDTS_cu:Column7B)=1) or (DTSout_CU:DTSBuyerSellerDependence/cat_EDTS_cu:Column7B='t')">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <span class="graph">ДА</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="(number(DTSout_CU:DTSBuyerSellerDependence/cat_EDTS_cu:Column7B)=0) or (DTSout_CU:DTSBuyerSellerDependence/cat_EDTS_cu:Column7B='f')">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <span class="graph">НЕТ</span>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:140mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">(в) Стоимость сделки с ввозимыми товарами близка к одной из возможных проверочных величин, указанных в пункте 5 статьи 39 ТК ЕАЭС?</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;" valign="middle">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;" valign="middle">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:140mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">таможенную границу Таможенного союза</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="(number(DTSout_CU:DTSBuyerSellerDependence/cat_EDTS_cu:Column7C)=1) or (DTSout_CU:DTSBuyerSellerDependence/cat_EDTS_cu:Column7C='t')">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <span class="graph">ДА</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="(number(DTSout_CU:DTSBuyerSellerDependence/cat_EDTS_cu:Column7C)=0) or (DTSout_CU:DTSBuyerSellerDependence/cat_EDTS_cu:Column7C='f')">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <span class="graph">НЕТ</span>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:140mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">В случае ответа ДА, указываются подробности</span>
                                             <br/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:for-each select="DTSout_CU:DTSBuyerSellerDependence/cat_EDTS_cu:Column7CDescription[not(cat_EDTS_cu:ConsignmentItemOrdinal)]">
                                                <xsl:apply-templates select="cat_EDTS_cu:DescriptionText"/>
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             </xsl:for-each>
                                             <xsl:if test="DTSout_CU:DTSBuyerSellerDependence/cat_EDTS_cu:Column7CDescription[cat_EDTS_cu:ConsignmentItemOrdinal]">
												 <xsl:for-each select="DTSout_CU:DTSBuyerSellerDependence/cat_EDTS_cu:Column7CDescription[cat_EDTS_cu:ConsignmentItemOrdinal]">
													<br/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:text>для товара № </xsl:text>
													<xsl:value-of select="cat_EDTS_cu:ConsignmentItemOrdinal"/>
													<xsl:text>: </xsl:text>
													<xsl:apply-templates select="cat_EDTS_cu:DescriptionText"/>
												 </xsl:for-each>
                                             </xsl:if>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;" valign="middle">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;" valign="middle">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:140mm;" valign="top">
                                             <span class="graphNo">8 </span>
                                             <span class="graph">(а) Имеются ли ОГРАНИЧЕНИЯ в отношении прав покупателя на пользование и распоряжение товарами, за исключением ограничений, которые:</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;" valign="middle">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;" valign="middle">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:140mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">- установлены совместным решением органов Таможенного союза;</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;" valign="middle">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;" valign="middle">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:140mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">- ограничивают географический регион, в котором товары могут быть перепроданы;</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;" valign="middle">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;" valign="middle">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:140mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">- существенно не влияют на стоимость товаров.</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="(number(DTSout_CU:DTSSellingLimitation/cat_EDTS_cu:Column8A)=1) or (DTSout_CU:DTSSellingLimitation/cat_EDTS_cu:Column8A='t')">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <span class="graph">ДА</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="(number(DTSout_CU:DTSSellingLimitation/cat_EDTS_cu:Column8A)=0) or (DTSout_CU:DTSSellingLimitation/cat_EDTS_cu:Column8A='f')">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <span class="graph">НЕТ</span>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:140mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">(б) Зависит ли продажа товаров или их цена от соблюдения УСЛОВИЙ или ОБЯЗАТЕЛЬСТВ, влияние которых на цену оцениваемых товаров не может быть количественно определено?</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;" valign="middle">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;" valign="middle">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:140mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">Указывается вид и содержание, а также расчет стоимостной оценки таких условий или обязательств</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="(number(DTSout_CU:DTSSellingLimitation/cat_EDTS_cu:Column8B)=1) or (DTSout_CU:DTSSellingLimitation/cat_EDTS_cu:Column8B='t')">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <span class="graph">ДА</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="(number(DTSout_CU:DTSSellingLimitation/cat_EDTS_cu:Column8B)=0) or (DTSout_CU:DTSSellingLimitation/cat_EDTS_cu:Column8B='f')">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <span class="graph">НЕТ</span>
                                          </td>
                                       </tr>
                                       <xsl:if test="DTSout_CU:DTSSellingLimitation/cat_EDTS_cu:limitationDescription">
                                          <tr>
                                             <td class="graph" style="width:140mm;" valign="top">
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                <xsl:value-of select="DTSout_CU:DTSSellingLimitation/cat_EDTS_cu:limitationDescription"/>
                                             </td>
                                             <td align="center" class="graph" style="width:5mm;" valign="middle">
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             </td>
                                             <td class="graph" style="width:15mm;">
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             </td>
                                             <td align="center" class="graph" style="width:5mm;" valign="middle">
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             </td>
                                             <td class="graph" style="width:15mm;">
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             </td>
                                          </tr>
                                       </xsl:if>
                                       <tr>
                                          <td class="graph" colspan="5" style="width:180mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">Если влияние таких условий или обязательств на цену товаров может быть количественно определено, сумма указывается в графе 11б</span>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:140mm;" valign="top">
                                             <span class="graphNo">9 </span>
                                             <span class="graph">(а) Предусмотрены ли ЛИЦЕНЗИОННЫЕ и иные подобные ПЛАТЕЖИ за использование объектов ИНТЕЛЛЕКТУАЛЬНОЙ СОБСТВЕННОСТИ (за исключением платежей за право воспроизведения (тиражирования) ввозимых товаров на единой таможенной территории Таможенного союза), которые относятся к оцениваемым </span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;" valign="middle">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;" valign="middle">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:140mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">товарам и которые покупатель прямо или косвенно должен уплатить в качестве условия продажи таких товаров</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="(number(DTSout_CU:DTSAdditionalPayments/cat_EDTS_cu:Column9A)=1) or (DTSout_CU:DTSAdditionalPayments/cat_EDTS_cu:Column9A='t')">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <span class="graph">ДА</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="(number(DTSout_CU:DTSAdditionalPayments/cat_EDTS_cu:Column9A)=0) or (DTSout_CU:DTSAdditionalPayments/cat_EDTS_cu:Column9A='f')">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <span class="graph">НЕТ</span>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:140mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">(б) Зависит ли продажа товаров от соблюдения условия, в соответствии с которым ЧАСТЬ ДОХОДА (ВЫРУЧКИ), полученного в результате ПОСЛЕДУЮЩИХ ПРОДАЖ товаров, РАСПОРЯЖЕНИЯ товарами иным способом или их</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;" valign="middle">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;" valign="middle">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:140mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">ИСПОЛЬЗОВАНИЯ, будет причитаться прямо или косвенно продавцу?</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="(number(DTSout_CU:DTSAdditionalPayments/cat_EDTS_cu:Column9B)=1) or (DTSout_CU:DTSAdditionalPayments/cat_EDTS_cu:Column9B='t')">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <span class="graph">ДА</span>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="(number(DTSout_CU:DTSAdditionalPayments/cat_EDTS_cu:Column9B)=0) or (DTSout_CU:DTSAdditionalPayments/cat_EDTS_cu:Column9B='f')">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:15mm;">
                                             <span class="graph">НЕТ</span>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" colspan="5" style="width:180mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">В случае ответа ДА на подпункт (а) и/или (б): указываются условия и в графах 15 и 16 приводятся соответствующие суммы.</span>
                                             <xsl:if test="DTSout_CU:DTSAdditionalPayments/cat_EDTS_cu:PaymentDescription">
                                                <br/>
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                <xsl:value-of select="DTSout_CU:DTSAdditionalPayments/cat_EDTS_cu:PaymentDescription"/>
                                             </xsl:if>
                                             <xsl:if test="DTSout_CU:DTSAdditionalPayments/cat_EDTS_cu:PaymentConditionDescription">
                                                <br/>
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                <xsl:for-each select="DTSout_CU:DTSAdditionalPayments/cat_EDTS_cu:PaymentConditionDescription">
                                                   <xsl:value-of select="."/>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:for-each>
                                             </xsl:if>
                                          </td>
                                       </tr>
                                    </tbody>
                                 </table>
                              </td>
                           </tr>
                           <tr>
                              <td class="graphBold" rowspan="2" style="width:100mm;border-left:solid 1.5pt #000000;border-top:solid 2pt #000000;border-right:solid 1.5pt #000000;border-bottom:solid 1.5pt #000000;">
                                 <xsl:text>&lt;*&gt; ЛИЦА ЯВЛЯЮТСЯ ВЗАИМОСВЯЗАННЫМИ ИСКЛЮЧИТЕЛЬНО В ТОМ СЛУЧАЕ, ЕСЛИ</xsl:text>
                                 <br/>
                                 <xsl:text>(а) является сотрудниками или директорами (руководителями) придприятий друг друга;</xsl:text>
                                 <br/>
                                 <xsl:text>(б) являются юридически признанными деловыми партнерами, т.е. связаны договорными отношениями, действуют в целях извлечения прибыли и совместно несут расходы и убытки, связанные с осуществлением совместной деятельности;</xsl:text>
                                 <br/>
                                 <xsl:text>(в) являются работодателем и работником, служащим;</xsl:text>
                                 <br/>
                                 <xsl:text>(г) какое-либо лицо прямо или косвенно владеет, контролирует или является держателем пяти или более процентов выпущенных в обращение голосующих акций обоих из них;</xsl:text>
                                 <br/>
                                 <xsl:text>(д) одно из них прямо или косвенно контролирует другое;</xsl:text>
                                 <br/>
                                 <xsl:text>(е) оба они прямо или косвенно контролируются третьим лицом;</xsl:text>
                                 <br/>
                                 <xsl:text>(ж) вместе они прямо или косвенно контролируют третье лицо;</xsl:text>
                                 <br/>
                                 <xsl:text>(з) являются родственниками или членами одной семьи.</xsl:text>
                                 <br/>
                                 <xsl:text>Факт взаимосвязи сам по себе не должен являться основанием для признания стоимости сделки неприемлимой для целей определения таможенной стоимости товаров (пункт 4 статьи 39 ТК ЕАЭС).</xsl:text>
                              </td>
                              <td class="graph" style="width:80mm;border-left:solid 0.8pt #000000;border-right:solid 0.8pt #000000;" valign="top">
                                 <span class="graphNo">10 </span>
                                 <span class="graph">(а) Число дополнительных листов</span>
                                 <br/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:value-of select="DTSout_CU:AdditionalSheetNumber"/>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" style="width:80mm;border-left:solid 0.8pt #000000;border-right:solid 0.8pt #000000;" valign="top">
                                 <span class="graphNo">10 </span>
                                 <span class="graph">(б) Место, дата, подпись, печать</span>
                                 <br/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="DTSout_CU:EECEDocHeaderAddInfo/RUScat_ru:EDocDateTime"/>
                                 </xsl:call-template>
                                 <xsl:if test="cat_EDTS_cu:RegNumberDoc"> исх. номер 
										<xsl:value-of select="cat_EDTS_cu:RegNumberDoc"/>
                                 </xsl:if>
                                 <xsl:if test="cat_EDTS_cu:SecurityLabelCode">код защитной наклейки
										<xsl:value-of select="cat_EDTS_cu:SecurityLabelCode"/>
                                 </xsl:if>
                                 <br/>
                                 <xsl:if test="DTSout_CU:DTSout_CUFilledPerson/RUDECLcat:QualificationCertificate">Номер квалификационного аттестата специалиста по таможенному оформлению
											<xsl:value-of select="DTSout_CU:DTSout_CUFilledPerson/RUDECLcat:QualificationCertificate"/>
                                 </xsl:if>
                                 <br/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:value-of select="DTSout_CU:DTSout_CUFilledPerson/RUDECLcat:SigningDetails/cat_ru:PersonSurname"/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:value-of select="DTSout_CU:DTSout_CUFilledPerson/RUDECLcat:SigningDetails/cat_ru:PersonName"/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:value-of select="DTSout_CU:DTSout_CUFilledPerson/RUDECLcat:SigningDetails/cat_ru:PersonMiddleName"/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:if test="DTSout_CU:DTSout_CUFilledPerson/RUDECLcat:SignatoryPersonIdentityDetails">
									<xsl:for-each select="DTSout_CU:DTSout_CUFilledPerson/RUDECLcat:SignatoryPersonIdentityDetails">
										<xsl:value-of select="cat_ru:IdentityCardName"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:value-of select="cat_ru:IdentityCardSeries"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:value-of select="cat_ru:IdentityCardNumber"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:call-template name="russian_date">
										   <xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
										</xsl:call-template>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:value-of select="cat_ru:OrganizationName"/>
                                    </xsl:for-each>
                                 </xsl:if>
                                 <xsl:text> </xsl:text>
                                 <!--<xsl:value-of select="DTSout_CU:DTSout_CUFilledPerson/catESAD_cu:Contact/cat_ru:Phone"/>-->
                                 <xsl:for-each select="DTSout_CU:DTSout_CUFilledPerson/RUDECLcat:SigningDetails/RUScat_ru:CommunicationDetails/cat_ru:Phone">
                                    <xsl:value-of select="."/>
                                    <xsl:if test="position()!=last()">, </xsl:if>
                                 </xsl:for-each>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:value-of select="DTSout_CU:DTSout_CUFilledPerson/RUDECLcat:SigningDetails/cat_ru:PersonPost"/>
                                 <xsl:if test="DTSout_CU:DTSout_CUFilledPerson/RUDECLcat:PowerOfAttorneyDetails">
                                    <br/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:if test="DTSout_CU:DTSout_CUFilledPerson/RUDECLcat:PowerOfAttorneyDetails/cat_ru:PrDocumentName">
                                       <xsl:value-of select="DTSout_CU:DTSout_CUFilledPerson/RUDECLcat:PowerOfAttorneyDetails/cat_ru:PrDocumentName"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:if>
                                    <xsl:value-of select="DTSout_CU:DTSout_CUFilledPerson/RUDECLcat:PowerOfAttorneyDetails/cat_ru:PrDocumentNumber"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:if test="DTSout_CU:DTSout_CUFilledPerson/RUDECLcat:PowerOfAttorneyDetails/cat_ru:PrDocumentDate">
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="DTSout_CU:DTSout_CUFilledPerson/RUDECLcat:PowerOfAttorneyDetails/cat_ru:PrDocumentDate"/>
                                       </xsl:call-template>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:if>
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="DTSout_CU:DTSout_CUFilledPerson/RUDECLcat:PowerOfAttorneyDetails/RUScat_ru:DocValidityDate"/>
                                    </xsl:call-template>
                                 </xsl:if>
                              </td>
                           </tr>
                        </tbody>
                     </table>
                  </div>
                  <xsl:variable name="DTS" select="current()"/>
                  <xsl:for-each select="DTSout_CU:DTSout_CUGoodsCustomsCost[(position()) mod 3 = 1]">
                     <!--<xsl:for-each select="DTSout_CU:DTSout_CUGoodsCustomsCost">-->
                     <div class="page">
                        <table cellpadding="0" cellspacing="0" style="width:100%;">
                           <tbody>
                              <tr>
                                 <td align="right" class="graph" style="width:145mm;">
                                    <span class="graph">Форма ДТС-1</span>
                                 </td>
                                 <td align="right" class="graph" style="width:35mm;">
                                    <span class="graph">Лист №  </span>
                                    <xsl:value-of select="DTSout_CU:SheetNumber"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td align="right" class="graph" style="width:145mm;">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </td>
                                 <td align="right" class="graph" style="width:35mm;">
                                    <span class="graph">Метод 1</span>
                                 </td>
                              </tr>
                           </tbody>
                        </table>
                        <table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0.8pt #000000;">
                           <xsl:variable name="column2" select="following-sibling::DTSout_CU:DTSout_CUGoodsCustomsCost[1]"/>
                           <xsl:variable name="column3" select="following-sibling::DTSout_CU:DTSout_CUGoodsCustomsCost[2]"/>
                           <tbody>
                              <tr>
                                 <td align="center" class="graph" colspan="2" rowspan="2" style="width:110mm;border:solid 0.8pt #000000;" valign="top">
                                    <span class="graph">ДЛЯ ОТМЕТОК ТАМОЖЕННОГО ОРГАНА</span>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="top">
                                    <span class="graph">Товар № </span>
                                    <xsl:value-of select="DTSout_CU:GTDGoodsNumber"/>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="top">
                                    <span class="graph">Товар № </span>
                                    <xsl:value-of select="$column2/DTSout_CU:GTDGoodsNumber"/>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="top">
                                    <span class="graph">Товар № </span>
                                    <xsl:value-of select="$column3/DTSout_CU:GTDGoodsNumber"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="top">
                                    <span class="graph">Код ТН ВЭД</span>
                                    <br/>
                                    <xsl:value-of select="DTSout_CU:GoodsTNVEDCode"/>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="top">
                                    <span class="graph">Код ТН ВЭД</span>
                                    <br/>
                                    <xsl:value-of select="$column2/DTSout_CU:GoodsTNVEDCode"/>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="top">
                                    <span class="graph">Код ТН ВЭД</span>
                                    <br/>
                                    <xsl:value-of select="$column3/DTSout_CU:GoodsTNVEDCode"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" rowspan="4" style="width:20mm;border:solid 0.8pt #000000;" valign="top">
                                    <span class="graph">А. Основа для расчета</span>
                                 </td>
                                 <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                    <span class="graphNo">11 </span>
                                    <span class="graph">(а) Цена, фактически уплаченная или подлежащая уплате за товары в ВАЛЮТЕ СЧЕТА </span>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1CalculationBasis/cat_EDTS_cu:DealCurrencyCode"/>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1CalculationBasis/cat_EDTS_cu:DealCurrencyAmount"/>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="$column2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1CalculationBasis/cat_EDTS_cu:DealCurrencyAmount"/>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="$column3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1CalculationBasis/cat_EDTS_cu:DealCurrencyAmount"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <span class="graph">в НАЦИОНАЛЬНОЙ ВАЛЮТЕ</span>
                                    <br/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <span class="graph">(курс пересчета 
												<xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1CalculationBasis/cat_EDTS_cu:DealCurrencyRate"/>
                                       <xsl:if test="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1CalculationBasis/cat_EDTS_cu:CurrencyQuantity">
                                          <xsl:text> </xsl:text> за
												<xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1CalculationBasis/cat_EDTS_cu:CurrencyQuantity"/> ед.
												</xsl:if>
												
											) срок заявления:<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="DTSout_CU:CustomsCostDate"/></xsl:call-template></span>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1CalculationBasis/cat_EDTS_cu:DealNationalAmount"/>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="$column2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1CalculationBasis/cat_EDTS_cu:DealNationalAmount"/>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="$column3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1CalculationBasis/cat_EDTS_cu:DealNationalAmount"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <span class="graph">(б) Косвенные платежи (условия или обязательства) в НАЦИОНАЛЬНОЙ ВАЛЮТЕ - см. графу 8 (б)</span>
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1CalculationBasis/cat_EDTS_cu:IndirectCurrencyCode"/>
                                    <br/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <span class="graph">(курс пересчета 
												<xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1CalculationBasis/cat_EDTS_cu:IndirectCurrencyRate"/>
                                       <xsl:if test="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1CalculationBasis/cat_EDTS_cu:IndirectCurrencyQuantity">
                                          <xsl:text> </xsl:text> за
												<xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1CalculationBasis/cat_EDTS_cu:IndirectCurrencyQuantity"/> едн.</xsl:if>
											)</span>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1CalculationBasis/cat_EDTS_cu:IndirectNationalPayment"/>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="$column2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1CalculationBasis/cat_EDTS_cu:IndirectNationalPayment"/>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="$column3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1CalculationBasis/cat_EDTS_cu:IndirectNationalPayment"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                    <span class="graphNo">12 </span>
                                    <span class="graph">Итого А в рублях</span>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1CalculationBasis/cat_EDTS_cu:BasisNationalAmount"/>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="$column2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1CalculationBasis/cat_EDTS_cu:BasisNationalAmount"/>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="$column3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1CalculationBasis/cat_EDTS_cu:BasisNationalAmount"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" rowspan="12" style="width:20mm;border:solid 0.8pt #000000;" valign="top">
                                    <span class="graph">Б. ДОПОЛНИ- ТЕЛЬНЫЕ НАЧИСЛЕНИЯ: расходы в национальной валюте, которые не включены в А*</span>
                                 </td>
                                 <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                    <span class="graphNo">13 </span>
                                    <span class="graph">Расходы, произведенные покупателем на:</span>
                                    <br/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <span class="graph">(а) вознаграждения посреднику  (агенту), брокеру за исключением вознаграждений за закупку товаров</span>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:AgentBonus"/>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="$column2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:AgentBonus"/>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="$column3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:AgentBonus"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <span class="graph">(б) тару и упаковку</span>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:PackageExpenses"/>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="$column2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:PackageExpenses"/>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="$column3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:PackageExpenses"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                    <span class="graphNo">14 </span>
                                    <span class="graph">Соответствующим образом распределенная стоимость следующих товаров и услуг, прямо или косвенно предоставленных покупателем бесплатно или сниженной цене для использования в связи с  производством и продажей  для вывоза оцениваемых товаров на единую таможенную территорию таможенного союза, в размере, не включенном в цену, фактически уплаченную или подлежащую уплате:</span>
                                    <br/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <span class="graph">(а) сырья, материалов, деталей, полуфабрикатов и тому подобных предметов, которых состоят  ввозимые товары</span>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:StoreCost"/>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="$column2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:StoreCost"/>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="$column3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:StoreCost"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <span class="graph">(б) инструментов, штампов, форм и других подобных предметов, использованных при производстве ввозимых товаров</span>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:ProductionToolkitCost"/>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="$column2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:ProductionToolkitCost"/>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="$column3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:ProductionToolkitCost"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <span class="graph">(в) материалов, израсходованных при производстве ввозимых товаров</span>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:WorkingStockCost"/>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="$column2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:WorkingStockCost"/>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="$column3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:WorkingStockCost"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <span class="graph">(г) проектирования, разработки, инженерной, конструктивной работы, художественного оформления, дизайна, эскизов и чертежей, выполненных вне единой таможенной территории Таможенного союза и необходимых для производства ввозимых товаров</span>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:DesignPayment"/>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="$column2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:DesignPayment"/>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="$column3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:DesignPayment"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                    <span class="graphNo">15 </span>
                                    <span class="graph">Лицензионные и иные подобные платежи за использование объектов интеллектуальной собственности - см. графу 9 (а)</span>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:IntellectualPropertyPayment"/>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="$column2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:IntellectualPropertyPayment"/>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="$column3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:IntellectualPropertyPayment"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                    <span class="graphNo">16 </span>
                                    <span class="graph">Часть дохода (выручки), полученного в результате последующей продажи, распоряжения иным способом или использования товаров, которая прямо или косвенно причитается продавцу - см. графу 9 (б)</span>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:SellerIncome"/>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="$column2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:SellerIncome"/>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="$column3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:SellerIncome"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                    <span class="graphNo">17 </span>
                                    <span class="graph">Расходы по перевозке (транспортировке) товаров до 
											<xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:BorderPlace"/>
											 (место прибытия на единую таможенную территорию Таможенного союза)</span>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:BorderTransportCharges"/>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="$column2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:BorderTransportCharges"/>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="$column3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:BorderTransportCharges"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                    <span class="graphNo">18 </span>
                                    <span class="graph">Расходы по погрузке, выгрузке/перегрузке товаров и иным операциям, связанным с перевозкой до 
											<xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:BorderPlace"/>
											(место прибытия на единую таможенную территорию Таможенного союза)</span>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:LoadCharges"/>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="$column2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:LoadCharges"/>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="$column3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:LoadCharges"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                    <span class="graphNo">19 </span>
                                    <span class="graph">Расходы на страхование в связи с операциями, указанными в графах 17 и 18</span>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:InsuranceCharges"/>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="$column2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:InsuranceCharges"/>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="$column3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:InsuranceCharges"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                    <span class="graphNo">20 </span>
                                    <span class="graph">Итого Б в национальной валюте</span>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:TotalAdditionalSum"/>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="$column2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:TotalAdditionalSum"/>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="$column3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:TotalAdditionalSum"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" rowspan="4" style="width:20mm;border:solid 0.8pt #000000;" valign="top">
                                    <span class="graph">В. ВЫЧЕТЫ: расходы в национальной валюте, которые включены в А*</span>
                                 </td>
                                 <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                    <span class="graphNo">21 </span>
                                    <span class="graph">Расходы на строительство, возведение, сборку, монтаж, обслуживание, или оказание технического содействия, производимые после ввоза товаров на единую таможенную территорию таможенного союза</span>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1Deduction/cat_EDTS_cu:BuildingAmount"/>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="$column2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1Deduction/cat_EDTS_cu:BuildingAmount"/>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="$column3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1Deduction/cat_EDTS_cu:BuildingAmount"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                    <span class="graphNo">22 </span>
                                    <span class="graph">Расходы по перевозке (транспортировке) товаров после их прибытия на единую таможенную территорию таможенного союза</span>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1Deduction/cat_EDTS_cu:UnionTransportCharge"/>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="$column2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1Deduction/cat_EDTS_cu:UnionTransportCharge"/>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="$column3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1Deduction/cat_EDTS_cu:UnionTransportCharge"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                    <span class="graphNo">23 </span>
                                    <span class="graph">Пошлины, налоги и сборы, уплачиваемые на единой таможенной территории таможенного союза в связи с ввозом или продажей ввозимых товаров</span>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1Deduction/cat_EDTS_cu:UnionTaxPayment"/>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="$column2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1Deduction/cat_EDTS_cu:UnionTaxPayment"/>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="$column3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1Deduction/cat_EDTS_cu:UnionTaxPayment"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                    <span class="graphNo">24 </span>
                                    <span class="graph">Итого В в национальной валюте</span>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1Deduction/cat_EDTS_cu:TotalDeductionAmount"/>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="$column2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1Deduction/cat_EDTS_cu:TotalDeductionAmount"/>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="$column3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1Deduction/cat_EDTS_cu:TotalDeductionAmount"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" colspan="2" style="width:110mm;border:solid 0.8pt #000000;" valign="top">
                                    <span class="graphNo">25 </span>
                                    <span class="graph">ЗАЯВЛЕННАЯ ТАМОЖЕННАЯ СТОИМОСТЬ (А + Б - В)</span>
                                    <br/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <span class="graph">(а) в НАЦИОНАЛЬНОЙ ВАЛЮТЕ</span>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSout_CU:NationalDeclaredCustomsCost"/>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="$column2/DTSout_CU:NationalDeclaredCustomsCost"/>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="$column3/DTSout_CU:NationalDeclaredCustomsCost"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" colspan="2" style="width:110mm;border:solid 0.8pt #000000;" valign="top">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <span class="graph">(б) в ДОЛЛАРАХ США (курс пересчета 
											<xsl:value-of select="$DTS/DTSout_CU:ExchangeRate/RUScat_ru:CurrencyRate"/>
										<xsl:choose>
											<xsl:when test="$DTS/DTSout_CU:CurrencyQuantity">
												<xsl:text> </xsl:text>за 
												<xsl:value-of select="$DTS/DTSout_CU:CurrencyQuantity"/>едн.
											</xsl:when>
											<xsl:when test="$DTS/DTSout_CU:ExchangeRate/RUScat_ru:ScaleNumber">
												<xsl:text> </xsl:text>за 
												<xsl:call-template name="power">
													<xsl:with-param name="number" select="10"/>
													<xsl:with-param name="topower" select="$DTS/DTSout_CU:ExchangeRate/RUScat_ru:ScaleNumber"/>
												 </xsl:call-template>едн.
											</xsl:when>
										</xsl:choose>
											)</span>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSout_CU:DollarDeclaredCustomsCost"/>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="$column2/DTSout_CU:DollarDeclaredCustomsCost"/>
                                 </td>
                                 <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="$column3/DTSout_CU:DollarDeclaredCustomsCost"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" colspan="5" style="width:180mm;border:solid 0.8pt #000000;" valign="top">
                                    <table cellpadding="0" cellspacing="0" style="width:100%;">
                                       <tbody>
                                          <tr>
                                             <td class="graph" colspan="3" style="width:180mm;" valign="top">
                                                <xsl:text>* Если сумма оплачена в иностранной валюте, здесь указывается сумма в иностранной валюте и курс пересчета по каждому товару и элементу стоимости</xsl:text>
                                             </td>
                                          </tr>
                                          <tr>
                                             <td class="graph" style="width:80mm;" valign="top">
                                                <span class="graph">Номер товара и позиции</span>
                                             </td>
                                             <td class="graph" style="width:40mm;" valign="top">
                                                <span class="graph">Код валюты, сумма</span>
                                             </td>
                                             <td class="graph" style="width:40mm;" valign="top">
                                                <span class="graph">Курс пересчета</span>
                                             </td>
                                          </tr>
                                          <xsl:for-each select="DTSout_CU:DTSCurrencyPayment">
                                             <tr>
                                                <td class="graph" style="width:80mm;" valign="top">
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   <xsl:value-of select="cat_EDTS_cu:PositionsNumber"/>
                                                </td>
                                                <td class="graph" style="width:40mm;" valign="top">
                                                   <xsl:value-of select="cat_EDTS_cu:CurrencyCode"/>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   <xsl:value-of select="cat_EDTS_cu:CurrencyAmount"/>
                                                </td>
                                                <td class="graph" style="width:40mm;" valign="top">
                                                   <xsl:choose>
                                                      <xsl:when test="cat_EDTS_cu:CurrencyRate">
                                                         <xsl:value-of select="cat_EDTS_cu:CurrencyRate"/>
                                                         <xsl:if test="cat_EDTS_cu:CurrencyQuantity">
                                                            <xsl:text> </xsl:text>за
																			<xsl:value-of select="cat_EDTS_cu:CurrencyQuantity"/>ед.
																			</xsl:if>
                                                      </xsl:when>
                                                      <xsl:otherwise>
                                                         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                      </xsl:otherwise>
                                                   </xsl:choose>
                                                </td>
                                             </tr>
                                          </xsl:for-each>
                                          <xsl:for-each select="$column2/DTSout_CU:DTSCurrencyPayment">
                                             <tr>
                                                <td class="graph" style="width:80mm;" valign="top">
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   <xsl:value-of select="cat_EDTS_cu:PositionsNumber"/>
                                                </td>
                                                <td class="graph" style="width:40mm;" valign="top">
                                                   <xsl:value-of select="cat_EDTS_cu:CurrencyCode"/>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   <xsl:value-of select="cat_EDTS_cu:CurrencyAmount"/>
                                                </td>
                                                <td class="graph" style="width:40mm;" valign="top">
                                                   <xsl:choose>
                                                      <xsl:when test="cat_EDTS_cu:CurrencyRate">
                                                         <xsl:value-of select="cat_EDTS_cu:CurrencyRate"/>
                                                         <xsl:if test="cat_EDTS_cu:CurrencyQuantity">
                                                            <xsl:text> </xsl:text>за
																			<xsl:value-of select="cat_EDTS_cu:CurrencyQuantity"/>едн.
																			</xsl:if>
                                                      </xsl:when>
                                                      <xsl:otherwise>
                                                         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                      </xsl:otherwise>
                                                   </xsl:choose>
                                                </td>
                                             </tr>
                                          </xsl:for-each>
                                          <xsl:for-each select="$column3/DTSout_CU:DTSCurrencyPayment">
                                             <tr>
                                                <td class="graph" style="width:80mm;" valign="top">
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   <xsl:value-of select="cat_EDTS_cu:PositionsNumber"/>
                                                </td>
                                                <td class="graph" style="width:40mm;" valign="top">
                                                   <xsl:value-of select="cat_EDTS_cu:CurrencyCode"/>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                   <xsl:value-of select="cat_EDTS_cu:CurrencyAmount"/>
                                                </td>
                                                <td class="graph" style="width:40mm;" valign="top">
                                                   <xsl:choose>
                                                      <xsl:when test="cat_EDTS_cu:CurrencyRate">
                                                         <xsl:value-of select="cat_EDTS_cu:CurrencyRate"/>
                                                         <xsl:if test="cat_EDTS_cu:CurrencyQuantity">
                                                            <xsl:text> </xsl:text>за
																			<xsl:value-of select="cat_EDTS_cu:CurrencyQuantity"/>едн.
																			</xsl:if>
                                                      </xsl:when>
                                                      <xsl:otherwise>
                                                         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                      </xsl:otherwise>
                                                   </xsl:choose>
                                                </td>
                                             </tr>
                                          </xsl:for-each>
                                       </tbody>
                                    </table>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="graph" colspan="2" style="width:110mm;border:solid 0.8pt #000000;" valign="top">
                                    <span class="graph">Дополнительные данные</span>
                                    <br/>
                                     <xsl:variable name="GTDGoodsNumber1">
										 <xsl:value-of select="DTSout_CU:GTDGoodsNumber"/>
                                     </xsl:variable>
                                     <xsl:variable name="GTDGoodsNumber2">
										 <xsl:choose>
											<xsl:when test="$column2">
												 <xsl:value-of select="$column2/DTSout_CU:GTDGoodsNumber"/>
											</xsl:when>
											<xsl:otherwise>-1</xsl:otherwise>
										 </xsl:choose> 
                                     </xsl:variable>
                                     <xsl:variable name="GTDGoodsNumber3">
										 <xsl:choose>
											<xsl:when test="$column3">
												 <xsl:value-of select="$column3/DTSout_CU:GTDGoodsNumber"/>
											</xsl:when>
											<xsl:otherwise>-1</xsl:otherwise>
										 </xsl:choose> 
                                     </xsl:variable>
									 <xsl:for-each select="../DTSout_CU:DTSBuyerSellerDependence/cat_EDTS_cu:Column7CDescription">
										 <xsl:if test="cat_EDTS_cu:ConsignmentItemOrdinal and (cat_EDTS_cu:ConsignmentItemOrdinal=$GTDGoodsNumber1 or ($GTDGoodsNumber2!='-1' and cat_EDTS_cu:ConsignmentItemOrdinal=$GTDGoodsNumber2) or ($GTDGoodsNumber3!='-1' and cat_EDTS_cu:ConsignmentItemOrdinal=$GTDGoodsNumber3))">
											<br/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											<xsl:value-of select="'7В'"/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											<xsl:text>для товара № </xsl:text>
											<xsl:value-of select="cat_EDTS_cu:ConsignmentItemOrdinal"/>
											<xsl:text>: </xsl:text>
											<xsl:apply-templates select="cat_EDTS_cu:DescriptionText"/>
										 </xsl:if>
									 </xsl:for-each>
                                    <xsl:for-each select="DTSout_CU:AdditionalData">
                                       <xsl:if test=".">
                                          <br/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="translate(cat_EDTS_cu:PositionNumber,$eng,$rus)"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:text>для товара № </xsl:text>
											<xsl:value-of select="../DTSout_CU:GTDGoodsNumber"/>
											<xsl:text>: </xsl:text>
                                          <xsl:for-each select="cat_EDTS_cu:AdditionalInformation">
                                             <xsl:value-of select="."/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </xsl:for-each>
                                       </xsl:if>
                                    </xsl:for-each>
                                    <xsl:if test="$column2">
										<xsl:for-each select="$column2/DTSout_CU:AdditionalData">
										   <xsl:if test=".">
											  <br/>
											  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											  <xsl:value-of select="translate(cat_EDTS_cu:PositionNumber,$eng,$rus)"/>
											  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											  <xsl:text>для товара № </xsl:text>
											  <xsl:value-of select="../DTSout_CU:GTDGoodsNumber"/>
											  <xsl:text>: </xsl:text>
											  <xsl:for-each select="cat_EDTS_cu:AdditionalInformation">
												 <xsl:value-of select="."/>
												 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											  </xsl:for-each>
										   </xsl:if>
										</xsl:for-each>
									</xsl:if>
                                    <xsl:if test="$column3">
										<xsl:for-each select="$column3/DTSout_CU:AdditionalData">
										   <xsl:if test=".">
											  <br/>
											  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											  <xsl:value-of select="translate(cat_EDTS_cu:PositionNumber,$eng,$rus)"/>
											  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											  <xsl:text>для товара № </xsl:text>
											  <xsl:value-of select="../DTSout_CU:GTDGoodsNumber"/>
											  <xsl:text>: </xsl:text>
											  <xsl:for-each select="cat_EDTS_cu:AdditionalInformation">
												 <xsl:value-of select="."/>
												 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											  </xsl:for-each>
										   </xsl:if>
										</xsl:for-each>
                                    </xsl:if>
                                 </td>
                                 <td class="graph" colspan="3" style="width:70mm;border:solid 0.8pt #000000;" valign="top">
                                    <span class="graph">Подпись, печать</span>
                                    <br/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="$DTS/DTSout_CU:DTSout_CUFilledPerson/cat_ru:PersonSurname"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="$DTS/DTSout_CU:DTSout_CUFilledPerson/cat_ru:PersonName"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="$DTS/DTSout_CU:DTSout_CUFilledPerson/cat_ru:PersonMiddleName"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="$DTS/DTSout_CU:DTSout_CUFilledPerson/cat_ru:PersonPost"/>
                                 </td>
                              </tr>
                           </tbody>
                        </table>
                     </div>
                  </xsl:for-each>
               </xsl:when>
               <xsl:when test="DTSout_CU:FormDTS=2">
                  <div class="page nobreak">
                     <table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0pt #000000;">
                        <tbody>
                           <tr>
                              <td class="graph" rowspan="2" style="width:100mm;"/>
                              <td align="right" class="graphNo" style="width:80mm;">ДЕКЛАРАЦИЯ ТАМОЖЕННОЙ СТОИМОСТИ</td>
                           </tr>
                           <tr>
                              <td align="right" class="graph" style="width:80mm;">Форма ДТС-2</td>
                           </tr>
                        </tbody>
                     </table>
                     <table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0.8pt #000000;">
                        <tbody>
                           <tr>
                              <td class="graph" style="width:100mm;border-left:solid 0.8pt #000000;border-top:solid 0.8pt #000000;">
                                 <span class="graphNo">1 </span>
                                 <span class="graph">Продавец (поставщик)</span>
                                 <br/>
                                 <xsl:apply-templates mode="org" select="DTSout_CU:DTSoutSeller"/>
                              </td>
                              <td class="graph" rowspan="3" style="width:80mm;border-left:solid 2pt #000000;border-top:solid 1.5pt #000000;border-right:solid 0.8pt #000000;border-bottom:solid 1.5pt #000000;" valign="top">
                                 <span class="graph">ДЛЯ ОТМЕТОК ТАМОЖЕННОГО ОРГАНА</span>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" style="width:100mm;border-left:solid 0.8pt #000000;border-top:solid 0.8pt #000000;">
                                 <span class="graphNo">2 </span>
                                 <span class="graph">(а) Покупатель (получатель)</span>
                                 <br/>
                                 <xsl:apply-templates mode="org" select="DTSout_CU:DTSoutBuyer"/>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" style="width:100mm;border-left:solid 0.8pt #000000;border-top:solid 0.8pt #000000;">
                                 <span class="graphNo">2 </span>
                                 <span class="graph">(б) Декларант</span>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" style="width:100mm;border-left:solid 0.8pt #000000;">
                                 <!--xsl:apply-templates select="DTSout_CU:DTSoutDeclarant" mode="org"/-->
                                 <xsl:value-of select="DTSout_CU:DTSoutDeclarant/cat_ru:OrganizationName"/>
                                 <xsl:if test="DTSout_CU:DTSoutDeclarant/cat_ru:ShortName">
                                    <span class="graph"> (</span>
                                    <xsl:value-of select="DTSout_CU:DTSoutDeclarant/cat_ru:ShortName"/>
                                    <span class="graph">) </span>
                                 </xsl:if>
                                 <br/>
                                 <xsl:if test="DTSout_CU:DTSoutDeclarant/cat_ru:OGRN">
                                    <span class="graph">№ </span>
                                    <xsl:value-of select="DTSout_CU:DTSoutDeclarant/cat_ru:OGRN"/>
                                 </xsl:if>
                                 <br/>
                                 <xsl:if test="DTSout_CU:DTSoutDeclarant/cat_ru:Address/cat_ru:PostalCode">
                                    <xsl:value-of select="DTSout_CU:DTSoutDeclarant/cat_ru:Address/cat_ru:PostalCode"/>,
											</xsl:if>
                                 <!--<xsl:if test="DTSout_CU:DTSoutDeclarant/cat_ru:Address/cat_ru:CountryCode">
												<xsl:value-of select="DTSout_CU:DTSoutDeclarant/cat_ru:Address/cat_ru:CountryCode"/>, 
											</xsl:if>-->
                                 <xsl:if test="DTSout_CU:DTSoutDeclarant/cat_ru:Address/cat_ru:CountryName">
                                    <xsl:value-of select="DTSout_CU:DTSoutDeclarant/cat_ru:Address/cat_ru:CountryName"/>, 
											</xsl:if>
                                 <xsl:if test="DTSout_CU:DTSoutDeclarant/cat_ru:Address/cat_ru:Region">
                                    <xsl:value-of select="DTSout_CU:DTSoutDeclarant/cat_ru:Address/cat_ru:Region"/>, 
											</xsl:if>
                                 <xsl:if test="DTSout_CU:DTSoutDeclarant/cat_ru:Address/cat_ru:City">
                                    <xsl:value-of select="DTSout_CU:DTSoutDeclarant/cat_ru:Address/cat_ru:City"/>, 
											</xsl:if>
                                 <xsl:if test="DTSout_CU:DTSoutDeclarant/cat_ru:Address/cat_ru:StreetHouse">
                                    <xsl:value-of select="DTSout_CU:DTSoutDeclarant/cat_ru:Address/cat_ru:StreetHouse"/>
                                 </xsl:if>
                                 <xsl:choose>
                                    <xsl:when test="(DTSout_CU:DTSoutDeclarant/cat_ru:INN!='') or (DTSout_CU:DTSoutDeclarant/cat_ru:KPP!='')">
                                       <br/>
                                       <xsl:text>№ </xsl:text>
                                       <xsl:if test="DTSout_CU:DTSoutDeclarant/cat_ru:INN!=''">
                                          <xsl:value-of select="DTSout_CU:DTSoutDeclarant/cat_ru:INN"/>
                                       </xsl:if>
                                       <xsl:if test="DTSout_CU:DTSoutDeclarant/cat_ru:KPP!=''">
                                          <xsl:text> / </xsl:text>
                                          <xsl:value-of select="DTSout_CU:DTSoutDeclarant/cat_ru:KPP"/>
                                       </xsl:if>
                                    </xsl:when>
                                 </xsl:choose>
                                 <xsl:if test="DTSout_CU:DTSoutDeclarant/cat_ru:IdentityCard">
                                    <br/>
                                    <xsl:value-of select="DTSout_CU:DTSoutDeclarant/cat_ru:IdentityCard/cat_ru:IdentityCardCode"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSout_CU:DTSoutDeclarant/cat_ru:IdentityCard/cat_ru:IdentityCardName"/>
                                    <xsl:if test="DTSout_CU:DTSoutDeclarant/cat_ru:IdentityCard/cat_ru:IdentityCardSeries">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTSoutDeclarant/cat_ru:IdentityCard/cat_ru:IdentityCardSeries"/>
                                    </xsl:if>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="DTSout_CU:DTSoutDeclarant/cat_ru:IdentityCard/cat_ru:IdentityCardNumber"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="DTSout_CU:DTSoutDeclarant/cat_ru:IdentityCard/cat_ru:IdentityCardDate"/>
                                    </xsl:call-template>
                                    <xsl:if test="DTSout_CU:DTSoutDeclarant/cat_ru:IdentityCard/cat_ru:OrganizationName">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTSoutDeclarant/cat_ru:IdentityCard/cat_ru:OrganizationName"/>
                                       <xsl:text> </xsl:text>
                                    </xsl:if>
                                 </xsl:if>
                                 <xsl:value-of select="DTSout_CU:DTSoutDeclarant/DTSout_CU:DocumentRegNumber"/>
                              </td>
                              <td class="graph" style="width:80mm;border:solid 0.8pt #000000;" valign="top">
                                 <span class="graphNo">3 </span>
                                 <span class="graph">Условия поставки</span>
                                 <br/>
                                 <xsl:value-of select="DTSout_CU:DeliveryTerms/cat_ru:DeliveryTermsStringCode"/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:value-of select="DTSout_CU:DeliveryTerms/cat_ru:DeliveryPlace"/>
                              </td>
                           </tr>
                           <tr>
                              <td class="graphBold" style="width:100mm;border-left:solid 1.5pt #000000;border-top:solid 2pt #000000;border-right:solid 1.5pt #000000;border-bottom:solid 1.5pt #000000;">
                                 <xsl:text>ВАЖНАЯ ИНФОРМАЦИЯ</xsl:text>
                                 <br/>
                                 <xsl:text>В соответствии с пунктом 2 статьи 84 ТК ЕАЭС декларант</xsl:text>
                                 <br/>
                                 <xsl:text>либо таможенный представитель несет</xsl:text>
                                 <br/>
                                 <xsl:text>ответственность за указание в декларации</xsl:text>
                                 <br/>
                                 <xsl:text>таможенной стоимости недостоверных сведений.</xsl:text>
                              </td>
                              <td class="graph" style="width:80mm;border-left:solid 0.8pt #000000;border-right:solid 0.8pt #000000;" valign="top">
                                 <span class="graphNo">4 </span>
                                 <span class="graph">Вид, номер и дата документа, являющегося основанием для поставки товара</span>
                                 <br/>
                                 <xsl:for-each select="DTSout_CU:DTSInvoiceDocuments">
                                    <xsl:if test="cat_EDTS_cu:PositionNumber=4">
                                       <xsl:if test="cat_ru:PrDocumentName">
                                          <xsl:value-of select="cat_ru:PrDocumentName"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </xsl:if>
                                       <xsl:if test="cat_EDTS_cu:PresentedDocumentModeCode">
                                          <xsl:value-of select="cat_EDTS_cu:PresentedDocumentModeCode"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </xsl:if>
                                       <xsl:value-of select="cat_ru:PrDocumentNumber"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                       </xsl:call-template>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <br/>
                                    </xsl:if>
                                 </xsl:for-each>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" colspan="2" style="width:180mm;border:solid 0.8pt #000000;" valign="top">
                                 <span class="graphNo">5 </span>
                                 <span class="graph">Номер и дата документа с принятыми решениями (таможенными органами/судебными органами) по ранее ввезенным товарам по документу, указанному в графе 4</span>
                                 <br/>
                                 <xsl:for-each select="DTSout_CU:DTSInvoiceDocuments">
                                    <xsl:if test="cat_EDTS_cu:PositionNumber=5">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="cat_ru:PrDocumentNumber"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                       </xsl:call-template>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="cat_ru:PrDocumentName"/>
                                       <br/>
                                    </xsl:if>
                                 </xsl:for-each>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" colspan="2" style="width:180mm;border:solid 0.8pt #000000;" valign="top">
                                 <table cellpadding="0" cellspacing="0" style="width:100%;">
                                    <tbody>
                                       <tr>
                                          <td class="graph" style="width:130mm;" valign="top">
                                             <span class="graphNo">6 </span>
                                             <span class="graph">Таможенная стоимость декларируемых товаров определяется по методу</span>
                                          </td>
                                          <td class="graph" colspan="3" style="width:50mm;" valign="top">
                                             <table cellpadding="0" cellspacing="0" style="width:100%;">
                                                <tbody>
                                                   <tr>
                                                      <td align="center" class="graph" style="width:40mm;border-left:solid 0.8pt #000000;border-bottom:solid 0.8pt #000000;" valign="top">
                                                         <span class="graphBold">Верное отметить</span>
                                                      </td>
                                                      <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                                         <span class="graphBold">х</span>
                                                      </td>
                                                      <td align="center" class="graph" style="width:5mm;border-bottom:solid 0.8pt #000000;">
                                                         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                      </td>
                                                   </tr>
                                                </tbody>
                                             </table>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:130mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">(а) по стоимости сделки с идентичными товарами (метод 2)</span>
                                          </td>
                                          <td class="graph" style="width:22.5mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="(DTSout_CU:CustomsCostMethodCode=2) or (DTSout_CU:BaseMethodCode=2)">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:22.5mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:130mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">(б) по стоимости сделки с однородными товарами (метод 3)</span>
                                          </td>
                                          <td class="graph" style="width:22.5mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="(DTSout_CU:CustomsCostMethodCode=3) or (DTSout_CU:BaseMethodCode=3)">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:22.5mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:130mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">(в) по методу вычитания (метод 4)</span>
                                          </td>
                                          <td class="graph" style="width:22.5mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="(DTSout_CU:CustomsCostMethodCode=4) or (DTSout_CU:BaseMethodCode=4)">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:22.5mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:130mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">(г) по методу сложения (метод 5)</span>
                                          </td>
                                          <td class="graph" style="width:22.5mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="(DTSout_CU:CustomsCostMethodCode=5) or (DTSout_CU:BaseMethodCode=5)">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:22.5mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:130mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">д) &lt;*&gt; по резервному методу (метод 6)</span>
                                          </td>
                                          <td class="graph" style="width:22.5mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="((DTSout_CU:CustomsCostMethodCode=6) and not(DTSout_CU:BaseMethodCode=1))">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:22.5mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:130mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">(е) по резервному методу (метод 6) на основе метода по стоимости сделки с ввозимыми товарами (метод 1)
</span>
                                          </td>
                                          <td class="graph" style="width:22.5mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="((DTSout_CU:CustomsCostMethodCode='6') and (DTSout_CU:BaseMethodCode='1'))">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:22.5mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td class="graph" style="width:130mm;" valign="top">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <span class="graph">(ж) различным (если для разных товаров используются различные методы) </span>
                                          </td>
                                          <td class="graph" style="width:22.5mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
                                             <xsl:choose>
                                                <xsl:when test="(DTSout_CU:CustomsCostMethodCode='*' or DTSout_CU:CustomsCostMethodCode='9')">
                                                   <span class="graphBold">х</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                </xsl:otherwise>
                                             </xsl:choose>
                                          </td>
                                          <td class="graph" style="width:22.5mm;">
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                    </tbody>
                                 </table>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" colspan="2" style="width:180mm;border-left:solid 0.8pt #000000;border-right:solid 0.8pt #000000;border-bottom:solid 0.8pt #000000;" valign="top">
                                 <span class="graphNo">7 </span>
                                 <span class="graph">Причины, по которым предшествующие методы определения таможенной стоимости неприменимы</span>
                                 <br/>
                                 <xsl:for-each select="DTSout_CU:ReasonApplyMethod/cat_EDTS_cu:ReasonDescription">
                                    <xsl:value-of select="."/>
                                    <xsl:text> </xsl:text>
                                 </xsl:for-each>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" colspan="2" style="width:180mm;border-left:solid 0.8pt #000000;border-right:solid 0.8pt #000000;" valign="top">
                                 <span class="graphNo">8 </span>
                                 <span class="graph">Наименование и реквизиты основных документов, представленных в подтверждение приводимых сведений</span>
                                 <br/>
                                 <xsl:for-each select="DTSout_CU:DTSInvoiceDocuments">
                                    <xsl:if test="cat_EDTS_cu:PositionNumber=8">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="cat_ru:PrDocumentNumber"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                       </xsl:call-template>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="cat_ru:PrDocumentName"/>
                                       <br/>
                                    </xsl:if>
                                 </xsl:for-each>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" rowspan="2" style="width:100mm;border:solid 0.8pt #000000;">
                                 <xsl:text>&lt;*&gt; В КАЧЕСТВЕ ОСНОВЫ ДЛЯ ОПРЕДЕЛЕНИЯ </xsl:text>
                                 <br/>
                                 <xsl:text>ТАМОЖЕННОЙ СТОИМОСТИ ТОВАРОВ ПО МЕТОДУ 6 В </xsl:text>
                                 <br/>
                                 <xsl:text>СООТВЕТСТВИИ СО СТАТЬЕЙ 45 ТК ЕАЭС</xsl:text>
                                 <br/>
                                 <xsl:text>НЕ МОГУТ БЫТЬ ИСПОЛЬЗОВАНЫ:</xsl:text>
                                 <br/>
                                 <xsl:text>-цены на товары на внутреннем рынке Таможенного союза, произведенные на таможенной территории Таможенного союза;</xsl:text>
                                 <br/>
                                 <xsl:text>- системы, предусматривающие принятие для таможенных целей более высокой из двухальтернативных стоимостей;</xsl:text>
                                 <br/>
                                 <xsl:text>- цена на товары на внутреннем рынке страны вывоза;</xsl:text>
                                 <br/>
                                 <xsl:text>- иные расходы, нежели расходы, включенныев  расчетную стоимость, которая была определена для идентичных или однородных товаров;</xsl:text>
                                 <br/>
                                 <xsl:text>- цены товаров, поставляемых из страны их вывоза в третьи страны;</xsl:text>
                                 <br/>
                                 <xsl:text>- минимальная таможенная стоимость;</xsl:text>
                                 <br/>
                                 <xsl:text>- произвольная или фиктивная стоимость.</xsl:text>
                              </td>
                              <td class="graph" style="width:80mm;border:solid 0.8pt #000000;" valign="top">
                                 <span class="graphNo">9 </span>
                                 <span class="graph">Число дополнительных листов</span>
                                 <br/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:value-of select="DTSout_CU:AdditionalSheetNumber"/>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" style="width:80mm;border:solid 0.8pt #000000;" valign="top">
                                 <span class="graphNo">10 </span>
                                 <span class="graph">Место, дата, подпись, печать</span>
                                 <br/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="DTSout_CU:EECEDocHeaderAddInfo/RUScat_ru:EDocDateTime"/>
                                 </xsl:call-template>
                                 <xsl:if test="cat_EDTS_cu:RegNumberDoc"> исх. номер 
										<xsl:value-of select="cat_EDTS_cu:RegNumberDoc"/>
                                 </xsl:if>
                                 <xsl:if test="cat_EDTS_cu:SecurityLabelCode">код защитной наклейки
										<xsl:value-of select="cat_EDTS_cu:SecurityLabelCode"/>
                                 </xsl:if>
                                 <br/>
                                 <xsl:if test="DTSout_CU:DTSout_CUFilledPerson/RUDECLcat:QualificationCertificate">Номер квалификационного аттестата специалиста по таможенному оформлению
										<xsl:value-of select="DTSout_CU:DTSout_CUFilledPerson/RUDECLcat:QualificationCertificate"/>
                                 </xsl:if>
                                 <br/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:value-of select="DTSout_CU:DTSout_CUFilledPerson/RUDECLcat:SigningDetails/cat_ru:PersonSurname"/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:value-of select="DTSout_CU:DTSout_CUFilledPerson/RUDECLcat:SigningDetails/cat_ru:PersonName"/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:value-of select="DTSout_CU:DTSout_CUFilledPerson/RUDECLcat:SigningDetails/cat_ru:PersonMiddleName"/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:if test="DTSout_CU:DTSout_CUFilledPerson/RUDECLcat:SignatoryPersonIdentityDetails">
									<xsl:for-each select="DTSout_CU:DTSout_CUFilledPerson/RUDECLcat:SignatoryPersonIdentityDetails">
										<xsl:value-of select="cat_ru:IdentityCardName"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:value-of select="cat_ru:IdentityCardSeries"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:value-of select="cat_ru:IdentityCardNumber"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:call-template name="russian_date">
										   <xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
										</xsl:call-template>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:value-of select="cat_ru:OrganizationName"/>
									</xsl:for-each>
                                 </xsl:if>
                                 <!--<xsl:value-of select="DTSout_CU:DTSout_CUFilledPerson/catESAD_cu:Contact/cat_ru:Phone"/>-->
                                 <xsl:for-each select="DTSout_CU:DTSout_CUFilledPerson/RUDECLcat:SigningDetails/RUScat_ru:CommunicationDetails/cat_ru:Phone">
                                    <xsl:value-of select="."/>
                                    <xsl:if test="position()!=last()">, </xsl:if>
                                 </xsl:for-each>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:value-of select="DTSout_CU:DTSout_CUFilledPerson/RUDECLcat:SigningDetails/cat_ru:PersonPost"/>
                                 <xsl:if test="DTSout_CU:DTSout_CUFilledPerson/RUDECLcat:PowerOfAttorneyDetails">
                                    <br/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:if test="DTSout_CU:DTSout_CUFilledPerson/RUDECLcat:PowerOfAttorneyDetails/cat_ru:PrDocumentName">
                                       <xsl:value-of select="DTSout_CU:DTSout_CUFilledPerson/RUDECLcat:PowerOfAttorneyDetails/cat_ru:PrDocumentName"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:if>
                                    <xsl:value-of select="DTSout_CU:DTSout_CUFilledPerson/RUDECLcat:PowerOfAttorneyDetails/cat_ru:PrDocumentNumber"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:if test="DTSout_CU:DTSout_CUFilledPerson/RUDECLcat:PowerOfAttorneyDetails/cat_ru:PrDocumentDate">
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="DTSout_CU:DTSout_CUFilledPerson/RUDECLcat:PowerOfAttorneyDetails/cat_ru:PrDocumentDate"/>
                                       </xsl:call-template>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:if>
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="DTSout_CU:DTSout_CUFilledPerson/RUDECLcat:PowerOfAttorneyDetails/RUScat_ru:DocValidityDate"/>
                                    </xsl:call-template>
                                 </xsl:if>
                              </td>
                           </tr>
                        </tbody>
                     </table>
                  </div>
                  <xsl:variable name="DTS" select="current()"/>
                  <!--<xsl:for-each select="DTSout_CU:DTSout_CUGoodsCustomsCost">-->
                  
                  
                  <xsl:for-each select="//DTSout_CU:DTSout_CUGoodsCustomsCost[(($DTS/DTSout_CU:CustomsCostMethodCode=6) and ($DTS/DTSout_CU:BaseMethodCode=1)) or (($DTS/DTSout_CU:CustomsCostMethodCode='*') and (DTSout_CU:MethodNumberCode=6) and (DTSout_CU:BaseMethodNumberCode=1)) or (($DTS/DTSout_CU:CustomsCostMethodCode='6') and (DTSout_CU:MethodNumberCode=6) and (DTSout_CU:BaseMethodNumberCode=1))][(position() mod 3) = 1]">
                   <!--<xsl:if test="(($DTS/DTSout_CU:CustomsCostMethodCode=6) and ($DTS/DTSout_CU:BaseMethodCode=1)) or (($DTS/DTSout_CU:CustomsCostMethodCode='*') and (DTSout_CU:MethodNumberCode=6) and (DTSout_CU:BaseMethodNumberCode=1)) or (($DTS/DTSout_CU:CustomsCostMethodCode='6') and (DTSout_CU:MethodNumberCode=6) and (DTSout_CU:BaseMethodNumberCode=1))">-->
                    <xsl:variable name="column_2" select="following-sibling::DTSout_CU:DTSout_CUGoodsCustomsCost[(($DTS/DTSout_CU:CustomsCostMethodCode=6) and ($DTS/DTSout_CU:BaseMethodCode=1)) or (($DTS/DTSout_CU:CustomsCostMethodCode='*') and (DTSout_CU:MethodNumberCode=6) and (DTSout_CU:BaseMethodNumberCode=1)) or (($DTS/DTSout_CU:CustomsCostMethodCode='6') and (DTSout_CU:MethodNumberCode=6) and (DTSout_CU:BaseMethodNumberCode=1))][1]"/>
                     <xsl:variable name="column_3" select="following-sibling::DTSout_CU:DTSout_CUGoodsCustomsCost[(($DTS/DTSout_CU:CustomsCostMethodCode=6) and ($DTS/DTSout_CU:BaseMethodCode=1)) or (($DTS/DTSout_CU:CustomsCostMethodCode='*') and (DTSout_CU:MethodNumberCode=6) and (DTSout_CU:BaseMethodNumberCode=1)) or (($DTS/DTSout_CU:CustomsCostMethodCode='6') and (DTSout_CU:MethodNumberCode=6) and (DTSout_CU:BaseMethodNumberCode=1))][2]"/>
                   
                        <div class="page">
                           <table cellpadding="0" cellspacing="0" style="width:100%;">
                              <tbody>
                                 <tr>
                                    <td align="right" class="graph" style="width:145mm;">
                                       <span class="graph">Форма ДТС-2</span>
                                    </td>
                                    <td align="right" class="graph" style="width:35mm;">
                                       <span class="graph">Лист №  </span>
                                       <xsl:value-of select="DTSout_CU:SheetNumber"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td align="right" class="graph" style="width:145mm;">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </td>
                                    <td align="right" class="graph" style="width:35mm;">
                                       <span class="graph">Метод 6 на основе метода 1</span>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                           <table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0.8pt #000000;">
                              <tbody>
                                 <tr>
                                    <td align="center" class="graph" colspan="2" rowspan="2" style="width:110mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graph">ДЛЯ ОТМЕТОК ТАМОЖЕННОГО ОРГАНА</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graph">Товар № </span>
                                       <xsl:value-of select="DTSout_CU:GTDGoodsNumber"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graph">Товар № </span>
                                       <xsl:value-of select="$column_2/DTSout_CU:GTDGoodsNumber"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graph">Товар № </span>
                                       <xsl:value-of select="$column_3/DTSout_CU:GTDGoodsNumber"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graph">Код ТН ВЭД</span>
                                       <br/>
                                       <xsl:value-of select="DTSout_CU:GoodsTNVEDCode"/>
                                       <xsl:value-of select="DTSout_CU:GoodsAddTNVEDCode"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graph">Код ТН ВЭД</span>
                                       <br/>
                                       <xsl:value-of select="$column_2/DTSout_CU:GoodsTNVEDCode"/>
                                       <xsl:value-of select="$column_2/DTSout_CU:GoodsAddTNVEDCode"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graph">Код ТН ВЭД</span>
                                       <br/>
                                       <xsl:value-of select="$column_3/DTSout_CU:GoodsTNVEDCode"/>
                                       <xsl:value-of select="$column_3/DTSout_CU:GoodsAddTNVEDCode"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" rowspan="4" style="width:20mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graph">А. Основа для расчета</span>
                                    </td>
                                    <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graphNo">11 </span>
                                       <span class="graph">(а) Цена, фактически уплаченная или подлежащая уплате за товары в ВАЛЮТЕ СЧЕТА </span>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1CalculationBasis/cat_EDTS_cu:DealCurrencyCode"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1CalculationBasis/cat_EDTS_cu:DealCurrencyAmount"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1CalculationBasis/cat_EDTS_cu:DealCurrencyAmount"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1CalculationBasis/cat_EDTS_cu:DealCurrencyAmount"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">в НАЦИОНАЛЬНОЙ ВАЛЮТЕ</span>
                                       <br/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(курс пересчета 
												<xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1CalculationBasis/cat_EDTS_cu:DealCurrencyRate"/>
                                          <xsl:if test="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1CalculationBasis/cat_EDTS_cu:CurrencyQuantity">
                                             <xsl:text> </xsl:text> за
												<xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1CalculationBasis/cat_EDTS_cu:CurrencyQuantity"/> едн.
												</xsl:if>
												
											)</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1CalculationBasis/cat_EDTS_cu:DealNationalAmount"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1CalculationBasis/cat_EDTS_cu:DealNationalAmount"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1CalculationBasis/cat_EDTS_cu:DealNationalAmount"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(б) Косвенные платежи (условия или обязательства) в НАЦИОНАЛЬНОЙ ВАЛЮТЕ - см. графу 8 (б)</span>
                                       <xsl:text> </xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1CalculationBasis/cat_EDTS_cu:IndirectCurrencyCode"/>
                                       <br/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(курс пересчета 
												<xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1CalculationBasis/cat_EDTS_cu:IndirectCurrencyRate"/>
                                          <xsl:if test="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1CalculationBasis/cat_EDTS_cu:IndirectCurrencyQuantity">
                                             <xsl:text> </xsl:text> за
												<xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1CalculationBasis/cat_EDTS_cu:IndirectCurrencyQuantity"/> едн.</xsl:if>
											)</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1CalculationBasis/cat_EDTS_cu:IndirectNationalPayment"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1CalculationBasis/cat_EDTS_cu:IndirectNationalPayment"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1CalculationBasis/cat_EDTS_cu:IndirectNationalPayment"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graphNo">12 </span>
                                       <span class="graph">Итого А в рублях</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1CalculationBasis/cat_EDTS_cu:BasisNationalAmount"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1CalculationBasis/cat_EDTS_cu:BasisNationalAmount"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1CalculationBasis/cat_EDTS_cu:BasisNationalAmount"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" rowspan="12" style="width:20mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graph">Б. ДОПОЛНИ- ТЕЛЬНЫЕ НАЧИСЛЕНИЯ: расходы в национальной валюте, которые не включены в А*</span>
                                    </td>
                                    <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graphNo">13 </span>
                                       <span class="graph">Расходы, произведенные покупателем на:</span>
                                       <br/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(а) вознаграждения посреднику  (агенту), брокеру за исключением вознаграждений за закупку товаров</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:AgentBonus"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:AgentBonus"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:AgentBonus"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(б) тару и упаковку</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:PackageExpenses"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:PackageExpenses"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:PackageExpenses"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graphNo">14 </span>
                                       <span class="graph">Соответствующим образом распределенная стоимость следующих товаров и услуг, прямо или косвенно предоставленных покупателем бесплатно или сниженной цене для использования в связи с  производством и продажей  для вывоза оцениваемых товаров на единую таможенную территорию таможенного союза, в размере, не включенном в цену, фактически уплаченную или подлежащую уплате:</span>
                                       <br/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(а) сырья, материалов, деталей, полуфабрикатов и тому подобных предметов, которых состоят  ввозимые товары</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:StoreCost"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:StoreCost"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:StoreCost"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(б) инструментов, штампов, форм и других подобных предметов, использованных при производстве ввозимых товаров</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:ProductionToolkitCost"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:ProductionToolkitCost"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:ProductionToolkitCost"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(в) материалов, израсходованных при производстве ввозимых товаров</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:WorkingStockCost"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:WorkingStockCost"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:WorkingStockCost"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(г) проектирования, разработки, инженерной, конструктивной работы, художественного оформления, дизайна, эскизов и чертежей, выполненных вне единой таможенной территории Таможенного союза и необходимых для производства ввозимых товаров</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:DesignPayment"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:DesignPayment"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:DesignPayment"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graphNo">15 </span>
                                       <span class="graph">Лицензионные и иные подобные платежи за использование объектов интеллектуальной собственности - см. графу 9 (а)</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:IntellectualPropertyPayment"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:IntellectualPropertyPayment"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:IntellectualPropertyPayment"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graphNo">16 </span>
                                       <span class="graph">Часть дохода (выручки), полученного в результате последующей продажи, распоряжения иным способом или использования товаров, которая прямо или косвенно причитается продавцу - см. графу 9 (б)</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:SellerIncome"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:SellerIncome"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:SellerIncome"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graphNo">17 </span>
                                       <span class="graph">Расходы по перевозке (транспортировке) товаров до 
											<xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:BorderPlace"/>
											 (место прибытия на единую таможенную территорию Таможенного союза)</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:BorderTransportCharges"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:BorderTransportCharges"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:BorderTransportCharges"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graphNo">18 </span>
                                       <span class="graph">Расходы по погрузке, выгрузке/перегрузке товаров и иным операциям, связанным с перевозкой до 
											<xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:BorderPlace"/>
											(место прибытия на единую таможенную территорию Таможенного союза)</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:LoadCharges"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:LoadCharges"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:LoadCharges"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graphNo">19 </span>
                                       <span class="graph">Расходы на страхование в связи с операциями, указанными в графах 17 и 18</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:InsuranceCharges"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:InsuranceCharges"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:InsuranceCharges"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graphNo">20 </span>
                                       <span class="graph">Итого Б в национальной валюте</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:TotalAdditionalSum"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:TotalAdditionalSum"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1AdditionalSum/cat_EDTS_cu:TotalAdditionalSum"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" rowspan="4" style="width:20mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graph">В. ВЫЧЕТЫ: расходы в национальной валюте, которые включены в А*</span>
                                    </td>
                                    <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graphNo">21 </span>
                                       <span class="graph">Расходы на строительство, возведение, сборку, монтаж, обслуживание, или оказание технического содействия, производимые после ввоза товаров на единую таможенную территорию таможенного союза</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1Deduction/cat_EDTS_cu:BuildingAmount"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1Deduction/cat_EDTS_cu:BuildingAmount"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1Deduction/cat_EDTS_cu:BuildingAmount"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graphNo">22 </span>
                                       <span class="graph">Расходы по перевозке (транспортировке) товаров после их прибытия на единую таможенную территорию таможенного союза</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1Deduction/cat_EDTS_cu:UnionTransportCharge"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1Deduction/cat_EDTS_cu:UnionTransportCharge"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1Deduction/cat_EDTS_cu:UnionTransportCharge"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graphNo">23 </span>
                                       <span class="graph">Пошлины, налоги и сборы, уплачиваемые на единой таможенной территории таможенного союза в связи с ввозом или продажей ввозимых товаров</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1Deduction/cat_EDTS_cu:UnionTaxPayment"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1Deduction/cat_EDTS_cu:UnionTaxPayment"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1Deduction/cat_EDTS_cu:UnionTaxPayment"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graphNo">24 </span>
                                       <span class="graph">Итого В в национальной валюте</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1Deduction/cat_EDTS_cu:TotalDeductionAmount"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1Deduction/cat_EDTS_cu:TotalDeductionAmount"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod1/cat_EDTS_cu:Method1Deduction/cat_EDTS_cu:TotalDeductionAmount"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" colspan="2" style="width:110mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graphNo">25 </span>
                                       <span class="graph">ЗАЯВЛЕННАЯ ТАМОЖЕННАЯ СТОИМОСТЬ (А + Б - В)</span>
                                       <br/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(а) в НАЦИОНАЛЬНОЙ ВАЛЮТЕ</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:NationalDeclaredCustomsCost"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:NationalDeclaredCustomsCost"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:NationalDeclaredCustomsCost"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" colspan="2" style="width:110mm;border:solid 0.8pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(б) в ДОЛЛАРАХ США (курс пересчета 
											<xsl:value-of select="$DTS/DTSout_CU:ExchangeRate/RUScat_ru:CurrencyRate"/>
											<xsl:choose>
												<xsl:when test="$DTS/DTSout_CU:CurrencyQuantity">
													<xsl:text> </xsl:text>за 
													<xsl:value-of select="$DTS/DTSout_CU:CurrencyQuantity"/>едн.
												</xsl:when>
												<xsl:when test="$DTS/DTSout_CU:ExchangeRate/RUScat_ru:ScaleNumber">
													<xsl:text> </xsl:text>за 
													<xsl:call-template name="power">
														<xsl:with-param name="number" select="10"/>
														<xsl:with-param name="topower" select="$DTS/DTSout_CU:ExchangeRate/RUScat_ru:ScaleNumber"/>
													 </xsl:call-template>едн.
												</xsl:when>
											</xsl:choose>
											)</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DollarDeclaredCustomsCost"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DollarDeclaredCustomsCost"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DollarDeclaredCustomsCost"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" colspan="5" style="width:180mm;border:solid 0.8pt #000000;" valign="top">
                                       <table cellpadding="0" cellspacing="0" style="width:100%;">
                                          <tbody>
                                             <tr>
                                                <td class="graph" colspan="3" style="width:180mm;" valign="top">
                                                   <xsl:text>* Если сумма оплачена в иностранной валюте, здесь указывается сумма в иностранной валюте и курс пересчета по каждому товару и элементу стоимости</xsl:text>
                                                </td>
                                             </tr>
                                             <tr>
                                                <td class="graph" style="width:80mm;" valign="top">
                                                   <span class="graph">Номер товара и позиции</span>
                                                </td>
                                                <td class="graph" style="width:40mm;" valign="top">
                                                   <span class="graph">Код валюты, сумма</span>
                                                </td>
                                                <td class="graph" style="width:40mm;" valign="top">
                                                   <span class="graph">Курс пересчета</span>
                                                </td>
                                             </tr>
                                             <xsl:for-each select="DTSout_CU:DTSCurrencyPayment">
                                                <tr>
                                                   <td class="graph" style="width:80mm;" valign="top">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                      <xsl:value-of select="cat_EDTS_cu:PositionsNumber"/>
                                                   </td>
                                                   <td class="graph" style="width:40mm;" valign="top">
                                                      <xsl:value-of select="cat_EDTS_cu:CurrencyCode"/>
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                      <xsl:value-of select="cat_EDTS_cu:CurrencyAmount"/>
                                                   </td>
                                                   <td class="graph" style="width:40mm;" valign="top">
                                                      <xsl:choose>
                                                         <xsl:when test="cat_EDTS_cu:CurrencyRate">
                                                            <xsl:value-of select="cat_EDTS_cu:CurrencyRate"/>
                                                            <xsl:if test="cat_EDTS_cu:CurrencyQuantity">
                                                               <xsl:text> </xsl:text>за
																			<xsl:value-of select="cat_EDTS_cu:CurrencyQuantity"/>едн.
																			</xsl:if>
                                                         </xsl:when>
                                                         <xsl:otherwise>
                                                            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                         </xsl:otherwise>
                                                      </xsl:choose>
                                                   </td>
                                                </tr>
                                             </xsl:for-each>
                                             <xsl:for-each select="$column_2/DTSout_CU:DTSCurrencyPayment">
                                                <tr>
                                                   <td class="graph" style="width:80mm;" valign="top">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                      <xsl:value-of select="cat_EDTS_cu:PositionsNumber"/>
                                                   </td>
                                                   <td class="graph" style="width:40mm;" valign="top">
                                                      <xsl:value-of select="cat_EDTS_cu:CurrencyCode"/>
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                      <xsl:value-of select="cat_EDTS_cu:CurrencyAmount"/>
                                                   </td>
                                                   <td class="graph" style="width:40mm;" valign="top">
                                                      <xsl:choose>
                                                         <xsl:when test="cat_EDTS_cu:CurrencyRate">
                                                            <xsl:value-of select="cat_EDTS_cu:CurrencyRate"/>
                                                            <xsl:if test="cat_EDTS_cu:CurrencyQuantity">
                                                               <xsl:text> </xsl:text>за
																			<xsl:value-of select="cat_EDTS_cu:CurrencyQuantity"/>едн.
																			</xsl:if>
                                                         </xsl:when>
                                                         <xsl:otherwise>
                                                            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                         </xsl:otherwise>
                                                      </xsl:choose>
                                                   </td>
                                                </tr>
                                             </xsl:for-each>
                                             <xsl:for-each select="$column_3/DTSout_CU:DTSCurrencyPayment">
                                                <tr>
                                                   <td class="graph" style="width:80mm;" valign="top">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                      <xsl:value-of select="cat_EDTS_cu:PositionsNumber"/>
                                                   </td>
                                                   <td class="graph" style="width:40mm;" valign="top">
                                                      <xsl:value-of select="cat_EDTS_cu:CurrencyCode"/>
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                      <xsl:value-of select="cat_EDTS_cu:CurrencyAmount"/>
                                                   </td>
                                                   <td class="graph" style="width:40mm;" valign="top">
                                                      <xsl:choose>
                                                         <xsl:when test="cat_EDTS_cu:CurrencyRate">
                                                            <xsl:value-of select="cat_EDTS_cu:CurrencyRate"/>
                                                            <xsl:if test="cat_EDTS_cu:CurrencyQuantity">
                                                               <xsl:text> </xsl:text>за
																			<xsl:value-of select="cat_EDTS_cu:CurrencyQuantity"/>едн.
																			</xsl:if>
                                                         </xsl:when>
                                                         <xsl:otherwise>
                                                            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                         </xsl:otherwise>
                                                      </xsl:choose>
                                                   </td>
                                                </tr>
                                             </xsl:for-each>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" colspan="2" style="width:110mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graph">Дополнительные данные</span>
                                       <br/>
                                       <xsl:for-each select="DTSout_CU:AdditionalData">
                                          <xsl:if test=".">
                                             <br/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:value-of select="cat_EDTS_cu:PositionNumber"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             <xsl:for-each select="cat_EDTS_cu:AdditionalInformation">
                                                <xsl:value-of select="."/>
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             </xsl:for-each>
                                          </xsl:if>
                                       </xsl:for-each>
                                    </td>
                                    <td class="graph" colspan="3" style="width:70mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graph">Подпись, печать</span>
                                       <br/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$DTS/DTSout_CU:DTSout_CUFilledPerson/cat_ru:PersonSurname"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$DTS/DTSout_CU:DTSout_CUFilledPerson/cat_ru:PersonName"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$DTS/DTSout_CU:DTSout_CUFilledPerson/cat_ru:PersonMiddleName"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$DTS/DTSout_CU:DTSout_CUFilledPerson/cat_ru:PersonPost"/>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                        </div>
                     <!--</xsl:if>-->
                     
                  </xsl:for-each>
                  
                  
                <xsl:for-each select="//DTSout_CU:DTSout_CUGoodsCustomsCost[(($DTS/DTSout_CU:CustomsCostMethodCode=6) and ($DTS/DTSout_CU:BaseMethodCode=4)) or (($DTS/DTSout_CU:CustomsCostMethodCode='*') and (DTSout_CU:MethodNumberCode=6) 
                  and (DTSout_CU:BaseMethodNumberCode=4)) or (($DTS/DTSout_CU:CustomsCostMethodCode='6') and (DTSout_CU:MethodNumberCode=6) and (DTSout_CU:BaseMethodNumberCode=4)) 
                  or ($DTS/DTSout_CU:CustomsCostMethodCode=4) or (($DTS/DTSout_CU:CustomsCostMethodCode='*') and (DTSout_CU:MethodNumberCode=4))][(position() mod 3) = 1]">
                  
                  
                  <!--<xsl:if test="(($DTS/DTSout_CU:CustomsCostMethodCode=6) and ($DTS/DTSout_CU:BaseMethodCode=4)) or (($DTS/DTSout_CU:CustomsCostMethodCode='*') and (DTSout_CU:MethodNumberCode=6) 
                  and (DTSout_CU:BaseMethodNumberCode=4)) or (($DTS/DTSout_CU:CustomsCostMethodCode='6') and (DTSout_CU:MethodNumberCode=6) and (DTSout_CU:BaseMethodNumberCode=4)) 
                  or ($DTS/DTSout_CU:CustomsCostMethodCode=4) or (($DTS/DTSout_CU:CustomsCostMethodCode='*') and (DTSout_CU:MethodNumberCode=4))">-->
                  
                  
                  
                     <xsl:variable name="column_2" select="following-sibling::DTSout_CU:DTSout_CUGoodsCustomsCost[(($DTS/DTSout_CU:CustomsCostMethodCode=6) and ($DTS/DTSout_CU:BaseMethodCode=4)) or (($DTS/DTSout_CU:CustomsCostMethodCode='*') and (DTSout_CU:MethodNumberCode=6) 
                  and (DTSout_CU:BaseMethodNumberCode=4)) or (($DTS/DTSout_CU:CustomsCostMethodCode='6') and (DTSout_CU:MethodNumberCode=6) and (DTSout_CU:BaseMethodNumberCode=4)) 
                  or ($DTS/DTSout_CU:CustomsCostMethodCode=4) or (($DTS/DTSout_CU:CustomsCostMethodCode='*') and (DTSout_CU:MethodNumberCode=4))][1]"/>
                     
                     <xsl:variable name="column_3" select="following-sibling::DTSout_CU:DTSout_CUGoodsCustomsCost[(($DTS/DTSout_CU:CustomsCostMethodCode=6) and ($DTS/DTSout_CU:BaseMethodCode=4)) or (($DTS/DTSout_CU:CustomsCostMethodCode='*') and (DTSout_CU:MethodNumberCode=6) 
                  and (DTSout_CU:BaseMethodNumberCode=4)) or (($DTS/DTSout_CU:CustomsCostMethodCode='6') and (DTSout_CU:MethodNumberCode=6) and (DTSout_CU:BaseMethodNumberCode=4)) 
                  or ($DTS/DTSout_CU:CustomsCostMethodCode=4) or (($DTS/DTSout_CU:CustomsCostMethodCode='*') and (DTSout_CU:MethodNumberCode=4))][2]"/>
                        <div class="page">
                           <table cellpadding="0" cellspacing="0" style="width:100%;">
                              <tbody>
                                 <tr>
                                    <td align="right" class="graph" style="width:145mm;">
                                       <span class="graph">Форма ДТС-2</span>
                                    </td>
                                    <td align="right" class="graph" style="width:35mm;">
                                       <span class="graph">Лист № </span>
                                       <xsl:value-of select="DTSout_CU:SheetNumber"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td align="right" class="graph" style="width:145mm;">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </td>
                                    <td align="right" class="graph" style="width:35mm;">
                                       <span class="graph">Методы 4, 6</span>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                           <table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0.8pt #000000;">
                              <tbody>
                                 <tr>
                                    <td align="center" class="graph" colspan="2" rowspan="2" style="width:110mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graph">ДЛЯ ОТМЕТОК ТАМОЖЕННОГО ОРГАНА</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graph">Товар № </span>
                                       <xsl:value-of select="DTSout_CU:GTDGoodsNumber"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graph">Товар № </span>
                                       <xsl:value-of select="$column_2/DTSout_CU:GTDGoodsNumber"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graph">Товар № </span>
                                       <xsl:value-of select="$column_3/DTSout_CU:GTDGoodsNumber"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graph">Код ТН ВЭД ЕАЭС</span>
                                       <br/>
                                       <xsl:value-of select="DTSout_CU:GoodsTNVEDCode"/>
                                       <xsl:value-of select="DTSout_CU:GoodsAddTNVEDCode"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graph">Код ТН ВЭД ЕАЭС</span>
                                       <br/>
                                       <xsl:value-of select="$column_2/DTSout_CU:GoodsTNVEDCode"/>
                                       <xsl:value-of select="$column_2/DTSout_CU:GoodsAddTNVEDCode"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graph">Код ТН ВЭД ЕАЭС</span>
                                       <br/>
                                       <xsl:value-of select="$column_3/DTSout_CU:GoodsTNVEDCode"/>
                                       <xsl:value-of select="$column_3/DTSout_CU:GoodsAddTNVEDCode"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:20mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graph">А. Основа для расчета</span>
                                    </td>
                                    <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graphNo">11 </span>
                                       <span class="graph">Цена единицы оцениваемых, идентичных или однородных товаров (в национальной валюте), по которой их наибольшее совокупное количество продается лицам, не являющимся взаимосвязанными лицами с лицами, осуществляющими продажу на теможенной территории Таможенного Союза</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod46/cat_EDTS_cu:Method46Basis/cat_EDTS_cu:IdenticalDealNationalPrice"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod46/cat_EDTS_cu:Method46Basis/cat_EDTS_cu:IdenticalDealNationalPrice"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod46/cat_EDTS_cu:Method46Basis/cat_EDTS_cu:IdenticalDealNationalPrice"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" rowspan="5" style="width:20mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graph">Б. Вычеты сумм, которые вошли в раздел А</span>
                                    </td>
                                    <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graphNo">12 </span>
                                       <span class="graph">Вознаграждения посреднику (агенту) либо надбавки к цене, обычно производимой для получения прибыли и покрытия коммерческих и управленческих расходов</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod46/cat_EDTS_cu:Method46Deduction/cat_EDTS_cu:AgentCharge"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod46/cat_EDTS_cu:Method46Deduction/cat_EDTS_cu:AgentCharge"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod46/cat_EDTS_cu:Method46Deduction/cat_EDTS_cu:AgentCharge"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graphNo">13 </span>
                                       <span class="graph">Расходы на перевозку (транспортировку), страхование и иные  связанные с такими операциями расходы, осуществленные на таможенной территории Таможенного Союза</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod46/cat_EDTS_cu:Method46Deduction/cat_EDTS_cu:UnionTransportCharge"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod46/cat_EDTS_cu:Method46Deduction/cat_EDTS_cu:UnionTransportCharge"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod46/cat_EDTS_cu:Method46Deduction/cat_EDTS_cu:UnionTransportCharge"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graphNo">14 </span>
                                       <span class="graph">Таможенные пошлины, налоги, сборы, подлежащие уплате в связи с ввозом товаров на таможенную территорию Таможенного Союза или с их продажей на этой территории государства-члена Таможенного Союза, включая налоги и сборы субъектов государства-члена Таможенного Союза и местные налоги и сборы</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod46/cat_EDTS_cu:Method46Deduction/cat_EDTS_cu:UnionTaxPayment"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod46/cat_EDTS_cu:Method46Deduction/cat_EDTS_cu:UnionTaxPayment"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod46/cat_EDTS_cu:Method46Deduction/cat_EDTS_cu:UnionTaxPayment"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graphNo">15 </span>
                                       <span class="graph">Стоимость, добавленная в результате переработки (обработки)</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod46/cat_EDTS_cu:Method46Deduction/cat_EDTS_cu:ProcessingAddedCost"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod46/cat_EDTS_cu:Method46Deduction/cat_EDTS_cu:ProcessingAddedCost"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod46/cat_EDTS_cu:Method46Deduction/cat_EDTS_cu:ProcessingAddedCost"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graphNo">16 </span>
                                       <span class="graph">Итого Б в национальной валюте (по графам с 12 по 15)</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod46/cat_EDTS_cu:Method46Deduction/cat_EDTS_cu:TotalDeductionAmount"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod46/cat_EDTS_cu:Method46Deduction/cat_EDTS_cu:TotalDeductionAmount"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod46/cat_EDTS_cu:Method46Deduction/cat_EDTS_cu:TotalDeductionAmount"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" colspan="2" style="width:110mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graphNo">17 </span>
                                       <span class="graph">Количество оцениваемых товаров</span>
                                       <xsl:if test="(DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod46/cat_EDTS_cu:DeclaratedGoodsQuantity/cat_EDTS_cu:MeasureUnitQualifierName) or (DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod46/cat_EDTS_cu:DeclaratedGoodsQuantity/cat_EDTS_cu:MeasureUnitQualifierCode)">
														(
														<xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod46/cat_EDTS_cu:DeclaratedGoodsQuantity/cat_EDTS_cu:MeasureUnitQualifierCode"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod46/cat_EDTS_cu:DeclaratedGoodsQuantity/cat_EDTS_cu:MeasureUnitQualifierName"/>
														)
													</xsl:if>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod46/cat_EDTS_cu:DeclaratedGoodsQuantity/cat_EDTS_cu:GoodsQuantity"/>
                                       <xsl:if test="(DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod46/cat_EDTS_cu:DeclaratedGoodsQuantity/cat_EDTS_cu:MeasureUnitQualifierName) or (DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod46/cat_EDTS_cu:DeclaratedGoodsQuantity/cat_EDTS_cu:MeasureUnitQualifierCode)">
														(
														<xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod46/cat_EDTS_cu:DeclaratedGoodsQuantity/cat_EDTS_cu:MeasureUnitQualifierCode"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod46/cat_EDTS_cu:DeclaratedGoodsQuantity/cat_EDTS_cu:MeasureUnitQualifierName"/>
														)
													</xsl:if>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod46/cat_EDTS_cu:DeclaratedGoodsQuantity/cat_EDTS_cu:GoodsQuantity"/>
                                       <xsl:if test="($column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod46/cat_EDTS_cu:DeclaratedGoodsQuantity/cat_EDTS_cu:MeasureUnitQualifierName) or ($column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod46/cat_EDTS_cu:DeclaratedGoodsQuantity/cat_EDTS_cu:MeasureUnitQualifierCode)">
														(
														<xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod46/cat_EDTS_cu:DeclaratedGoodsQuantity/cat_EDTS_cu:MeasureUnitQualifierCode"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod46/cat_EDTS_cu:DeclaratedGoodsQuantity/cat_EDTS_cu:MeasureUnitQualifierName"/>
														)
													</xsl:if>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod46/cat_EDTS_cu:DeclaratedGoodsQuantity/cat_EDTS_cu:GoodsQuantity"/>
                                       <xsl:if test="($column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod46/cat_EDTS_cu:DeclaratedGoodsQuantity/cat_EDTS_cu:MeasureUnitQualifierName) or ($column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod46/cat_EDTS_cu:DeclaratedGoodsQuantity/cat_EDTS_cu:MeasureUnitQualifierCode)">
														(
														<xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod46/cat_EDTS_cu:DeclaratedGoodsQuantity/cat_EDTS_cu:MeasureUnitQualifierCode"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod46/cat_EDTS_cu:DeclaratedGoodsQuantity/cat_EDTS_cu:MeasureUnitQualifierName"/>
														)
													</xsl:if>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" colspan="2" style="width:110mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graphNo">18 </span>
                                       <span class="graph">ЗАЯВЛЕННАЯ ТАМОЖЕННАЯ СТОИМОСТЬ (11-16) х 17</span>
                                       <br/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(а) в национальной валюте</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:NationalDeclaredCustomsCost"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:NationalDeclaredCustomsCost"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:NationalDeclaredCustomsCost"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" colspan="2" style="width:110mm;border:solid 0.8pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(б) в ДОЛЛАРАХ США (курс пересчета 
													<xsl:value-of select="$DTS/DTSout_CU:CurrencyRate"/>
													)</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DollarDeclaredCustomsCost"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DollarDeclaredCustomsCost"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DollarDeclaredCustomsCost"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" colspan="2" style="width:110mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graph">Дополнительные данные</span>
                                       <xsl:if test="DTSout_CU:AdditionalData">
                                          <br/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="DTSout_CU:AdditionalData/cat_EDTS_cu:PositionNumber"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:for-each select="DTSout_CU:AdditionalData/cat_EDTS_cu:AdditionalInformation">
                                             <xsl:value-of select="."/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </xsl:for-each>
                                       </xsl:if>
                                    </td>
                                    <td class="graph" colspan="3" style="width:70mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graph">Подпись, печать</span>
                                       <br/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$DTS/DTSout_CU:DTSout_CUFilledPerson/cat_ru:PersonSurname"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$DTS/DTSout_CU:DTSout_CUFilledPerson/cat_ru:PersonName"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$DTS/DTSout_CU:DTSout_CUFilledPerson/cat_ru:PersonMiddleName"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$DTS/DTSout_CU:DTSout_CUFilledPerson/cat_ru:PersonPost"/>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                        </div>
                    <!-- </xsl:if>-->
                  </xsl:for-each>
                  
                  
                  
                <xsl:for-each select="//DTSout_CU:DTSout_CUGoodsCustomsCost[($DTS/DTSout_CU:CustomsCostMethodCode=5) or (($DTS/DTSout_CU:CustomsCostMethodCode='*') and (DTSout_CU:MethodNumberCode=5)) or (($DTS/DTSout_CU:CustomsCostMethodCode=6) 
                  and ($DTS/DTSout_CU:BaseMethodCode=5)) or(($DTS/DTSout_CU:CustomsCostMethodCode='*') and (DTSout_CU:MethodNumberCode=6) 
                  and (DTSout_CU:BaseMethodNumberCode=5))or(($DTS/DTSout_CU:CustomsCostMethodCode='6') and (DTSout_CU:MethodNumberCode=6) and (DTSout_CU:BaseMethodNumberCode=5))][(position() mod 3) = 1]">
                
                
                  <!--<xsl:if test="($DTS/DTSout_CU:CustomsCostMethodCode=5) or (($DTS/DTSout_CU:CustomsCostMethodCode='*') and (DTSout_CU:MethodNumberCode=5)) or (($DTS/DTSout_CU:CustomsCostMethodCode=6) 
                  and ($DTS/DTSout_CU:BaseMethodCode=5)) or(($DTS/DTSout_CU:CustomsCostMethodCode='*') and (DTSout_CU:MethodNumberCode=6) 
                  and (DTSout_CU:BaseMethodNumberCode=5))or(($DTS/DTSout_CU:CustomsCostMethodCode='6') and (DTSout_CU:MethodNumberCode=6) and (DTSout_CU:BaseMethodNumberCode=5))">-->
                  
                   <xsl:variable name="column_2" select="following-sibling::DTSout_CU:DTSout_CUGoodsCustomsCost[($DTS/DTSout_CU:CustomsCostMethodCode=5) or (($DTS/DTSout_CU:CustomsCostMethodCode='*') and (DTSout_CU:MethodNumberCode=5)) or (($DTS/DTSout_CU:CustomsCostMethodCode=6) 
                  and ($DTS/DTSout_CU:BaseMethodCode=5)) or(($DTS/DTSout_CU:CustomsCostMethodCode='*') and (DTSout_CU:MethodNumberCode=6) 
                  and (DTSout_CU:BaseMethodNumberCode=5))or(($DTS/DTSout_CU:CustomsCostMethodCode='6') and (DTSout_CU:MethodNumberCode=6) and (DTSout_CU:BaseMethodNumberCode=5))][1]"/>
                     
                     <xsl:variable name="column_3" select="following-sibling::DTSout_CU:DTSout_CUGoodsCustomsCost[($DTS/DTSout_CU:CustomsCostMethodCode=5) or (($DTS/DTSout_CU:CustomsCostMethodCode='*') and (DTSout_CU:MethodNumberCode=5)) or (($DTS/DTSout_CU:CustomsCostMethodCode=6) 
                  and ($DTS/DTSout_CU:BaseMethodCode=5)) or(($DTS/DTSout_CU:CustomsCostMethodCode='*') and (DTSout_CU:MethodNumberCode=6) 
                  and (DTSout_CU:BaseMethodNumberCode=5))or(($DTS/DTSout_CU:CustomsCostMethodCode='6') and (DTSout_CU:MethodNumberCode=6) and (DTSout_CU:BaseMethodNumberCode=5))][2]"/>
                        <div class="page">
                           <table cellpadding="0" cellspacing="0" style="width:100%;">
                              <tbody>
                                 <tr>
                                    <td align="right" class="graph" style="width:145mm;">
                                       <span class="graph">Форма ДТС-2</span>
                                    </td>
                                    <td align="right" class="graph" style="width:35mm;">
                                       <span class="graph">Лист № </span>
                                       <xsl:value-of select="DTSout_CU:SheetNumber"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td align="right" class="graph" style="width:145mm;">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </td>
                                    <td align="right" class="graph" style="width:35mm;">
                                       <span class="graph">Методы 5, 6</span>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                           <table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0.8pt #000000;">
                              <tbody>
                                 <tr>
                                    <td align="center" class="graph" colspan="2" rowspan="2" style="width:110mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graph">ДЛЯ ОТМЕТОК ТАМОЖЕННОГО ОРГАНА</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graph">Товар № </span>
                                       <xsl:value-of select="DTSout_CU:GTDGoodsNumber"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graph">Товар № </span>
                                       <xsl:value-of select="$column_2/DTSout_CU:GTDGoodsNumber"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graph">Товар № </span>
                                       <xsl:value-of select="$column_3/DTSout_CU:GTDGoodsNumber"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graph">Код ТН ВЭД</span>
                                       <br/>
                                       <xsl:value-of select="DTSout_CU:GoodsTNVEDCode"/>
                                       <xsl:value-of select="DTSout_CU:GoodsAddTNVEDCode"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graph">Код ТН ВЭД</span>
                                       <br/>
                                       <xsl:value-of select="$column_2/DTSout_CU:GoodsTNVEDCode"/>
                                       <xsl:value-of select="$column_2/DTSout_CU:GoodsAddTNVEDCode"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graph">Код ТН ВЭД</span>
                                       <br/>
                                       <xsl:value-of select="$column_3/DTSout_CU:GoodsTNVEDCode"/>
                                       <xsl:value-of select="$column_3/DTSout_CU:GoodsAddTNVEDCode"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" rowspan="12" style="width:20mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graph">А. Основа для расчета*</span>
                                    </td>
                                    <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graphNo">11 </span>
                                       <span class="graph">Расходы производителя по изготовлению/приобретению материалов и расходы на производство, а также на иные операции, связанные с производством ввозимых товаров, в том числе:</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod56/cat_EDTS_cu:Method56Basis/cat_EDTS_cu:ProductionStoreExpense"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod56/cat_EDTS_cu:Method56Basis/cat_EDTS_cu:ProductionStoreExpense"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod56/cat_EDTS_cu:Method56Basis/cat_EDTS_cu:ProductionStoreExpense"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graph">а) расходы на тару и упаковку</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod56//cat_EDTS_cu:Method56Basis/cat_EDTS_cu:PackageExpenses"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod56//cat_EDTS_cu:Method56Basis/cat_EDTS_cu:PackageExpenses"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod56//cat_EDTS_cu:Method56Basis/cat_EDTS_cu:PackageExpenses"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graph">(б) расходы на проектирование, разработку, инженерную, конструкторскую работу художественное оформление, дизайн, эскизы и чертежи, выполненные на таможенной территории Таможенного союза и необходимые для производства оцениваемых товаров в пределах, оплаченных производителем</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod56//cat_EDTS_cu:Method56Basis/cat_EDTS_cu:DesignPaymentProduction"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod56//cat_EDTS_cu:Method56Basis/cat_EDTS_cu:DesignPaymentProduction"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod56//cat_EDTS_cu:Method56Basis/cat_EDTS_cu:DesignPaymentProduction"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graphNo">12 </span>
                                       <span class="graph">Расходы, связанные с производством ввозимых товаров, в том числе: соответствующим образом распределенная стоимость следующих товаров и услуг, прямо или косвенно предоставленных бесплатно или по сниженной цене для использования в связи с производством и продажей для вывоза на таможенную территорию Таможенного союза оцениваемых товаров:</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod56//cat_EDTS_cu:Method56Basis/cat_EDTS_cu:GoodsCost"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod56//cat_EDTS_cu:Method56Basis/cat_EDTS_cu:GoodsCost"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod56//cat_EDTS_cu:Method56Basis/cat_EDTS_cu:GoodsCost"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graph">(а) сырья, материалов, деталей, полуфабрикатов и тому подобных предметов, из которых состоят ввозимые товары</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod56//cat_EDTS_cu:Method56Basis/cat_EDTS_cu:StoreCost"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod56//cat_EDTS_cu:Method56Basis/cat_EDTS_cu:StoreCost"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod56//cat_EDTS_cu:Method56Basis/cat_EDTS_cu:StoreCost"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(б) инструментов, штампов, форм и других подобных предметов, использованных при производстве ввозимых товаров</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod56/cat_EDTS_cu:Method56Basis/cat_EDTS_cu:ProductionToolkitCost"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod56/cat_EDTS_cu:Method56Basis/cat_EDTS_cu:ProductionToolkitCost"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod56/cat_EDTS_cu:Method56Basis/cat_EDTS_cu:ProductionToolkitCost"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(в) материалов, израсходованных при производстве ввозимых товаров</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod56/cat_EDTS_cu:Method56Basis/cat_EDTS_cu:ConsumablesCost"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod56/cat_EDTS_cu:Method56Basis/cat_EDTS_cu:ConsumablesCost"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod56/cat_EDTS_cu:Method56Basis/cat_EDTS_cu:ConsumablesCost"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graph">(г) проектирования, разработки, инженерной, конструкторской работы, художественного оформления, дизайна, эскизов и чертежей, выполненных вне таможенной территории Таможенного союза и необходимых для производства ввозимых товаров</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod56/cat_EDTS_cu:Method56Basis/cat_EDTS_cu:DesignPayment"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod56/cat_EDTS_cu:Method56Basis/cat_EDTS_cu:DesignPayment"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod56/cat_EDTS_cu:Method56Basis/cat_EDTS_cu:DesignPayment"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graphNo">13 </span>
                                       <span class="graph">Сумма прибыли и коммерческих и управленческих расходов</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod56/cat_EDTS_cu:Method56Basis/cat_EDTS_cu:CommerceExpense"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod56/cat_EDTS_cu:Method56Basis/cat_EDTS_cu:CommerceExpense"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod56/cat_EDTS_cu:Method56Basis/cat_EDTS_cu:CommerceExpense"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graphNo">14 </span>
                                       <span class="graph">Расходы по перевозке (транспортировке) товаров до  
													<xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod56/cat_EDTS_cu:Method56Basis/cat_EDTS_cu:BorderPlace"/>
													(место прибытия на единую таможенную территорию Таможенного Союза)</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod56/cat_EDTS_cu:Method56Basis/cat_EDTS_cu:BorderTransportCharges"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod56/cat_EDTS_cu:Method56Basis/cat_EDTS_cu:BorderTransportCharges"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod56/cat_EDTS_cu:Method56Basis/cat_EDTS_cu:BorderTransportCharges"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graphNo">15 </span>
                                       <span class="graph">Расходы по погрузке, разгрузке/перегрузке товаров и операциям, связанным с перевозкой до  
													<xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod56/cat_EDTS_cu:Method56Basis/cat_EDTS_cu:ArrivalPlace"/>
													(место прибытия на единую таможенную территорию Таможенного Союза)</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod56/cat_EDTS_cu:Method56Basis/cat_EDTS_cu:LoadCharges"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod56/cat_EDTS_cu:Method56Basis/cat_EDTS_cu:LoadCharges"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod56/cat_EDTS_cu:Method56Basis/cat_EDTS_cu:LoadCharges"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graphNo">16 </span>
                                       <span class="graph">Расходы на страхование в связи с операциями, указанными в графах 14 и 15</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod56/cat_EDTS_cu:Method56Basis/cat_EDTS_cu:InsuranceCharges"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod56/cat_EDTS_cu:Method56Basis/cat_EDTS_cu:InsuranceCharges"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod56/cat_EDTS_cu:Method56Basis/cat_EDTS_cu:InsuranceCharges"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" colspan="2" style="width:110mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graphNo">17 </span>
                                       <span class="graph">ТАМОЖЕННАЯ СТОИМОСТЬ ОЦЕНИВАЕМЫХ ТОВАРОВ </span>
                                       <br/>
                                       <span class="graph">(итого по графам с 11 по 16)</span>
                                       <br/>
                                       <span class="graph">(а) в национальной валюте государства -</span>
                                       <span class="graph">члена Таможенного союза</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:NationalDeclaredCustomsCost"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:NationalDeclaredCustomsCost"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:NationalDeclaredCustomsCost"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" colspan="2" style="width:110mm;border:solid 0.8pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(б) в ДОЛЛАРАХ США (курс пересчета 
													<xsl:value-of select="$DTS/DTSout_CU:CurrencyRate"/>
													)</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DollarDeclaredCustomsCost"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DollarDeclaredCustomsCost"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DollarDeclaredCustomsCost"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" colspan="3" style="width:180mm;border:solid 0.8pt #000000;" valign="top">
                                       <table cellpadding="0" cellspacing="0" style="width:100%;">
                                          <tbody>
                                             <tr>
                                                <td class="graph" colspan="3" style="width:180mm;" valign="top">
                                                   <xsl:text>* Если сумма оплачена в иностранной валюте, здесь указывается сумма в иностранной валюте и курс пересчета по каждому товару и элементу стоимости</xsl:text>
                                                </td>
                                             </tr>
                                             <tr>
                                                <td class="graph" style="width:80mm;" valign="top">
                                                   <span class="graph">Номер товара и позиции</span>
                                                </td>
                                                <td class="graph" style="width:40mm;" valign="top">
                                                   <span class="graph">Код валюты, сумма</span>
                                                </td>
                                                <td class="graph" style="width:40mm;" valign="top">
                                                   <span class="graph">Курс пересчета</span>
                                                </td>
                                             </tr>
                                             <xsl:for-each select="DTSout_CU:DTSCurrencyPayment">
                                                <tr>
                                                   <td class="graph" style="width:80mm;" valign="top">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                      <xsl:value-of select="cat_EDTS_cu:PositionsNumber"/>
                                                   </td>
                                                   <td class="graph" style="width:40mm;" valign="top">
                                                      <xsl:value-of select="cat_EDTS_cu:CurrencyCode"/>
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                      <xsl:value-of select="cat_EDTS_cu:CurrencyAmount"/>
                                                   </td>
                                                   <td class="graph" style="width:40mm;" valign="top">
                                                      <xsl:choose>
                                                         <xsl:when test="cat_EDTS_cu:CurrencyRate">
                                                            <xsl:value-of select="cat_EDTS_cu:CurrencyRate"/>
                                                         </xsl:when>
                                                         <xsl:otherwise>
                                                            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                         </xsl:otherwise>
                                                      </xsl:choose>
                                                   </td>
                                                </tr>
                                             </xsl:for-each>
                                             <xsl:for-each select="$column_2/DTSout_CU:DTSCurrencyPayment">
                                                <tr>
                                                   <td class="graph" style="width:80mm;" valign="top">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                      <xsl:value-of select="cat_EDTS_cu:PositionsNumber"/>
                                                   </td>
                                                   <td class="graph" style="width:40mm;" valign="top">
                                                      <xsl:value-of select="cat_EDTS_cu:CurrencyCode"/>
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                      <xsl:value-of select="cat_EDTS_cu:CurrencyAmount"/>
                                                   </td>
                                                   <td class="graph" style="width:40mm;" valign="top">
                                                      <xsl:choose>
                                                         <xsl:when test="cat_EDTS_cu:CurrencyRate">
                                                            <xsl:value-of select="cat_EDTS_cu:CurrencyRate"/>
                                                         </xsl:when>
                                                         <xsl:otherwise>
                                                            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                         </xsl:otherwise>
                                                      </xsl:choose>
                                                   </td>
                                                </tr>
                                             </xsl:for-each>
                                             <xsl:for-each select="$column_3/DTSCurrencyPayment">
                                                <tr>
                                                   <td class="graph" style="width:80mm;" valign="top">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                      <xsl:value-of select="cat_EDTS_cu:PositionsNumber"/>
                                                   </td>
                                                   <td class="graph" style="width:40mm;" valign="top">
                                                      <xsl:value-of select="cat_EDTS_cu:CurrencyCode"/>
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                      <xsl:value-of select="cat_EDTS_cu:CurrencyAmount"/>
                                                   </td>
                                                   <td class="graph" style="width:40mm;" valign="top">
                                                      <xsl:choose>
                                                         <xsl:when test="cat_EDTS_cu:CurrencyRate">
                                                            <xsl:value-of select="cat_EDTS_cu:CurrencyRate"/>
                                                         </xsl:when>
                                                         <xsl:otherwise>
                                                            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                         </xsl:otherwise>
                                                      </xsl:choose>
                                                   </td>
                                                </tr>
                                             </xsl:for-each>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" colspan="2" style="width:110mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graph">Дополнительные данные</span>
                                       <xsl:if test="DTSout_CU:AdditionalData">
                                          <br/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="DTSout_CU:AdditionalData/cat_EDTS_cu:PositionNumber"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:for-each select="DTSout_CU:AdditionalData/cat_EDTS_cu:AdditionalInformation">
                                             <xsl:value-of select="."/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </xsl:for-each>
                                       </xsl:if>
                                    </td>
                                    <td class="graph" colspan="3" style="width:70mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graph">Подпись, печать</span>
                                       <br/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$DTS/DTSout_CU:DTSout_CUFilledPerson/cat_ru:PersonSurname"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$DTS/DTSout_CU:DTSout_CUFilledPerson/cat_ru:PersonName"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$DTS/DTSout_CU:DTSout_CUFilledPerson/cat_ru:PersonMiddleName"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$DTS/DTSout_CU:DTSout_CUFilledPerson/cat_ru:PersonPost"/>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                        </div>
                  <!--   </xsl:if>-->
                     </xsl:for-each>
                     
                     
                <xsl:for-each select="//DTSout_CU:DTSout_CUGoodsCustomsCost[($DTS/DTSout_CU:CustomsCostMethodCode=2) or ($DTS/DTSout_CU:CustomsCostMethodCode=3) 
                or ($DTS/DTSout_CU:CustomsCostMethodCode=6 and (($DTS/DTSout_CU:BaseMethodCode=2) or ($DTS/DTSout_CU:BaseMethodCode=3))) or (($DTS/DTSout_CU:CustomsCostMethodCode='*') 
                and ((DTSout_CU:MethodNumberCode=2) or (DTSout_CU:MethodNumberCode=3))) or  ((DTSout_CU:MethodNumberCode=6) and ((DTSout_CU:BaseMethodNumberCode=2) 
                or (DTSout_CU:BaseMethodNumberCode=3)))][(position() mod 3) = 1]">
                     
                     
                     
                    <!-- <xsl:if test="($DTS/DTSout_CU:CustomsCostMethodCode=2) or ($DTS/DTSout_CU:CustomsCostMethodCode=3) or ($DTS/DTSout_CU:CustomsCostMethodCode=6 and (($DTS/DTSout_CU:BaseMethodCode=2) or ($DTS/DTSout_CU:BaseMethodCode=3))) or (($DTS/DTSout_CU:CustomsCostMethodCode='*') and ((DTSout_CU:MethodNumberCode=2) or (DTSout_CU:MethodNumberCode=3))) or  ((DTSout_CU:MethodNumberCode=6) and ((DTSout_CU:BaseMethodNumberCode=2) or (DTSout_CU:BaseMethodNumberCode=3)))">-->
                    <xsl:variable name="column_2" select="following-sibling::DTSout_CU:DTSout_CUGoodsCustomsCost[($DTS/DTSout_CU:CustomsCostMethodCode=2) or ($DTS/DTSout_CU:CustomsCostMethodCode=3) 
                     or ($DTS/DTSout_CU:CustomsCostMethodCode=6 and (($DTS/DTSout_CU:BaseMethodCode=2) or ($DTS/DTSout_CU:BaseMethodCode=3))) or (($DTS/DTSout_CU:CustomsCostMethodCode='*') 
                     and ((DTSout_CU:MethodNumberCode=2) or (DTSout_CU:MethodNumberCode=3))) or  ((DTSout_CU:MethodNumberCode=6) and ((DTSout_CU:BaseMethodNumberCode=2) 
                     or (DTSout_CU:BaseMethodNumberCode=3)))][1]"/>
                     
                     <xsl:variable name="column_3" select="following-sibling::DTSout_CU:DTSout_CUGoodsCustomsCost[($DTS/DTSout_CU:CustomsCostMethodCode=2) or ($DTS/DTSout_CU:CustomsCostMethodCode=3) 
                     or ($DTS/DTSout_CU:CustomsCostMethodCode=6 and (($DTS/DTSout_CU:BaseMethodCode=2) or ($DTS/DTSout_CU:BaseMethodCode=3))) or (($DTS/DTSout_CU:CustomsCostMethodCode='*') 
                     and ((DTSout_CU:MethodNumberCode=2) or (DTSout_CU:MethodNumberCode=3))) or  ((DTSout_CU:MethodNumberCode=6) and ((DTSout_CU:BaseMethodNumberCode=2) 
                     or (DTSout_CU:BaseMethodNumberCode=3)))][2]"/>
                        <div class="page">
                           <table cellpadding="0" cellspacing="0" style="width:100%;">
                              <tbody>
                                 <tr>
                                    <td align="right" class="graph" style="width:145mm;">
                                       <span class="graph">Форма ДТС-2</span>
                                    </td>
                                    <td align="right" class="graph" style="width:35mm;">
                                       <span class="graph">Лист № </span>
                                       <xsl:value-of select="DTSout_CU:SheetNumber"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td align="right" class="graph" style="width:145mm;">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </td>
                                    <td align="right" class="graph" style="width:35mm;">
                                       <span class="graph">Методы 2, 3, 6</span>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                           <table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0.8pt #000000;">
                              <tbody>
                                 <tr>
                                    <td align="center" class="graph" colspan="2" rowspan="2" style="width:110mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graph">ДЛЯ ОТМЕТОК ТАМОЖЕННОГО ОРГАНА</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graph">Товар № </span>
                                       <xsl:value-of select="DTSout_CU:GTDGoodsNumber"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graph">Товар № </span>
                                       <xsl:value-of select="$column_2/DTSout_CU:GTDGoodsNumber"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graph">Товар № </span>
                                       <xsl:value-of select="$column_3/DTSout_CU:GTDGoodsNumber"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graph">Код ТН ВЭД ЕАЭС</span>
                                       <br/>
                                       <xsl:value-of select="DTSout_CU:GoodsTNVEDCode"/>
                                       <xsl:value-of select="DTSout_CU:GoodsAddTNVEDCode"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graph">Код ТН ВЭД ЕАЭС</span>
                                       <br/>
                                       <xsl:value-of select="$column_2/DTSout_CU:GoodsTNVEDCode"/>
                                       <xsl:value-of select="$column_2/DTSout_CU:GoodsAddTNVEDCode"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graph">Код ТН ВЭД ЕАЭС</span>
                                       <br/>
                                       <xsl:value-of select="$column_3/DTSout_CU:GoodsTNVEDCode"/>
                                       <xsl:value-of select="$column_3/DTSout_CU:GoodsAddTNVEDCode"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:20mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graph">А. Основа для расчета</span>
                                    </td>
                                    <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graphNo">11 </span>
                                       <span class="graph">Стоимость сделки с идентичными/однородными товарами в национальной валюте</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:Method2Basis/cat_EDTS_cu:IdenticalDealNationalAmount"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:Method2Basis/cat_EDTS_cu:IdenticalDealNationalAmount"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:Method2Basis/cat_EDTS_cu:IdenticalDealNationalAmount"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" rowspan="13" style="width:20mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graph">Б. Корректировки стоимости сделки (+-)*</span>
                                    </td>
                                    <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graphNo">12 </span>
                                       <span class="graph">(а) корректировка на количество (-)</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:MinusQuantityCorrect"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:MinusQuantityCorrect"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:MinusQuantityCorrect"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(б) корректировка на коммерческий уровень (-)</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:MinusCommerceCorrect"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:MinusCommerceCorrect"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:MinusCommerceCorrect"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(в) корректировка на разницу в расходах по перевозке (транспортировке) товаров до 
													<xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:MinusBorderPlace"/>
													 (место прибытия на таможенную единую  таможенную территорию Таможенного Союза) (-)</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:MinusBorderTransportCharges"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:MinusBorderTransportCharges"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:MinusBorderTransportCharges"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(г) корректировка на разницу в расходах по погрузке, выгрузке/перегрузке товаров и операциям, связанным с перевозкой до 
														<xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:MinusArrivalPlace"/>
													  (место прибытия на таможенную единую  таможенную территорию Таможенного Союза) (-)</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:MinusLoadCharges"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:MinusLoadCharges"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:MinusLoadCharges"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(д) корректировка на разницу в расходах на страхование в связи с операциями указанными в графах 12в и 12г (-)</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:MinusInsuranceCharges"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:MinusInsuranceCharges"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:MinusInsuranceCharges"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graphNo">13 </span>
                                       <span class="graph">Итого графа 12 в национальной валюте</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:MinusTotalSum"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:MinusTotalSum"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:MinusTotalSum"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graphNo">14 </span>
                                       <span class="graph">(а) корректировка на количество (+)</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:PlusQuantityCorrect"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:PlusQuantityCorrect"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:PlusQuantityCorrect"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(б) корректировка на коммерческий уровень (+)</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:PlusCommerceCorrect"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:PlusCommerceCorrect"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:PlusCommerceCorrect"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(в) корректировка на разницу в расходах по перевозке (транспортировке) товаров до 
													<xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:PlusBorderPlace"/>
													 (место прибытия на таможенную единую  таможенную территорию Таможенного Союза) (+)</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:PlusBorderTransportCharges"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:PlusBorderTransportCharges"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:PlusBorderTransportCharges"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(г) корректировка на разницу в расходах по погрузке, разгрузке/перегрузке товаров и операциям, связанным с перевозкой до 
													<xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:PlusArrivalPlace"/>
													 (место прибытия на таможенную единую  таможенную территорию Таможенного Союза) (+)</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:PlusLoadCharges"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:PlusLoadCharges"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:PlusLoadCharges"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(д) корректировка на разницу в расходах на страхование в связи с операциями, указанными в графах 14в и 14г (+)</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:PlusInsuranceCharges"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:PlusInsuranceCharges"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:PlusInsuranceCharges"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graphNo">15 </span>
                                       <span class="graph">Итого графа 14 в национальной валюте</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:PlusTotalSum"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:PlusTotalSum"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:PlusTotalSum"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graphNo">16 </span>
                                       <span class="graph">Стоимость сделки с учетом корректировок (11а-13+15) в национальной валюте</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:TotalDealCorrect"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:TotalDealCorrect"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:Method2DealCorrect/cat_EDTS_cu:TotalDealCorrect"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" rowspan="2" style="width:20mm;border:solid 0.8pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </td>
                                    <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graphNo">17 </span>
                                       <span class="graph">Количество</span>
                                       <br/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(а) идентичных/однородных товаров</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:IdenticalGoodsQuantity/cat_EDTS_cu:GoodsQuantity"/>
                                       <xsl:if test="(DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:IdenticalGoodsQuantity/cat_EDTS_cu:MeasureUnitQualifierName) or (DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:IdenticalGoodsQuantity/cat_EDTS_cu:MeasureUnitQualifierCode)">
														(
														<xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:IdenticalGoodsQuantity/cat_EDTS_cu:MeasureUnitQualifierCode"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:IdenticalGoodsQuantity/cat_EDTS_cu:MeasureUnitQualifierName"/>
														)
													</xsl:if>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:IdenticalGoodsQuantity/cat_EDTS_cu:GoodsQuantity"/>
                                       <xsl:if test="($column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:IdenticalGoodsQuantity/cat_EDTS_cu:MeasureUnitQualifierName) or ($column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:IdenticalGoodsQuantity/cat_EDTS_cu:MeasureUnitQualifierCode)">
														(
														<xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:IdenticalGoodsQuantity/cat_EDTS_cu:MeasureUnitQualifierCode"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:IdenticalGoodsQuantity/cat_EDTS_cu:MeasureUnitQualifierName"/>
														)
													</xsl:if>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:IdenticalGoodsQuantity/cat_EDTS_cu:GoodsQuantity"/>
                                       <xsl:if test="($column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:IdenticalGoodsQuantity/cat_EDTS_cu:MeasureUnitQualifierName) or ($column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:IdenticalGoodsQuantity/cat_EDTS_cu:MeasureUnitQualifierCode)">
														(
														<xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:IdenticalGoodsQuantity/cat_EDTS_cu:MeasureUnitQualifierCode"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:IdenticalGoodsQuantity/cat_EDTS_cu:MeasureUnitQualifierName"/>
														)
													</xsl:if>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(б) декларируемых товаров</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:DeclaratedGoodsQuantity/cat_EDTS_cu:GoodsQuantity"/>
                                       <xsl:if test="(DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:DeclaratedGoodsQuantity/cat_EDTS_cu:MeasureUnitQualifierName) or (DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:DeclaratedGoodsQuantity/cat_EDTS_cu:MeasureUnitQualifierCode)">
														 (
														<xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:DeclaratedGoodsQuantity/cat_EDTS_cu:MeasureUnitQualifierCode"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:DeclaratedGoodsQuantity/cat_EDTS_cu:MeasureUnitQualifierName"/>
														)
													</xsl:if>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:DeclaratedGoodsQuantity/cat_EDTS_cu:GoodsQuantity"/>
                                       <xsl:if test="($column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:DeclaratedGoodsQuantity/cat_EDTS_cu:MeasureUnitQualifierName) or ($column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:DeclaratedGoodsQuantity/cat_EDTS_cu:MeasureUnitQualifierCode)">
														(
														<xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:DeclaratedGoodsQuantity/cat_EDTS_cu:MeasureUnitQualifierCode"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="$column_2/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:DeclaratedGoodsQuantity/cat_EDTS_cu:MeasureUnitQualifierName"/>
														)
													</xsl:if>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:DeclaratedGoodsQuantity/cat_EDTS_cu:GoodsQuantity"/>
                                       <xsl:if test="($column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:DeclaratedGoodsQuantity/cat_EDTS_cu:MeasureUnitQualifierName) or ($column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:DeclaratedGoodsQuantity/cat_EDTS_cu:MeasureUnitQualifierCode)">
														(
														<xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:DeclaratedGoodsQuantity/cat_EDTS_cu:MeasureUnitQualifierCode"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="$column_3/DTSout_CU:DTS_CUCustomsCostCalculation/cat_EDTS_cu:DTSMethod236/cat_EDTS_cu:DeclaratedGoodsQuantity/cat_EDTS_cu:MeasureUnitQualifierName"/>
														)
													</xsl:if>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" colspan="2" style="width:110mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graphNo">18 </span>
                                       <span class="graph">ЗАЯВЛЕННАЯ ТАМОЖЕННАЯ СТОИМОСТЬ (16/17а*17б)</span>
                                       <br/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(а) в РУБЛЯХ</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:NationalDeclaredCustomsCost"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:NationalDeclaredCustomsCost"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:NationalDeclaredCustomsCost"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" colspan="2" style="width:110mm;border:solid 0.8pt #000000;" valign="top">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <span class="graph">(б) в ДОЛЛАРАХ США (курс пересчета 
													<xsl:value-of select="$DTS/DTSout_CU:CurrencyRate"/>
													)</span>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="DTSout_CU:DollarDeclaredCustomsCost"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_2/DTSout_CU:DollarDeclaredCustomsCost"/>
                                    </td>
                                    <td align="center" class="graph" style="width:23mm;border:solid 0.8pt #000000;" valign="middle">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$column_3/DTSout_CU:DollarDeclaredCustomsCost"/>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" colspan="5" style="width:180mm;border:solid 0.8pt #000000;" valign="top">
                                       <table cellpadding="0" cellspacing="0" style="width:100%;">
                                          <tbody>
                                             <tr>
                                                <td class="graph" colspan="3" style="width:180mm;" valign="top">
                                                   <xsl:text>* Если сумма оплачена в иностранной валюте, здесь указывается сумма в иностранной валюте и курс пересчета по каждому товару и элементу стоимости</xsl:text>
                                                </td>
                                             </tr>
                                             <tr>
                                                <td class="graph" style="width:80mm;" valign="top">
                                                   <span class="graph">Номер товара и позиции</span>
                                                </td>
                                                <td class="graph" style="width:40mm;" valign="top">
                                                   <span class="graph">Код валюты, сумма</span>
                                                </td>
                                                <td class="graph" style="width:40mm;" valign="top">
                                                   <span class="graph">Курс пересчета</span>
                                                </td>
                                             </tr>
                                             <xsl:for-each select="DTSout_CU:DTSCurrencyPayment">
                                                <tr>
                                                   <td class="graph" style="width:80mm;" valign="top">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                      <xsl:value-of select="cat_EDTS_cu:PositionsNumber"/>
                                                   </td>
                                                   <td class="graph" style="width:40mm;" valign="top">
                                                      <xsl:value-of select="cat_EDTS_cu:CurrencyCode"/>
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                      <xsl:value-of select="cat_EDTS_cu:CurrencyAmount"/>
                                                   </td>
                                                   <td class="graph" style="width:40mm;" valign="top">
                                                      <xsl:choose>
                                                         <xsl:when test="cat_EDTS_cu:CurrencyRate">
                                                            <xsl:value-of select="cat_EDTS_cu:CurrencyRate"/>
                                                         </xsl:when>
                                                         <xsl:otherwise>
                                                            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                         </xsl:otherwise>
                                                      </xsl:choose>
                                                   </td>
                                                </tr>
                                             </xsl:for-each>
                                             <xsl:for-each select="$column_2/DTSout_CU:DTSCurrencyPayment">
                                                <tr>
                                                   <td class="graph" style="width:80mm;" valign="top">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                      <xsl:value-of select="cat_EDTS_cu:PositionsNumber"/>
                                                   </td>
                                                   <td class="graph" style="width:40mm;" valign="top">
                                                      <xsl:value-of select="cat_EDTS_cu:CurrencyCode"/>
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                      <xsl:value-of select="cat_EDTS_cu:CurrencyAmount"/>
                                                   </td>
                                                   <td class="graph" style="width:40mm;" valign="top">
                                                      <xsl:choose>
                                                         <xsl:when test="cat_EDTS_cu:CurrencyRate">
                                                            <xsl:value-of select="cat_EDTS_cu:CurrencyRate"/>
                                                         </xsl:when>
                                                         <xsl:otherwise>
                                                            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                         </xsl:otherwise>
                                                      </xsl:choose>
                                                   </td>
                                                </tr>
                                             </xsl:for-each>
                                             <xsl:for-each select="$column_3/DTSout_CU:DTSCurrencyPayment">
                                                <tr>
                                                   <td class="graph" style="width:80mm;" valign="top">
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                      <xsl:value-of select="cat_EDTS_cu:PositionsNumber"/>
                                                   </td>
                                                   <td class="graph" style="width:40mm;" valign="top">
                                                      <xsl:value-of select="cat_EDTS_cu:CurrencyCode"/>
                                                      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                      <xsl:value-of select="cat_EDTS_cu:CurrencyAmount"/>
                                                   </td>
                                                   <td class="graph" style="width:40mm;" valign="top">
                                                      <xsl:choose>
                                                         <xsl:when test="cat_EDTS_cu:CurrencyRate">
                                                            <xsl:value-of select="cat_EDTS_cu:CurrencyRate"/>
                                                         </xsl:when>
                                                         <xsl:otherwise>
                                                            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                                         </xsl:otherwise>
                                                      </xsl:choose>
                                                   </td>
                                                </tr>
                                             </xsl:for-each>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td class="graph" colspan="2" style="width:110mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graph">Дополнительные данные</span>
                                       <xsl:if test="DTSout_CU:AdditionalData">
                                          <br/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="DTSout_CU:AdditionalData/cat_EDTS_cu:PositionNumber"/>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:for-each select="DTSout_CU:AdditionalData/cat_EDTS_cu:AdditionalInformation">
                                             <xsl:value-of select="."/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </xsl:for-each>
                                       </xsl:if>
                                    </td>
                                    <td class="graph" colspan="3" style="width:70mm;border:solid 0.8pt #000000;" valign="top">
                                       <span class="graph">Подпись, печать</span>
                                       <br/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$DTS/DTSout_CU:DTSout_CUFilledPerson/cat_ru:PersonSurname"/>
                                       <xsl:text> </xsl:text>
                                       <xsl:value-of select="$DTS/DTSout_CU:DTSout_CUFilledPerson/cat_ru:PersonName"/>
                                       <xsl:text> </xsl:text>
                                       <xsl:value-of select="$DTS/DTSout_CU:DTSout_CUFilledPerson/cat_ru:PersonMiddleName"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="$DTS/DTSout_CU:DTSout_CUFilledPerson/cat_ru:PersonPost"/>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                        </div>
                    <!-- </xsl:if>-->
                 
                 </xsl:for-each>
               </xsl:when>
            </xsl:choose>
         </body>
      </html>
   </xsl:template>
	<!-- Реквизиты организации -->
	<xsl:template match="*" mode="org">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:ShortName">
			<span class="graph"> (</span>
			<xsl:value-of select="cat_ru:ShortName"/>
			<span class="graph">)</span>
		</xsl:if>
		<br/>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:apply-templates mode="ru_address" select="."/>
				<xsl:if test="position()!=last()">; </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RUScat_ru:CommunicationDetails/cat_ru:E_mail">
			<xsl:if test="RUScat_ru:SubjectAddressDetails">
				<xsl:text>; </xsl:text>
			</xsl:if>
			<xsl:for-each select="RUScat_ru:CommunicationDetails/cat_ru:E_mail">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RUScat_ru:SubjectBranch">
			<br/>
			<xsl:value-of select="RUScat_ru:SubjectBranch/cat_ru:OrganizationName"/>
			<br/>
			<xsl:if test="RUScat_ru:SubjectBranch/RUScat_ru:SubjectAddressDetails">
				<xsl:apply-templates mode="ru_address" select="RUScat_ru:SubjectBranch/RUScat_ru:SubjectAddressDetails"/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="(cat_ru:RFOrganizationFeatures) or (cat_ru:RBOrganizationFeatures) or (cat_ru:RKOrganizationFeatures)">
			<br/>
			<xsl:text>№ </xsl:text>
			<xsl:if test="cat_ru:RKOrganizationFeatures/cat_ru:ITN">
				<xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:CategoryCode"/>/
					<xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:KATOCode"/>/
					<xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:RNN"/>/
					<xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:ITNReserv"/>
			</xsl:if>
			<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
				<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
			</xsl:if>
		</xsl:if>
		<br/>
		<xsl:apply-templates mode="spaceSeparated" select="RUScat_ru:IdentityCard"/>
	</xsl:template>
	<!-- Адрес -->
	<xsl:template match="*" mode="ru_address">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<xsl:if test="RUScat_ru:AddressKindCode">
					<xsl:choose>
						<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес регистрации: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='2'">Фактический адрес: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='3'">Почтовый адрес: </xsl:when>
					</xsl:choose>
				</xsl:if>
				<xsl:value-of select="RUScat_ru:AddressText"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="last">
					<!-- надо через переменную, т.к. смещение на невыводимые KLADR, AOGUID, AOID -->
					<xsl:choose>
						<xsl:when test="local-name(*[last()])='KLADR' or local-name(*[last()])='AOGUID' or local-name(*[last()])='AOID'">
							<xsl:choose>
								<xsl:when test="RUScat_ru:KLADR and RUScat_ru:AOGUID and RUScat_ru:AOID">
									<xsl:value-of select="count(*) - 3"/>
								</xsl:when>
								<xsl:when test="(not(RUScat_ru:KLADR) and RUScat_ru:AOGUID and RUScat_ru:AOID) or (RUScat_ru:KLADR and not(RUScat_ru:AOGUID) and RUScat_ru:AOID) or (RUScat_ru:KLADR and RUScat_ru:AOGUID and not(RUScat_ru:AOID)) ">
									<xsl:value-of select="count(*) - 2"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="count(*) - 1"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="count(*)"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:for-each select="*">
					<xsl:if test="local-name()='OKTMO'">ОКТМО: </xsl:if>
					<xsl:if test="local-name()='OKATO'"> ОКАТО: </xsl:if>
					<!--xsl:if test="local-name()='KLADR'">Код КЛАДР: </xsl:if>
					<xsl:if test="local-name()='AOGUID'">Глобальный ИД по ФИАС: </xsl:if>
					<xsl:if test="local-name()='AOID'">Уникальный ИД по ФИАС: </xsl:if-->
					<xsl:if test="local-name()='TerritoryCode'">Код единицы административно - территориального деления: </xsl:if>
					<xsl:if test="local-name()='PostOfficeBoxId'">Номер а/я: </xsl:if>
					<xsl:choose>
						<xsl:when test="local-name()='AddressKindCode'">
							<xsl:choose>
								<xsl:when test=".='1'">Адрес регистрации: </xsl:when>
								<xsl:when test=".='2'">Фактический адрес: </xsl:when>
								<xsl:when test=".='3'">Почтовый адрес: </xsl:when>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="local-name()='CountryCode'">
							<xsl:if test="not(../RUScat_ru:CounryName)">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=$last">, </xsl:if>
							</xsl:if>
						</xsl:when>
						<xsl:when test="local-name()='KLADR' or local-name()='AOGUID' or local-name()='AOID'">
							<!--в этом случае ничего не выводим-->
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="."/>
							<xsl:if test="position()!=$last">, </xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="*" mode="spaceSeparated">
		<xsl:if test="position() > 1">
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:apply-templates select="."/>
	</xsl:template>
	<xsl:template match="cat_ru:IdentityCard|RUScat_ru:IdentityCard">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="local-name()='IdentityCardDate'">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- возведение в степень -->
	<xsl:template name="power">
	   <xsl:param name="number"/>
	   <xsl:param name="topower"/>
	   <xsl:param name="curvalue" select="1"/>
	   <xsl:param name="curpower" select="1"/>
	   <xsl:choose>
		   <xsl:when test="$curpower &gt; $topower">
				<xsl:value-of select="$curvalue"/>
		   </xsl:when>
		   <xsl:otherwise>
				<xsl:call-template name="power">
					<xsl:with-param name="number" select="$number"/>
					<xsl:with-param name="topower" select="$topower"/>
					<xsl:with-param name="curvalue" select="$curvalue * $number"/>
					<xsl:with-param name="curpower" select="$curpower + 1"/>
				 </xsl:call-template>
		   </xsl:otherwise>
		</xsl:choose>
	</xsl:template>	
</xsl:stylesheet>
