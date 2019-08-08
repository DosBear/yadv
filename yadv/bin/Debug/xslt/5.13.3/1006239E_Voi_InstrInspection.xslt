<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.12.0" 
xmlns:ATDcat="urn:customs.ru:Information:CustomsDocuments:ATDCommon:5.13.1" 
xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" 
xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" 
xmlns:voii="urn:customs.ru:Information:CustomsDocuments:Voi_InstrInspection:5.13.3" 
xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа Voi_InstrInspectionType -->
	<xsl:template match="voii:Voi_InstrInspection">
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

					.graphMainValueTop {
						vertical-align:top;
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
					
					.bord_without_bottom
					{
						vertical-align:top;
						align:left;
						border-top: solid 1px #000000;
						border-left: solid 1px #000000;
						border-right: solid 1px #000000;
					}

					.bord_without_top
					{
						vertical-align:top;
						align:left;
						border-bottom: solid 1px #000000;
						border-left: solid 1px #000000;
						border-right: solid 1px #000000;
					}

					.bord_without_top_bottom
					{
						border-left: solid 1px #000000;
						border-right: solid 1px #000000;
					}

				</style>
			</head>
			<body>
				<div class="page">
					<xsl:variable name="img_gto">
						<xsl:value-of select="'/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAYEBQYFBAYGBQYHBwYIChAKCgkJChQODwwQFxQYGBcUFhYaHSUfGhsjHBYWICwgIyYnKSopGR8tMC0oMCUoKSj/2wBDAQcHBwoIChMKChMoGhYaKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCj/wAARCACUAJQDASIAAhEBAxEB/8QAHAABAAIDAQEBAAAAAAAAAAAAAAUGAgMEAQcI/8QAOBAAAgEEAQMCBAIIBwADAAAAAQIDAAQFESEGEjFBURMUImFxgRUyNEJykaGxByMzUmJ0wRYkgv/EABQBAQAAAAAAAAAAAAAAAAAAAAD/xAAUEQEAAAAAAAAAAAAAAAAAAAAA/9oADAMBAAIRAxEAPwD9U0pSgUpSgUpSgUrwkDydUBBAIOwaAx0pPsPbdU7ojO5DMXc5vYpkg+XidDJbGLklhvezskDZHHb+fDqTqsYzMpa93bBER8xobYhh5Htrz9z/AFrs3UUmLus41tfPPcSJD8DukE3B/eA12r9IJ7Tsn94+KD6pSojpbLDN4S3vQoV2BV1HgMODUtsAgb80HtKUoFKUoFKUoFKUoFKUoFKVG3uZsbKcwzzASAbIHOvxoMs1lbXD2bXN65SNfYEn+VbcbexX9ok8DBkb1B2K+c9X39v1JkYsdbNJISwREj8uTskb/AcnwBzVxx6/oOKKB4HCHS7hjeReAfHaCR/+gPxPoG7qAQ39vJijdS2004BDxqCQAwOhsa8A1o6Tvbf9HWePWUvPBbqfrABZRsA8cb4G9e9QGdja4y65K2W7uLcKlzEkds5b4qghfIGhx48nevFRXRVhd22ekupYb+PGWETfBE6n4kzEFQo5+oj6yTvyV/INv+JONsYM3FkMtmLXHY+4jIkEpIeQoOVU/cdv38651VK6ozHTUsUMVtmbCK4t447WJkbuT4aoWZdgk8cDfOydbPOvpElr/wDLMtFDnYYbeEIZorCYq0/w9gMWTkLslQW2TragDljP9S4TH3+PVrqOGP5RS8crICIlA5H2Gh6eNA+lB70bjDhemLK0lIMiIXkI8dzEseftvX5VwXQiuOpIMr87cpb23bEIQgKM2pO7Y13A/UvP8uCaztri+u8fPj7uMo7Q7gvUYPDICPp+oa36c6Gx6Cqhf2l1HZSSi3yUl9K6OTDCXjEiBuwE7+rXdo+p+nXAoPp9hdxX1pHcQEmNxsbGj58GtcuQgjuvl+4NPrYQHZ17mq10pdDD9OW9rP8AMSZLsE0kQt5XMbOSQrdqHWvB+4rdaWUtpeJf5UaMhKtISAUY+AwGwF9Bydcb3vgLVG6yIGQ7U1lVTuersXjLr5eV3Z5H5CjfZ+I9KsOPvoMhD8W2buT8KDrpSlApSlApSsXYKhY+AN0GVVfqDFY3VzJeKoe5I06DUgIHB3vXHpx+O6zXqK7nlntrPD3E11C5jZnljiiJAGzy3frn/aapebtsplpZYEvIsrlJJQpgst/BsgAO5XlP08HnZAYjwhNBbOj7LCWt3cjFQOt0IkLySTNK5Usw1tidbKkkDQPHtW7rjqC5wFnbNY2pu7qeYQxxBSxdjvQUAjfjn2HJrf0fg48LjSPji6vJSDcXA8Mw47R7KvIA/EnkmuvJZO2tLpIri1vZZAPiRtFZyTDfjhlUgHn1IoKJjbyWyycMWcimjuWZmgNyx7430Ae7krIAD2rIpOgdN6E68jhZc3BkcZc/Es8nA4mtZbKQWz3MR57SwB0CQUJ9wDUjlJOoc383BN05aXtmxUC0vu1IoiDv6mIYySeDtAEU8BnIJqG/RmXtJrdLtZFeyLNbrcSGRjC+lKiUH61Vu3fdpgNGgs/RMPT2KRkxVgllNPr47Sv3zlgN9srsSx1s65I0djg1cZZEiRnkdVVQSSx0APc1RcJFiMvOoy9pa30oPxIHu40kljBYgoxI/dkDp+OverVn7LE3di7522tJ7WBWkJukVljABJPI44B39qD5hdW/TF3e3F7jbS+s8DYP8S4ubW7aG1upQR/9dYd6ZeSWIVR9zzUj1B1LJjelLM5C2tbLI3bfGhs4mRBbrvauznhSAO4seB4/HHP2mOzt0/wljh6bwtos5UbEMr9odY1jUD6ArIW1ye5VGuajencF1JPk06hynT0V9k53MouMjMiy2o/cW3iIKxaB5JPcTwdaFBIdN5TJY1UMllcQWV04Vr2dGjgU6JEcSMe5E2Tp5AO9m3vlVr6TYM93ibdr2ICSWIGWNl9SOQR/5UNYZadcc36dsrk9rEEx2byFu0+GRA2jx5G1PkMd6E/azi5to5lSRFdQwWRCjD7FTyPwNBWo+lcB8ZcgkADSJsfFkaVRsDRALED8uKm8PbCC1UgxHvA4iTsVRrwBsn+ZqCzOPltpH+X+PNYbLNHB9T25OyfpH1Mh50F2wJ4BB0vNgLrKW1ipthFlEX9cRTKkkZ2dq6MQONee4H/iKC70qLxmUa9bU1pNZuWZRHMVLN262R2sRrnXnzUpQKUpQK1zBWhdXOlKkE+NCtlc9+3ZZzN294VSSuwNj1/pQU66z5t0Z7rFNdW6Ht+aVQAwABBPcR7jXv6VE23VMEbrBjOmbiSXncVohjOyeTwNDzySanG6p6dsbmdmv/lndizox0e7XJKn+1RWY/xCwHaklvkr4yx7HdBbFwd68jX2oJWzzN1aWCnL4qWxutaKCXuUkePrH63HqBv01Xdi87HfJuMzQHkEvIrqNenJ3v7eaqNis1yJ8r1FYZS6ttCezivO0Q71+u0YJ7W9u4bA8aqUnzWSuMTORgXiTWgIwHBBHknQ4/CgtWPyqXFwsDkfEPcFI4DEaJH9f6Gonq+6mv0OCxsNz8zcuqzXPwGEVtF5Zy5AUnQICgkkn2B1o6CwptElupjtlaSCMbJ0Q3bI3PuyaHsqL6k1zdc9S3tvi720sMVdrcuwtkuJSqRszggGPR7pW54UDz5I1QQSzJJkps9hAZIrq1/SECbILaYieILry2u77MgNdvVXU1tn8PFBikF/by2sd28YBCTtIxWGBj/zcfUPPYrehrGwxMlimXu7e6f4VqpitLd1HZCYVQuwPn6mXRHgc681zWeOntei7NrWzit2jhdok44uZnKpsDz2I50d+tBlZ/GsM6yyNJdQ2SR2FyYYzIZrqYiWSXXr2kKSBzrj7V9HtMhDdWBu4xKIQGJ+JEyNwTv6WAPp7VRLNbzEzwWSs2RVY3uJHVVjmmuRMe+VRvt9f1CeRoA1aunM5a9UYyeWG2uooO4wsl1H8J3GtE9u9geRzo7B/Gg7L29Sytnushcx20Kjetj+Wz537VSx/iBBczMLCwu541Ou5pQGY+oGj2j77P5VN/De3iulurV7+WCQRghBIXXtBU6PA4PP336EVV0y8t0kST9OT2iH4jRGNtToCdFkCjYY69NHfmg2S57K213Jf5DAXTWzx/CjKFtAb221A79cABiBvk6ArGDrC2W4drLpv4txNrQjRVZ2A9SxG9Cov52bH3MMWdyWXs2lP+kEDk+QCHBI7wPIPgnejwaukXXXTzaU5IxIAB9YCAfnQedJDI3uWnyWcWO2uTEI4bOPu1FHskbJA22/OvHA9KuVUbF9R2+f6ttY8H3y2lpHJ8e40exi2tAH1PGz7fmN3mgUpSgVrnbsgkYb2FJ45PitlKCsNi8LIpkuTazqSZBI7EMdknZbfPmq9lepuksQqrauj367+GuPtgZgN8gHXj3+1SuY6NxWTyryNbJxzJGrEFt/va3ryPasmxHTHTNsZ7iCxs04JMh7yTv91fU/cDdBWcZ1HnL7J/NnGZSe3CFewhdQMQCrFVYF9j90cgbPFWGPLX6YotlLW4eWW5EMcEcYibTDY4J4HDb2d1XB1Lf9TZWVOmohY42NdyXV28iNcE7G0CH6OR+sTrjxsaqSsLNsfbRJNffPO+XRzK03xmUdhHazH1GvHpQSdpl7mzRhBiL7RI4Z4iPHH73sNVy3lw97k4r+fE5L5mGMxQlZogIgSO4oO7hm1ot51xxupK3vo5pJkWKX/LYqCBsSe+vv9jUdd5ee1uNSxxrGknc6kaJjJABB35Hn7+DQa45B8ubZsVk1gKujH4sZOn2XP63k9xrZG8MdnBafL5QxROrp3spYsp2NnfNThUAkedVB5mV2n7IXRJUXuiLnSs+x9JPoD47vQlfzDx/l3Uq1nk9FSp/V2QSD537gEexrosLmOxuJJreyyIeQ9zd3aQx1rZHd66G/c811Yy9S+tu8I8cintkSRe1lb1BH9/b+Vdeh7UHNbZR3cQi2uoxM/wBTyIvn3Y7/APKq+YzGfWSeKzx11cKC6x/LwmNmGyFf4hIXjQJ4JPgeauGh3Jx+8KokthdnJ3EkOY+Mxmkm+S+akkCx9xHaIl1/Do7GyAOTQY43JTx3TL1RcXrQuwLLJbxtG4A0FYDel9Ts7P2Hm421v05km2kdk767h2IYgPxqMwM1pLGYJSUlkcySwXh+IGdvJLEbU+ntocCu276Qw1xCzy20dugBLSJMe37+vj86DuxN9Ypnji8V8FlhhMk4hGljJIAHHqdH+VWaq70Tj8XaYdJ8NZJaw3BL6Xf1DZ03JPkAf09qsVApSlApSlBGZnFLkowUnltrhQQk0R0R9j7j7VTbHoG2u7uS5zN1dZFwQqiRwQPHcGGu3zv03rXO6+i1BZ7pyDLBiLi5tXfXxDBKyCQf8gCN0FS6lzkNrrp7pm2hucmRyQhkitRrRdvV30OPUn8xWVniRhsTY2ry/EuXyUcs7iNYwXKtsfSACeOSPWppMBH01atNgsYl1Kqle34nw3O9ckgHuPHJOz7VEWbZiWztpeoLWO0nfKoIoEIISIIQoHHHrQcYy1viRdrcSacys7En/TPA0R6cAfY+aj0mly6G4vGFtb9hMa7ILqwHa7eoU62F/Wf00OatWYwlllImFzbxPJ29qyNGrMnsRsHx7HYqB/RVzj7pbq/+JlYYvqiRE0Y39ZHG9vv1I59Na4oLNgrt7/C2N3Nv4k0QZtgAk7IJ0PfW9enio3IgSI6SkBHlJIkBHafHejD115HtwQayORgwWOuMplpycZNIjiWBS5LuQugAOBsA78DxUebqPJ5u9x1hlDD8KJbq4njAKWy7B5YjW+3TAj778UGq0zGLxfTmR6hyF28EGjbWkRYB1VRwe0H9Zj9Wv4R9qm8FlJJsJjZsshtr2aBGlDAgBiN6J1oH7H8qqTx47qvJx5ibGkWtlIFxoYKIkjB2J3TXcdkcew9t1K3t0bOcsk9xFczv9fw3EgmP7xC6PueCCo9Cvigt4IYoVIYdw0RyPNVNcTYLcX2Ss1M8L3rtMAih4JEb9buUbJ3ztt62B6Vu6cs79LmK5yExH1bWEa0N75YgAE69AAB9/NLazz0GSuliw0TrNM4FybggNGSe0sAOeDrWwfuKCYbHw5eNGuo0uQR9F1AQkg3ydgf+eftUdF0dDlbp4bzL3d3Y2z9r2wb/AC2bZ+liPOhrYJI3vY1xUtddG21yo3c3FuWI+Itq5iVh7fTr8z5P9Kn8VjrXFWUdpYxCKCMaCj+9B0wxpDEscY0ijQArOlKBSlKBSlKBSlKBVc6q/acb/wByL+z1Y6rnVP7Tjf8AuRf2egy1XhAr2vGOio4DMwUb8bJAG/50Fcztz+jYpESzfIW93J8uMcgB+YdlLMqkkBfpUtvfngDniAzOLY4s4np6F5LC5meS8SNwLl2QDduw0QCOCTz3eedknM9QpewyzvGlnczyS3OKjkYSSy/LBg8vaR2xkqXUeedHfFc3SuHgunhQx5HEW4jeeyc3YkuZbmXReZ3HHf2gAJyCC34AJwusmTwMUqT215f20rS23aIXiWMD6yoP07P0+x3x4qdssVbWgb5eMJ3eTySfxNQvS+GSwur24upprrLuwS6uZ3Lu4Gymj6JrwBoDn1q0IeKDERhSp9mFWC2/Zov4R/aoJvK/xCp22/Zov4R/ag20pSgUpSgUpSgUpSgUpSgVXOqf2nG/9yL+z1Y6rnVO/mcb/wByI/0egyqt9SZFmQx4+e2c208YvUQCaVEOyEVN8SMwRFLaC92/Sp+6m+XgeUeUBYb8cc818rg1lTJb9PzSvYgS2ysluyw3ZkGpZ5WPDIO5gijZJHdxvdB1mzn6nv7ySOG2tLSUrDPIoElz43LbpOD2iIOzLtBz9Q361fPkopLQQOo7BrQXgqR4Kn0I9PasrGyhtII4oECRooVVAA0Na1XWqEUEfawTNLJ3zA5CBP8ALLDS3EZ9ZPz448HnndSFtMk8CyRgqCSCrcFSDog/cVru7X46L2uYpoz3RypolD+HqPcHgio6yupEyptyjvO/1XZVSIo9DSsCfVuNKN8cnWhsJiQ67f4h/ep62/Zov4R/aoCT93+If3qftv2aL+Ef2oNtKUoFKUoFKUoFKUoFKUoFQ/UNvJLCkkPMkbLIgJ0Cynej9jyKmK8IBGiNg0FYLJMg4dD6pIumX7EVqhtIoP8ATUDZJqytZwt+5r8CRXnyUH+0/wA6CDj7SQAwLegB5/lWypK5xkMyFe38A3I/n5rlsbN27kkkdlQkFm13H7E/+0HMSB5OvxrzaHXIOvHNTIsYP9pP5178lB/tP8zQRCoXdVA22+B96no07I1X2AFYRQRxf6aAH39a20ClKUClKUClKUClKUClKUClKUClKUCvFUDehrfJpSg9pSlApSlApSlApSlApSlB/9k='"/>
					</xsl:variable>				

					<table width="190">
						<tbody>
							<tr>
								<td align="left" valign="top" width="25%">
									<img>
										<xsl:attribute name="src">
											<xsl:value-of select="concat('data:image/jpeg;base64,',$img_gto)"/>
										</xsl:attribute>
									</img> 
								</td>
								<td align="center" style="vertical-align:middle;" width="70%">
									<span class="docheader">Направление на осмотр с ИДК</span>
									<xsl:if test="voii:InstrNumber">
										<br/>
										<br/>
										<span class="docheader_number">№ </span>
										<span class="docheader_number">
											<xsl:value-of select="voii:InstrNumber/*[local-name() = 'CustomsCode']"/>
											<xsl:text>/</xsl:text>
											<xsl:call-template name="gtd_date">
												<xsl:with-param name="dateIn" select="voii:InstrNumber/*[local-name() = 'RegistrationDate']"/>
											</xsl:call-template>
											<xsl:text>/</xsl:text>
											<xsl:choose>
												<xsl:when test="string-length(voii:InstrNumber/*[local-name() = 'GTDNumber']) = 7">
													<xsl:call-template name="ActNumber">
														<xsl:with-param name="GTDID" select="substring(voii:InstrNumber/*[local-name() = 'GTDNumber'],2,6)"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="ActNumber">
														<xsl:with-param name="GTDID" select="voii:InstrNumber/*[local-name() = 'GTDNumber']"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</span>	
									</xsl:if>
								</td>
								<td align="left" valign="top" width="5%">
								</td>
							</tr>
						</tbody>
					</table>

					<table>
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
								<td colspan="4" class="graphMainTitle">Сведения о Направлении на осмотр:</td>
							</tr>
							<tr class="delim"><td colspan="4"></td></tr>
							<xsl:apply-templates select="voii:InstrInfo"/>
						</tbody>
					</table>

					<xsl:if test="voii:CustDocNumber">
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
								<xsl:for-each select="voii:CustDocNumber">
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
								<xsl:if test="voii:AssInspectionDateTime">
									<tr class="delim"><td colspan="4"></td></tr>
									<tr>
										<td>Предположительные дата и время<br/>осмотра</td>
										<td></td>
										<td class="bord_bottom"></td>
										<td class="bord_bottom">
											<xsl:call-template name="russian_datetime">
												<xsl:with-param name="dateIn" select="voii:AssInspectionDateTime"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="voii:BasisExamination">
									<tr class="delim"><td colspan="4"></td></tr>
									<tr>
										<td>Основание для проведения осмотра</td>
										<td></td>
										<td class="bord_bottom"></td>
										<td class="bord_bottom">
											<xsl:value-of select="voii:BasisExamination"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="voii:PreviousID">
									<tr class="delim"><td colspan="4"></td></tr>
									<tr>
										<td>Уникальный идентификатор ранее<br/>проведенного осмотра с ИДК</td>
										<td></td>
										<td class="bord_bottom"></td>
										<td class="bord_bottom">
											<xsl:value-of select="voii:PreviousID"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="voii:PreviousInspection">
									<tr class="delim"><td colspan="4"></td></tr>
									<tr>
										<td>Регистрационный номер акта ранее<br/>проведенного осмотра с ИДК</td>
										<td></td>
										<td class="bord_bottom"></td>
										<td class="bord_bottom">
											<xsl:value-of select="voii:PreviousInspection/*[local-name() = 'CustomsCode']"/>
											<xsl:text>/</xsl:text>
											<xsl:call-template name="gtd_date">
												<xsl:with-param name="dateIn" select="voii:PreviousInspection/*[local-name() = 'RegistrationDate']"/>
											</xsl:call-template>
											<xsl:text>/</xsl:text>
											<xsl:choose>
												<xsl:when test="string-length(voii:PreviousInspection/*[local-name() = 'GTDNumber']) = 7">
													<xsl:call-template name="ActNumber">
														<xsl:with-param name="GTDID" select="substring(voii:PreviousInspection/*[local-name() = 'GTDNumber'],2,6)"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="ActNumber">
														<xsl:with-param name="GTDID" select="voii:PreviousInspection/*[local-name() = 'GTDNumber']"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="voii:RepeatComments">
									<tr class="delim"><td colspan="4"></td></tr>
									<tr>
										<td colspan="4">Причины проведения повторного  осмотра:</td>
									</tr>
									<tr class="delim"><td colspan="4"></td></tr>
									<tr>
										<td colspan="4" class="bord_bottom">
											<xsl:for-each select="voii:RepeatComments">
												<xsl:apply-templates select="."/>
												<xsl:if test="position()!=last()">
													<br/>
												</xsl:if>
											</xsl:for-each>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</xsl:if>

					<xsl:if test="voii:BorderCustoms">
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
									<td colspan="4" class="graphMainTitle">Таможенный орган направления:</td>
								</tr>
								<tr class="delim"><td colspan="4"></td></tr>
								<xsl:apply-templates select="voii:BorderCustoms"/>
							</tbody>
						</table>
					</xsl:if>

					<!--xsl:if test="voii:DeliveryCustoms">
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
									<td colspan="4" class="graphMainTitle">Таможенный орган назначения:</td>
								</tr>
								<tr class="delim"><td colspan="4"></td></tr>
								<xsl:apply-templates select="voii:DeliveryCustoms"/>
							</tbody>
						</table>
					</xsl:if-->

					<xsl:if test="voii:IDKCustoms">
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
									<td colspan="4" class="graphMainTitle">Таможенный орган, которому назначается осмотр:</td>
								</tr>
								<tr class="delim"><td colspan="4"></td></tr>
								<xsl:apply-templates select="voii:IDKCustoms"/>
								<xsl:if test="voii:IDK_id">
									<tr class="delim"><td colspan="4"></td></tr>
									<tr>
										<td>Уникальный идентификатор ИДК,<br/>которому назначается осмотр</td>
										<td></td>
										<td class="bord_bottom"></td>
										<td class="bord_bottom">
											<xsl:value-of select="voii:IDK_id"/>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</xsl:if>

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
								<td colspan="4" class="graphMainTitle">Сведения о таможенной процедуре:</td>
							</tr>
							<tr class="delim"><td colspan="4"></td></tr>
							<xsl:if test="voii:CustomsProcedureType">
								<tr class="delim"><td colspan="4"></td></tr>
								<tr>
									<td>Направление перемещения</td>
									<td></td>
									<td class="bord_bottom"></td>
									<td class="bord_bottom">
										<xsl:value-of select="voii:CustomsProcedureType"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="voii:CustomsModeCode">
								<tr class="delim"><td colspan="4"></td></tr>
								<tr>
									<td>Код таможенной процедуры</td>
									<td></td>
									<td class="bord_bottom"></td>
									<td class="bord_bottom">
										<xsl:value-of select="voii:CustomsModeCode"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="voii:BorderDate">
								<tr class="delim"><td colspan="4"></td></tr>
								<tr>
									<td>Дата ввоза</td>
									<td></td>
									<td class="bord_bottom"></td>
									<td class="bord_bottom">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="voii:BorderDate"/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="voii:RiskOperCode">
								<tr class="delim"><td colspan="4"></td></tr>
								<tr>
									<td>Код технологической операции<br/>при выявлении ПР</td>
									<td></td>
									<td class="bord_bottom"></td>
									<td class="bord_bottom">
										<xsl:value-of select="voii:RiskOperCode"/>
									</td>
								</tr>
							</xsl:if>
						</tbody>
					</table>

					<xsl:if test="voii:InspectionObject">
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
									<td colspan="4" class="graphMainTitle">Сведения об объекте осмотра:</td>
								</tr>
								<tr class="delim"><td colspan="4"></td></tr>
								<xsl:apply-templates select="voii:InspectionObject"/>
							</tbody>
						</table>

					</xsl:if>


					
					
<!--
					<xsl:if test="voii:BorderDate">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Дата ввоза</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="voii:BorderDate"/>
									</xsl:call-template>
								</td>
							</tr>
						</table>
					</xsl:if>
-->
				</div>
			</body>
		</html>
	</xsl:template>

	<!-- Шаблон для типа RUScat_ru:UnifiedCode20Type -->
	<xsl:template match="RUScat_ru:BusinessEntityTypeCode">
		<xsl:if test="RUScat_ru:UnifiedCode">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;Код объекта в соответсвии<br/>&#160;&#160;&#160;со справочником<br/>&#160;&#160;&#160;(классификатором)</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="RUScat_ru:UnifiedCode"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="RUScat_ru:CodeListId">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;Обозначение справочника<br/>&#160;&#160;&#160;(классификатора)</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="RUScat_ru:CodeListId"/>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>
	
	<!-- Шаблон для типа cat_ru:ContactType -->
	<xsl:template match="RUScat_ru:CommunicationDetails">
		<xsl:if test="cat_ru:Phone">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;Номер телефона</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:for-each select="cat_ru:Phone">
						<xsl:value-of select="."/>
						<xsl:if test="position()!=last()">
							<xsl:text>, </xsl:text>
						</xsl:if>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;Номер факса</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="cat_ru:Fax"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;Номер телекса</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="cat_ru:Telex"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;Адрес электронной почты</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:for-each select="cat_ru:E_mail">
						<xsl:value-of select="."/>
						<xsl:if test="position()!=last()">
							<xsl:text>, </xsl:text>
						</xsl:if>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>
	
	<!-- Шаблон для типа RUScat_ru:RUIdentityCardType -->
	<xsl:template match="RUScat_ru:IdentityCard">
		<xsl:if test="cat_ru:IdentityCardCode">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;Код вида документа,<br/>&#160;&#160;&#160;удостоверяющего личность</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="cat_ru:IdentityCardCode"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardName">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;Краткое наименование документа,<br/>&#160;&#160;&#160;удостоверяющего личность</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="cat_ru:IdentityCardName"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardSeries">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;Серия документа</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="cat_ru:IdentityCardSeries"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardNumber">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;Номер документа</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="cat_ru:IdentityCardNumber"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardDate">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;Дата выдачи документа</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:OrganizationName">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;Наименование организации,<br/>&#160;&#160;&#160;выдавшей документ</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="cat_ru:OrganizationName"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="RUScat_ru:IssuerCode">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;Код подразделения органа,<br/>&#160;&#160;&#160;выдавшего документ</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="RUScat_ru:IssuerCode"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardName">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;Наименование вида документа</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="RUScat_ru:FullIdentityCardName"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="RUScat_ru:AuthorityId">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;Строка, идентифицирующая<br/>&#160;&#160;&#160;орган государственной власти<br/>&#160;&#160;&#160;государства-члена либо<br/>&#160;&#160;&#160;уполномоченную им организацию,<br/>&#160;&#160;&#160;выдавшую документ</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="RUScat_ru:AuthorityId"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryCode">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;Кодовое обозначение страны</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="RUScat_ru:CountryCode"/>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>
	
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="RUScat_ru:SubjectAddressDetails">
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	
	<!-- Шаблон для типа RUScat_ru:UITN40Type -->
	<xsl:template match="RUScat_ru:UITN">
		<xsl:if test="RUScat_ru:UITNCode">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;Код. Универсальный<br/>&#160;&#160;&#160;идентификационный<br/>&#160;&#160;&#160;таможенный номер</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="RUScat_ru:UITNCode"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryCode">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;Кодовое обозначение страны,<br/>&#160;&#160;&#160;по правилам которой сформирован<br/>&#160;&#160;&#160;указанный идентификатор</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="RUScat_ru:CountryCode"/>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>
	
	<!-- Шаблон для типа cat_ru:ITNKZType -->
	<xsl:template match="cat_ru:ITN">
		<xsl:if test="cat_ru:CategoryCode">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;&#160;&#160;Категория лица.<br/>&#160;&#160;&#160;&#160;&#160;Двухзначный цифровой код<br/>&#160;&#160;&#160;&#160;&#160;категории лица согласно<br/>&#160;&#160;&#160;&#160;&#160;учредительным документам или<br/>&#160;&#160;&#160;&#160;&#160;свидетельству о регистрации<br/>&#160;&#160;&#160;&#160;&#160;в качестве индивидуального<br/>предпринимателя</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="cat_ru:CategoryCode"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:KATOCode">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;&#160;&#160;Код КАТО</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="cat_ru:KATOCode"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:RNN">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;&#160;&#160;РНН. Регистрационный налоговый<br/>&#160;&#160;&#160;&#160;&#160;номер, присваиваемый<br/>&#160;&#160;&#160;&#160;&#160;налоговыми органами<br/>&#160;&#160;&#160;&#160;&#160;Республики Казахстан</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="cat_ru:RNN"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:ITNReserv">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;&#160;&#160;Резерв для ИТН</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="cat_ru:ITNReserv"/>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>
	
	<!-- Шаблон для типа cat_ru:KGOrganizationFeaturesType -->
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;ИНН - идентификационный налоговый<br/>&#160;&#160;&#160;номер налогоплательщика,<br/>&#160;&#160;&#160;ПИН - персональный идентификационный<br/>&#160;&#160;&#160;номер</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="cat_ru:KGINN"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;Код Общереспубликанского классификатора<br/>&#160;&#160;&#160;предприятий и организаций (ОКПО)<br/>&#160;&#160;&#160;для юридических лиц и <br/>&#160;&#160;&#160;индивидуальных предпринимателей</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="cat_ru:KGOKPO"/>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>
	
	<!-- Шаблон для типа cat_ru:RAOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;Учетный номер налогоплательщика (УНН)</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="cat_ru:UNN"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;Номерной знак общественных услуг (НЗОУ)</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="cat_ru:SocialServiceNumber"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;Номер справки об отсутствии<br/>&#160;&#160;&#160;номерного знака общественных<br/>&#160;&#160;&#160;услуг (НЗОУ)</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>
	
	<!-- Шаблон для типа cat_ru:RBOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;Учетный номер плательщика (УНП)</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="cat_ru:UNP"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;Идентификационный номер<br/>&#160;&#160;&#160;физического лица</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>
	
	<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;ОГРН/ОГРНИП. Основной<br/>&#160;&#160;&#160;государственный регистрационный<br/>&#160;&#160;&#160;номер</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="cat_ru:OGRN"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;ИНН - Индивидуальный номер<br/>&#160;&#160;&#160;налогоплательщика</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="cat_ru:INN"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;КПП - Код причины постановки<br/>&#160;&#160;&#160;на учет</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="cat_ru:KPP"/>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>
	
	<!-- Шаблон для типа cat_ru:RKOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;Бизнес-идентификационный номер (БИН)</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="cat_ru:BIN"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;Индивидуальный идентификационный<br/>&#160;&#160;&#160;номер (ИИН)</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="cat_ru:IIN"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td colspan="4">&#160;&#160;&#160;Идентификационный таможенный номер (ИТН):</td>
				<xsl:apply-templates select="cat_ru:ITN"/>
			</tr>
		</xsl:if>
	</xsl:template>
	
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="voii:BillDoc">
		<xsl:if test="cat_ru:PrDocumentName">
			<xsl:value-of select="cat_ru:PrDocumentName"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text>№ </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text>от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	<!-- Шаблон для типа cat_ru:CUCustomsType -->
	<xsl:template match="ATDcat:Customs|voii:BorderCustoms|voii:IDKCustoms|voii:DeliveryCustoms">
		<xsl:variable name="pref">
			<xsl:choose>
				<xsl:when test="name() = 'voii:BorderCustoms' or name() = 'voii:IDKCustoms' or name()='voii:DeliveryCustoms'"></xsl:when>
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

	<!-- Шаблон для типа cat_ru:CustomsType -->
	<xsl:template match="ATDcat:Customs">
		<tr class="delim"><td colspan="4"></td></tr>
		<tr>
			<td>&#160;&#160;&#160;Код таможенного органа</td>
			<td></td>
			<td class="bord_bottom"></td>
			<td class="bord_bottom">
				<xsl:value-of select="cat_ru:Code"/>
			</td>
		</tr>
		<xsl:if test="cat_ru:OfficeName">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;Наименование таможенного органа</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="cat_ru:OfficeName"/>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>

	<!-- Шаблон для типа ATDcat:CustomsPersonDetails -->
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
		<xsl:if test="$nodeCO/ATDcat:LNP or $nodeCO/ATDcat:CustomsCode">
			<tr class="delim"><td colspan="$colcnt+3"></td></tr>
			<tr>
				<xsl:choose>
					<xsl:when test="$nodeCO/ATDcat:LNP and $nodeCO/ATDcat:CustomsCode">
						<td>&#160;&#160;&#160;ЛНП (код ТО на оттиске ЛНП)</td>
					</xsl:when>
					<xsl:when test="$nodeCO/ATDcat:LNP">
						<td>&#160;&#160;&#160;ЛНП</td>
					</xsl:when>
					<xsl:when test="$nodeCO/ATDcat:CustomsCode">
						<td>&#160;&#160;&#160;Код ТО на оттиске ЛНП</td>
					</xsl:when>
				</xsl:choose>
				<td></td>
				<td class="bord_bottom"></td>
				<td colspan="4" class="bord_bottom">
					<xsl:if test="$nodeCO/ATDcat:LNP">
						<xsl:value-of select="$nodeCO/ATDcat:LNP"/>
						<xsl:if test="$nodeCO/ATDcat:CustomsCode">
							<xsl:text> (</xsl:text>
						</xsl:if>
					</xsl:if>
					<xsl:if test="$nodeCO/ATDcat:CustomsCode">
						<xsl:value-of select="$nodeCO/ATDcat:CustomsCode"/>
						<xsl:if test="$nodeCO/ATDcat:LNP">
							<xsl:text>)</xsl:text>
						</xsl:if>
					</xsl:if>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>

	<!-- Шаблон для типа cat_ru:CUCustomsType -->
	<xsl:template match="ATDcat:Customs">
		<tr class="delim"><td colspan="4"></td></tr>
		<tr>
			<td>&#160;&#160;&#160;Код таможенного органа</td>
			<td></td>
			<td class="bord_bottom"></td>
			<td class="bord_bottom">
				<xsl:value-of select="cat_ru:Code"/>
			</td>
		</tr>
		<xsl:if test="cat_ru:OfficeName">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;Наименование таможенного органа</td>
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
				<td>&#160;&#160;&#160;Код государства - члена ЕАЭС</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="cat_ru:CustomsCountryCode"/>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>

	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="voii:GTDID|voii:InstrNumber|ATDcat:GTDID|voii:PreviousInspection">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
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

	<!-- Шаблон для типа cat_ru:CustomsType -->
	<xsl:template match="ATDcat:Customs">
		<tr class="delim"><td colspan="4"></td></tr>
		<tr>
			<td>&#160;&#160;&#160;Код таможенного органа</td>
			<td></td>
			<td class="bord_bottom"></td>
			<td class="bord_bottom">
				<xsl:value-of select="cat_ru:Code"/>
			</td>
		</tr>
		<xsl:if test="cat_ru:OfficeName">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;Наименование таможенного органа</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="cat_ru:OfficeName"/>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>

	<!-- Шаблон для типа catESAD_cu:ContainerNumberType -->
	<xsl:template match="voii:InspContainer">
		<tr class="graphMainValue">
			<td>
				<xsl:value-of select="./*[local-name() = 'ContainerIdentificaror']"/>
			</td>
			<td align="center">
				<xsl:value-of select="./*[local-name() = 'FullIndicator']"/>
			</td>
		</tr>
	</xsl:template>

	<!-- Шаблон для типа voii:InspDocumentsType -->
	<xsl:template match="voii:InspDocuments">
		<tr class="graphMainValue">
			<td>
				<xsl:value-of select="cat_ru:PrDocumentName"/>
			</td>
			<td>
				<xsl:value-of select="cat_ru:PrDocumentNumber"/>
			</td>
			<td>
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
				</xsl:call-template>
			</td>
			<td>
				<xsl:value-of select="voii:PresentedDocumentModeCode"/>
			</td>
		</tr>
	</xsl:template>

	<!-- Шаблон для типа voii:InspTransportMeansType -->
	<xsl:template match="voii:InspTransportMeans">
		<table width="190">
			<col width="100%" align="left" class="graphMainHd" valign="bottom"/>
			<tbody>
				<tr>
					<td><br/></td>
				</tr>
				<tr>
					<td class="graphMainTitle">Транспортное средство/контейнеры:</td>
				</tr>
			</tbody>
		</table>
		<xsl:if test="voii:TransportMeans">
			<xsl:apply-templates select="voii:TransportMeans"/>
		</xsl:if>
		<xsl:if test="voii:InspContainer">
			<table width="190">
				<col width="100%" align="left" class="graphMainHd" valign="bottom"/>
				<tbody>
					<tr class="delim"><td></td></tr>
					<tr>
						<td class="graphMainSubTitle">&#160;&#160;&#160;Сведения о контейнерах:</td>
					</tr>
					<tr class="delim"><td></td></tr>
				</tbody>
			</table>
			<table width="190" class="border">
				<col width="55%" align="left"/>
				<col width="45%" align="left"/>
				<tbody>
					<tr class="graphMainHd">
						<td style="vertical-align:middle;" align="center">Номер (идентификатор) контейнера</td>
						<td align="center">Признак заполнения контейнера.<br/><span class="graphMainSubHd">(1 - товар занимает весь контейнер,<br/>2- товар занимает часть контейнера)</span></td>
					</tr>
					<xsl:for-each select="voii:InspContainer">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
	</xsl:template>

	<!-- Шаблон для типа voii:TransportMeansType -->
	<xsl:template match="voii:TransportMeans">
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
					<td colspan="4" class="graphMainSubTitle">&#160;&#160;&#160;Сведения о транспортном средстве:</td>
				</tr>
				<xsl:if test="voii:TransportModeCode">
					<tr class="delim"><td colspan="4"></td></tr>
					<tr>
						<td>Код вида ТС</td>
						<td></td>
						<td class="bord_bottom"></td>
						<td class="bord_bottom">
							<xsl:value-of select="voii:TransportModeCode"/>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="voii:TransportIdentifier">
					<tr class="delim"><td colspan="4"></td></tr>
					<tr>
						<td>Номер ТС</td>
						<td></td>
						<td class="bord_bottom"></td>
						<td class="bord_bottom">
							<xsl:value-of select="voii:TransportIdentifier"/>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="voii:TrailerIdentifier">
					<tr class="delim"><td colspan="4"></td></tr>
					<tr>
						<td>Регистрационный номер<br/>прицепа/полуприцепа</td>
						<td></td>
						<td class="bord_bottom"></td>
						<td class="bord_bottom">
							<xsl:for-each select="voii:TrailerIdentifier"><xsl:value-of select="."/></xsl:for-each>
						</td>
					</tr>
				</xsl:if>
			</tbody>
		</table>
	</xsl:template>

	<!-- Шаблон для типа voii:InspectionObjectType -->
	<xsl:template match="voii:InspectionObject">
		<xsl:if test="voii:ObjectType">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>Тип объекта</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:choose>
						<xsl:when test="voii:ObjectType='1'">
							<xsl:text>товар</xsl:text>
						</xsl:when>
						<xsl:when test="voii:ObjectType='2'">
							<xsl:text>транспортное средство</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="voii:ObjectType"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</xsl:if>

		<xsl:if test="voii:ConsigCountryCode or voii:ConsigCountryName">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>Страна отправителя</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:if test="voii:ConsigCountryCode">(<xsl:value-of select="voii:ConsigCountryCode"/>) </xsl:if>
					<xsl:value-of select="voii:ConsigCountryName"/>
				</td>
			</tr>
		</xsl:if>
		
		<xsl:if test="voii:DelivCountryCode or voii:DelivCountryName">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>Страна получателя</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:if test="voii:DelivCountryCode">(<xsl:value-of select="voii:DelivCountryCode"/>) </xsl:if>
					<xsl:value-of select="voii:DelivCountryName"/>
				</td>
			</tr>
		</xsl:if>

		<xsl:if test="voii:DeliveryPlace">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>Место доставки груза</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="voii:DeliveryPlace"/>
				</td>
			</tr>
		</xsl:if>

		<xsl:if test="voii:InspDescription">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>Дополнительные сведения/<br/>комментарий</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:for-each select="voii:InspDescription">
						<xsl:value-of select="."/>
						<xsl:if test="position()!=last()">
							<xsl:text>, </xsl:text>
						</xsl:if>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>

		<xsl:if test="voii:PersonInspection">
			<tr><td colspan="4"><br/></td></tr>
			<tr>
				<td colspan="4" class="graphMainTitle">Лицо, обладающее полномочиями в отношении товаров и (или)<br/>транспортных средств:</td>
				<xsl:apply-templates select="voii:PersonInspection"/>
			</tr>
		</xsl:if>


		<xsl:if test="voii:Consignor">
			<tr><td colspan="4"><br/></td></tr>
			<tr>
				<td colspan="4" class="graphMainTitle">Сведения об отправителе:</td>
				<xsl:apply-templates select="voii:Consignor"/>
			</tr>
		</xsl:if>

		<xsl:if test="voii:Consignee">
			<tr><td colspan="4"><br/></td></tr>
			<tr>
				<td colspan="4" class="graphMainTitle">Сведения о получателе:</td>
				<xsl:apply-templates select="voii:Consignee"/>
			</tr>
		</xsl:if>

		<xsl:if test="voii:Carrier">
			<tr><td colspan="4"><br/></td></tr>
			<tr>
				<td colspan="4" class="graphMainTitle">Сведения о перевозчике:</td>
				<xsl:apply-templates select="voii:Carrier"/>
			</tr>
		</xsl:if>

		<xsl:if test="voii:InspTransportMeans">
			<xsl:apply-templates select="voii:InspTransportMeans"/>
		</xsl:if>
		
		<xsl:if test="voii:InspDocuments">
			<table width="190">
				<col width="100%" align="left" class="graphMainHd" valign="bottom"/>
				<tbody>
					<tr><td><br/></td></tr>
					<tr>
						<td class="graphMainTitle">Документы, по которым перевозятся товары<br/>(транспортные, коммерческие):</td>
					</tr>
					<tr class="delim"><td></td></tr>
				</tbody>
			</table>
			<table width="190">
				<col width="35%" align="left"/>
				<col width="30%" align="left"/>
				<col width="17%" align="center"/>
				<col width="18%" align="center"/>
				<tbody>
					<tr class="graphMainHd">
						<td class="border-tbl" style="vertical-align:middle;" align="center">Наименование<br/>документа</td>
						<td class="border-tbl" style="vertical-align:middle;" align="center">Номер<br/>документа</td>
						<td class="border-tbl" style="vertical-align:middle;" align="center">Дата<br/>документа</td>
						<td class="border" style="vertical-align:middle;" align="center">Код вида<br/>документа</td>
					</tr>
					<xsl:for-each select="voii:InspDocuments">
						<tr class="graphMainValue">
							<td class="border-tbl">
								<xsl:value-of select="cat_ru:PrDocumentName"/>
							</td>
							<td class="border-tbl">
								<xsl:value-of select="cat_ru:PrDocumentNumber"/>
							</td>
							<td class="border-tbl">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
								</xsl:call-template>
							</td>
							<td class="border">
								<xsl:value-of select="voii:PresentedDocumentModeCode"/>
							</td>
						</tr>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>

		<xsl:if test="voii:InspGoods or voii:TotalPakageQuantity or voii:TotalGrossWeightQuantity or voii:TotalNetWeightQuantity">
			<table width="190">
				<col width="100%" align="left" class="graphMainHd" valign="bottom"/>
				<tbody>
					<tr><td><br/></td></tr>
					<tr>
						<td class="graphMainTitle">Сведения о товарах:</td>
					</tr>
				</tbody>
			</table>

			<xsl:if test="voii:InspGoods">
				<xsl:for-each select="voii:InspGoods">
					<table>
						<col width="25%" align="left" valign="top"/>
						<col width="25%" align="left" valign="top"/>
						<col width="25%" align="left" valign="top"/>
						<col width="25%" align="left" valign="top"/>
						<tbody>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr class="delim"><td colspan="4"></td></tr>
							<tr>
								<td class="bord_without_bottom">
									<span class="graphMainHd">№ п/п:</span>
								</td>
								<td class="bord_without_bottom">
									<span class="graphMainHd">Код ТНВЭД ЕАЭС:</span>
								</td>
								<td colspan="2" class="bord_without_bottom">
									<span class="graphMainHd">Описание товара:</span>
								</td>
							</tr>
							<tr class="delim">
								<td class="bord_without_top_bottom"></td>
								<td class="bord_without_top_bottom"></td>
								<td  class="bord_without_top_bottom" colspan="2"></td>
							</tr>
							<tr>
								<td class="bord_without_top">
									<span class="graphMainValueTop"><xsl:value-of select="voii:GoodsNumeric"/></span>
								</td>
								<td class="bord_without_top">
									<span class="graphMainValueTop"><xsl:value-of select="voii:GoodsTNVEDCode"/></span>
								</td>
								<td colspan="2" class="bord_without_top">
									<span class="graphMainValueTop">
										<xsl:for-each select="voii:GoodsDescription">
											<xsl:apply-templates select="."/>
											<xsl:if test="position()!=last()">
												<br/>
											</xsl:if>
										</xsl:for-each>	
									</span>
								</td>
							</tr>
							<br/>
							<xsl:if test="voii:BillDoc">
								<tr class="border">
									<td colspan="4" class="bord_without_bottom">
										<span class="graphMainHd">Товаросопроводительный документ:</span>
									</td>
								</tr>
								<tr class="delim">
									<td  class="bord_without_top_bottom" colspan="4"></td>
								</tr>
								<tr>
									<td  colspan="4" class="bord_without_top">
										<span class="graphMainValueTop"><xsl:apply-templates select="voii:BillDoc"/></span>
									</td>
								</tr>
							</xsl:if>

							<tr class="border">
								<td class="bord_without_bottom">
									<span class="graphMainHd">Количество<br/>грузовых<br/>мест:</span>
								</td>
								<td class="bord_without_bottom">
									<span class="graphMainHd">Вес товара<br/>брутто (кг):<br/></span>
								</td>
								<td class="bord_without_bottom">
									<span class="graphMainHd">Вес товара<br/>нетто (кг):<br/></span>
								</td>
								<td class="bord_without_bottom">
									<span class="graphMainHd">Код страны<br/>происхождения<br/>товара:</span>
								</td>
							</tr>
							<tr class="delim">
								<td class="bord_without_top_bottom"></td>
								<td class="bord_without_top_bottom"></td>
								<td class="bord_without_top_bottom"></td>
								<td class="bord_without_top_bottom"></td>
							</tr>
							<tr>
								<td class="bord_without_top">
									<span class="graphMainValueTop"><xsl:value-of select="translate(voii:PakageQuantity, '.', ',')"/></span>
								</td>
								<td class="bord_without_top">
									<span class="graphMainValueTop"><xsl:value-of select="translate(voii:GrossWeightQuantity, '.', ',')"/></span>
								</td>
								<td class="bord_without_top">
									<span class="graphMainValueTop"><xsl:value-of select="translate(voii:NetWeightQuantity, '.', ',')"/></span>
								</td>
								<td class="bord_without_top">
									<span class="graphMainValueTop"><xsl:value-of select="voii:OriginCountryCode"/></span>
								</td>
							</tr>
						</tbody>
					</table>
				</xsl:for-each>
			</xsl:if>	
		</xsl:if>	

		<xsl:if test="voii:TotalPakageQuantity or voii:TotalGrossWeightQuantity or voii:TotalNetWeightQuantity or voii:MainWeightQuantity">
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
					<xsl:if test="voii:TotalPakageQuantity">
						<tr class="delim"><td colspan="4"></td></tr>
						<tr>
							<td>Общее количество грузовых мест</td>
							<td></td>
							<td class="bord_bottom"></td>
							<td class="bord_bottom">
								<xsl:value-of select="translate(voii:TotalPakageQuantity, '.', ',')"/>
							</td>
						</tr>
					</xsl:if>
				
					<xsl:if test="voii:TotalGrossWeightQuantity">
						<tr class="delim"><td colspan="4"></td></tr>
						<tr>
							<td>Общий вес товаров брутто (кг)</td>
							<td></td>
							<td class="bord_bottom"></td>
							<td class="bord_bottom">
								<xsl:value-of select="translate(voii:TotalGrossWeightQuantity, '.', ',')"/>
							</td>
						</tr>
					</xsl:if>
	
					<xsl:if test="voii:TotalNetWeightQuantity">
						<tr class="delim"><td colspan="4"></td></tr>
						<tr>
							<td>Общий вес товаров нетто (кг)</td>
							<td></td>
							<td class="bord_bottom"></td>
							<td class="bord_bottom">
								<xsl:value-of select="translate(voii:TotalNetWeightQuantity, '.', ',')"/>
							</td>
						</tr>
					</xsl:if>
	
					<xsl:if test="voii:MainWeightQuantity">
						<tr class="delim"><td colspan="4"></td></tr>
						<tr>
							<td>Вес основного товара<br/>в товарной партии (кг)</td>
							<td></td>
							<td class="bord_bottom"></td>
							<td class="bord_bottom">
								<xsl:value-of select="translate(voii:MainWeightQuantity, '.', ',')"/>
							</td>
						</tr>
					</xsl:if>
				</tbody>
			</table>
		</xsl:if>	
		<br/>
		<xsl:if test="voii:RiskProfile">
			<table width="190">
				<col width="100%" align="left" class="graphMainHd" valign="bottom"/>
				<tbody>
					<tr class="delim"><td></td></tr>
					<tr>
						<td class="graphMainTitle">Номер профиля риска:</td>
					</tr>
					<tr class="delim"><td></td></tr>
				</tbody>
			</table>

			<xsl:for-each select="voii:RiskProfile">
				<table>
					<col width="15%" align="left" valign="top"/>
					<col width="20%" align="left" valign="top"/>
					<col width="20%" align="left" valign="top"/>
					<col width="18%" align="left" valign="top"/>
					<col width="28%" align="left" valign="top"/>
					<tbody>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr class="delim"><td colspan="5"></td></tr>
						<tr>
							<td class="bord_without_bottom">
								<span class="graphMainHd">Код вида<br/>ПР:</span>
							</td>
							<td class="bord_without_bottom">
								<span class="graphMainHd">Код ТО,<br/>утвердившего<br/>ПР:</span>
							</td>
							<td class="bord_without_bottom">
								<span class="graphMainHd">Дата<br/>регистрации<br/>ПР:</span>
							</td>
							<td class="bord_without_bottom">
								<span class="graphMainHd">Порядковый<br/>номер ПР:</span>
							</td>
							<td class="bord_without_bottom">
								<span class="graphMainHd">Порядковый номер<br/>версии ПР:</span>
							</td>
						</tr>
						<tr class="delim">
							<td class="bord_without_top_bottom"></td>
							<td class="bord_without_top_bottom"></td>
							<td class="bord_without_top_bottom"></td>
							<td class="bord_without_top_bottom"></td>
							<td class="bord_without_top_bottom"></td>
						</tr>
						<tr>
							<td class="bord_without_top">
								<span class="graphMainValueTop"><xsl:value-of select="voii:RiskProfileKind"/></span>
							</td>
							<td class="bord_without_top">
								<span class="graphMainValueTop"><xsl:value-of select="voii:CustomsCode"/></span>
							</td>
							<td class="bord_without_top">
								<span class="graphMainValueTop">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="voii:RegistryDate"/>
									</xsl:call-template>
								</span>
							</td>
							<td class="bord_without_top">
								<span class="graphMainValueTop"><xsl:value-of select="voii:SequenceNumber"/></span>
							</td>
							<td class="bord_without_top">
								<span class="graphMainValueTop"><xsl:value-of select="voii:RiskProfileNumberVersion"/></span>
							</td>
						</tr>

						<tr class="border">
							<td colspan="4" class="bord_without_bottom">
								<span class="graphMainHd">Номера товаров в таможенном документе,<br/>по которым сработал ПР:</span>
							</td>
							<td colspan="4" class="bord_without_bottom">
								<span class="graphMainHd">Дата и время<br/>выявления ПР:</span>
							</td>
						</tr>
						<tr class="delim">
							<td  class="bord_without_top_bottom" colspan="4"></td>
							<td  class="bord_without_top_bottom"></td>
						</tr>
						<tr>
							<td  colspan="4" class="bord_without_top">
								<xsl:choose>
									<xsl:when test="voii:GoodsNum">
										<span class="graphMainValueTop">
											<xsl:for-each select="voii:GoodsNum">
												<xsl:value-of select="."/>
												<xsl:if test="position()!=last()">
													<xsl:text>, </xsl:text>
												</xsl:if>
											</xsl:for-each>
										</span>	
									</xsl:when>
									<xsl:otherwise>
										<span class="graphMainValueTop">по всем товарам</span>
									</xsl:otherwise>
								</xsl:choose>
							</td>
							<td class="bord_without_top">
								<span class="graphMainValueTop">
									<xsl:if test="voii:CheckRiskTime">
										<xsl:call-template name="russian_datetime">
											<xsl:with-param name="dateIn" select="voii:CheckRiskTime"/>
										</xsl:call-template>
									</xsl:if>	
								</span>
							</td>
						</tr>
					</tbody>
				</table>
			</xsl:for-each>
		</xsl:if>	





<!--		
		
		
		<xsl:if test="voii:RiskProfile">
			<div class="title marg-t1">Номер профиля риска</div>
			<table class="bordered w190">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered">Код вида профиля риска</td>
						<td class="graphMain bordered">Код таможенного органа, должностное лицо которого утвердило профиль риска</td>
						<td class="graphMain bordered">Дата регистрации ПР</td>
						<td class="graphMain bordered">Порядковый номер ПР</td>
						<td class="graphMain bordered">Порядковый номер версии профиля риска</td>
						<td class="graphMain bordered">Дата и время выявления профиля риска</td>
					</tr>
					<xsl:for-each select="voii:RiskProfile">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
-->
	</xsl:template>

	<!-- Шаблон для типа voii:InstrInfoType -->
	<xsl:template match="voii:InstrInfo">

		<tr class="delim"><td colspan="4"></td></tr>
		<tr>
			<td>Дата и время создания документа</td>
			<td></td>
			<td class="bord_bottom"></td>
			<td class="bord_bottom">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="ATDcat:InstrDate"/>
				</xsl:call-template>
				<xsl:text>   </xsl:text>
				<xsl:value-of select="substring(ATDcat:InstrTime,1,8)"/>
			</td>
		</tr>

		<xsl:if test="ATDcat:Customs">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td colspan="4">Таможенный орган:</td>
			</tr>
			<xsl:apply-templates select="ATDcat:Customs"/>
		</xsl:if>

		<xsl:if test="ATDcat:CustomsOfficer">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>Должностное лицо ТО:</td>
				<xsl:call-template name="CustomsOfficer">
					<xsl:with-param name="nodeCO" select="./ATDcat:CustomsOfficer"/>
				</xsl:call-template>
			</tr>
		</xsl:if>

	</xsl:template>

	<!-- Шаблон для типа RUScat_ru:SubjectDetailsType -->
	<xsl:template match="voii:PersonInspection| voii:Consignor| voii:Consignee| voii:Carrier">
		<xsl:if test="cat_ru:OrganizationName">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>Наименование организации /<br/>ФИО физического лица</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="cat_ru:OrganizationName"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:ShortName">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>Краткое наименование организации</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="cat_ru:ShortName"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:OrganizationLanguage">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>Код языка для заполнения<br/>наименования</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="cat_ru:OrganizationLanguage"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td colspan="4">Сведения об организации. Особенности Российской Федерации:</td>
				<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:RKOrganizationFeatures">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td colspan="4">Сведения об организации. Особенности Республики Казахстан:</td>
				<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:RBOrganizationFeatures">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td colspan="4">Сведения об организации. Особенности Республики Беларусь:</td>
				<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:RAOrganizationFeatures">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td colspan="4">Сведения об организации. Особенности Республики Армения:</td>
				<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:KGOrganizationFeatures">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td colspan="4">Сведения об организации. Особенности Кыргызской Республики:</td>
				<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
			</tr>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeCode">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td colspan="4">Кодовое обозначение организационно-правовой формы, в которой<br/>зарегистрирован хозяйствующий субъект:</td>
				<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode"/>
			</tr>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeName">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>Наименование организационно-<br/>правовой формы, в которой<br/>зарегистрирован хозяйствующий<br/>субъект</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="RUScat_ru:BusinessEntityTypeName"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="RUScat_ru:UITN">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td colspan="4">Уникальный идентификационный таможенный номер, присвоенный<br/>юридическому или физическому лицу:</td>
				<xsl:apply-templates select="RUScat_ru:UITN"/>
			</tr>
		</xsl:if>
		<xsl:if test="RUScat_ru:PersonId">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>Уникальный идентификатор<br/>физического лица</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="RUScat_ru:PersonId"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCard">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td colspan="4">Сведения о документе, удостоверяющем личность физического лица:</td>
				<xsl:apply-templates select="RUScat_ru:IdentityCard"/>
			</tr>
		</xsl:if>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td colspan="4">Адрес(а):</td>
			</tr>
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td colspan="4" class="bord_bottom">
					<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
						<xsl:apply-templates select="."/>
						<xsl:if test="position()!=last()">
							<br/>
						</xsl:if>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="RUScat_ru:CommunicationDetails">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td colspan="4">Контактный реквизит субъекта:</td>
				<xsl:apply-templates select="RUScat_ru:CommunicationDetails"/>
			</tr>
		</xsl:if>
	</xsl:template>

	<xsl:template name="russian_datetime">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
				<xsl:text>   </xsl:text>
				<xsl:value-of select="substring($dateIn,12,8)"/>
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
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
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
	
	<xsl:template name="ActNumber">
		<xsl:param name="GTDID"/>
		<xsl:choose>
			<xsl:when test="string-length($GTDID) &lt; 6">
				<xsl:variable name="temp" select="concat('0',$GTDID)"/>
				<xsl:call-template name="ActNumber">
					<xsl:with-param name="GTDID" select="$temp"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$GTDID"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>
