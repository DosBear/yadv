<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:idkr="urn:customs.ru:Information:CustomsDocuments:IDKPrevReq:5.13.3" xmlns:ATDcat="urn:customs.ru:Information:CustomsDocuments:ATDCommon:5.13.1" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа IDKPrevReqType -->
	<xsl:template match="idkr:IDKPrevReq">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style>
					@media print {
						div.page {
							border: none;
							margin:0;
							padding:0;
						}
					}

					body {
						background: #cccccc;
					}

					div.page {
						width: 210mm;
						margin: 10px auto;
						margin-top: 6pt;
						margin-bottom: 6pt;
						padding: 10mm 10mm 10mm 15mm;
						background: #ffffff;
						border: solid 1pt #000000;
						page-break-after: always;
						font-family: Verdana;
					}

					.marg-top {
						margin-top:5mm;
					}

					table {
						width: 100%;
						border: 0;
						empty-cells: show;
						border-collapse: collapse;
						margin-top: 1px;
						word-break: break-all; /*перенос длинных строк не выходя за ширину ячейки*/
					}

					table.border tr {
						border: 1px solid gray;
						padding: 5px;
					}

					table.border td {
						padding: 5px;
						border: solid 1px windowtext;
					}

					.border-tbl {
						padding: 5px;
						border-top: solid 1px windowtext;
						border-bottom: solid 1px windowtext;
						border-left: solid 1px windowtext;
					}

					.border {
						padding: 5px;
						border: solid 1px windowtext;
					}

					.graph {
						font-family: Verdana;
						font-size: 12pt;
					}

					.value {
						border-bottom: solid 1px DarkGrey;
					}

					div.title, tr.title td { font-weight:bold;  }

					.bordered { border-collapse: collapse; }

					td {vertical-align:bottom;}
					
					td.bordered {
						border: solid 1px windowtext;
					}

					.graphMainTitle {
						vertical-align:top;
						font-size: 12pt;
						font-family:Verdana;
						font-weight: bold;
					}

					.graphMainSubTitle {
						vertical-align:top;
						font-size: 11pt;
						font-family:Verdana;
						font-weight: bold;
					}

					.graphMainHd {
						vertical-align:top;
						font-size: 12pt;
						font-family:Verdana;
					}

					.graphMainSubHd {
						vertical-align:top;
						font-size: 10pt;
						font-family:Verdana;
					}

					.graphMainValue {
						vertical-align:bottom;
						font-style: italic;
						font-family:Verdana;
						font-size: 12pt;
					}

					td.bord_bottom {
						border-bottom: solid 1px DarkGrey;
					}
					
					.delim {
						height: 7pt;
					}

					.docheader
					{
					font-size: 20pt;
					font-family:Verdana;
					}			

					.docheader_number
					{
					font-size: 18pt;
					font-family:Verdana;
					}			

					.normal
					{
					font-size: 12pt;
					font-family:Verdana;
					}			

					.bold
					{
					font-weight: bold;
					font-family:Verdana;
					font-size: 12pt;
					}			

					.italic
					{
					font-style: italic;
					font-family:Verdana;
					font-size: 10pt;
					}			
				</style>
			</head>
			<body>
				<div class="page">
					<xsl:variable name="img_gto">
						<xsl:value-of select="'/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAYEBQYFBAYGBQYHBwYIChAKCgkJChQODwwQFxQYGBcUFhYaHSUfGhsjHBYWICwgIyYnKSopGR8tMC0oMCUoKSj/2wBDAQcHBwoIChMKChMoGhYaKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCj/wAARCACUAJQDASIAAhEBAxEB/8QAHAABAAIDAQEBAAAAAAAAAAAAAAUGAgMEAQcI/8QAOBAAAgEEAQMCBAIIBwADAAAAAQIDAAQFESEGEjFBURMUImFxgRUyNEJykaGxByMzUmJ0wRYkgv/EABQBAQAAAAAAAAAAAAAAAAAAAAD/xAAUEQEAAAAAAAAAAAAAAAAAAAAA/9oADAMBAAIRAxEAPwD9U0pSgUpSgUpSgUrwkDydUBBAIOwaAx0pPsPbdU7ojO5DMXc5vYpkg+XidDJbGLklhvezskDZHHb+fDqTqsYzMpa93bBER8xobYhh5Htrz9z/AFrs3UUmLus41tfPPcSJD8DukE3B/eA12r9IJ7Tsn94+KD6pSojpbLDN4S3vQoV2BV1HgMODUtsAgb80HtKUoFKUoFKUoFKUoFKUoFKVG3uZsbKcwzzASAbIHOvxoMs1lbXD2bXN65SNfYEn+VbcbexX9ok8DBkb1B2K+c9X39v1JkYsdbNJISwREj8uTskb/AcnwBzVxx6/oOKKB4HCHS7hjeReAfHaCR/+gPxPoG7qAQ39vJijdS2004BDxqCQAwOhsa8A1o6Tvbf9HWePWUvPBbqfrABZRsA8cb4G9e9QGdja4y65K2W7uLcKlzEkds5b4qghfIGhx48nevFRXRVhd22ekupYb+PGWETfBE6n4kzEFQo5+oj6yTvyV/INv+JONsYM3FkMtmLXHY+4jIkEpIeQoOVU/cdv38651VK6ozHTUsUMVtmbCK4t447WJkbuT4aoWZdgk8cDfOydbPOvpElr/wDLMtFDnYYbeEIZorCYq0/w9gMWTkLslQW2TragDljP9S4TH3+PVrqOGP5RS8crICIlA5H2Gh6eNA+lB70bjDhemLK0lIMiIXkI8dzEseftvX5VwXQiuOpIMr87cpb23bEIQgKM2pO7Y13A/UvP8uCaztri+u8fPj7uMo7Q7gvUYPDICPp+oa36c6Gx6Cqhf2l1HZSSi3yUl9K6OTDCXjEiBuwE7+rXdo+p+nXAoPp9hdxX1pHcQEmNxsbGj58GtcuQgjuvl+4NPrYQHZ17mq10pdDD9OW9rP8AMSZLsE0kQt5XMbOSQrdqHWvB+4rdaWUtpeJf5UaMhKtISAUY+AwGwF9Bydcb3vgLVG6yIGQ7U1lVTuersXjLr5eV3Z5H5CjfZ+I9KsOPvoMhD8W2buT8KDrpSlApSlApSsXYKhY+AN0GVVfqDFY3VzJeKoe5I06DUgIHB3vXHpx+O6zXqK7nlntrPD3E11C5jZnljiiJAGzy3frn/aapebtsplpZYEvIsrlJJQpgst/BsgAO5XlP08HnZAYjwhNBbOj7LCWt3cjFQOt0IkLySTNK5Usw1tidbKkkDQPHtW7rjqC5wFnbNY2pu7qeYQxxBSxdjvQUAjfjn2HJrf0fg48LjSPji6vJSDcXA8Mw47R7KvIA/EnkmuvJZO2tLpIri1vZZAPiRtFZyTDfjhlUgHn1IoKJjbyWyycMWcimjuWZmgNyx7430Ae7krIAD2rIpOgdN6E68jhZc3BkcZc/Es8nA4mtZbKQWz3MR57SwB0CQUJ9wDUjlJOoc383BN05aXtmxUC0vu1IoiDv6mIYySeDtAEU8BnIJqG/RmXtJrdLtZFeyLNbrcSGRjC+lKiUH61Vu3fdpgNGgs/RMPT2KRkxVgllNPr47Sv3zlgN9srsSx1s65I0djg1cZZEiRnkdVVQSSx0APc1RcJFiMvOoy9pa30oPxIHu40kljBYgoxI/dkDp+OverVn7LE3di7522tJ7WBWkJukVljABJPI44B39qD5hdW/TF3e3F7jbS+s8DYP8S4ubW7aG1upQR/9dYd6ZeSWIVR9zzUj1B1LJjelLM5C2tbLI3bfGhs4mRBbrvauznhSAO4seB4/HHP2mOzt0/wljh6bwtos5UbEMr9odY1jUD6ArIW1ye5VGuajencF1JPk06hynT0V9k53MouMjMiy2o/cW3iIKxaB5JPcTwdaFBIdN5TJY1UMllcQWV04Vr2dGjgU6JEcSMe5E2Tp5AO9m3vlVr6TYM93ibdr2ICSWIGWNl9SOQR/5UNYZadcc36dsrk9rEEx2byFu0+GRA2jx5G1PkMd6E/azi5to5lSRFdQwWRCjD7FTyPwNBWo+lcB8ZcgkADSJsfFkaVRsDRALED8uKm8PbCC1UgxHvA4iTsVRrwBsn+ZqCzOPltpH+X+PNYbLNHB9T25OyfpH1Mh50F2wJ4BB0vNgLrKW1ipthFlEX9cRTKkkZ2dq6MQONee4H/iKC70qLxmUa9bU1pNZuWZRHMVLN262R2sRrnXnzUpQKUpQK1zBWhdXOlKkE+NCtlc9+3ZZzN294VSSuwNj1/pQU66z5t0Z7rFNdW6Ht+aVQAwABBPcR7jXv6VE23VMEbrBjOmbiSXncVohjOyeTwNDzySanG6p6dsbmdmv/lndizox0e7XJKn+1RWY/xCwHaklvkr4yx7HdBbFwd68jX2oJWzzN1aWCnL4qWxutaKCXuUkePrH63HqBv01Xdi87HfJuMzQHkEvIrqNenJ3v7eaqNis1yJ8r1FYZS6ttCezivO0Q71+u0YJ7W9u4bA8aqUnzWSuMTORgXiTWgIwHBBHknQ4/CgtWPyqXFwsDkfEPcFI4DEaJH9f6Gonq+6mv0OCxsNz8zcuqzXPwGEVtF5Zy5AUnQICgkkn2B1o6CwptElupjtlaSCMbJ0Q3bI3PuyaHsqL6k1zdc9S3tvi720sMVdrcuwtkuJSqRszggGPR7pW54UDz5I1QQSzJJkps9hAZIrq1/SECbILaYieILry2u77MgNdvVXU1tn8PFBikF/by2sd28YBCTtIxWGBj/zcfUPPYrehrGwxMlimXu7e6f4VqpitLd1HZCYVQuwPn6mXRHgc681zWeOntei7NrWzit2jhdok44uZnKpsDz2I50d+tBlZ/GsM6yyNJdQ2SR2FyYYzIZrqYiWSXXr2kKSBzrj7V9HtMhDdWBu4xKIQGJ+JEyNwTv6WAPp7VRLNbzEzwWSs2RVY3uJHVVjmmuRMe+VRvt9f1CeRoA1aunM5a9UYyeWG2uooO4wsl1H8J3GtE9u9geRzo7B/Gg7L29Sytnushcx20Kjetj+Wz537VSx/iBBczMLCwu541Ou5pQGY+oGj2j77P5VN/De3iulurV7+WCQRghBIXXtBU6PA4PP336EVV0y8t0kST9OT2iH4jRGNtToCdFkCjYY69NHfmg2S57K213Jf5DAXTWzx/CjKFtAb221A79cABiBvk6ArGDrC2W4drLpv4txNrQjRVZ2A9SxG9Cov52bH3MMWdyWXs2lP+kEDk+QCHBI7wPIPgnejwaukXXXTzaU5IxIAB9YCAfnQedJDI3uWnyWcWO2uTEI4bOPu1FHskbJA22/OvHA9KuVUbF9R2+f6ttY8H3y2lpHJ8e40exi2tAH1PGz7fmN3mgUpSgVrnbsgkYb2FJ45PitlKCsNi8LIpkuTazqSZBI7EMdknZbfPmq9lepuksQqrauj367+GuPtgZgN8gHXj3+1SuY6NxWTyryNbJxzJGrEFt/va3ryPasmxHTHTNsZ7iCxs04JMh7yTv91fU/cDdBWcZ1HnL7J/NnGZSe3CFewhdQMQCrFVYF9j90cgbPFWGPLX6YotlLW4eWW5EMcEcYibTDY4J4HDb2d1XB1Lf9TZWVOmohY42NdyXV28iNcE7G0CH6OR+sTrjxsaqSsLNsfbRJNffPO+XRzK03xmUdhHazH1GvHpQSdpl7mzRhBiL7RI4Z4iPHH73sNVy3lw97k4r+fE5L5mGMxQlZogIgSO4oO7hm1ot51xxupK3vo5pJkWKX/LYqCBsSe+vv9jUdd5ee1uNSxxrGknc6kaJjJABB35Hn7+DQa45B8ubZsVk1gKujH4sZOn2XP63k9xrZG8MdnBafL5QxROrp3spYsp2NnfNThUAkedVB5mV2n7IXRJUXuiLnSs+x9JPoD47vQlfzDx/l3Uq1nk9FSp/V2QSD537gEexrosLmOxuJJreyyIeQ9zd3aQx1rZHd66G/c811Yy9S+tu8I8cintkSRe1lb1BH9/b+Vdeh7UHNbZR3cQi2uoxM/wBTyIvn3Y7/APKq+YzGfWSeKzx11cKC6x/LwmNmGyFf4hIXjQJ4JPgeauGh3Jx+8KokthdnJ3EkOY+Mxmkm+S+akkCx9xHaIl1/Do7GyAOTQY43JTx3TL1RcXrQuwLLJbxtG4A0FYDel9Ts7P2Hm421v05km2kdk767h2IYgPxqMwM1pLGYJSUlkcySwXh+IGdvJLEbU+ntocCu276Qw1xCzy20dugBLSJMe37+vj86DuxN9Ypnji8V8FlhhMk4hGljJIAHHqdH+VWaq70Tj8XaYdJ8NZJaw3BL6Xf1DZ03JPkAf09qsVApSlApSlBGZnFLkowUnltrhQQk0R0R9j7j7VTbHoG2u7uS5zN1dZFwQqiRwQPHcGGu3zv03rXO6+i1BZ7pyDLBiLi5tXfXxDBKyCQf8gCN0FS6lzkNrrp7pm2hucmRyQhkitRrRdvV30OPUn8xWVniRhsTY2ry/EuXyUcs7iNYwXKtsfSACeOSPWppMBH01atNgsYl1Kqle34nw3O9ckgHuPHJOz7VEWbZiWztpeoLWO0nfKoIoEIISIIQoHHHrQcYy1viRdrcSacys7En/TPA0R6cAfY+aj0mly6G4vGFtb9hMa7ILqwHa7eoU62F/Wf00OatWYwlllImFzbxPJ29qyNGrMnsRsHx7HYqB/RVzj7pbq/+JlYYvqiRE0Y39ZHG9vv1I59Na4oLNgrt7/C2N3Nv4k0QZtgAk7IJ0PfW9enio3IgSI6SkBHlJIkBHafHejD115HtwQayORgwWOuMplpycZNIjiWBS5LuQugAOBsA78DxUebqPJ5u9x1hlDD8KJbq4njAKWy7B5YjW+3TAj778UGq0zGLxfTmR6hyF28EGjbWkRYB1VRwe0H9Zj9Wv4R9qm8FlJJsJjZsshtr2aBGlDAgBiN6J1oH7H8qqTx47qvJx5ibGkWtlIFxoYKIkjB2J3TXcdkcew9t1K3t0bOcsk9xFczv9fw3EgmP7xC6PueCCo9Cvigt4IYoVIYdw0RyPNVNcTYLcX2Ss1M8L3rtMAih4JEb9buUbJ3ztt62B6Vu6cs79LmK5yExH1bWEa0N75YgAE69AAB9/NLazz0GSuliw0TrNM4FybggNGSe0sAOeDrWwfuKCYbHw5eNGuo0uQR9F1AQkg3ydgf+eftUdF0dDlbp4bzL3d3Y2z9r2wb/AC2bZ+liPOhrYJI3vY1xUtddG21yo3c3FuWI+Itq5iVh7fTr8z5P9Kn8VjrXFWUdpYxCKCMaCj+9B0wxpDEscY0ijQArOlKBSlKBSlKBSlKBVc6q/acb/wByL+z1Y6rnVP7Tjf8AuRf2egy1XhAr2vGOio4DMwUb8bJAG/50Fcztz+jYpESzfIW93J8uMcgB+YdlLMqkkBfpUtvfngDniAzOLY4s4np6F5LC5meS8SNwLl2QDduw0QCOCTz3eedknM9QpewyzvGlnczyS3OKjkYSSy/LBg8vaR2xkqXUeedHfFc3SuHgunhQx5HEW4jeeyc3YkuZbmXReZ3HHf2gAJyCC34AJwusmTwMUqT215f20rS23aIXiWMD6yoP07P0+x3x4qdssVbWgb5eMJ3eTySfxNQvS+GSwur24upprrLuwS6uZ3Lu4Gymj6JrwBoDn1q0IeKDERhSp9mFWC2/Zov4R/aoJvK/xCp22/Zov4R/ag20pSgUpSgUpSgUpSgUpSgVXOqf2nG/9yL+z1Y6rnVO/mcb/wByI/0egyqt9SZFmQx4+e2c208YvUQCaVEOyEVN8SMwRFLaC92/Sp+6m+XgeUeUBYb8cc818rg1lTJb9PzSvYgS2ysluyw3ZkGpZ5WPDIO5gijZJHdxvdB1mzn6nv7ySOG2tLSUrDPIoElz43LbpOD2iIOzLtBz9Q361fPkopLQQOo7BrQXgqR4Kn0I9PasrGyhtII4oECRooVVAA0Na1XWqEUEfawTNLJ3zA5CBP8ALLDS3EZ9ZPz448HnndSFtMk8CyRgqCSCrcFSDog/cVru7X46L2uYpoz3RypolD+HqPcHgio6yupEyptyjvO/1XZVSIo9DSsCfVuNKN8cnWhsJiQ67f4h/ep62/Zov4R/aoCT93+If3qftv2aL+Ef2oNtKUoFKUoFKUoFKUoFKUoFQ/UNvJLCkkPMkbLIgJ0Cynej9jyKmK8IBGiNg0FYLJMg4dD6pIumX7EVqhtIoP8ATUDZJqytZwt+5r8CRXnyUH+0/wA6CDj7SQAwLegB5/lWypK5xkMyFe38A3I/n5rlsbN27kkkdlQkFm13H7E/+0HMSB5OvxrzaHXIOvHNTIsYP9pP5178lB/tP8zQRCoXdVA22+B96no07I1X2AFYRQRxf6aAH39a20ClKUClKUClKUClKUClKUClKUClKUCvFUDehrfJpSg9pSlApSlApSlApSlApSlB/9k='"/>
					</xsl:variable>				
					<table width="190">
						<col width="25%"/>
						<col width="65%"/>
						<col width="8%"/>
						<col width="5%"/>
						<tr>
							<td rowspan="2" align="left" valign="top">
								<img>
									<xsl:attribute name="src">
										<xsl:value-of select="concat('data:image/jpeg;base64,',$img_gto)"/>
									</xsl:attribute>
								</img> 
							</td>
							<td align="center"  style="vertical-align:top;">
								<span class="docheader">Запрос</span>
							</td>
							<td align="left" valign="top"></td>
							<td align="left" valign="top"></td>
						</tr>
						<tr>
							<td colspan="2" align="center"  style="vertical-align:middle;">
								<span class="docheader">на наличие  / предоставление<br/>результатов ранее проведенного<br/>осмотра с ИДК и наличия<br/>технических возможностей</span>
							</td>
							<td align="left" valign="top"></td>
						</tr>
					</table>
					<br/><br/>

					<table width="190">
						<col width="47%" align="left" class="graphMainHd" valign="bottom"/>
						<col width="3%" align="left" class="graphMainHd" valign="bottom"/>
						<col width="1%" align="left" class="graphMainValue" valign="bottom"/>
						<col width="49%" align="left" class="graphMainValue" valign="bottom"/>
						<tbody>
							<tr>
								<td><br/></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td colspan="4" class="graphMainTitle">Номер таможенного документа, по которому необходимо<br/>произвести осмотр:</td>
							</tr>
							<tr class="delim"><td colspan="4"></td></tr>
							<xsl:for-each select="idkr:CustDocNumber">
								<xsl:if test="ATDcat:DocKind">
									<tr class="delim"><td colspan="4"></td></tr>
									<tr>
										<td>Тип документа</td>
										<td></td>
										<td class="bord_bottom"></td>
										<td class="bord_bottom">
											<xsl:choose>
												<xsl:when test="ATDcat:DocKind='0'">уведомление о прибытии<br/>на таможенную территорию</xsl:when>
												<xsl:when test="ATDcat:DocKind='1'">транзитная декларация</xsl:when>
												<xsl:when test="ATDcat:DocKind='2'">книжка МДП</xsl:when>
												<xsl:when test="ATDcat:DocKind='3'">номер ДО-1/описи</xsl:when>
												<xsl:when test="ATDcat:DocKind='4'">ДТ</xsl:when>
												<xsl:when test="ATDcat:DocKind='5'">уведомление об убытии</xsl:when>
												<xsl:when test="ATDcat:DocKind='6'">иностранная транзитная декларация</xsl:when>
												<xsl:when test="ATDcat:DocKind='7'">коносамент</xsl:when>
												<xsl:when test="ATDcat:DocKind='8'">документ физического лица</xsl:when>
												<xsl:when test="ATDcat:DocKind='9'">иное</xsl:when>
												<xsl:otherwise><xsl:value-of select="ATDcat:DocKind"/></xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="ATDcat:GTDID">
									<tr class="delim"><td colspan="4"></td></tr>
									<tr>
										<td>Регистрационный номер документа</td>
										<td></td>
										<td class="bord_bottom"></td>
										<td class="bord_bottom">
											<xsl:call-template name="GTDID">
												<xsl:with-param name="DocNode" select="ATDcat:GTDID"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="ATDcat:DocNumber">
									<tr class="delim"><td colspan="4"></td></tr>
									<tr>
										<td>Номер документа</td>
										<td></td>
										<td class="bord_bottom"></td>
										<td class="bord_bottom">
											<xsl:value-of select="ATDcat:DocNumber/*[local-name() = 'DocNumber']"/>
											<xsl:if test="ATDcat:DocNumber/*[local-name() = 'DocDate']">
											<text> от </text>
											<xsl:value-of select="concat(substring(ATDcat:DocNumber/*[local-name() = 'DocDate'],9,2),'.',substring(ATDcat:DocNumber/*[local-name() = 'DocDate'],6,2),'.',substring(ATDcat:DocNumber/*[local-name() = 'DocDate'],1,4))"/>
											</xsl:if>
										</td>
									</tr>
								</xsl:if>
							</xsl:for-each>	

							<xsl:if test="idkr:CustomsProcedure">
								<tr class="delim"><td colspan="4"></td></tr>
								<tr>
									<td>Направление перемещения</td>
									<td></td>
									<td class="bord_bottom"></td>
									<td class="bord_bottom">
										<xsl:value-of select="idkr:CustomsProcedure"/>
									</td>
								</tr>
							</xsl:if>

							<xsl:if test="idkr:InspectionDate or idkr:InspectionTime">
								<tr class="delim"><td colspan="4"></td></tr>
								<tr>
									<td>Предположительные дата и время<br/>осмотра</td>
									<td></td>
									<td class="bord_bottom"></td>
									<td class="bord_bottom">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="idkr:InspectionDate"/>
										</xsl:call-template>
										&#160;<xsl:value-of select="substring(idkr:InspectionTime, 1,8)"/>
									</td>
								</tr>
							</xsl:if>
						</tbody>
					</table>

					<xsl:if test="idkr:Customs">
						<table width="190">
							<col width="47%" align="left" class="graphMainHd" valign="bottom"/>
							<col width="3%" align="left" class="graphMainHd" valign="bottom"/>
							<col width="1%" align="left" class="graphMainValue" valign="bottom"/>
							<col width="49%" align="left" class="graphMainValue" valign="bottom"/>
							<tbody>
								<tr>
									<td><br/></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td colspan="4" class="graphMainTitle">Таможенный орган оформления:</td>
								</tr>
								<tr class="delim"><td colspan="4"></td></tr>
								<xsl:apply-templates select="idkr:Customs"/>
							</tbody>
						</table>
					</xsl:if>

					<xsl:if test="idkr:CustomsOfficer">
						<table width="190">
							<col width="47%" align="left" class="graphMainHd" valign="bottom"/>
							<col width="3%" align="left" class="graphMainHd" valign="bottom"/>
							<col width="1%" align="left" class="graphMainValue" valign="bottom"/>
							<col width="2%" align="left" class="graphMainValue" valign="bottom"/>
							<col width="20%" align="left" class="graphMainValue" valign="bottom"/>
							<col width="3%" align="left" class="graphMainValue" valign="bottom"/>
							<col width="24%" align="left" class="graphMainValue" valign="bottom"/>
							<tbody>
								<tr class="delim">
									<td><br/></td>
									<td/><td/><td/><td/><td/><td/>
								</tr>
								<tr class="delim"><td colspan="7"></td></tr>
								<tr>
									<td>Должностное лицо ТО:</td>
									<xsl:call-template name="CustomsOfficer">
										<xsl:with-param name="nodeCO" select="idkr:CustomsOfficer"/>
									</xsl:call-template>
								</tr>
							</tbody>
						</table>
					</xsl:if>

					<xsl:if test="idkr:IDKCustoms">
						<table width="190">
							<col width="100%" align="left" class="graphMainHd" valign="bottom"/>
							<tbody>
								<tr><td><br/></td></tr>
								<tr>
									<td class="graphMainTitle">Таможенные  органы, приближенные к объекту осмотра:</td>
								</tr>
								<tr class="delim"><td><br/></td></tr>
							</tbody>
						</table>
						<table width="190" class="border">
							<col width="35%" align="left"/>
							<col width="65%" align="left"/>
							<tbody>
								<tr class="graphMainHd">
									<td style="vertical-align:middle;" align="center">Код таможенного органа</td>
									<td align="center">Наименование таможенного органа</td>
								</tr>
								<xsl:for-each select="idkr:IDKCustoms">
									<tr class="graphMainValue">
										<td>
											<xsl:value-of select="cat_ru:Code"/>
										</td>
										<td>
											<xsl:value-of select="cat_ru:OfficeName"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>

					<xsl:if test="idkr:PrevDocNumber or idkr:PrevTransportIdentifier or idkr:ContainerIdentificaror or idkr:PrevDocuments">
						<table width="190">
							<col width="100%" align="left" class="graphMainHd" valign="bottom"/>
							<tbody>
								<tr class="delim"><td><br/></td></tr>
								<tr>
									<td class="graphMainTitle">Сведения для поиска предшествующих осмотров:</td>
								</tr>
							</tbody>
						</table>

						<xsl:if test="idkr:PrevTransportIdentifier">
							<table width="190">
								<col width="100%" align="left" class="graphMainHd" valign="bottom"/>
								<tbody>
									<tr>
										<td><br/></td>
									</tr>
									<tr>
										<td colspan="4" class="graphMainSubTitle">&#160;&#160;&#160;Номер транспортного средства для поиска предшествующих осмотров:</td>
									</tr>
									<tr class="delim"><td></td></tr>
									<tr class="graphMainValue">
										<td class="bord_bottom">
											<xsl:for-each select="idkr:PrevTransportIdentifier">
												<xsl:apply-templates select="."/>
												<xsl:if test="position()!=last()">
													<span>; </span>
												</xsl:if>
											</xsl:for-each>
										</td>
									</tr>
								</tbody>
							</table>
						</xsl:if>

						<xsl:if test="idkr:ContainerIdentificaror">
							<table width="190">
								<col width="100%" align="left" class="graphMainHd" valign="bottom"/>
								<tbody>
									<tr>
										<td><br/></td>
									</tr>
									<tr>
										<td colspan="4" class="graphMainSubTitle">&#160;&#160;&#160;Номера  контейнеров:</td>
									</tr>
									<tr class="delim"><td></td></tr>
									<tr class="graphMainValue">
										<td class="bord_bottom">
											<xsl:for-each select="idkr:ContainerIdentificaror">
												<xsl:apply-templates select="."/>
												<xsl:if test="position()!=last()">
													<span>; </span>
												</xsl:if>
											</xsl:for-each>
										</td>
									</tr>
								</tbody>
							</table>
						</xsl:if>

						<xsl:if test="idkr:PrevDocNumber">
							<table width="190">
								<col width="100%" align="left" class="graphMainHd" valign="bottom"/>
								<tbody>
									<tr class="delim"><td><br/></td></tr>
									<tr>
										<td class="graphMainSubTitle">&#160;&#160;&#160;Номера предшествующих таможенных документов,<br/>по которым осмотр мог производиться:</td>
									</tr>
									<tr class="delim"><td><br/></td></tr>
								</tbody>
							</table>
							<table width="190" class="border">
								<col width="40%" align="left"/>
								<col width="60%" align="left"/>
								<tbody>
									<tr class="graphMainHd">
										<td style="vertical-align:middle;" align="center">Тип документа</td>
										<td align="center">Номер документа</td>
									</tr>
									<xsl:for-each select="idkr:PrevDocNumber">
										<tr class="graphMainValue">
											<td>
												<xsl:choose>
													<xsl:when test="ATDcat:DocKind='0'">уведомление о прибытии<br/>на таможенную территорию</xsl:when>
													<xsl:when test="ATDcat:DocKind='1'">транзитная декларация</xsl:when>
													<xsl:when test="ATDcat:DocKind='2'">книжка МДП</xsl:when>
													<xsl:when test="ATDcat:DocKind='3'">номер ДО-1/описи</xsl:when>
													<xsl:when test="ATDcat:DocKind='4'">ДТ</xsl:when>
													<xsl:when test="ATDcat:DocKind='5'">уведомление об убытии</xsl:when>
													<xsl:when test="ATDcat:DocKind='6'">иностранная транзитная декларация</xsl:when>
													<xsl:when test="ATDcat:DocKind='7'">коносамент</xsl:when>
													<xsl:when test="ATDcat:DocKind='8'">документ физического лица</xsl:when>
													<xsl:when test="ATDcat:DocKind='9'">иное</xsl:when>
													<xsl:otherwise><xsl:value-of select="ATDcat:DocKind"/></xsl:otherwise>
												</xsl:choose>
											</td>
											<td>
												<xsl:choose>
													<xsl:when test="ATDcat:GTDID">
														<xsl:call-template name="GTDID">
															<xsl:with-param name="DocNode" select="ATDcat:GTDID"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:when test="ATDcat:DocNumber">
														<xsl:value-of select="ATDcat:DocNumber/*[local-name() = 'DocNumber']"/>
														<xsl:if test="ATDcat:DocNumber/*[local-name() = 'DocDate']">
														<text> от </text>
														<xsl:value-of select="concat(substring(ATDcat:DocNumber/*[local-name() = 'DocDate'],9,2),'.',substring(ATDcat:DocNumber/*[local-name() = 'DocDate'],6,2),'.',substring(ATDcat:DocNumber/*[local-name() = 'DocDate'],1,4))"/>
														</xsl:if>
													</xsl:when>
												</xsl:choose>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</xsl:if>

						<xsl:if test="idkr:PrevDocuments">
							<table width="190">
								<col width="100%" align="left" class="graphMainHd" valign="bottom"/>
								<tbody>
									<tr class="delim"><td><br/></td></tr>
									<tr>
										<td class="graphMainSubTitle">&#160;&#160;&#160;Номера сопроводительных документов для поиска предшествующих осмотров:</td>
									</tr>
									<tr class="delim"><td><br/></td></tr>
								</tbody>
							</table>
							<table width="190" class="border">
								<col width="23%" align="left"/>
								<col width="30%" align="left"/>
								<col width="30%" align="left"/>
								<col width="17%" align="left"/>
								<tbody>
									<tr class="graphMainHd">
										<td style="vertical-align:middle;" align="center">Код вида<br/>представляемого<br/>документа</td>
										<td style="vertical-align:middle;" align="center">Наименование</td>
										<td style="vertical-align:middle;" align="center">Номер</td>
										<td style="vertical-align:middle;" align="center">Дата</td>
									</tr>
									<xsl:for-each select="idkr:PrevDocuments">
										<tr class="graphMainValue">
											<td>
												<xsl:value-of select="idkr:PresentedDocumentModeCode"/>
											</td>
											<td>
												<xsl:value-of select="cat_ru:PrDocumentName"/>
											</td>
											<td>
												<xsl:value-of select="cat_ru:PrDocumentNumber"/>
											</td>
											<td>
												<xsl:value-of select="concat(substring(cat_ru:PrDocumentDate,9,2),'.',substring(cat_ru:PrDocumentDate,6,2),'.',substring(cat_ru:PrDocumentDate,1,4))"/>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</xsl:if>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CUCustomsType -->
	<xsl:template match="idkr:Customs">
		<xsl:variable name="pref">
			<xsl:choose>
				<xsl:when test="name() = 'idkr:Customs'"></xsl:when>
				<xsl:otherwise>&#160;&#160;&#160;</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<tr class="delim"><td colspan="4"></td></tr>
		<tr>
			<td><xsl:value-of select="concat($pref,'Код таможенного органа')"/></td>
			<td></td>
			<td class="bord_bottom"></td>
			<td class="bord_bottom">
				<xsl:value-of select="cat_ru:Code"/>
			</td>
		</tr>
		<xsl:if test="cat_ru:OfficeName">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td><xsl:value-of select="concat($pref,'Наименование таможенного органа')"/></td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="cat_ru:OfficeName"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:CustomsCountryCode">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td><xsl:value-of select="concat($pref,'Код государства - члена ЕАЭС')"/></td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="cat_ru:CustomsCountryCode"/>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>

	<xsl:template name="CustomsOfficer">
		<xsl:param name="nodeCO"/>
		
		<tr class="delim"><td colspan="4"></td></tr>
		<tr>
			<td>&#160;&#160;&#160;ФИО</td>
			<td></td>
			<td class="bord_bottom"></td>
			<td colspan="4" class="bord_bottom">
				<xsl:value-of select="$nodeCO/cat_ru:PersonSurname"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="$nodeCO/cat_ru:PersonName"/>
				<xsl:if test="$nodeCO/cat_ru:PersonMiddleName">										
					<xsl:text> </xsl:text>
					<xsl:value-of select="$nodeCO/cat_ru:PersonMiddleName"/>
				</xsl:if>
			</td>
		</tr>
		<xsl:if test="$nodeCO/cat_ru:PersonPost">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;Должность</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td colspan="4" class="bord_bottom">
					<xsl:value-of select="$nodeCO/cat_ru:PersonPost"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="$nodeCO/RUScat_ru:LNP or $nodeCO/RUScat_ru:CustomsCode">
			<tr class="delim"><td colspan="$colcnt+3"></td></tr>
			<tr>
				<xsl:choose>
					<xsl:when test="$nodeCO/RUScat_ru:LNP and $nodeCO/RUScat_ru:CustomsCode">
						<td>&#160;&#160;&#160;ЛНП (код ТО на оттиске ЛНП)</td>
					</xsl:when>
					<xsl:when test="$nodeCO/RUScat_ru:LNP">
						<td>&#160;&#160;&#160;ЛНП</td>
					</xsl:when>
					<xsl:when test="$nodeCO/RUScat_ru:CustomsCode">
						<td>&#160;&#160;&#160;Код ТО на оттиске ЛНП</td>
					</xsl:when>
				</xsl:choose>
				<td></td>
				<td class="bord_bottom"></td>
				<td colspan="4" class="bord_bottom">
					<xsl:if test="$nodeCO/RUScat_ru:LNP">
						<xsl:value-of select="$nodeCO/RUScat_ru:LNP"/>
						<xsl:if test="$nodeCO/RUScat_ru:CustomsCode">
							<xsl:text> (</xsl:text>
						</xsl:if>
					</xsl:if>
					<xsl:if test="$nodeCO/RUScat_ru:CustomsCode">
						<xsl:value-of select="$nodeCO/RUScat_ru:CustomsCode"/>
						<xsl:if test="$nodeCO/RUScat_ru:LNP">
							<xsl:text>)</xsl:text>
						</xsl:if>
					</xsl:if>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="gtd_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise><xsl:value-of select="$dateIn"/></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template name="GTDID">
		<xsl:param name="DocNode"/>
		<xsl:value-of select="$DocNode/*[local-name() = 'CustomsCode']"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="$DocNode/*[local-name() = 'RegistrationDate']"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="$DocNode/*[local-name() = 'GTDNumber']"/>
	</xsl:template>
	
</xsl:stylesheet>
