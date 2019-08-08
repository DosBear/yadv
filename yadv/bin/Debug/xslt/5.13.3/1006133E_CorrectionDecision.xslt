<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="corrd  cat_ru " version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:corrd="urn:customs.ru:Information:CustomsDocuments:CorrectionDecision:5.12.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
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
  <xsl:template name="gtd_date">
    <xsl:param name="dategtd"/>
    <xsl:choose>
      <xsl:when test="substring($dategtd,5,1)='-' and substring($dategtd,8,1)='-'">
        <xsl:value-of select="substring($dategtd,9,2)"/>
        <xsl:value-of select="substring($dategtd,6,2)"/>
        <xsl:value-of select="substring($dategtd,3,2)"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$dategtd"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="/">
    <xsl:apply-templates/>
  </xsl:template>
  <xsl:template match="corrd:CorrectionDecision">
    <html>
      <head>
        <title>Решение по направлению, принятое структурным отделом таможни</title>
        <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
        <style type="text/css">
          body {
          text-align: center;
          background: #cccccc;
          }

          table {
          border: 0;
          cellpadding: 3;
          cellspacing: 0;
          width: 100%;
          border-collapse: collapse;
          }



          td.bold {
          font-size: 8.0pt;
          font-family: Arial, sans-serif;
          color: windowtext;
          font-weight: 700;
          font-style: normal;
          text-decoration: none;
          text-align: general;
          vertical-align: bottom;
          white-space: nowrap;
          }

          td.value {
          font-size: 7.0pt;
          font-family: Arial, sans-serif;
          color: windowtext;
          font-weight: 400;
          font-style: normal;
          text-decoration: none;
          text-align: general;
          vertical-align: top;
          white-space: nowrap;
          }

          .bordered {
          border-bottom: .1pt solid windowtext;
          }

          span.bold {
          font-size: 12.0pt;
          font-family: Arial, sans-serif;
          color: windowtext;
          font-weight: 700;
          font-style: normal;
          }

          span.value {
          font-size: 12.0pt;
          font-family: Courier;
          color: windowtext;
          }

          div.page {
          width: 210mm;
          margin-top: 6pt;
          margin-bottom: 6pt;
          padding: 5mm;
          padding-left: 10mm;
          background: #ffffff;
          border: solid 1pt #000000;
          }

          div.album_page {
          width: 297mm;
          margin-top: 6pt;
          margin-bottom: 6pt;
          padding: 5mm;
          padding-left: 5mm;
          background: #ffffff;
          border: solid 1pt #000000;
          }

          p.bold {
          font-weight: bold;
          }

          .graph {
          font-family: Arial;
          font-size: 7pt;
          }

          .maingraph {
          font-family: Arial;
          font-size:12pt;
          }

          @media print {
          div.page {
          border: none;
          }
          }
        </style>
      </head>
      <body>
        <div class="album_page">
          <table>
            <tbody>
              <tr>
                <td align="center" class="maingraph">
                  <b>Решение по направлению, принятое структурным отделом таможни</b>
                  <br/>
                  <br/>
                </td>
              </tr>
              <!--tr>
								<td><b>Дата и время формирования документа:</b>
									<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="remc:CreateDocDate"/></xsl:call-template>&#160;
									<xsl:value-of select="remc:CreateDocTime"/>
									<br/>
								</td>
							</tr-->
              <tr>
                <td>
                  <b>Порядковый номер Направления, сформированного по ДТ в процессе ее оформления: </b>
                  <xsl:value-of select="corrd:CoordReqNumber"/> 
                  <br/>
                </td>
              </tr>
              <tr>
                <td>
                  <b>Регистрационный номер ДТ: </b>
                  <xsl:value-of select="corrd:DTNumber/cat_ru:CustomsCode"/>/<xsl:call-template name="gtd_date">
                    <xsl:with-param name="dategtd" select="corrd:DTNumber/cat_ru:RegistrationDate"/>
                  </xsl:call-template>/<xsl:value-of select="corrd:DTNumber/cat_ru:GTDNumber"/> 
                  <br/>
                </td>
              </tr>
              <tr>
                <td>
                  <b>Ссылка на DocumentID того состояния ДТ, при котором было сформировано Направление на согласование мер по минимизации риска: </b>
                  <xsl:value-of select="corrd:DTReference"/> 
                  <br/>
                </td>
              </tr>
            </tbody>
          </table>
          <table>
            <tbody>
              <tr>
                <td>
                  <b>Заключение:</b>
                  <br/>
                  <u>
                    <xsl:for-each select="corrd:ResolutionCustInspector">
                      <xsl:value-of select="."/> 
                    </xsl:for-each>
                  </u>
                </td>
              </tr>
            </tbody>
          </table>
          <br/>
          <div align="left"><b>Решения по минимизации риска:</b></div>
          <table border="1" style="empty-cells: show; border-collapse:collapse; font-size: 11pt;">
            <tbody>
              <tr style="font: bold">
                <td align="center" style="word-wrap: break-word;">№ товара по ДТ</td>
                <td align="center" style="word-wrap: break-word;">Номер риска</td>
                <td align="center" style="word-wrap: break-word;">Код ТО</td>
                <td align="center" style="word-wrap: break-word;">Код меры</td>
                <xsl:if test="//corrd:DecisionSign">
                  <td align="center" style="word-wrap: break-word;">Применение мер по минимизации рисков</td>
                </xsl:if>
                <xsl:if test="//corrd:DecisionAcceptCode">
                  <td align="center" style="word-wrap: break-word;">Код результатов применения прямых мер по минимизации рисков</td>
                </xsl:if>
                <xsl:if test="//corrd:DecisionDeclineCode">
                  <td align="//center" style="word-wrap: break-word; width:20mm">Обоснование причины неприменения меры</td>
                </xsl:if>
                <xsl:if test="//corrd:DecisionDeclineReasonCode">
                  <td align="center" style="word-wrap: break-word; width:20mm">Код причины неприменения меры</td>
                </xsl:if>
                <xsl:if test="//corrd:Mandatory">
                  <td align="center" style="word-wrap: break-word; width:20mm">Обязательность применения прямых мер по минимизации рисков</td>
                </xsl:if>
                <td align="center" style="word-wrap: break-word; width:20mm">Этап проведения проверки на соответствие профилям риска</td>
                <td align="center" style="word-wrap: break-word; width:20mm">Должностное лицо таможенного органа, принявшее решение</td>
                <xsl:if test="//corrd:DecisionArticles">
                  <td align="center" style="word-wrap: break-word; width:20mm">Дела об административных правонарушениях, уголовные дела</td>
                </xsl:if>
                <xsl:if test="//corrd:DecisionDescription">
                  <td align="center" style="word-wrap: break-word;">Описание принятого решения</td>
                </xsl:if>
              </tr>
              <xsl:for-each select="corrd:MeasureDecisions">
                <tr>
                  <td style="word-wrap: break-word;">
                    <xsl:value-of select="corrd:GoodsNumeric"/>
                  </td>
                  <td style="word-wrap: break-word;">
                    <xsl:value-of select="corrd:TerrActionCode"/>/
                    <xsl:value-of select="corrd:CustomCode"/>/
                    <xsl:call-template name="gtd_date">
                      <xsl:with-param name="dategtd" select="corrd:RiskProfileRegDate"/>
                    </xsl:call-template>/
                    <xsl:value-of select="corrd:RiskProfileNumber"/>/
                    <xsl:value-of select="corrd:RiskProfileNumberVersion"/>
                  </td>
                  <td style="word-wrap: break-word;">
                    <xsl:value-of select="corrd:DecisionCustomCode"/>
                  </td>
                  <td style="word-wrap: break-word;">
                    <xsl:value-of select="corrd:MeasureCode"/>
                  </td>
                  <xsl:if test="//corrd:DecisionSign">
                    <td style="word-wrap: break-word;">
                      <xsl:choose>
                        <xsl:when test="corrd:DecisionSign='1' or corrd:DecisionSign='t' or corrd:DecisionSign='true'">
                          приняты меры в соответствии с профилем риска
                        </xsl:when>
                        <xsl:otherwise>мера не была применена</xsl:otherwise>
                      </xsl:choose>
                    </td>
                  </xsl:if>
                  <xsl:if test="//corrd:DecisionAcceptCode">
                    <td style="word-wrap: break-word;">
                      <xsl:value-of select="corrd:DecisionAcceptCode"/>
                    </td>
                  </xsl:if>
                  <xsl:if test="//corrd:DecisionDeclineCode">
                    <td style="word-wrap: break-word; width:20mm">
                      <xsl:choose>
                        <xsl:when test="corrd:DecisionDeclineCode='02'">
                          Прямая мера не применяется согласно п.33 Инструкции, утвержденной приказом ФТС
                        </xsl:when>
                        <xsl:when test="corrd:DecisionDeclineCode='03'"> Прямая мера по минимизации риска не применялась по условиям  профиля риска</xsl:when>
                        <xsl:when test="corrd:DecisionDeclineCode='04'">Прямая  мера по минимизации риска не применялась в силу объективных причин</xsl:when>
                        <xsl:when test="corrd:DecisionDeclineCode='05'">
                          Прямая  мера по минимизации риска не применялась согласно результатам случайной выборки
                        </xsl:when>
                        <xsl:otherwise>Отсутствует</xsl:otherwise>
                      </xsl:choose>
                    </td>
                  </xsl:if>
                  <xsl:if test="//corrd:DecisionDeclineReasonCode">
                    <td style="word-wrap: break-word; width:20mm">
                      <xsl:value-of select="corrd:DecisionDeclineReasonCode"/>
                    </td>
                  </xsl:if>
                  <xsl:if test="//corrd:Mandatory">
                    <td style="word-wrap: break-word; width:20mm">
                      <xsl:choose>
                        <xsl:when test="corrd:Mandatory='1' or corrd:Mandatory='t' or corrd:Mandatory='true'">
                          обязательное применение меры
                        </xsl:when>
                        <xsl:otherwise>необязательное применение меры</xsl:otherwise>
                      </xsl:choose>
                    </td>
                  </xsl:if>
                  <td style="word-wrap: break-word; width:20mm">
                    <xsl:value-of select="corrd:PointCode"/>
                  </td>
                  <td style="word-wrap: break-word; width:20mm">
                    <!--<xsl:value-of select="corrd:PersonName"/>
								<xsl:if test="corrd:CustomsPerson/cat_ru:LNP">
										<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
										(<xsl:value-of select="corrd:CustomsPerson/cat_ru:LNP"/>)
									</xsl:if>	-->
                    <xsl:choose>
                      <xsl:when test="corrd:PersonName">
                        <xsl:value-of select="corrd:PersonName"/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="corrd:LNP"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </td>
                  <xsl:if test="//corrd:DecisionArticles">
                    <td style="word-wrap: break-word; width:20mm">
                      <xsl:for-each select="corrd:DecisionArticles">
                        Статья <xsl:value-of select="corrd:DecisionArticleNumber"/>
                        <xsl:if test="corrd:ArticlePartNumber">
                          <xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
                          часть <xsl:value-of select="corrd:ArticlePartNumber"/>
                        </xsl:if>, 
                        <xsl:if test="corrd:InfractionNumber">  
                           номер дела:
                           <xsl:value-of select="corrd:InfractionNumber"/>
                        </xsl:if>;
                        <br/>
                      </xsl:for-each>
                    </td>
                  </xsl:if>
                  <xsl:if test="//corrd:DecisionDescription">
                    <td style="word-wrap: break-word;">
                      <xsl:for-each select="corrd:DecisionDescription">
                        <xsl:choose>
                          <xsl:when test="corrd:InformationCode='0'">Характеристика выявленных нарушений: </xsl:when>
                          <xsl:when test="corrd:InformationCode='1'">Описание причины неприменения меры: </xsl:when>
                          <xsl:when test="corrd:InformationCode='2'">Отметка о результатах применения мер: </xsl:when>
                        </xsl:choose>
                        <xsl:if test="corrd:ViolationCode">
                          код выявленного нарушения - <xsl:value-of select="corrd:ViolationCode"/>,
                        </xsl:if>
                        <xsl:for-each select="corrd:DescriptionText">
                          <xsl:value-of select="."/>
                        </xsl:for-each>;<br/>
                      </xsl:for-each>
                    </td>
                  </xsl:if>
                </tr>
              </xsl:for-each>
            </tbody>
          </table>
          <br/>
          <div align="left"><b>Основания для решения:</b></div>
          <table border="1" style="empty-cells: show; border-collapse:collapse; font-size: 11pt;">
            <tbody>
              <tr style="font: bold">
                <td align="center" style="width:20mm"> ID документа</td>
                <td align="center">Документ</td>
                <td align="center">Код  документа</td>
                <td align="center">Нормативный документ</td>
                <td align="center">№ раздела</td>
                <td align="center">№ записи</td>
                <td align="center">Комментарий</td>
              </tr>
              <xsl:for-each select="corrd:RefDocumentList">
                <tr>
                  <td>
                    <xsl:value-of select="corrd:CusDesDocumentID"/>
                  </td>
                  <td>
                    <xsl:value-of select="cat_ru:PrDocumentName"/> 
                    №<xsl:value-of select="cat_ru:PrDocumentNumber"/> 
                    от <xsl:call-template name="russian_date">
                      <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                    </xsl:call-template>
                  </td>
                  <td>
                    <xsl:value-of select="corrd:DocCode"/>
                  </td>
                  <td>
                    <xsl:value-of select="corrd:DocName"/>
                  </td>
                  <td>
                    <xsl:value-of select="corrd:SectionNumber"/>
                  </td>
                  <td>
                    <xsl:value-of select="corrd:RecordNumber"/>
                  </td>
                  <td>
                    <xsl:value-of select="corrd:Note"/>
                  </td>
                </tr>
              </xsl:for-each>
            </tbody>
          </table>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
