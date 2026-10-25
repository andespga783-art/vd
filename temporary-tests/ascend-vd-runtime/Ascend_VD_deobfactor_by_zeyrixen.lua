-- deobfactor by zeyrixen (https://discord.gg/dRbHa2dwt)
checkPreStatus = function()
	local numberValue = 0

	if game.PlaceId == 93978595733734 then
		numberValue = 100
	end

	if getgenv().Junkie == nil and getgenv().Key == nil then
		numberValue += 200
	end

	if not (numberValue < 300) then
		return
	end

	local function callbackValue(valueValue, inputValue, inputValue2, inputValue3, inputValue4, inputValue5)
		bit32.bxor(valueValue, 115093482)
		local valueValue2 = valueValue
		local entries = { inputValue2, inputValue3, inputValue4, inputValue5 }
		local maskedBits = 873330988
		local entries2 = { nil, 0, 1, 4, nil }
		local entries3 = entries

		while true do
			local entry = entries2[3]
			local entry2 = entries2[4]
			local sum = entries2[2] + entry
			local matches = entry <= 0
			local invertedFlag = not matches
			local matches2 = sum >= entry2
			local matches3 = sum <= entry2
			matches2 = matches and matches2
			matches2 = matches2 or invertedFlag and matches3
			entries2[2] = sum

			if matches2 then
				local entry3 = entries3[sum]
				local entries4 = { entries2, 1, #entry3 + 0, nil, 0 }

				while true do
					local entry4 = entries4[2]
					local entry5 = entries4[3]
					local sum2 = entries4[5] + entry4
					local matches4 = entry4 <= 0
					local invertedFlag2 = not matches4
					local matches5 = sum2 >= entry5
					local matches6 = sum2 <= entry5
					matches5 = matches4 and matches5
					matches5 = matches5 or invertedFlag2 and matches6
					entries4[5] = sum2

					if matches5 then
						local sum3
						sum3 = sum2
						local maskedBits2
						maskedBits2 = bit32.band(maskedBits, sum3)
						local shiftedBits
						shiftedBits = bit32.lshift(maskedBits2, 1)
						local maskedBits3, sum4

						do
							local packedResults = table.pack(bit32.band(shiftedBits, 4294967295))
							local packedResults2 = table.pack(bit32.band(packedResults[1], 65535))
							local maskedBits4 = bit32.band(63910 * packedResults2[1] + bit32.lshift(bit32.band(63910 * bit32.rshift(packedResults[1], 16) + 11601 * packedResults2[1], 65535), 16), 4294967295)
							local invertedBits = bit32.bnot(sum3)
							local combinedBits = bit32.bor(shiftedBits, invertedBits)
							local packedResults3 = table.pack(bit32.band(shiftedBits, 4294967295))
							local packedResults4 = table.pack(bit32.band(combinedBits, 4294967295))
							local packedResults5 = table.pack(bit32.band(packedResults3[1], 65535))
							local packedResults6 = table.pack(bit32.rshift(packedResults3[1], 16))
							local packedResults7 = table.pack(bit32.band(packedResults4[1], 65535))
							maskedBits3 = bit32.band(packedResults5[1] * packedResults7[1] + bit32.lshift(bit32.band(packedResults5[1] * bit32.rshift(packedResults4[1], 16) + packedResults6[1] * packedResults7[1], 65535), 16), 4294967295)
							local packedResults8 = table.pack(bit32.band(maskedBits3, 4294967295))
							local packedResults9 = table.pack(bit32.band(packedResults8[1], 65535))
							sum4 = maskedBits + maskedBits4 + bit32.band(63909 * packedResults9[1] + bit32.lshift(bit32.band(63909 * bit32.rshift(packedResults8[1], 16) + 11601 * packedResults9[1], 65535), 16), 4294967295)
						end

						local maskedBits5, xorValue, sum5

						do
							local packedResults10 = table.pack(bit32.band(sum3, 4294967295))
							local packedResults11 = table.pack(bit32.band(packedResults10[1], 65535))
							local maskedBits6 = bit32.band(59637 * packedResults11[1] + bit32.lshift(bit32.band(59637 * bit32.rshift(packedResults10[1], 16) + 26647 * packedResults11[1], 65535), 16), 4294967295)
							local packedResults12 = table.pack(bit32.band(maskedBits2, 4294967295))
							local packedResults13 = table.pack(bit32.band(packedResults12[1], 65535))
							local sum6 = maskedBits6 + bit32.band(5898 * packedResults13[1] + bit32.lshift(bit32.band(5898 * bit32.rshift(packedResults12[1], 16) + 38888 * packedResults13[1], 65535), 16), 4294967295)
							local invertedBits2 = bit32.bnot(shiftedBits)
							local xorValue2 = bit32.bxor(shiftedBits, sum3)
							local maskedBits7 = bit32.band(invertedBits2, xorValue2)
							local packedResults14 = table.pack(bit32.band(shiftedBits, 4294967295))
							local packedResults15 = table.pack(bit32.band(maskedBits7, 4294967295))
							local packedResults16 = table.pack(bit32.band(packedResults14[1], 65535))
							local packedResults17 = table.pack(bit32.rshift(packedResults14[1], 16))
							local packedResults18 = table.pack(bit32.band(packedResults15[1], 65535))
							maskedBits5 = bit32.band(packedResults16[1] * packedResults18[1] + bit32.lshift(bit32.band(packedResults16[1] * bit32.rshift(packedResults15[1], 16) + packedResults17[1] * packedResults18[1], 65535), 16), 4294967295)
							local packedResults19 = table.pack(bit32.band(maskedBits5, 4294967295))
							local packedResults20 = table.pack(bit32.band(packedResults19[1], 65535))
							local maskedBits8 = bit32.band(63909 * packedResults20[1] + bit32.lshift(bit32.band(63909 * bit32.rshift(packedResults19[1], 16) + 11601 * packedResults20[1], 65535), 16), 4294967295)
							xorValue = bit32.bxor(bit32.bor(sum3, maskedBits), maskedBits)
							local packedResults21 = table.pack(bit32.band(xorValue, 4294967295))
							local packedResults22 = table.pack(bit32.band(packedResults21[1], 65535))
							local sum7 = sum4 + sum6 + maskedBits8 + bit32.band(5900 * packedResults22[1] + bit32.lshift(bit32.band(5900 * bit32.rshift(packedResults21[1], 16) + 38888 * packedResults22[1], 65535), 16), 4294967295)
							local sum8 = bit32.band(bit32.bxor(sum7, 521530460), 2147483647) + 3669857490
							local maskedBits9 = bit32.band(sum7, 521530460)
							local packedResults23 = table.pack(bit32.band(bit32.bnot(maskedBits9), 4294967295))
							local packedResults24 = table.pack(bit32.band(packedResults23[1], 65535))
							local maskedBits10 = bit32.band(51817 * packedResults24[1] + bit32.lshift(bit32.band(51817 * bit32.rshift(packedResults23[1], 16) + 27998 * packedResults24[1], 65535), 16), 4294967295)
							local packedResults25 = table.pack(bit32.band(bit32.bor(-521530461, sum7), 4294967295))
							local packedResults26 = table.pack(bit32.band(packedResults25[1], 65535))
							sum5 = sum8 + 38177212 + maskedBits10 + bit32.band(51817 * packedResults26[1] + bit32.lshift(bit32.band(51817 * bit32.rshift(packedResults25[1], 16) + 27998 * packedResults26[1], 65535), 16), 4294967295)
						end

						local sum9

						do
							local packedResults27 = table.pack(bit32.band(shiftedBits, 4294967295))
							local packedResults28 = table.pack(bit32.band(packedResults27[1], 65535))
							local maskedBits11 = bit32.band(63910 * packedResults28[1] + bit32.lshift(bit32.band(63910 * bit32.rshift(packedResults27[1], 16) + 11601 * packedResults28[1], 65535), 16), 4294967295)
							local packedResults29 = table.pack(bit32.band(maskedBits3, 4294967295))
							local packedResults30 = table.pack(bit32.band(packedResults29[1], 65535))
							local sum10 = maskedBits + maskedBits11 + bit32.band(63909 * packedResults30[1] + bit32.lshift(bit32.band(63909 * bit32.rshift(packedResults29[1], 16) + 11601 * packedResults30[1], 65535), 16), 4294967295)
							local packedResults31 = table.pack(bit32.band(sum3, 4294967295))
							local packedResults32 = table.pack(bit32.band(packedResults31[1], 65535))
							local maskedBits12 = bit32.band(59637 * packedResults32[1] + bit32.lshift(bit32.band(59637 * bit32.rshift(packedResults31[1], 16) + 26647 * packedResults32[1], 65535), 16), 4294967295)
							local packedResults33 = table.pack(bit32.band(maskedBits2, 4294967295))
							local packedResults34 = table.pack(bit32.band(packedResults33[1], 65535))
							local sum11 = maskedBits12 + bit32.band(5898 * packedResults34[1] + bit32.lshift(bit32.band(5898 * bit32.rshift(packedResults33[1], 16) + 38888 * packedResults34[1], 65535), 16), 4294967295)
							local packedResults35 = table.pack(bit32.band(maskedBits5, 4294967295))
							local packedResults36 = table.pack(bit32.band(packedResults35[1], 65535))
							local maskedBits13 = bit32.band(63909 * packedResults36[1] + bit32.lshift(bit32.band(63909 * bit32.rshift(packedResults35[1], 16) + 11601 * packedResults36[1], 65535), 16), 4294967295)
							local packedResults37 = table.pack(bit32.band(xorValue, 4294967295))
							local packedResults38 = table.pack(bit32.band(packedResults37[1], 65535))
							local packedResults39 = table.pack(bit32.band(sum5 - bit32.band(bit32.bxor(sum10 + sum11 + maskedBits13 + bit32.band(5900 * packedResults38[1] + bit32.lshift(bit32.band(5900 * bit32.rshift(packedResults37[1], 16) + 38888 * packedResults38[1], 65535), 16), 4294967295), 521530460), 2147483647) + 326164782 + 3968802514, 4294967295))
							local packedResults40 = table.pack(bit32.band(packedResults39[1], 65535))
							local maskedBits14 = bit32.band(58174 * packedResults40[1] + bit32.lshift(bit32.band(58174 * bit32.rshift(packedResults39[1], 16) + 50722 * packedResults40[1], 65535), 16), 4294967295)
							local packedResults41 = table.pack(bit32.band(shiftedBits, 4294967295))
							local packedResults42 = table.pack(bit32.band(packedResults41[1], 65535))
							local maskedBits15 = bit32.band(63910 * packedResults42[1] + bit32.lshift(bit32.band(63910 * bit32.rshift(packedResults41[1], 16) + 11601 * packedResults42[1], 65535), 16), 4294967295)
							local packedResults43 = table.pack(bit32.band(maskedBits3, 4294967295))
							local packedResults44 = table.pack(bit32.band(packedResults43[1], 65535))
							local sum12 = maskedBits + maskedBits15 + bit32.band(63909 * packedResults44[1] + bit32.lshift(bit32.band(63909 * bit32.rshift(packedResults43[1], 16) + 11601 * packedResults44[1], 65535), 16), 4294967295)
							local packedResults45 = table.pack(bit32.band(sum3, 4294967295))
							local packedResults46 = table.pack(bit32.band(packedResults45[1], 65535))
							local maskedBits16 = bit32.band(59637 * packedResults46[1] + bit32.lshift(bit32.band(59637 * bit32.rshift(packedResults45[1], 16) + 26647 * packedResults46[1], 65535), 16), 4294967295)
							local maskedBits17 = maskedBits14
							local sum13 = sum12
							local packedResults47 = table.pack(bit32.band(maskedBits2, 4294967295))
							local packedResults48 = table.pack(bit32.band(packedResults47[1], 65535))
							local sum14 = maskedBits16 + bit32.band(5898 * packedResults48[1] + bit32.lshift(bit32.band(5898 * bit32.rshift(packedResults47[1], 16) + 38888 * packedResults48[1], 65535), 16), 4294967295)
							local packedResults49 = table.pack(bit32.band(maskedBits5, 4294967295))
							local packedResults50 = table.pack(bit32.band(packedResults49[1], 65535))
							local maskedBits18 = bit32.band(63909 * packedResults50[1] + bit32.lshift(bit32.band(63909 * bit32.rshift(packedResults49[1], 16) + 11601 * packedResults50[1], 65535), 16), 4294967295)
							local packedResults51 = table.pack(bit32.band(xorValue, 4294967295))
							local packedResults52 = table.pack(bit32.band(packedResults51[1], 65535))
							local sum15 = maskedBits17 + 6739446809 + 6354830034 + 4085592341 + bit32.band(bit32.bxor(sum13 + sum14 + maskedBits18 + bit32.band(5900 * packedResults52[1] + bit32.lshift(bit32.band(5900 * bit32.rshift(packedResults51[1], 16) + 38888 * packedResults52[1], 65535), 16), 4294967295), 521530460), 2147483647)
							entry3[sum3] = bit32.bxor(entry3[sum3], sum15)
							sum9 = sum15
						end

						local sum16, sum17

						do
							local packedResults53 = table.pack(bit32.band(sum3, 4294967295))
							local packedResults54 = table.pack(bit32.band(packedResults53[1], 65535))
							local packedResults55 = table.pack(bit32.band(bit32.band(packedResults54[1] * 54685 + bit32.lshift(bit32.band(packedResults54[1] * 6897 + bit32.rshift(packedResults53[1], 16) * 54685, 65535), 16), 4294967295), 4294967295))
							local packedResults56 = table.pack(bit32.band(packedResults55[1], 65535))
							local sum18 = bit32.band(53103 * packedResults56[1] + bit32.lshift(bit32.band(53103 * bit32.rshift(packedResults55[1], 16) + 20035 * packedResults56[1], 65535), 16), 4294967295) + 2217246156
							local packedResults57 = table.pack(bit32.band(sum3, 4294967295))
							local packedResults58 = table.pack(bit32.band(packedResults57[1], 65535))
							local maskedBits19 = bit32.band(packedResults58[1] * 54685 + bit32.lshift(bit32.band(packedResults58[1] * 6897 + bit32.rshift(packedResults57[1], 16) * 54685, 65535), 16), 4294967295)
							local maskedBits20 = bit32.band(sum9, 521530460)
							local packedResults59 = table.pack(bit32.band(maskedBits19, 4294967295))
							local packedResults60 = table.pack(bit32.band(maskedBits20, 4294967295))
							local packedResults61 = table.pack(bit32.band(packedResults59[1], 65535))
							local packedResults62 = table.pack(bit32.rshift(packedResults59[1], 16))
							local packedResults63 = table.pack(bit32.band(packedResults60[1], 65535))
							local packedResults64 = table.pack(bit32.band(bit32.band(packedResults61[1] * packedResults63[1] + bit32.lshift(bit32.band(packedResults61[1] * bit32.rshift(packedResults60[1], 16) + packedResults62[1] * packedResults63[1], 65535), 16), 4294967295), 4294967295))
							local packedResults65 = table.pack(bit32.band(packedResults64[1], 65535))
							local sum19 = sum18 + 3628156240 + bit32.band(53102 * packedResults65[1] + bit32.lshift(bit32.band(53102 * bit32.rshift(packedResults64[1], 16) + 20035 * packedResults65[1], 65535), 16), 4294967295)
							local packedResults66 = table.pack(bit32.band(maskedBits + 972433322, 4294967295))
							local packedResults67 = table.pack(bit32.band(packedResults66[1], 65535))
							sum16 = bit32.band(65535 * packedResults67[1] + bit32.lshift(bit32.band(65535 * bit32.rshift(packedResults66[1], 16) + 65535 * packedResults67[1], 65535), 16), 4294967295) + bit32.band(sum9, 521530460)
							local packedResults68 = table.pack(bit32.band(sum3, 4294967295))
							local packedResults69 = table.pack(bit32.band(packedResults68[1], 65535))
							local maskedBits21 = bit32.band(packedResults69[1] * 54685 + bit32.lshift(bit32.band(packedResults69[1] * 6897 + bit32.rshift(packedResults68[1], 16) * 54685, 65535), 16), 4294967295)
							local combinedBits2 = bit32.bor(bit32.bxor(sum9, 521530460), -521530461)
							local packedResults70 = table.pack(bit32.band(maskedBits21, 4294967295))
							local packedResults71 = table.pack(bit32.band(combinedBits2, 4294967295))
							local packedResults72 = table.pack(bit32.band(packedResults70[1], 65535))
							local packedResults73 = table.pack(bit32.rshift(packedResults70[1], 16))
							local packedResults74 = table.pack(bit32.band(packedResults71[1], 65535))
							local packedResults75 = table.pack(bit32.band(bit32.band(packedResults72[1] * packedResults74[1] + bit32.lshift(bit32.band(packedResults72[1] * bit32.rshift(packedResults71[1], 16) + packedResults73[1] * packedResults74[1], 65535), 16), 4294967295), 4294967295))
							local packedResults76 = table.pack(bit32.band(packedResults75[1], 65535))
							local maskedBits22 = bit32.band(53102 * packedResults76[1] + bit32.lshift(bit32.band(53102 * bit32.rshift(packedResults75[1], 16) + 20035 * packedResults76[1], 65535), 16), 4294967295)
							local sum20 = sum19
							local packedResults77 = table.pack(bit32.band(sum3, 4294967295))
							local packedResults78 = table.pack(bit32.band(packedResults77[1], 65535))
							local maskedBits23 = bit32.band(packedResults78[1] * 54685 + bit32.lshift(bit32.band(packedResults78[1] * 6897 + bit32.rshift(packedResults77[1], 16) * 54685, 65535), 16), 4294967295)
							local invertedBits3 = bit32.bnot(maskedBits23)
							local packedResults79 = table.pack(bit32.band(bit32.band(maskedBits + 972433322, invertedBits3), 4294967295))
							local packedResults80 = table.pack(bit32.band(packedResults79[1], 65535))
							sum17 = sum20 + sum16 + 2744532196 + maskedBits22 + bit32.band(2 * packedResults80[1] + bit32.lshift(bit32.band(2 * bit32.rshift(packedResults79[1], 16) + 0 * packedResults80[1], 65535), 16), 4294967295)
						end

						local maskedBits24

						do
							local maskedBits25 = bit32.band(sum17, 2147483647)
							local packedResults81 = table.pack(bit32.band(bit32.bnot(maskedBits25), 4294967295))
							local packedResults82 = table.pack(bit32.band(packedResults81[1], 65535))
							local sum21 = 3082915519 + bit32.band(51039 * packedResults82[1] + bit32.lshift(bit32.band(51039 * bit32.rshift(packedResults81[1], 16) + 56288 * packedResults82[1], 65535), 16), 4294967295)
							local packedResults83 = table.pack(bit32.band(bit32.bor(sum17, -2147483648), 4294967295))
							local packedResults84 = table.pack(bit32.band(packedResults83[1], 65535))
							local sum22 = sum21 + 606025888 + bit32.band(51040 * packedResults84[1] + bit32.lshift(bit32.band(51040 * bit32.rshift(packedResults83[1], 16) + 56288 * packedResults84[1], 65535), 16), 4294967295)
							local maskedBits26 = bit32.band(sum17, 2147483647)
							local invertedBits4 = bit32.bnot(maskedBits26)
							local packedResults85 = table.pack(bit32.band(invertedBits4, 4294967295))
							local packedResults86 = table.pack(bit32.band(packedResults85[1], 65535))
							local sum23 = 4206748122 + bit32.band(57818 * packedResults86[1] + bit32.lshift(bit32.band(57818 * bit32.rshift(packedResults85[1], 16) + 64189 * packedResults86[1], 65535), 16), 4294967295)
							local combinedBits3 = bit32.bor(sum17, 2147483647)
							local packedResults87 = table.pack(bit32.band(bit32.bxor(sum17, combinedBits3), 4294967295))
							local packedResults88 = table.pack(bit32.band(packedResults87[1], 65535))
							local packedResults89 = table.pack(bit32.band(sum22 - sum23 + 2235702821 + bit32.band(7717 * packedResults88[1] + bit32.lshift(bit32.band(7717 * bit32.rshift(packedResults87[1], 16) + 1346 * packedResults88[1], 65535), 16), 4294967295), 4294967295))
							local packedResults90 = table.pack(bit32.band(packedResults89[1], 65535))
							maskedBits24 = bit32.band(59431 * packedResults90[1] + bit32.lshift(bit32.band(59431 * bit32.rshift(packedResults89[1], 16) + 38277 * packedResults90[1], 65535), 16), 4294967295)
						end

						local invertedBits5
						invertedBits5 = bit32.bnot(sum17)
						local sum24

						do
							local xorValue3 = bit32.bxor(sum17, 2147483647)
							local combinedBits4 = bit32.bor(invertedBits5, xorValue3)
							local packedResults91 = table.pack(bit32.band(sum17, 4294967295))
							local packedResults92 = table.pack(bit32.band(combinedBits4, 4294967295))
							local packedResults93 = table.pack(bit32.band(packedResults91[1], 65535))
							local packedResults94 = table.pack(bit32.rshift(packedResults91[1], 16))
							local packedResults95 = table.pack(bit32.band(packedResults92[1], 65535))
							local packedResults96 = table.pack(bit32.band(bit32.band(packedResults93[1] * packedResults95[1] + bit32.lshift(bit32.band(packedResults93[1] * bit32.rshift(packedResults92[1], 16) + packedResults94[1] * packedResults95[1], 65535), 16), 4294967295), 4294967295))
							local packedResults97 = table.pack(bit32.band(packedResults96[1], 65535))
							local maskedBits27 = bit32.band(8738 * packedResults97[1] + bit32.lshift(bit32.band(8738 * bit32.rshift(packedResults96[1], 16) + 59016 * packedResults97[1], 65535), 16), 4294967295)
							local packedResults98 = table.pack(bit32.band(bit32.band(sum17, 2147483647), 4294967295))
							local packedResults99 = table.pack(bit32.band(packedResults98[1], 65535))
							sum24 = 3576711829 + maskedBits27 + bit32.band(19094 * packedResults99[1] + bit32.lshift(bit32.band(19094 * bit32.rshift(packedResults98[1], 16) + 21808 * packedResults99[1], 65535), 16), 4294967295)
						end

						local sum25

						do
							local xorValue4 = bit32.bxor(sum17, 2147483647)
							local packedResults100 = table.pack(bit32.band(bit32.bor(invertedBits5, xorValue4), 4294967295))
							local packedResults101 = table.pack(bit32.band(packedResults100[1], 65535))
							local packedResults102 = table.pack(bit32.band(bit32.band(65535 * packedResults101[1] + bit32.lshift(bit32.band(65535 * bit32.rshift(packedResults100[1], 16) + 32767 * packedResults101[1], 65535), 16), 4294967295), 4294967295))
							local packedResults103 = table.pack(bit32.band(packedResults102[1], 65535))
							local maskedBits28 = bit32.band(8738 * packedResults103[1] + bit32.lshift(bit32.band(8738 * bit32.rshift(packedResults102[1], 16) + 59016 * packedResults103[1], 65535), 16), 4294967295)
							local packedResults104 = table.pack(bit32.band(bit32.band(2147483647, invertedBits5), 4294967295))
							local packedResults105 = table.pack(bit32.band(packedResults104[1], 65535))
							sum25 = maskedBits28 + bit32.band(19093 * packedResults105[1] + bit32.lshift(bit32.band(19093 * bit32.rshift(packedResults104[1], 16) + 21808 * packedResults105[1], 65535), 16), 4294967295)
						end

						do
							local maskedBits29 = bit32.band(sum17, 2147483647)
							local xorValue5 = bit32.bxor(sum17, 2147483647)
							local combinedBits5 = bit32.bor(invertedBits5, xorValue5)
							local packedResults106 = table.pack(bit32.band(maskedBits29, 4294967295))
							local packedResults107 = table.pack(bit32.band(combinedBits5, 4294967295))
							local packedResults108 = table.pack(bit32.band(packedResults106[1], 65535))
							local packedResults109 = table.pack(bit32.rshift(packedResults106[1], 16))
							local packedResults110 = table.pack(bit32.band(packedResults107[1], 65535))
							local packedResults111 = table.pack(bit32.band(bit32.band(packedResults108[1] * packedResults110[1] + bit32.lshift(bit32.band(packedResults108[1] * bit32.rshift(packedResults107[1], 16) + packedResults109[1] * packedResults110[1], 65535), 16), 4294967295), 4294967295))
							local packedResults112 = table.pack(bit32.band(packedResults111[1], 65535))
							local maskedBits30 = bit32.band(56798 * packedResults112[1] + bit32.lshift(bit32.band(56798 * bit32.rshift(packedResults111[1], 16) + 6519 * packedResults112[1], 65535), 16), 4294967295)
							local combinedBits6 = bit32.bor(sum17, 2147483647)
							local xorValue6 = bit32.bxor(sum17, 2147483647)
							local combinedBits7 = bit32.bor(invertedBits5, xorValue6)
							local packedResults113 = table.pack(bit32.band(combinedBits6, 4294967295))
							local packedResults114 = table.pack(bit32.band(combinedBits7, 4294967295))
							local packedResults115 = table.pack(bit32.band(packedResults113[1], 65535))
							local packedResults116 = table.pack(bit32.rshift(packedResults113[1], 16))
							local packedResults117 = table.pack(bit32.band(packedResults114[1], 65535))
							local packedResults118 = table.pack(bit32.band(bit32.band(packedResults115[1] * packedResults117[1] + bit32.lshift(bit32.band(packedResults115[1] * bit32.rshift(packedResults114[1], 16) + packedResults116[1] * packedResults117[1], 65535), 16), 4294967295), 4294967295))
							local packedResults119 = table.pack(bit32.band(packedResults118[1], 65535))
							maskedBits = maskedBits24 + sum24 + sum25 + maskedBits30 + bit32.band(56798 * packedResults119[1] + bit32.lshift(bit32.band(56798 * bit32.rshift(packedResults118[1], 16) + 6519 * packedResults119[1], 65535), 16), 4294967295)
						end

						continue
					end

					break
				end

				entries2 = entries4[1]
				continue
			end

			break
		end

		local entry6 = inputValue[6]
		local difference = buffer.len(entry6) - 24 - 20
		local sum26 = 24 + 194384610 % difference
		local numberValue2 = 24

		while true do
			local sum27 = numberValue2 + (sum26 + bit32.band(maskedBits, 255) + 1) % difference
			local readi8Result = buffer.readi8(entry6, sum26)
			local readu32Result = buffer.readu32(entry6, sum27)
			local maskedBits31 = bit32.band(bit32.bxor(bit32.bxor(maskedBits, readi8Result) + bit32.lshift(bit32.band(readu32Result, 255), 3) + 972433322, sum26), 2147483647)
			local writeu16 = buffer.writeu16
			local xorValue7 = bit32.bxor(readi8Result, readu32Result)
			local readu32Result2 = readu32Result
			local combinedBits8 = bit32.bor(bit32.band(bit32.bxor(xorValue7, maskedBits31), 2147483647), 1999678976)
			writeu16(entry6, sum26, combinedBits8)
			local writei8 = buffer.writei8
			local shiftedBits2 = bit32.rshift(maskedBits31, 8)
			local combinedBits9 = bit32.bor(bit32.band(bit32.bxor(bit32.bxor(readu32Result2, shiftedBits2), sum26), 2147483647), 1816115968)
			writei8(entry6, sum27, combinedBits9)
			sum26 = numberValue2 + (sum26 + bit32.band(maskedBits31, 63) + 1) % difference
			maskedBits = maskedBits31
		end
	end

	callbackValue(384196879, {}, {}, {}, {}, {})
	local numberValue2 = 318670691
	local numberValue3 = 984673

	while true do
		numberValue2 += numberValue3
	end
end

checkPreStatus()

local function callbackValue(valueValue)
	local Players, localPlayer, localPlayerValue, playerGui, RunService, VirtualInputManager, GuiService, ReplicatedStorage, UserInputService, HttpService
	local CoreGui, TweenService, TeleportService, Lighting, CollectionService, currentCamera, gotBlinded, enabledValue, valueValue2, sum
	local entries, enabledValue2, espCache, visualSettings, config, callbackValue2, difference, entries2, entries3, entries4
	local vd, thread, sum2, sum3

	do
		local valueValue3 = valueValue
		local numberValue = 3789452486
		Players = game:GetService("Players")
		localPlayer = Players.LocalPlayer
		localPlayerValue = localPlayer
		playerGui = localPlayer.PlayerGui
		RunService = game:GetService("RunService")
		VirtualInputManager = game:GetService("VirtualInputManager")
		GuiService = game:GetService("GuiService")
		ReplicatedStorage = game:GetService("ReplicatedStorage")
		UserInputService = game:GetService("UserInputService")
		HttpService = game:GetService("HttpService")
		CoreGui = game:GetService("CoreGui")
		TweenService = game:GetService("TweenService")
		TeleportService = game:GetService("TeleportService")
		Lighting = game:GetService("Lighting")
		CollectionService = game:GetService("CollectionService")
		local xorValue = bit32.bxor(3642956283, numberValue)
		currentCamera = workspace.CurrentCamera
		local remotes = ReplicatedStorage:WaitForChild("Remotes")
		gotBlinded = remotes:FindFirstChild("Items") and remotes.Items:FindFirstChild("Flashlight") and remotes.Items.Flashlight:FindFirstChild("GotBlinded")
		enabledValue = false
		MoonwalkEnabled = false
		BypassGenEnabled = false
		BypassGenMode = "Manual Repair"
		RepairAnimTrack = nil
		ProcessedGens = {}
		AutoRepairEnabled = false
		valueValue2 = valueValue3
		local sum4 = valueValue2 + xorValue
		AutoRepairThread = nil
		AutoCurrentPoint = nil
		AutoCurrentGenModel = nil
		LastFireTime = 0
		AutoFireInterval = 0.5
		local difference2 = numberValue - bit32.bxor(sum4, 0)
		TouchID = 8822
		ActionPath = "Survivor-mob.Controls.action.check"
		isAimingFlash = false
		FOVEnabled = false
		TargetFOV = 90
		GodMode = false
		NoSlowdownEnabled = false
		BypassGateEnabled = false
		FleeKillerEnabled = false
		FleeDistance = 40
		FleeCooldown = 0
		sum = sum4 + difference2
		HeartbeatConnection = nil
		VisibilityConnection = nil
		currentTarget = nil
		SpeedEnabled = false
		SpeedAmount = 0.02
		SpeedInputEnabled = false
		SpeedInputValue = 0.1
		local xorValue2 = bit32.bxor(sum, 0)
		local xorValue3 = bit32.bxor(difference2, xorValue2)
		SpeedInputConnection = nil
		FullBright = false
		NoFog = false
		NoShadow = false
		bit32.bxor(sum, 0)
		TimeOfDayValue = 14
		autoVaultEnabled = false
		autoPalletSlideEnabled = false
		lastActionTime = 0
		COOLDOWN = 1.5
		EmoteEnabled = false
		SelectedAnim = nil
		SelectedSound = nil
		currentTrack = nil
		currentSound = nil
		entries = {}
		enabledValue2 = false
		ConfigData = { Surv_SkillFrequency = 10, Surv_SkillSpeed = 1 }
		espCache = { Visibility = {}, Generators = {} }
		local xorValue4 = bit32.bxor(sum, 0)
		local packedResults = table.pack(bit32.band(xorValue3, 4294967295))
		local packedResults2 = table.pack(bit32.band(xorValue4, 4294967295))
		local packedResults3 = table.pack(bit32.band(packedResults[1], 65535))
		local packedResults4 = table.pack(bit32.rshift(packedResults[1], 16))
		local packedResults5 = table.pack(bit32.band(packedResults2[1], 65535))
		local maskedBits = bit32.band(packedResults3[1] * packedResults5[1] + bit32.lshift(bit32.band(packedResults3[1] * bit32.rshift(packedResults2[1], 16) + packedResults4[1] * packedResults5[1], 65535), 16), 4294967295)
		espCache.Pallets = {}
		espCache.Hooks = {}
		espCache.Gates = {}
		espCache.Windows = {}
		espCache.SCPs = {}
		local maskedBits2 = maskedBits

		visualSettings = {
			Colors = {
				SCP = Color3.new(1, 1, 0),
				Player = Color3.new(0.62745100259780884, 0.35294118523597717, 1),
				Killer = Color3.new(1, 0.15686275064945221, 0.15686275064945221),
				Generator = Color3.new(1, 1, 1),
				GeneratorDone = Color3.new(0, 0.70588237047195435, 0.23529411852359772),
				Pallet = Color3.new(0, 0.70588237047195435, 0.23529411852359772),
				Hook = Color3.new(0, 0.70588237047195435, 0.23529411852359772),
				Gate = Color3.new(1, 1, 1),
				Window = Color3.new(1, 1, 1),
			},
		}

		isAimbotHolding = false
		lockedTarget = nil

		config = {
			Surv_AutoParry = false,
			Surv_ParrySafety = true,
			Surv_ParryAggressive = true,
			Surv_ParryCircle = true,
			Surv_ParryRadius = 0.6,
			Surv_ParryFace = 10,
			Ignored_Skills_List = {},
			Surv_VaultSpeed = 13,
			Surv_Perks = false,
			LockAim = false,
			Surv_PerfectVault = false,
			Killer_3rdPerson = false,
			Surv_Aimbot_Enabled = false,
			Surv_Aimbot_ShowFOV = true,
			Surv_Aimbot_Radius = 150,
			Surv_Aimbot_MaxDist = 300,
			Surv_Aimbot_Smoothness = 0.5,
			Surv_Aimbot_Predict = 0.01,
			Killer_Aimbot_Enabled = false,
			Killer_Aimbot_MaxDist = 12,
			Killer_Aimbot_Smoothness = 0.5,
		}

		local xorValue5 = bit32.bxor(maskedBits2, 4294967295)
		local difference3 = sum + 1225108239 - 144562929
		config.Misc_FakeName = false
		config.Surv_AutoCrouch = false
		config.Surv_CrouchV = false
		config.InstantTPGate = false
		config.GateClientModule = nil
		config.oldGateNew = nil
		local xorValue6 = xorValue5
		config.oldGateCanUse = nil
		config.HitSoundEnabled = false
		config.HitSoundVolume = 1
		config.HitSoundId = "rbxassetid://106225491596534"
		config.HitSoundCooldown = 0.3
		config.HitSoundLastTime = 0
		config.ESP_Master = false
		config.ESP_Player = false
		config.ESP_Outline = false
		config.ESP_Name = false
		config.ESP_GeneratorName = true
		local sum5 = xorValue5 + bit32.bxor(difference3, 0)
		config.ESP_Distance = false
		config.ESP_Killer = false
		config.ESP_ItemIcon = false
		config.ESP_Generator = false
		config.ESP_Pallet = false
		config.ESP_Hook = false
		config.ESP_KillerWarn = false
		local packedResults6 = table.pack(bit32.band(valueValue2, 4294967295))
		local packedResults7 = table.pack(bit32.band(packedResults6[1], 65535))
		local maskedBits3 = bit32.band(15722 * packedResults7[1] + bit32.lshift(bit32.band(15722 * bit32.rshift(packedResults6[1], 16) + 17704 * packedResults7[1], 65535), 16), 4294967295)
		local packedResults8 = table.pack(bit32.band(bit32.bnot(valueValue2), 4294967295))
		local packedResults9 = table.pack(bit32.band(packedResults8[1], 65535))
		local sum6 = 1030325142 + difference3 + maskedBits3 + bit32.band(15722 * packedResults9[1] + bit32.lshift(bit32.band(15722 * bit32.rshift(packedResults8[1], 16) + 17704 * packedResults9[1], 65535), 16), 4294967295)
		config.ESP_Gate = false
		config.ESP_Window = false
		config.ESP_SCP = false
		Config = config

		local fakePerks = {
			QuickRecoveryEnabled = false,
			PerfectLandingEnabled = false,
			FlowstateEnabled = false,
			PerkCooldown = 10,
			boostActive = false,
			perfectLandingBoostActive = false,
		}

		local xorValue7 = bit32.bxor(sum6, 0)
		local packedResults10 = table.pack(bit32.band(xorValue6, 4294967295))
		local packedResults11 = table.pack(bit32.band(xorValue7, 4294967295))
		local packedResults12 = table.pack(bit32.band(packedResults10[1], 65535))
		local packedResults13 = table.pack(bit32.rshift(packedResults10[1], 16))
		local packedResults14 = table.pack(bit32.band(packedResults11[1], 65535))
		local maskedBits4 = bit32.band(packedResults12[1] * packedResults14[1] + bit32.lshift(bit32.band(packedResults12[1] * bit32.rshift(packedResults11[1], 16) + packedResults13[1] * packedResults14[1], 65535), 16), 4294967295)
		fakePerks.fsOnCooldown = false
		fakePerks.lastQRTime = 0
		fakePerks.lastPLTime = 0
		fakePerks.lastFSTime = 0
		fakePerks.qrConnection = nil
		fakePerks.plConnection = nil
		fakePerks.fsConnection = nil
		fakePerks.fsAnimConnection = nil
		FakePerks = fakePerks
		Connections = { SkillHeartbeat = nil, Stalk = nil }
		local maskedBits5 = maskedBits4
		Auto = { SkillCheck = false, SkillCheckMode = "Legit" }
		local sum7 = sum6 + maskedBits4
		Killer = { BypassLeap = false, AntiBlind = false }
		AutoStalk = { Enabled = false, StalkRange = 150, Target = nil }
		local quotient = maskedBits4 // bit32.bxor(sum7, 0)

		local aimConfig = {
			Aim_Silent = false,
			Pistol_BlockKnocked = false,
			Flash_Silent = false,
			Flash_YOffset = 1.5,
			LockAim = false,
			Pistol_Target = "Survivor",
			Pistol_FOVMode = false,
			Pistol_ShowFOV = false,
			Pistol_FOV = 150,
			Aim_SilentVeil = false,
		}

		local difference4 = maskedBits5 - bit32.bxor(sum7, 0)
		aimConfig.Aim_SilentVeilV2 = false
		aimConfig.Aim_SilentVeilV3 = false
		aimConfig.Veil_ShowFOV = true
		aimConfig.SpearSmart_enable = false
		aimConfig.Veil_FOV = 150
		aimConfig.SPEAR_Speed = 165
		local xorValue8 = bit32.bxor(sum7, 0)
		aimConfig.SPEAR_Gravity = workspace.Gravity * 0.5
		aimConfig.SPEAR_MaxDist = 200
		aimConfig.Veil_LeadMultiplier = 1.4
		aimConfig.AIM_Auto = false
		aimConfig.AIM_TargetPart = "Torso"
		aimConfig.Killer_InfAbyssal = false
		AimConfig = aimConfig
		local sum8 = sum7 + xorValue8
		isChargingSpear = false
		isAttackCooldown = false
		isFiringSpear = false

		callbackValue2 = function()
			return AimConfig.Aim_SilentVeil or AimConfig.Aim_SilentVeilV2
		end

		veilTargetHighlight = Instance.new("Highlight")
		veilTargetHighlight.Name = "VD_VeilTarget"
		veilTargetHighlight.FillColor = Color3.new(0.62745100259780884, 0.35294118523597717, 1)
		veilTargetHighlight.OutlineColor = Color3.new(0.62745100259780884, 0.35294118523597717, 1)
		veilTargetHighlight.FillTransparency = 0.5
		veilTargetHighlight.OutlineTransparency = 0
		VeilTrackerEnabled = false
		SpearInterceptorHooked = false
		local stateValue = { ParryCooldown = false, ParryCooldownTime = 60 }
		local difference5 = difference4 - bit32.bxor(sum8, 0)
		stateValue.busy = false
		stateValue.created = false
		stateValue.LastCrosshairStyle = nil
		local sum9 = sum8 + 1327403806
		stateValue.AutoParryAdornment = nil
		stateValue.ThirdPersonConn = nil
		stateValue.SpooferConns = {}
		stateValue.ItemESPs = {}
		State = stateValue
		local sum10 = xorValue8 + difference5

		local ids = {
			["122812055447896"] = "Veil lunge",
			["133963973694098"] = "Mayers Basic",
			["117042998468241"] = "Mayers lunge",
			["135002183282873"] = "cure lunge",
			["121216847022485"] = "cure Basic",
			["132817836308238"] = "Jeff Basic",
			["129784271201071"] = "Jeff lunge",
			["82666958311998"] = "Jeff Frenzy",
			["78432063483146"] = "Abyssal Basic",
			["118907603246885"] = "Abyssal lunge",
			["139369275981139"] = "Jason Basic",
			["110355011987939"] = "Jason lunge",
		}

		local combinedBits = bit32.bor(difference5, sum10)
		ids["111920872708571"] = "Masked Basic"
		ids["105374834496520"] = "Masked lunge"
		ids["138720291317243"] = "Masked Tony"
		ids["106871536134254"] = "Masked Alex"
		ids["130593238885843"] = "Masked Cobra"
		ids["115244153053858"] = "Masked Cobra lunge"
		ids["74968262036854"] = "Hidden Basic"
		ids["113255068724446"] = "Hidden lunge"
		ids["98163597193511"] = "Hidden S1"
		ids["80411309607666"] = "Abyssal S1"
		difference = sum10 - bit32.bxor(sum9, 0)
		VALID_PARRY_IDS = ids
		AntiAutoParryEnabled = false
		entries2 = {}

		for index in pairs(VALID_PARRY_IDS) do
			table.insert(entries2, index)
		end

		entries3 = {}
		local sum11 = sum9 + combinedBits

		entries4 = {
			["Left Arm"] = true,
			["Right Arm"] = true,
			LeftHand = true,
			RightHand = true,
			LeftLowerArm = true,
			RightLowerArm = true,
			LeftUpperArm = true,
			RightUpperArm = true,
		}

		vd = getgenv().VD or {}
		getgenv().VD = vd
		local xorValue9 = bit32.bxor(sum11, 0)
		local combinedBits2 = bit32.bor(combinedBits, xorValue9)
		vd.KILLER_SilentAimFlask = false
		vd.KILLER_FlaskLaser = false
		vd.KILLER_InfFrenzy = false
		vd.KILLER_InfPursuit = false
		getgenv().NEX_CureFlaskLaserThread = nil
		getgenv().NEX_CureFlaskLaserPart = nil
		getgenv().NEX_JeffCooldownBypassThread = nil
		thread = nil
		local entries5

		entries5 = {
			Attached = {},
			lastTime = 0,
			Cooldown = 0.1,
			Distance = 6,
			Trigger = function()
				local lastTime = entries5.lastTime
				local cooldown = entries5.Cooldown
				if tick() - lastTime < cooldown then
					return
				end
				entries5.lastTime = tick()
				local character = localPlayer.Character
				local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
				if not humanoidRootPart then
					return
				end
				local selectedValue = math.random() > 0.5 and 1 or -1
				local difference6 = humanoidRootPart.CFrame - humanoidRootPart.CFrame.Position
				humanoidRootPart.CFrame = CFrame.new(humanoidRootPart.Position + humanoidRootPart.CFrame.RightVector * selectedValue * entries5.Distance) * difference6
			end,
		}

		sum2 = combinedBits2 + 3345546480

		entries5.Attach = function(inputValue)
			if not inputValue or entries5.Attached[inputValue] then
				return
			end
			entries5.Attached[inputValue] = true
			local humanoid = inputValue:WaitForChild("Humanoid", 5)
			if not humanoid then
				return
			end
			local animator = humanoid:FindFirstChildOfClass("Animator") or humanoid:WaitForChild("Animator", 5)
			if not animator then
				return
			end
			local connection = nil

			connection = humanoid.ChildAdded:Connect(function(child)
				if child:IsA("Animator") then
					entries5.Attached[inputValue] = nil

					if connection then
						connection:Disconnect()
					end

					entries5.Attach(inputValue)
				end
			end)

			inputValue.AncestryChanged:Connect(function(child, parent)
				if not parent then
					entries5.Attached[inputValue] = nil

					if connection then
						connection:Disconnect()
					end
				end
			end)

			animator.AnimationPlayed:Connect(function(inputValue2)
				local numberValue2 = 251133080
				local numberValue3 = 4182665629
				if not Config.Surv_CrouchV then
					return
				end
				local match = (inputValue2.Animation and inputValue2.Animation.AnimationId or ""):match("%d+")
				if match ~= "86266790353635" and match ~= "93136435416899" then
					return
				end
				local character = localPlayer.Character
				character = character and character:FindFirstChild("HumanoidRootPart")
				local humanoidRootPart = inputValue:FindFirstChild("HumanoidRootPart")
				if not (character and humanoidRootPart) then
					return
				end

				if (character.Position - humanoidRootPart.Position).Magnitude > 100 then
					return
				end
				local vector = Vector3.new(character.Position.X - humanoidRootPart.Position.X, 0, character.Position.Z - humanoidRootPart.Position.Z)
				if vector.Magnitude <= 0 then
					return
				end
				local vector2 = Vector3.new(humanoidRootPart.CFrame.LookVector.X, 0, humanoidRootPart.CFrame.LookVector.Z)
				if vector2.Magnitude <= 0.001 then
					return
				end

				if vector2.Unit:Dot(vector.Unit) >= 0.7 then
					entries5.Trigger()
					bit32.bxor(numberValue2 - numberValue3, 459173475)
				end
			end)
		end

		entries5.TryAttach = function(inputValue)
			if inputValue ~= localPlayer and inputValue.Team and inputValue.Team.Name == "Killer" and inputValue.Character then
				entries5.Attach(inputValue.Character)
			end
		end

		entries5.Setup = function(inputValue)
			if inputValue == localPlayer then
				return
			end

			inputValue.CharacterAdded:Connect(function()
				entries5.TryAttach(inputValue)
			end)

			inputValue:GetPropertyChangedSignal("Team"):Connect(function()
				entries5.TryAttach(inputValue)
			end)

			if inputValue.Character then
				entries5.TryAttach(inputValue)
			end
		end

		for _, player in ipairs(Players:GetPlayers()) do
			entries5.Setup(player)
		end

		Players.PlayerAdded:Connect(entries5.Setup)

		local function enableSpooferValue()
			if not Config.Misc_FakeName then
				return
			end
			local playerGui2 = localPlayer:FindFirstChild("PlayerGui")
			if not playerGui2 then
				return
			end

			applySpooferToObj = function(inputValue)
				if inputValue:IsA("TextLabel") or inputValue:IsA("TextButton") or inputValue:IsA("TextBox") then
					local function updateTextValue()
						if not Config.Misc_FakeName then
							return
						end
						local text = inputValue.Text

						if not inputValue:GetAttribute("OriginalText") then
							inputValue:SetAttribute("OriginalText", text)
						end

						local enabledValue3 = false

						for _, player in ipairs(Players:GetPlayers()) do
							if string.find(text, player.Name) or string.find(text, player.DisplayName) then
								local displayName = player.DisplayName
								text = string.gsub(string.gsub(text, player.Name, "Ascend Official"), displayName, "Ascend Official")
								enabledValue3 = true
							end
						end

						if enabledValue3 and inputValue.Text ~= text then
							inputValue.Text = text
						end
					end

					updateText = updateTextValue
					updateText()
					local connection = inputValue:GetPropertyChangedSignal("Text"):Connect(updateText)
					table.insert(State.SpooferConns, connection)
				elseif inputValue:IsA("ImageLabel") or inputValue:IsA("ImageButton") then
					updateImage = function()
						if not Config.Misc_FakeName then
							return
						end
						local image = inputValue.Image
						local enabledValue3 = false

						for _, player in ipairs(Players:GetPlayers()) do
							if string.find(image, tostring(player.UserId)) then
								if not inputValue:GetAttribute("OriginalImage") then
									inputValue:SetAttribute("OriginalImage", image)
								end

								enabledValue3 = true
								break
							end
						end

						if enabledValue3 and inputValue.Image ~= "rbxassetid://108345915439792" then
							inputValue.Image = "rbxassetid://108345915439792"
						end
					end

					updateImage()
					local connection = inputValue:GetPropertyChangedSignal("Image"):Connect(updateImage)
					table.insert(State.SpooferConns, connection)
				end
			end

			for _, descendant in ipairs(playerGui2:GetDescendants()) do
				applySpooferToObj(descendant)
			end

			local connection = playerGui2.DescendantAdded:Connect(function(descendant)
				task.defer(function()
					applySpooferToObj(descendant)
				end)
			end)

			table.insert(State.SpooferConns, connection)
		end

		sum3 = sum11 + sum2
		enableSpoofer = enableSpooferValue
	end

	disableSpoofer = function()
		local numberValue2 = 723984055

		for _, spooferConn in ipairs(State.SpooferConns) do
			if spooferConn.Connected then
				spooferConn:Disconnect()
			end
		end

		table.clear(State.SpooferConns)
		local playerGui2 = localPlayer:FindFirstChild("PlayerGui")

		if playerGui2 then
			for _, descendant in ipairs(playerGui2:GetDescendants()) do
				if descendant:IsA("TextLabel") or descendant:IsA("TextButton") or descendant:IsA("TextBox") then
					local attribute = descendant:GetAttribute("OriginalText")

					if attribute then
						descendant.Text = attribute
						descendant:SetAttribute("OriginalText", nil)
					end
				elseif descendant:IsA("ImageLabel") or descendant:IsA("ImageButton") then
					local attribute = descendant:GetAttribute("OriginalImage")

					if attribute then
						descendant.Image = attribute
						descendant:SetAttribute("OriginalImage", nil)
					end
				end
			end
		end
	end

	IsSafeToParry = function(inputValue)
		if not Config.Surv_ParrySafety then
			return true
		end

		if not inputValue then
			return false
		end
		local checkInterractable = inputValue:FindFirstChild("CheckInterractable")

		if checkInterractable then
			if checkInterractable:GetAttribute("isVaulting") == true then
				return false
			end

			if checkInterractable:GetAttribute("isRepairing") == true then
				return false
			end

			if checkInterractable:GetAttribute("isUnhooking") == true then
				return false
			end

			if checkInterractable:GetAttribute("isHealing") == true then
				return false
			end

			if checkInterractable:GetAttribute("isSliding") == true then
				return false
			end
		end

		return true
	end

	TriggerCrouch = function()
		pcall(function()
			local numberValue2 = 1851521852
			local numberValue3 = 3584617347
			local playerGui2 = localPlayer:FindFirstChild("PlayerGui")

			for match in string.gmatch("Survivor-mob.Controls.crouch.icon", "[^%.]+") do
				playerGui2 = playerGui2 and playerGui2:FindFirstChild(match)
			end

			if playerGui2 and playerGui2:IsA("GuiObject") and playerGui2.Visible and playerGui2.Parent and playerGui2.Parent:IsA("GuiButton") then
				local parent = playerGui2.Parent

				if UserInputService.TouchEnabled and type(firesignal) == "function" then
					firesignal(parent.MouseButton1Click)
					task.wait(1.4)
					firesignal(parent.MouseButton1Click)
					bit32.bxor(numberValue3 - 2862179998, 4272385894)
				else
					VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.LeftControl, false, game)
					task.wait(1.4)
					VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.LeftControl, false, game)
				end
			else
				VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.LeftControl, false, game)
				task.wait(1.4)
				VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.LeftControl, false, game)
			end
		end)
	end

	GetRole = function()
		if not localPlayer.Team then
			return "Unknown"
		end
		local name = localPlayer.Team.Name
		if name == "Killer" then
			return "Killer"
		end

		if name == "Survivors" then
			return "Survivor"
		end
		return "Spectator"
	end

	IsSurvivor = function(inputValue)
		return inputValue and inputValue.Team and inputValue.Team.Name == "Survivors"
	end

	IsKiller = function(inputValue)
		return inputValue and inputValue.Team and inputValue.Team.Name == "Killer"
	end

	IsDowned = function(inputValue)
		if not inputValue then
			return false
		end
		return inputValue:GetAttribute("Knocked") == true or inputValue:GetAttribute("IsHooked") == true
	end

	GetDistance = function(inputValue)
		local humanoidRootPart = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
		if not humanoidRootPart then
			return math.huge
		end
		return (inputValue - humanoidRootPart.Position).Magnitude
	end

	local callbackValue3

	callbackValue3 = function()
		return localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
	end

	local callbackValue4, callbackValue5, callbackValue6, xorValue10

	do
		local xorValue11 = bit32.bxor(sum3, 0)
		local packedResults15 = table.pack(bit32.band(difference, 4294967295))
		local packedResults16 = table.pack(bit32.band(xorValue11, 4294967295))
		local packedResults17 = table.pack(bit32.band(packedResults15[1], 65535))
		local packedResults18 = table.pack(bit32.rshift(packedResults15[1], 16))
		local packedResults19 = table.pack(bit32.band(packedResults16[1], 65535))
		local maskedBits6 = bit32.band(packedResults17[1] * packedResults19[1] + bit32.lshift(bit32.band(packedResults17[1] * bit32.rshift(packedResults16[1], 16) + packedResults18[1] * packedResults19[1], 65535), 16), 4294967295)

		pcall(function()
			Config.GateClientModule = require(game:GetService("ReplicatedStorage").Modules.Items.GateClient)
		end)

		callbackValue4 = function(inputValue)
			for _, item in getgc(true) do
				if typeof(item) == "table" and rawget(item, "gateDuration") and rawget(item, "gateRemote") then
					rawset(item, "gateDuration", inputValue)
				end
			end
		end

		callbackValue5 = function()
			if not Config.GateClientModule then
				return
			end

			if not Config.oldGateNew then
				Config.oldGateNew = Config.GateClientModule.new

				Config.GateClientModule.new = function(...)
					local oldGateNewResult = Config.oldGateNew(...)

					if Config.InstantTPGate then
						oldGateNewResult.gateDuration = 0
					end

					return oldGateNewResult
				end
			end

			if not Config.oldGateCanUse then
				Config.oldGateCanUse = Config.GateClientModule.CanUse

				Config.GateClientModule.CanUse = function(inputValue)
					if Config.InstantTPGate then
						if inputValue.isSilenced or inputValue.isBuffering then
							return false
						end
						local lastUse = inputValue.lastUse
						return os.clock() - lastUse >= inputValue.currentCooldown
					end

					return Config.oldGateCanUse(inputValue)
				end
			end
		end

		callbackValue6 = function()
			if not Config.GateClientModule then
				return
			end

			if Config.oldGateNew then
				Config.GateClientModule.new = Config.oldGateNew
				Config.oldGateNew = nil
			end

			if Config.oldGateCanUse then
				Config.GateClientModule.CanUse = Config.oldGateCanUse
				Config.oldGateCanUse = nil
			end
		end

		UpdateHookData = function()
			for _, player in pairs(Players:GetPlayers()) do
				if player ~= localPlayer and player.Team and player.Team.Name == "Survivors" then
					entries[player.Name] = player:GetAttribute("HookCount") or 0
				end
			end
		end

		CreateHookESP = function(parent, inputValue)
			local numberValue2 = 2857206808
			local numberValue3 = 34784883
			if not enabledValue2 then
				return
			end
			local name = "HookESP_" .. parent.Name
			local findFirstChildResult = parent:FindFirstChild(name)

			if findFirstChildResult then
				findFirstChildResult:Destroy()
			end

			local billboardGui = Instance.new("BillboardGui")
			billboardGui.Name = name
			billboardGui.Parent = parent
			billboardGui.AlwaysOnTop = true
			billboardGui.Size = UDim2.new(0, 60, 0, 18)
			billboardGui.StudsOffset = Vector3.new(0, 5.5, 0)
			local textLabel = Instance.new("TextLabel")
			textLabel.Size = UDim2.new(1, 0, 1, 0)
			textLabel.BackgroundTransparency = 1
			textLabel.Font = Enum.Font.GothamBold
			textLabel.TextSize = 11
			textLabel.TextScaled = true
			textLabel.Text = string.format("Hooked %d", inputValue)
			textLabel.TextXAlignment = Enum.TextXAlignment.Center
			textLabel.TextYAlignment = Enum.TextYAlignment.Center
			textLabel.Parent = billboardGui

			if inputValue >= 3 then
				textLabel.TextColor3 = Color3.new(1, 0.19607843458652496, 0.19607843458652496)
			elseif inputValue >= 2 then
				textLabel.TextColor3 = Color3.new(1, 0.78431373834609985, 0.19607843458652496)
			else
				textLabel.TextColor3 = Color3.new(0.78431373834609985, 0.78431373834609985, 0.78431373834609985)
			end

			local uiStroke = Instance.new("UIStroke")
			uiStroke.Color = Color3.new(0, 0, 0)
			uiStroke.Thickness = 2
			uiStroke.Transparency = 0.5
			uiStroke.Parent = textLabel
			bit32.bxor(numberValue2, 842386655)
		end

		UpdateHookESP = function()
			if not enabledValue2 then
				return
			end

			for _, player in pairs(Players:GetPlayers()) do
				if player ~= localPlayer and player.Character then
					if not IsKiller(player) then
						CreateHookESP(player.Character, entries[player.Name] or player:GetAttribute("HookCount") or 0)
					end
				end
			end
		end

		ClearHookESP = function()
			for _, player in pairs(Players:GetPlayers()) do
				if player.Character then
					for _, child in pairs(player.Character:GetChildren()) do
						if string.match(child.Name, "^HookESP_") then
							child:Destroy()
						end
					end
				end
			end
		end

		xorValue10 = maskedBits6 + sum2
	end

	SetupHookDetection = function()
		for _, player in pairs(Players:GetPlayers()) do
			if player ~= localPlayer then
				player:GetAttributeChangedSignal("HookCount"):Connect(function()
					local entries6 = entries
					local name = player.Name
					entries6[name] = player:GetAttribute("HookCount") or 0

					if enabledValue2 then
						UpdateHookESP()
					end
				end)
			end
		end
	end

	Players.PlayerAdded:Connect(function(player)
		player:GetAttributeChangedSignal("HookCount"):Connect(function()
			entries[player.Name] = player:GetAttribute("HookCount") or 0

			if enabledValue2 then
				UpdateHookESP()
			end
		end)
	end)

	task.spawn(function()
		task.wait(2)
		SetupHookDetection()
	end)

	task.spawn(function()
		while true do
			task.wait(1)

			if enabledValue2 then
				UpdateHookData()
				UpdateHookESP()
			else
				ClearHookESP()
			end
		end
	end)

	PlayHitSound = function()
		if not Config.HitSoundEnabled then
			return
		end
		local now = tick()
		if now - Config.HitSoundLastTime < Config.HitSoundCooldown then
			return
		end
		Config.HitSoundLastTime = now

		pcall(function()
			local sound = Instance.new("Sound")
			sound.SoundId = Config.HitSoundId
			sound.Volume = Config.HitSoundVolume
			sound.PlayOnRemove = true
			sound.Parent = workspace.CurrentCamera or workspace
			sound:Play()

			local function taskCallback()
				if sound and sound.Parent then
					sound:Destroy()
				end
			end

			task.delay(sound.TimeLength + 0.1, taskCallback)
		end)
	end

	getgenv().AutoRunMobileEnabled = false
	local callbackValue7

	do
		local thread2 = nil

		local function callbackValue8()
			local playerGui2 = localPlayer:FindFirstChild("PlayerGui")
			if not playerGui2 then
				return nil
			end
			local survivorMob = playerGui2:FindFirstChild("Survivor-mob")
			if not survivorMob then
				return nil
			end
			local controls = survivorMob:FindFirstChild("Controls")
			if not controls then
				return nil
			end
			local sprint = controls:FindFirstChild("sprint")
			if not sprint then
				return nil
			end

			if sprint:IsA("GuiButton") then
				return sprint
			end
			local icon = sprint:FindFirstChild("icon")
			if icon and icon:IsA("GuiButton") then
				return icon
			end

			if icon and icon.Parent and icon.Parent:IsA("GuiButton") then
				return icon.Parent
			end

			if sprint.Parent and sprint.Parent:IsA("GuiButton") then
				return sprint.Parent
			end
			return sprint
		end

		local function callbackValue9()
			local valueValue4 = callbackValue8()
			if not valueValue4 then
				return false
			end

			pcall(function()
				local numberValue2 = 3706001041
				local numberValue3 = 3367473139

				if type(firesignal) == "function" then
					firesignal(valueValue4.MouseButton1Click)
					firesignal(valueValue4.MouseButton1Down)
					task.wait(0.04)
					firesignal(valueValue4.MouseButton1Up)
				else
					local absolutePosition = valueValue4.AbsolutePosition
					local absoluteSize = valueValue4.AbsoluteSize
					local guiInset = GuiService:GetGuiInset()
					local sum12 = absolutePosition.X + absoluteSize.X / 2 + guiInset.X
					local y = absolutePosition.Y
					local y2 = absoluteSize.Y
					local xorValue12 = bit32.bxor(numberValue2, numberValue3)
					local sum13 = y + y2 / 2 + guiInset.Y
					VirtualInputManager:SendTouchEvent(9901, 0, sum12, sum13)
					task.wait(0.04)
					VirtualInputManager:SendTouchEvent(9901, 2, sum12, sum13)
				end
			end)

			return true
		end

		local function callbackValue10()
			local character = localPlayer.Character
			if not character then
				return false
			end
			local humanoid = character:FindFirstChildOfClass("Humanoid")
			if not humanoid then
				return false
			end

			if humanoid.MoveDirection.Magnitude > 0.12 then
				return true
			end
			local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

			if humanoidRootPart then
				local assemblyLinearVelocity = humanoidRootPart.AssemblyLinearVelocity
				if Vector3.new(assemblyLinearVelocity.X, 0, assemblyLinearVelocity.Z).Magnitude > 1.5 then
					return true
				end
			end

			return false
		end

		local function callbackValue11()
			local character = localPlayer.Character
			if not character then
				return false
			end
			return character:GetAttribute("Crouching") == true or character:GetAttribute("Crouchingserver") == true
		end

		local function callbackValue12()
			local character = localPlayer.Character
			if not character then
				return false
			end
			return character:GetAttribute("Sprinting") == true or character:GetAttribute("IsRunning") == true
		end

		callbackValue7 = function()
			if thread2 then
				return
			end

			thread2 = task.spawn(function()
				while getgenv().AutoRunMobileEnabled do
					local valueValue4 = callbackValue10()
					local valueValue5 = callbackValue11()
					local valueValue6 = callbackValue12()

					if valueValue5 then
						if valueValue6 then
							callbackValue9()
						end
					elseif valueValue4 and not valueValue6 then
						callbackValue9()
					elseif not valueValue4 and valueValue6 then
						callbackValue9()
					end

					task.wait(0.12)
				end

				if callbackValue12() then
					callbackValue9()
				end

				thread2 = nil
			end)
		end
	end

	local difference6
	difference6 = sum3 + sum2
	local callbackValue13

	callbackValue13 = function()
		getgenv().AutoRunMobileEnabled = false
	end

	State.RandomMode_IsNormal = false

	do
		local function callbackValue14(inputValue)
			local spawn_ = task.spawn
			local xorValue12 = 531352810

			local function callbackValue15()
				local remotes = game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 10)
				bit32.bxor(xorValue12, 0)
				remotes = remotes and remotes:WaitForChild("KillerPerks", 5)
				remotes = remotes and remotes:WaitForChild("kingscourge", 5)
				remotes = remotes and remotes:WaitForChild("KingScourgeStart", 5)

				if remotes then
					remotes.OnClientEvent:Connect(function()
						if Auto.SkillCheckMode == "Random" then
							State.RandomMode_IsNormal = true
						end
					end)
				end
			end

			local xorValue13 = bit32.bxor(inputValue, 54341998)
			xorValue12 = bit32.bxor(xorValue12, xorValue13)
			spawn_(callbackValue15)
		end

		local xorValue12 = bit32.bxor(difference6, 2719630879)
		callbackValue14(xorValue12)
	end

	local callbackValue15

	local function callbackValue16()
		if not playerGui then
			return nil
		end
		local survivorMob = playerGui:FindFirstChild("Survivor-mob")
		if not survivorMob then
			return nil
		end
		local controls = survivorMob:FindFirstChild("Controls")
		if not controls then
			return nil
		end
		return controls:FindFirstChild("action") or controls:FindFirstChild("check")
	end

	callbackValue15 = function()
		local valueValue4 = callbackValue16()

		if valueValue4 and valueValue4:IsA("GuiObject") and valueValue4.Visible then
			if type(firesignal) == "function" then
				pcall(function()
					firesignal(valueValue4.MouseButton1Down)
					task.wait(0.005)
					firesignal(valueValue4.MouseButton1Up)
				end)

				return true
			end
		end

		if valueValue4 and valueValue4:IsA("GuiObject") and valueValue4.Visible then
			pcall(function()
				local absolutePosition = valueValue4.AbsolutePosition
				local absoluteSize = valueValue4.AbsoluteSize
				local guiInset = GuiService:GetGuiInset()
				local sum12 = 8822 + math.random(1, 9999)
				VirtualInputManager:SendTouchEvent(sum12, 0, absolutePosition.X + absoluteSize.X / 2 + guiInset.X, absolutePosition.Y + absoluteSize.Y / 2 + guiInset.Y)
				task.wait(0.005)
				VirtualInputManager:SendTouchEvent(sum12, 2, absolutePosition.X + absoluteSize.X / 2 + guiInset.X, absolutePosition.Y + absoluteSize.Y / 2 + guiInset.Y)
			end)

			return true
		end

		pcall(function()
			VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
			task.wait(0.005)
			VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
		end)

		return true
	end

	local callbackValue17

	callbackValue17 = function()
		if Connections.SkillHeartbeat then
			Connections.SkillHeartbeat:Disconnect()
		end

		Connections.SkillHeartbeat = RunService.Heartbeat:Connect(function()
			local numberValue2 = 3821906987
			local numberValue3 = 2449936067
			if not Auto.SkillCheck or State.busy then
				return
			end
			local skillCheckPromptGui = playerGui:FindFirstChild("SkillCheckPromptGui")
			if not skillCheckPromptGui then
				return
			end
			local check = skillCheckPromptGui:FindFirstChild("Check")
			if not check or not check.Visible then
				State.RandomMode_IsNormal = false
				return
			end
			local line = check:FindFirstChild("Line")
			local goal = check:FindFirstChild("Goal")
			if not line or not goal then
				return
			end

			if Auto.SkillCheckMode == "Instant" or Auto.SkillCheckMode == "Random" and not State.RandomMode_IsNormal then
				line.Rotation = goal.Rotation + 109
				State.busy = true
				State.busyTime = tick()
				local numberValue4 = 187553171

				local function taskCallback()
					callbackValue15()
					task.wait(0.05)
					local matches = bit32.bxor(numberValue4, 0) == 60737852
					State.busy = false
				end

				numberValue4 = 118485696
				task.spawn(taskCallback)
			else
				local randomModeIsNormal = Auto.SkillCheckMode == "Normal" or Auto.SkillCheckMode == "Random" and State.RandomMode_IsNormal
				local remainder = line.Rotation % 360
				local remainder2 = goal.Rotation % 360
				local remainder3, remainder4

				if randomModeIsNormal then
					remainder3 = (remainder2 + 116) % 360
					remainder4 = (remainder2 + 140) % 360
				else
					remainder3 = (remainder2 + 102) % 360
					remainder4 = (remainder2 + 116) % 360
				end

				local selectedValue

				if remainder4 < remainder3 then
					selectedValue = remainder >= remainder3 or remainder <= remainder4
				else
					selectedValue = remainder >= remainder3 and remainder <= remainder4
				end

				if selectedValue then
					State.busy = true
					local spawn_ = task.spawn
					local xorValue13 = 442214211

					local function callbackValue18()
						callbackValue15()
						local wait = task.wait
						local matches = bit32.bxor(xorValue13, 0) == 421564442
						wait(0.05)
						State.busy = false
					end

					xorValue13 = bit32.bxor(xorValue13, numberValue3 - 2031504611)
					spawn_(callbackValue18)
				end
			end
		end)
	end

	local callbackValue18, callbackValue19, callbackValue20, callbackValue21, xorValue13, frame, sum12, frame2, createBillboardGui, valueValue4
	local maskedBits7, bypassGenEnabled, difference7, callbackValue22, sum13

	do
		local function callbackValue23()
			local callbackValue24 = callbackValue3
			local valueValue5 = callbackValue3()
			if not valueValue5 then
				return nil
			end
			local huge = math.huge
			local item = nil

			for _, player in pairs(Players:GetPlayers()) do
				if player ~= localPlayer and player.Character then
					local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
					local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")

					if humanoid and humanoidRootPart and humanoid.Health > 30 then
						local magnitude = (humanoidRootPart.Position - valueValue5.Position).Magnitude

						if magnitude <= AutoStalk.StalkRange and magnitude < huge then
							huge = magnitude
							item = player
						end
					end
				end
			end

			return item
		end

		getTargetPartObject = function(inputValue)
			if AimConfig.AIM_TargetPart == "Head" then
				return inputValue:FindFirstChild("Head")
			end

			if AimConfig.AIM_TargetPart == "Root" or AimConfig.AIM_TargetPart == "HumanoidRootPart" then
				return inputValue:FindFirstChild("HumanoidRootPart")
			end
			return inputValue:FindFirstChild("Torso") or inputValue:FindFirstChild("UpperTorso") or inputValue:FindFirstChild("HumanoidRootPart")
		end

		getClosestSurvivor = function()
			local numberValue2 = 3168356571
			local numberValue3 = 197901674
			local character = localPlayerValue.Character
			character = character and character:FindFirstChild("HumanoidRootPart")
			if not character then
				return nil
			end
			local veilFov = AimConfig.Veil_FOV
			local currentCamera2 = workspace.CurrentCamera
			local vector2 = Vector2.new(currentCamera2.ViewportSize.X / 2, currentCamera2.ViewportSize.Y / 2)
			local getTargetPartObjectResult = nil

			for _, player in ipairs(Players:GetPlayers()) do
				if player ~= localPlayerValue and player.Team and player.Team.Name == "Survivors" and player.Character then
					local character2 = player.Character
					local humanoid = character2:FindFirstChildOfClass("Humanoid")
					local getTargetPartObjectResult2 = getTargetPartObject(character2)

					if humanoid and humanoid.Health > 0 and getTargetPartObjectResult2 then
						if (getTargetPartObjectResult2.Position - character.Position).Magnitude <= AimConfig.SPEAR_MaxDist then
							local screenPosition, valueValue5 = currentCamera2:WorldToViewportPoint(getTargetPartObjectResult2.Position)

							if valueValue5 then
								local magnitude = (Vector2.new(screenPosition.X, screenPosition.Y) - vector2).Magnitude

								if magnitude <= veilFov then
									veilFov = magnitude
									getTargetPartObjectResult = getTargetPartObjectResult2
								end
							end
						end
					end
				end
			end

			return getTargetPartObjectResult
		end

		local function callbackValue24()
			return localPlayer.Team and localPlayer.Team.Name == "Survivors"
		end

		local function callbackValue25(inputValue)
			local humanoid = inputValue:FindFirstChildOfClass("Humanoid")
			if not humanoid then
				return false
			end
			local animator = humanoid:FindFirstChildOfClass("Animator")
			if not animator then
				return false
			end

			for _, item in ipairs(animator:GetPlayingAnimationTracks()) do
				if item.Animation and string.find(tostring(item.Animation.AnimationId), "126081405469607") then
					return true
				end
			end

			return false
		end

		local function callbackValue26(inputValue)
			if not FakePerks.QuickRecoveryEnabled then
				return
			end

			if not callbackValue24() then
				return
			end

			if FakePerks.boostActive then
				return
			end
			local lastQRTime = FakePerks.lastQRTime
			if tick() - lastQRTime < FakePerks.PerkCooldown then
				return
			end
			FakePerks.boostActive = true
			FakePerks.lastQRTime = tick()
			local now = tick()

			task.spawn(function()
				while FakePerks.QuickRecoveryEnabled and tick() - now < 3 do
					if inputValue and inputValue.Parent then
						inputValue:SetAttribute("speedboost", 1.4)
					end

					task.wait()
				end

				if inputValue and inputValue.Parent then
					inputValue:SetAttribute("speedboost", 1)
				end

				FakePerks.boostActive = false
			end)
		end

		local function callbackValue27(inputValue)
			if FakePerks.qrConnection then
				FakePerks.qrConnection:Disconnect()
				FakePerks.qrConnection = nil
			end

			if not inputValue then
				return
			end

			FakePerks.qrConnection = inputValue:GetAttributeChangedSignal("isvaulting"):Connect(function()
				if inputValue:GetAttribute("isvaulting") == true then
					task.spawn(function()
						task.wait(0.05)
						local valueValue5 = callbackValue25(inputValue)

						if not valueValue5 then
							task.wait(0.05)
							valueValue5 = callbackValue25(inputValue)
						end

						if not valueValue5 and inputValue:GetAttribute("isvaulting") == true then
							callbackValue26(inputValue)
						end
					end)
				end
			end)
		end

		FakePerks.ToggleQuickRecovery = function(quickRecoveryEnabled)
			FakePerks.QuickRecoveryEnabled = quickRecoveryEnabled

			if quickRecoveryEnabled and localPlayer.Character then
				callbackValue27(localPlayer.Character)
			elseif not quickRecoveryEnabled and FakePerks.qrConnection then
				FakePerks.qrConnection:Disconnect()
				FakePerks.qrConnection = nil
			end

			Library:Notify({ Title = "Fake Quick Recovery", Description = quickRecoveryEnabled and "AKTIF" or "NONAKTIF", Time = 2 })
		end

		local function callbackValue28(inputValue)
			if not FakePerks.PerfectLandingEnabled then
				return
			end

			if not callbackValue24() then
				return
			end

			if FakePerks.perfectLandingBoostActive then
				return
			end
			local lastPLTime = FakePerks.lastPLTime
			if tick() - lastPLTime < FakePerks.PerkCooldown then
				return
			end
			FakePerks.perfectLandingBoostActive = true
			FakePerks.lastPLTime = tick()
			local now = tick()

			task.spawn(function()
				while FakePerks.perfectLandingBoostActive and tick() - now < 3 do
					if inputValue and inputValue.Parent then
						inputValue:SetAttribute("speedboost", 1.4)
					end

					task.wait()
				end

				if inputValue and inputValue.Parent then
					inputValue:SetAttribute("speedboost", 1)
				end

				FakePerks.perfectLandingBoostActive = false
			end)
		end

		local function callbackValue29(inputValue)
			if FakePerks.plConnection then
				FakePerks.plConnection:Disconnect()
				FakePerks.plConnection = nil
			end

			if not inputValue then
				return
			end

			FakePerks.plConnection = inputValue:GetAttributeChangedSignal("speedboost"):Connect(function()
				if not callbackValue24() then
					return
				end

				if inputValue:GetAttribute("speedboost") == 0.625 then
					callbackValue28(inputValue)
				end
			end)
		end

		FakePerks.TogglePerfectLanding = function(perfectLandingEnabled)
			FakePerks.PerfectLandingEnabled = perfectLandingEnabled

			if perfectLandingEnabled then
				if localPlayer.Character then
					callbackValue29(localPlayer.Character)
				end
			else
				if FakePerks.plConnection then
					FakePerks.plConnection:Disconnect()
					FakePerks.plConnection = nil
				end

				if FakePerks.perfectLandingBoostActive and localPlayer.Character then
					localPlayer.Character:SetAttribute("speedboost", 1)
					FakePerks.perfectLandingBoostActive = false
				end
			end

			Library:Notify({ Title = "Fake Perfect Landing", Description = perfectLandingEnabled and "AKTIF" or "NONAKTIF", Time = 2 })
		end

		local function callbackValue30(inputValue)
			local numberValue2 = 2754578615

			if FakePerks.fsConnection then
				FakePerks.fsConnection:Disconnect()
				FakePerks.fsConnection = nil
			end

			local fsAnimConnection = FakePerks.fsAnimConnection
			local maskedBits8 = bit32.band(numberValue2, 1980944324)

			if fsAnimConnection then
				FakePerks.fsAnimConnection:Disconnect()
				FakePerks.fsAnimConnection = nil
			end

			if not inputValue then
				return
			end
			local humanoid = inputValue:WaitForChild("Humanoid", 3)
			if not humanoid then
				return
			end
			local animator = humanoid:WaitForChild("Animator", 3)
			if not animator then
				return
			end
			local fakePerks2 = FakePerks
			local animationPlayed = animator.AnimationPlayed
			local connect = animationPlayed.Connect
			local xorValue14 = 342994741

			local function callbackValue31(inputValue2)
				if not inputValue2.Animation then
					return
				end
				local matches = inputValue2.Animation.AnimationId ~= "rbxassetid://136962284480779"
				local sum14 = bit32.bxor(xorValue14, 0) + 85169351
				if matches then
					return
				end
				local connection = nil

				connection = inputValue2.Stopped:Connect(function()
					if connection then
						connection:Disconnect()
					end

					FakePerks.lastFSTime = tick()
					FakePerks.fsOnCooldown = true

					if inputValue and inputValue.Parent then
						inputValue:SetAttribute("Flowstate", false)
					end

					task.delay(FakePerks.PerkCooldown, function()
						FakePerks.fsOnCooldown = false

						if FakePerks.FlowstateEnabled and inputValue and inputValue.Parent then
							inputValue:SetAttribute("Flowstate", true)
						end
					end)
				end)
			end

			xorValue14 = bit32.bxor(xorValue14, maskedBits8 - 528109012)
			fakePerks2.fsAnimConnection = connect(animationPlayed, callbackValue31)
			local numberValue3 = 451963786

			local function callbackValue32()
				if not FakePerks.FlowstateEnabled then
					return
				end
				local invertedFlag = not callbackValue24()
				local matches = bit32.bxor(bit32.bxor(numberValue3, 0), 386338122) ~= 37122706
				if invertedFlag then
					return
				end
				local attribute = inputValue:GetAttribute("Flowstate")

				if attribute == true then
					local fsOnCooldown = FakePerks.fsOnCooldown

					if not fsOnCooldown then
						local lastFSTime = FakePerks.lastFSTime
						fsOnCooldown = tick() - lastFSTime < FakePerks.PerkCooldown
					end

					if fsOnCooldown then
						inputValue:SetAttribute("Flowstate", false)
					end
				elseif attribute == false then
					local invertedFlag2 = not FakePerks.fsOnCooldown
					local matches2

					if invertedFlag2 then
						local lastFSTime = FakePerks.lastFSTime
						matches2 = tick() - lastFSTime >= FakePerks.PerkCooldown
					else
						matches2 = invertedFlag2
					end

					if matches2 then
						inputValue:SetAttribute("Flowstate", true)
					end
				end
			end

			numberValue3 = 355565528
			FakePerks.fsConnection = inputValue:GetAttributeChangedSignal("Flowstate"):Connect(callbackValue32)
			task.wait(0.5)

			if FakePerks.FlowstateEnabled and inputValue and inputValue.Parent then
				inputValue:SetAttribute("Flowstate", true)
			end
		end

		local function toggleFlowstate(flowstateEnabled)
			FakePerks.FlowstateEnabled = flowstateEnabled

			if flowstateEnabled then
				if localPlayer.Character then
					callbackValue30(localPlayer.Character)
				end
			else
				if FakePerks.fsConnection then
					FakePerks.fsConnection:Disconnect()
					FakePerks.fsConnection = nil
				end

				if FakePerks.fsAnimConnection then
					FakePerks.fsAnimConnection:Disconnect()
					FakePerks.fsAnimConnection = nil
				end

				if localPlayer.Character then
					localPlayer.Character:SetAttribute("Flowstate", false)
				end
			end

			Library:Notify({ Title = "Fake Flowstate", Description = flowstateEnabled and "AKTIF" or "NONAKTIF", Time = 2 })
		end

		local quotient2 = sum2 // 185
		FakePerks.ToggleFlowstate = toggleFlowstate

		local function callbackValue31(character)
			task.wait(0.5)

			if FakePerks.QuickRecoveryEnabled then
				callbackValue27(character)
			end

			if FakePerks.PerfectLandingEnabled then
				callbackValue29(character)
			end

			if FakePerks.FlowstateEnabled then
				callbackValue30(character)
			end
		end

		if localPlayer.Character then
			callbackValue31(localPlayer.Character)
			difference6 = difference6 + quotient2 - 18061359
		end

		localPlayer.CharacterAdded:Connect(callbackValue31)

		callbackValue18 = function()
			if Connections.Stalk then
				return
			end

			Connections.Stalk = RunService.Heartbeat:Connect(function()
				if not AutoStalk.Enabled then
					return
				end
				local callbackValue32 = callbackValue23
				local valueValue5 = callbackValue23()
				if not valueValue5 or not valueValue5.Character then
					return
				end
				local startStalking = ReplicatedStorage:FindFirstChild("Remotes", true) and ReplicatedStorage.Remotes:FindFirstChild("Killers", true) and ReplicatedStorage.Remotes.Killers:FindFirstChild("Stalker", true) and ReplicatedStorage.Remotes.Killers.Stalker:FindFirstChild("StartStalking")

				if startStalking then
					pcall(function()
						startStalking:FireServer(valueValue5)
					end)
				end
			end)
		end

		callbackValue19 = function()
			if Connections.Stalk then
				Connections.Stalk:Disconnect()
				Connections.Stalk = nil
			end
		end

		callbackValue20 = function()
			local valueValue5 = callbackValue3()
			if not valueValue5 then
				return
			end
			local item = nil

			for _, descendant in ipairs(workspace:GetDescendants()) do
				if string.lower(descendant.Name) == "fininshline" and descendant:IsA("BasePart") then
					item = descendant
					break
				else
					item = nil
				end
			end

			if not item then
				warn("fininshline not found")
				return
			end
			valueValue5.CFrame = item.CFrame + Vector3.new(0, 5, 0)
		end

		local settings = { Enabled = false }

		callbackValue21 = function()
			local localPlayer2 = game.Players.LocalPlayer

			local function callbackValue32()
				while true do
					task.wait()
					if not (localPlayer2.Character and localPlayer2.Character:FindFirstChild("HumanoidRootPart") and localPlayer2.Character:FindFirstChild("Right Leg")) then
						continue
					end
					break
				end

				task.wait(0.1)
				local character = localPlayer2.Character

				pcall(function()
					local numberValue2 = 899496176
					character.Head.Transparency = 1
					local face = character.Head:FindFirstChild("face")

					if face then
						face:Destroy()
					end

					character["Right Leg"].Transparency = 1
					local meshPart = Instance.new("MeshPart")
					meshPart.Name = "KorlessHead"
					meshPart.Size = Vector3.new(1.05, 1.05, 1.05)
					meshPart.CanCollide = false
					meshPart.MeshId = "rbxassetid://902942096"
					meshPart.TextureID = "rbxassetid://902843398"
					meshPart.CFrame = character["Right Leg"].CFrame * CFrame.new(0, 0.5, 0)
					meshPart.Parent = character
					local weldConstraint = Instance.new("WeldConstraint")
					weldConstraint.Part0 = character["Right Leg"]
					weldConstraint.Part1 = meshPart
					local packedResults20 = table.pack(bit32.band(numberValue2, 4294967295))
					local packedResults21 = table.pack(bit32.band(packedResults20[1], 65535))
					bit32.band(packedResults21[1] * 23544 + bit32.lshift(bit32.band(packedResults21[1] * 0 + bit32.rshift(packedResults20[1], 16) * 23544, 65535), 16), 4294967295)
					weldConstraint.Parent = meshPart
				end)
			end

			callbackValue32()

			if settings.Connection then
				settings.Connection:Disconnect()
			end

			settings.Connection = localPlayer2.CharacterAdded:Connect(function()
				task.wait(1)
				callbackValue32()
			end)
		end

		local timestamp = 0

		ScanMap = function()
			local numberValue2 = 4140899309
			local numberValue3 = 3239482301
			if tick() - timestamp < 2 then
				return
			end
			timestamp = tick()
			table.clear(espCache.Generators)
			table.clear(espCache.Windows)
			local clear = table.clear
			local combinedBits3 = bit32.bor(numberValue3, 25300015)
			clear(espCache.Pallets)
			table.clear(espCache.Hooks)
			table.clear(espCache.Gates)
			table.clear(espCache.SCPs)
			local descendants = (workspace:FindFirstChild("Map") or workspace):GetDescendants()

			for index2, descendant in ipairs(descendants) do
				if index2 % 200 == 0 then
					task.wait()
				end

				if descendant:IsA("Model") then
					local lowerResult = string.lower(descendant.Name)

					if lowerResult == "generator" then
						local basePart = descendant:FindFirstChildWhichIsA("BasePart")

						if basePart then
							table.insert(espCache.Generators, { model = descendant, part = basePart })
						end
					elseif lowerResult == "hook" and descendant:FindFirstChild("HookPoint") then
						table.insert(espCache.Hooks, descendant)
					elseif lowerResult == "gate" and descendant:FindFirstChild("ExitLever") then
						table.insert(espCache.Gates, descendant)
					elseif lowerResult == "window" then
						table.insert(espCache.Windows, descendant)
					end
				elseif descendant:IsA("BasePart") and descendant.Name == "PrimaryPartPallet" then
					local parent = descendant.Parent

					if parent and not table.find(espCache.Pallets, parent) then
						table.insert(espCache.Pallets, parent)
					end
				end
			end

			local descendants2 = workspace:GetDescendants()

			for index3, item in ipairs(descendants2) do
				if index3 % 200 == 0 then
					task.wait()
				end

				if item:IsA("Model") and string.match(string.lower(item.Name), "^scp") then
					if not table.find(espCache.SCPs, item) then
						table.insert(espCache.SCPs, item)
					end
				end
			end
		end

		local items = ReplicatedStorage:WaitForChild("Items", 5)

		extractAssetId = function(inputValue)
			return tostring(inputValue):match("%d+")
		end

		getItemIcon = function(inputValue)
			if not items then
				return nil
			end
			local findFirstChildResult = items:FindFirstChild(inputValue)
			if not findFirstChildResult then
				return nil
			end
			local texture = nil

			pcall(function()
				texture = findFirstChildResult.Texture or findFirstChildResult.Image
			end)

			if texture and texture ~= "" then
				local extractAssetIdResult = extractAssetId(texture)
				if extractAssetIdResult then
					return ("rbxthumb://type=Asset&id=%s&w=420&h=420"):format(extractAssetIdResult)
				end
			end

			return nil
		end

		CreateModernESP = function(parent, name, inputValue)
			local sum14 = 3299204732
			local billboardGui = parent:FindFirstChild(name)
			local difference8 = 146907273
			local difference9 = 813112104

			if not billboardGui then
				billboardGui = Instance.new("BillboardGui")
				billboardGui.Name = name
				billboardGui.Parent = parent
				billboardGui.AlwaysOnTop = true
				billboardGui.Size = UDim2.new(0, 200, 0, 25)
				billboardGui.StudsOffset = Vector3.new(0, inputValue.offsetY or 3.5, 0)
				local frame3 = Instance.new("Frame")
				frame3.Name = "Box"
				frame3.AutomaticSize = Enum.AutomaticSize.X
				frame3.Size = UDim2.new(0, 0, 0, 15)
				frame3.Position = UDim2.new(0.5, 0, 0, 0)
				frame3.AnchorPoint = Vector2.new(0.5, 0)
				frame3.BackgroundColor3 = Color3.new(0.058823529630899429, 0.058823529630899429, 0.058823529630899429)
				frame3.BackgroundTransparency = 0
				frame3.BorderSizePixel = 0
				frame3.ZIndex = 2
				frame3.Parent = billboardGui
				local sum15 = difference8 + difference9
				Instance.new("UICorner", frame3).CornerRadius = UDim.new(0, 3)
				local uiGradient = Instance.new("UIGradient")
				local numberSequence = NumberSequence.new
				local entries6 = {}
				local newResult = NumberSequenceKeypoint.new(0, 1)
				local newResult2 = NumberSequenceKeypoint.new(0.15, 0.35)
				local newResult3 = NumberSequenceKeypoint.new(0.85, 0.35)
				local packedResults20 = table.pack(NumberSequenceKeypoint.new(1, 1))
				entries6[1] = newResult
				entries6[2] = newResult2
				entries6[3] = newResult3

				do
					local values = table.pack(table.unpack(packedResults20, 1, packedResults20.n))
					table.move(values, 1, values.n, 4, entries6)
				end

				uiGradient.Transparency = numberSequence(entries6)
				uiGradient.Parent = frame3
				local uiPadding = Instance.new("UIPadding", frame3)
				local shiftedBits = bit32.rshift(sum14 // 80, 9)
				uiPadding.PaddingLeft = UDim.new(0, 8)
				uiPadding.PaddingRight = UDim.new(0, 8)
				local uiListLayout = Instance.new("UIListLayout", frame3)
				uiListLayout.FillDirection = Enum.FillDirection.Horizontal
				uiListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
				uiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
				uiListLayout.Padding = UDim.new(0, 3)
				local sortOrder = Enum.SortOrder
				local quotient3 = difference9 // bit32.bxor(sum15, 0)
				uiListLayout.SortOrder = sortOrder.LayoutOrder
				local imageLabel = Instance.new("ImageLabel", frame3)
				imageLabel.Name = "Icon"
				imageLabel.Size = UDim2.new(0, 12, 0, 12)
				imageLabel.BackgroundTransparency = 1
				imageLabel.ZIndex = 3
				imageLabel.LayoutOrder = 1
				imageLabel.Visible = false
				local textLabel = Instance.new("TextLabel", frame3)
				textLabel.Name = "Text"
				textLabel.AutomaticSize = Enum.AutomaticSize.X
				textLabel.Size = UDim2.new(0, 0, 1, 0)
				textLabel.BackgroundTransparency = 1
				textLabel.Font = Enum.Font.GothamMedium
				textLabel.TextSize = 10
				textLabel.ZIndex = 3
				textLabel.LayoutOrder = 2
				textLabel.RichText = true
				textLabel.TextXAlignment = Enum.TextXAlignment.Center
				textLabel.TextYAlignment = Enum.TextYAlignment.Center
				local xorValue14 = bit32.bxor(sum15, 0)
				local frame4 = Instance.new("Frame")
				frame4.Name = "Line"
				frame4.Size = UDim2.new(0, 1, 0, 10)
				frame4.Position = UDim2.new(0.5, 0, 0, 15)
				frame4.AnchorPoint = Vector2.new(0.5, 0)
				frame4.BorderSizePixel = 0
				frame4.ZIndex = 1
				local xorValue15 = bit32.bxor(sum15, 0)
				frame4.Parent = billboardGui
				local uiGradient2 = Instance.new("UIGradient")
				uiGradient2.Rotation = 90
				local new = NumberSequenceKeypoint.new
				uiGradient2.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), new(1, 1) })
				uiGradient2.Parent = frame4
				difference8 = sum15 + 3481855192
				sum14 = xorValue15 + 2339185355
				difference9 = xorValue14 - 146907273
			end

			billboardGui.Line.BackgroundColor3 = inputValue.color
			local icon = billboardGui.Box:FindFirstChild("Icon")
			local combinedBits3 = bit32.bor(difference9, sum14)

			if inputValue.icon and inputValue.icon ~= "" then
				if icon then
					icon.Image = inputValue.icon
					icon.Visible = true
					difference8 = difference8 + 357030895 - 357030895
				end
			elseif icon then
				icon.Visible = false
			end

			local quotient4 = combinedBits3 // 4
			local formattedText = string.format("#%02X%02X%02X", inputValue.color.R * 255, inputValue.color.G * 255, inputValue.color.B * 255)

			if inputValue.distance then
				billboardGui.Box.Text.Text = string.format("<font color='#FFFFFF'>%s</font> <font color='%s'>[%dm]</font>", inputValue.name, formattedText, inputValue.distance)
			elseif inputValue.subtext then
				billboardGui.Box.Text.Text = string.format("<font color='#FFFFFF'>%s</font> <font color='%s'>%s</font>", inputValue.name, formattedText, inputValue.subtext)
			else
				local text = billboardGui.Box.Text
				local format = string.format
				local maskedBits8 = bit32.band(sum14, quotient4)
				text.Text = format("<font color='#FFFFFF'>%s</font>", inputValue.name)
				bit32.bxor(maskedBits8, 3229616160)
			end
		end

		ClearESP = function(inputValue)
			local numberValue2 = 2316324559
			local numberValue3 = 4020595478

			if inputValue == "Player" then
				for _, player in pairs(Players:GetPlayers()) do
					if player.Character then
						if player.Character:FindFirstChild("PEH") then
							player.Character.PEH:Destroy()
						end

						if player.Character:FindFirstChild("PE_Text") then
							player.Character.PE_Text:Destroy()
						end
					end
				end
			elseif inputValue == "Killer" then
				for _, player in pairs(Players:GetPlayers()) do
					if player.Character then
						if player.Character:FindFirstChild("KEH") then
							player.Character.KEH:Destroy()
						end

						if player.Character:FindFirstChild("KE_Text") then
							player.Character.KE_Text:Destroy()
						end
					end
				end
			elseif inputValue == "Generator" then
				for _, generator in pairs(espCache.Generators) do
					if generator.model and generator.model.Parent then
						if generator.model:FindFirstChild("GEH") then
							generator.model.GEH:Destroy()
						end

						if generator.model:FindFirstChild("GE_Text") then
							generator.model.GE_Text:Destroy()
						end
					end
				end
			elseif inputValue == "Pallet" then
				local quotient3 = numberValue2 // numberValue3

				for _, pallet in pairs(espCache.Pallets) do
					if pallet and pallet.Parent then
						if pallet:FindFirstChild("PalletEH") then
							pallet.PalletEH:Destroy()
						end
					end
				end

				bit32.bxor(quotient3, 2316324559)
			elseif inputValue == "Hook" then
				for _, hook in pairs(espCache.Hooks) do
					if hook and hook.Parent then
						if hook:FindFirstChild("HookEH") then
							hook.HookEH:Destroy()
						end
					end
				end
			elseif inputValue == "Window" then
				for _, window in pairs(espCache.Windows) do
					if window and window.Parent then
						if window:FindFirstChild("WindowEH") then
							window.WindowEH:Destroy()
						end
					end
				end
			elseif inputValue == "Gate" then
				for _, gate in pairs(espCache.Gates) do
					if gate and gate.Parent then
						if gate:FindFirstChild("GateEH") then
							gate.GateEH:Destroy()
						end
					end
				end
			elseif inputValue == "SCP" then
				for _, scP in pairs(espCache.SCPs) do
					if scP and scP.Parent then
						if scP:FindFirstChild("SCPEH") then
							scP.SCPEH:Destroy()
						end
					end
				end
			end
		end

		ClearAllESP = function()
			ClearESP("Player")
			ClearESP("Killer")
			ClearESP("Generator")
			ClearESP("Pallet")
			ClearESP("Hook")
			ClearESP("Gate")
			ClearESP("SCP")
			ClearESP("Window")
			ClearHookESP()
		end

		local packedResults20 = table.pack(bit32.band(quotient2, 4294967295))
		local packedResults21 = table.pack(bit32.band(packedResults20[1], 65535))
		local maskedBits8 = bit32.band(packedResults21[1] * 50833 + bit32.lshift(bit32.band(packedResults21[1] * 0 + bit32.rshift(packedResults20[1], 16) * 50833, 65535), 16), 4294967295)

		UpdatePlayerESP = function()
			local numberValue2 = 2995765233
			local numberValue3 = 473822951
			local sum14 = 76250452 + numberValue3
			if not Config.ESP_Master then
				return
			end
			local character = localPlayer.Character
			character = character and character:FindFirstChild("HumanoidRootPart")

			if Config.ESP_KillerWarn and character and GetRole() == "Survivor" then
				local killerWarn = character:FindFirstChild("KillerWarn")
				local ipairsValue = ipairs
				local packedResults22 = table.pack(Players:GetPlayers())
				local xorValue14 = bit32.bxor(numberValue3, numberValue2)
				local valueValue5, valueValue6, valueValue7 = ipairsValue(table.unpack(packedResults22, 1, packedResults22.n))
				local huge = math.huge

				for _, item in valueValue5, valueValue6, valueValue7 do
					if item ~= localPlayer and IsKiller(item) and item.Character then
						local humanoidRootPart = item.Character:FindFirstChild("HumanoidRootPart")

						if humanoidRootPart then
							local magnitude = (humanoidRootPart.Position - character.Position).Magnitude

							if magnitude < huge then
								huge = magnitude
							end
						end
					end
				end

				if huge <= 80 then
					if not killerWarn then
						local billboardGui = Instance.new("BillboardGui")
						billboardGui.Name = "KillerWarn"
						billboardGui.Size = UDim2.new(0, 30, 0, 30)
						billboardGui.AlwaysOnTop = true
						billboardGui.StudsOffset = Vector3.new(0, 4, 0)
						billboardGui.Parent = character
						local textLabel = Instance.new("TextLabel")
						textLabel.Name = "WarnText"
						textLabel.Size = UDim2.new(1, 0, 1, 0)
						textLabel.BackgroundTransparency = 1
						textLabel.TextScaled = true
						textLabel.TextStrokeTransparency = 0
						textLabel.Font = Enum.Font.GothamBlack
						textLabel.Parent = billboardGui
						sum14 = sum14 + xorValue14 + 1364047594
						killerWarn = billboardGui
					end

					local warnText = killerWarn:FindFirstChild("WarnText")

					if warnText then
						if huge <= 40 then
							warnText.Text = "!!"
							warnText.TextColor3 = Color3.new(1, 0, 0)
						else
							warnText.Text = "!"
							warnText.TextColor3 = Color3.new(1, 1, 0)
						end
					end
				elseif killerWarn then
					killerWarn:Destroy()
				end
			else
				local killerWarn = character and character:FindFirstChild("KillerWarn")

				if killerWarn then
					killerWarn:Destroy()
				end
			end

			local sum15 = sum14
			local espPlayer = Config.ESP_Player

			if espPlayer or Config.ESP_Killer then
				for _, player in pairs(Players:GetPlayers()) do
					if player ~= localPlayer and player.Character then
						local isKillerResult = IsKiller(player)
						local head = player.Character:FindFirstChild("Head")

						if head and (not isKillerResult and Config.ESP_Player or isKillerResult and Config.ESP_Killer) then
							local selectedValue = character and math.floor((head.Position - character.Position).Magnitude) or 0
							local killer = isKillerResult and visualSettings.Colors.Killer or visualSettings.Colors.Player
							local name = isKillerResult and "KEH" or "PEH"
							local selectedValue2 = isKillerResult and "KE_Text" or "PE_Text"
							local highlight = player.Character:FindFirstChild(name)

							if not highlight then
								highlight = Instance.new("Highlight")
								highlight.Name = name
								highlight.Parent = player.Character
							end

							highlight.FillColor = killer
							highlight.OutlineColor = killer
							highlight.FillTransparency = Config.ESP_Outline and 1 or 0.5
							highlight.OutlineTransparency = 0

							if Config.ESP_Name then
								local selectedValue3 = Config.ESP_ItemIcon and not isKillerResult
								local getItemIconResult = nil

								if selectedValue3 then
									local attribute = player:GetAttribute("EquippedItem")
									local selectedValue4 = attribute and attribute ~= ""
									getItemIconResult = nil

									if selectedValue4 then
										getItemIconResult = getItemIcon(attribute)
									end
								end

								CreateModernESP(player.Character, selectedValue2, {
									name = player.Name,
									distance = Config.ESP_Distance and selectedValue or nil,
									color = killer,
									icon = getItemIconResult,
								})
							else
								local findFirstChildResult = player.Character:FindFirstChild(selectedValue2)

								if findFirstChildResult then
									findFirstChildResult:Destroy()
								end
							end
						end
					end
				end
			end
		end

		UpdateSCPESP = function()
			local numberValue2 = 3269785176
			if not Config.ESP_Master then
				return
			end

			if Config.ESP_SCP then
				for _, scP in ipairs(espCache.SCPs) do
					if scP and scP.Parent then
						local humanoid = scP:FindFirstChildOfClass("Humanoid")
						local humanoidRootPart = scP:FindFirstChild("HumanoidRootPart") or scP:FindFirstChild("Torso") or scP.PrimaryPart

						if humanoid and humanoidRootPart and humanoid.Health > 0 and math.floor(humanoid.WalkSpeed) == 9 then
							local scp = visualSettings.Colors.SCP
							local scpeh = scP:FindFirstChild("SCPEH")

							if not scpeh then
								scpeh = Instance.new("Highlight")
								scpeh.Name = "SCPEH"
								scpeh.Parent = scP
							end

							scpeh.FillColor = scp
							scpeh.OutlineColor = scp
							scpeh.FillTransparency = Config.ESP_Outline and 1 or 0.5
							scpeh.OutlineTransparency = 0
						else
							local scpeh = scP:FindFirstChild("SCPEH")

							if scpeh then
								scpeh:Destroy()
							end
						end
					end
				end
			else
				ClearESP("SCP")
			end
		end

		UpdateStaticESP = function()
			local difference8 = 1962887977
			local numberValue2 = 3780522517
			local xorValue14 = 333792292
			if not Config.ESP_Master then
				return
			end

			if Config.ESP_Generator then
				local pairsValue = pairs
				local espCache2 = espCache
				local quotient3 = difference8 // bit32.bxor(xorValue14, 0)

				for _, generator in pairsValue(espCache2.Generators) do
					local model = generator.model

					if model and model.Parent then
						local roundedValue = math.floor(model:GetAttribute("RepairProgress") or 0)
						local generatorDone = roundedValue >= 100 and visualSettings.Colors.GeneratorDone or visualSettings.Colors.Generator
						local geh = model:FindFirstChild("GEH")

						if not geh then
							local highlight = Instance.new("Highlight")
							highlight.Name = "GEH"
							highlight.Parent = model
							geh = highlight
						end

						geh.FillColor = generatorDone
						geh.OutlineColor = generatorDone
						geh.FillTransparency = Config.ESP_Outline and 1 or 0.5
						geh.OutlineTransparency = 0

						if Config.ESP_GeneratorName then
							local formattedText

							if roundedValue >= 100 then
								xorValue14 = bit32.bxor(bit32.bxor(xorValue14, quotient3), 5)
								formattedText = "100%"
							else
								formattedText = string.format("%d%%", roundedValue)
							end

							CreateModernESP(model, "GE_Text", { name = formattedText, subtext = nil, color = generatorDone, icon = nil })
						else
							local geText = model:FindFirstChild("GE_Text")

							if geText then
								geText:Destroy()
							end
						end
					end
				end

				difference8 = quotient3 - 2332079324
			end

			if Config.ESP_Pallet then
				local pairsResult, valueValue5, valueValue6 = pairs(espCache.Pallets)
				local xorValue15 = bit32.bxor(xorValue14, 84754930)

				for _, adornee in pairsResult, valueValue5, valueValue6 do
					if adornee and adornee.Parent then
						local palletEH = adornee:FindFirstChild("PalletEH")

						if not palletEH then
							palletEH = Instance.new("Highlight")
							palletEH.Name = "PalletEH"
							palletEH.Parent = adornee
						end

						palletEH.Adornee = adornee
						palletEH.FillColor = visualSettings.Colors.Pallet
						palletEH.OutlineColor = visualSettings.Colors.Pallet
						palletEH.FillTransparency = Config.ESP_Outline and 1 or 0.5
						palletEH.OutlineTransparency = 0
					end
				end

				xorValue14 = bit32.bxor(xorValue15, 84754930)
			end

			if Config.ESP_Window then
				for _, window in ipairs(espCache.Windows) do
					if window and window.Parent then
						local bottom = window:FindFirstChild("Bottom") or window:FindFirstChildWhichIsA("BasePart")

						if bottom then
							local windowEH = window:FindFirstChild("WindowEH")

							if not windowEH then
								windowEH = Instance.new("BoxHandleAdornment")
								windowEH.Name = "WindowEH"
								windowEH.Parent = window
								windowEH.AlwaysOnTop = true
								windowEH.ZIndex = 5
							end

							windowEH.Adornee = bottom
							windowEH.Size = bottom.Size
							windowEH.Color3 = visualSettings.Colors.Window
							windowEH.Transparency = Config.ESP_Outline and 0.8 or 0.4
						end
					end
				end
			end

			if Config.ESP_Hook then
				local ipairsValue = ipairs
				local espCache3 = espCache
				local xorValue16 = bit32.bxor(xorValue14, 22426133)

				for _, hook in ipairsValue(espCache3.Hooks) do
					if hook and hook.Parent then
						local hookEH = hook:FindFirstChild("HookEH")

						if not hookEH then
							hookEH = Instance.new("Highlight")
							hookEH.Name = "HookEH"
							hookEH.Parent = hook
						end

						hookEH.FillColor = visualSettings.Colors.Hook
						hookEH.OutlineColor = visualSettings.Colors.Hook
						hookEH.FillTransparency = Config.ESP_Outline and 1 or 0.5
						hookEH.OutlineTransparency = 0
					end
				end

				xorValue14 = bit32.bxor(xorValue16, 22426133)
			end

			if Config.ESP_Gate then
				for _, gate in ipairs(espCache.Gates) do
					if gate and gate.Parent then
						local gateEH = gate:FindFirstChild("GateEH")

						if not gateEH then
							gateEH = Instance.new("Highlight")
							gateEH.Name = "GateEH"
							gateEH.Parent = gate
						end

						gateEH.Adornee = gate
						gateEH.FillColor = visualSettings.Colors.Gate
						local xorValue17 = bit32.bxor(xorValue14, numberValue2)
						gateEH.OutlineColor = visualSettings.Colors.Gate
						gateEH.FillTransparency = Config.ESP_Outline and 1 or 0.5
						gateEH.OutlineTransparency = 0
						xorValue14 = bit32.bxor(xorValue17, 3780522517)
					end
				end
			end
		end

		ForceRefreshMap = function()
			ScanMap()

			if Config.ESP_Master then
				ClearAllESP()
				task.wait(0.1)
				UpdatePlayerESP()
				UpdateSCPESP()
				UpdateStaticESP()
			end

			pcall(function()
			end)
		end

		task.spawn(function()
			task.wait(2)
			ScanMap()

			pcall(function()
			end)
		end)

		localPlayer.CharacterAdded:Connect(function()
			task.wait(1.5)
			ScanMap()

			if Config.ESP_Master then
				task.spawn(function()
					task.wait(0.5)
					ClearAllESP()
					task.wait(0.2)
					UpdatePlayerESP()
					UpdateSCPESP()
					UpdateStaticESP()
				end)
			end
		end)

		workspace.ChildAdded:Connect(function(child)
			if child.Name == "Map" then
				task.wait(1)
				ScanMap()
			end
		end)

		task.spawn(function()
			while true do
				task.wait(40)

				if not Config.ESP_Master then
				end

				ScanMap()

				if Config.ESP_Master then
					pcall(UpdateStaticESP)
					pcall(UpdatePlayerESP)
					pcall(UpdateSCPESP)
				end
			end
		end)

		local timestamp2 = 0

		local connection = RunService.Heartbeat:Connect(function()
			local now = tick()
			local difference8 = now - timestamp2
			local matches = difference8 < 3

			if difference8 then
				if not matches then
					timestamp2 = now
					local map = workspace:FindFirstChild("Map")

					if map then
						local lastMapChildCount = #map:GetChildren()

						if not getgenv()._lastMapChildCount then
							getgenv()._lastMapChildCount = lastMapChildCount
						elseif getgenv()._lastMapChildCount ~= lastMapChildCount then
							getgenv()._lastMapChildCount = lastMapChildCount

							task.spawn(function()
								task.wait(0.5)
								ScanMap()
							end)
						end
					else
						getgenv()._lastMapChildCount = nil
					end

					return
				end
			end
		end)

		pcall(function()
			game:BindToClose(function()
				if connection then
					connection:Disconnect()
				end
			end)
		end)

		if CoreGui:FindFirstChild("FOVCircleGui_Standalone") then
			local fovCircleGuiStandalone = CoreGui:FindFirstChild("FOVCircleGui_Standalone")
			local maskedBits9 = bit32.band(xorValue10, maskedBits8)
			fovCircleGuiStandalone:Destroy()
			xorValue10 = bit32.bxor(maskedBits9, 740303136)
		end

		local screenGui = Instance.new("ScreenGui")
		screenGui.Name = "FOVCircleGui_Standalone"
		screenGui.Parent = CoreGui
		screenGui.ResetOnSpawn = false
		screenGui.IgnoreGuiInset = true
		local frame3 = Instance.new("Frame")
		frame3.BackgroundTransparency = 1
		frame3.AnchorPoint = Vector2.new(0.5, 0.5)
		frame3.Position = UDim2.new(0.5, 0, 0.5, 0)
		frame3.Visible = false
		frame3.Parent = screenGui
		local uiCorner = Instance.new("UICorner")
		uiCorner.CornerRadius = UDim.new(1, 0)
		uiCorner.Parent = frame3
		local new = Instance.new
		xorValue13 = bit32.bxor(maskedBits8, xorValue10)
		local UIStroke = new("UIStroke")
		UIStroke.Color = Color3.new(0.62745100259780884, 0.35294118523597717, 1)
		UIStroke.Thickness = 1.5
		UIStroke.Parent = frame3
		frame = Instance.new("Frame")
		local xorValue14 = bit32.bxor(difference6, 0)
		local xorValue15 = bit32.bxor(xorValue10, xorValue14)
		frame.BackgroundTransparency = 1
		frame.AnchorPoint = Vector2.new(0.5, 0.5)
		frame.Position = UDim2.new(0.5, 0, 0.5, 0)
		frame.Visible = false
		frame.Parent = screenGui
		local sum14 = difference6 + xorValue15
		Instance.new("UICorner", frame).CornerRadius = UDim.new(1, 0)
		local uiStroke = Instance.new("UIStroke", frame)
		uiStroke.Color = visualSettings.Colors.Player
		uiStroke.Thickness = 1.5
		local new2 = Instance.new
		local quotient3 = xorValue15 // bit32.bxor(sum14, 0)
		local ScreenGui = new2("ScreenGui")
		ScreenGui.Name = "VeilTrackerGui"
		sum12 = sum14 + xorValue13
		ScreenGui.IgnoreGuiInset = true
		ScreenGui.ResetOnSpawn = false
		ScreenGui.Parent = CoreGui
		frame2 = Instance.new("Frame")
		frame2.Name = "Line"
		frame2.AnchorPoint = Vector2.new(0.5, 0.5)
		frame2.BackgroundColor3 = Color3.new(0.62745100259780884, 0.35294118523597717, 1)
		frame2.BackgroundTransparency = 0.2
		frame2.BorderSizePixel = 0
		frame2.Visible = false
		frame2.Parent = ScreenGui

		createBillboardGui = function()
			local billboardGui = Instance.new("BillboardGui")
			billboardGui.Name = "VeilTrackerBillboard"
			billboardGui.Size = UDim2.new(0, 14, 0, 14)
			billboardGui.AlwaysOnTop = true
			billboardGui.LightInfluence = 0
			billboardGui.MaxDistance = 500
			local frame4 = Instance.new("Frame")
			frame4.AnchorPoint = Vector2.new(0.5, 0.5)
			frame4.Position = UDim2.new(0.5, 0, 0.5, 0)
			frame4.Size = UDim2.new(1, 0, 1, 0)
			frame4.BackgroundTransparency = 1
			frame4.Parent = billboardGui
			Instance.new("UICorner", frame4).CornerRadius = UDim.new(1, 0)
			local uiStroke2 = Instance.new("UIStroke")
			uiStroke2.Color = Color3.new(0.62745100259780884, 0.35294118523597717, 1)
			uiStroke2.Thickness = 1
			uiStroke2.Transparency = 0.1
			uiStroke2.Parent = frame4
			return billboardGui
		end

		valueValue4 = nil

		getBestAimbotTarget = function()
			local getRoleResult = GetRole()
			local survAimbotRadius = Config.Surv_Aimbot_Radius
			local vector2 = Vector2.new(currentCamera.ViewportSize.X / 2, currentCamera.ViewportSize.Y / 2)
			local humanoidRootPartValue = nil
			local huge = math.huge

			for _, player in pairs(Players:GetPlayers()) do
				if player ~= localPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
					if getRoleResult == "Survivor" and Config.Surv_Aimbot_Enabled and IsKiller(player) then
						local humanoidRootPart = player.Character.HumanoidRootPart
						local hugeValue = GetDistance(humanoidRootPart.Position)

						if getRoleResult == "Survivor" and hugeValue <= Config.Surv_Aimbot_MaxDist then
							local screenPosition, valueValue5 = currentCamera:WorldToViewportPoint(humanoidRootPart.Position)

							if valueValue5 then
								local magnitude = (Vector2.new(screenPosition.X, screenPosition.Y) - vector2).Magnitude

								if magnitude < survAimbotRadius then
									survAimbotRadius = magnitude
									humanoidRootPartValue = humanoidRootPart
								end
							end
						elseif getRoleResult == "Killer" and hugeValue <= Config.Killer_Aimbot_MaxDist then
							if hugeValue < huge then
								humanoidRootPartValue = humanoidRootPart
								huge = hugeValue
							end
						end
					elseif getRoleResult == "Killer" and Config.Killer_Aimbot_Enabled and not IsKiller(player) then
						local humanoid = player.Character:FindFirstChild("Humanoid")

						if humanoid and humanoid.Health > 0 and not IsDowned(player.Character) then
							local humanoidRootPart = player.Character.HumanoidRootPart
							local hugeValue2 = GetDistance(humanoidRootPart.Position)

							if getRoleResult == "Survivor" and hugeValue2 <= Config.Surv_Aimbot_MaxDist then
								local screenPosition2, valueValue6 = currentCamera:WorldToViewportPoint(humanoidRootPart.Position)

								if valueValue6 then
									local magnitude = (Vector2.new(screenPosition2.X, screenPosition2.Y) - vector2).Magnitude

									if magnitude < survAimbotRadius then
										survAimbotRadius = magnitude
										humanoidRootPartValue = humanoidRootPart
									end
								end
							elseif getRoleResult == "Killer" and hugeValue2 <= Config.Killer_Aimbot_MaxDist then
								if hugeValue2 < huge then
									humanoidRootPartValue = humanoidRootPart
									huge = hugeValue2
								end
							end
						end
					end
				end
			end

			return humanoidRootPartValue
		end

		GetKillerUI = function()
			local playerGui2 = localPlayer:FindFirstChild("PlayerGui")
			if not playerGui2 then
				return nil
			end

			for _, child in pairs(playerGui2:GetChildren()) do
				if string.sub(child.Name, -4) == "-mob" and child.Name ~= "Survivor-mob" then
					return child
				end
			end

			return nil
		end

		local inputValue = nil
		local enabledValue3 = false
		local inputValue2 = nil
		local quotient4 = xorValue13 // bit32.bxor(sum12, 0)

		FireAbyssalSkill = function()
			if GetRole() ~= "Killer" then
				return
			end
			local selectedKiller = localPlayer:FindFirstChild("SelectedKiller")

			if string.find(string.lower(tostring(selectedKiller and selectedKiller.Value or localPlayer:GetAttribute("SelectedKiller"))), "abyss") then
				pcall(function()
					game:GetService("ReplicatedStorage").Remotes.Killers.Abysswalker.corrupt:FireServer()
				end)
			end
		end

		StartInfiniteAbyssal = function()
			if enabledValue3 then
				return
			end
			enabledValue3 = true

			task.spawn(function()
				while enabledValue3 and Config.Killer_InfAbyssal and GetRole() == "Killer" do
					FireAbyssalSkill()
					task.wait(0.5)
				end
			end)
		end

		StopInfiniteAbyssal = function()
			enabledValue3 = false
		end

		UserInputService.InputBegan:Connect(function(input, gameProcessed)
			local xorValue16 = 3142082387
			local matches = input.UserInputType == Enum.UserInputType.Touch
			local numberValue2 = 2689086097
			local getRoleResult = GetRole()

			if Config.Killer_InfAbyssal and input.KeyCode == Enum.KeyCode.Q then
				StartInfiniteAbyssal()
			end

			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				if gameProcessed then
					return
				end

				if getRoleResult == "Killer" and Config.Killer_Aimbot_Enabled then
					lockedAimbotTarget = getBestAimbotTarget()
					isAimbotHolding = true
				end
			end

			if matches then
				if Config.Killer_InfAbyssal then
					local getKillerUiResult = GetKillerUI()
					local move2 = getKillerUiResult and getKillerUiResult:FindFirstChild("Controls") and getKillerUiResult.Controls:FindFirstChild("move2")

					if move2 and move2.Visible then
						local position = input.Position
						local absolutePosition = move2.AbsolutePosition
						local absoluteSize = move2.AbsoluteSize
						local matches2 = position.X >= absolutePosition.X

						if matches2 then
							matches2 = position.X <= absolutePosition.X + absoluteSize.X
							xorValue16 = numberValue2 + 452996290
						end

						matches2 = matches2 and position.Y >= absolutePosition.Y

						if matches2 then
							matches2 = position.Y <= absolutePosition.Y + absoluteSize.Y
							xorValue16 = bit32.bxor(bit32.bxor(xorValue16, numberValue2), 2689086097)
						end

						if matches2 then
							StartInfiniteAbyssal()
							inputValue2 = input
						end
					end
				end

				if getRoleResult == "Killer" and Config.Killer_Aimbot_Enabled then
					local getKillerUiResult2 = GetKillerUI()
					local attack = getKillerUiResult2 and getKillerUiResult2:FindFirstChild("Controls") and getKillerUiResult2.Controls:FindFirstChild("attack")

					if attack and attack.Visible then
						local position = input.Position
						local absolutePosition = attack.AbsolutePosition
						local absoluteSize = attack.AbsoluteSize

						if position.X >= absolutePosition.X and position.X <= absolutePosition.X + absoluteSize.X and position.Y >= absolutePosition.Y and position.Y <= absolutePosition.Y + absoluteSize.Y then
							lockedAimbotTarget = getBestAimbotTarget()
							isAimbotHolding = true
							inputValue = input
							bit32.bxor(numberValue2 - xorValue16, 1152901551)
						end
					end
				end
			end
		end)

		UserInputService.InputEnded:Connect(function(input)
			local matches = input.UserInputType == Enum.UserInputType.Touch

			if input.KeyCode == Enum.KeyCode.Q then
				StopInfiniteAbyssal()
			end

			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				isAimbotHolding = false
				lockedAimbotTarget = nil
			end

			if matches and input == inputValue2 then
				StopInfiniteAbyssal()
				inputValue2 = nil
			end

			if matches and input == inputValue then
				isAimbotHolding = false
				lockedAimbotTarget = nil
				inputValue = nil
			end
		end)

		UserInputService.InputBegan:Connect(function(input, gameProcessed)
			local sum15 = 3584512683
			local matches = input.UserInputType == Enum.UserInputType.Touch
			local numberValue2 = 2594951502
			if gameProcessed and not matches then
				return
			end
			local character = localPlayerValue.Character
			character = character and character:GetAttribute("spearmode") == true

			if input.UserInputType == Enum.UserInputType.MouseButton2 then
				if AimConfig.Aim_Silent then
					isChargingPistol = true
					lockedTarget = getPistolTarget()
				end

				if AimConfig.Flash_Silent then
					isAimingFlash = true
				end
			elseif input.UserInputType == Enum.UserInputType.MouseButton1 then
				if AimConfig.Aim_Silent and isChargingPistol then
					executeSilentAimFire()
				end

				character = callbackValue2() and character

				if character then
					isChargingSpear = true
				end
			elseif matches then
				if AimConfig.Aim_Silent or AimConfig.Flash_Silent then
					local playerGui2 = localPlayerValue:FindFirstChild("PlayerGui")

					if playerGui2 then
						local survivorMob = playerGui2:FindFirstChild("Survivor-mob")

						if survivorMob then
							local controls = survivorMob:FindFirstChild("Controls")

							if controls then
								local guiMob = controls:FindFirstChild("Gui-mob")

								if guiMob and guiMob.Visible then
									local position = input.Position
									local absolutePosition = guiMob.AbsolutePosition
									local absoluteSize = guiMob.AbsoluteSize
									local matches2 = position.X >= absolutePosition.X
									local shiftedBits = bit32.rshift(sum15, 8)

									if matches2 and position.X <= absolutePosition.X + absoluteSize.X and position.Y >= absolutePosition.Y and position.Y <= absolutePosition.Y + absoluteSize.Y then
										if AimConfig.Aim_Silent then
											isChargingPistol = true
											inputValue = input
											lockedTarget = getPistolTarget()
										end

										if AimConfig.Flash_Silent then
											isAimingFlash = true
											inputValue = input
										end
									end

									sum15 = shiftedBits + 3570510681
								end
							end
						end
					end
				end

				if callbackValue2() and character then
					local playerGui2 = localPlayerValue:FindFirstChild("PlayerGui")

					if playerGui2 then
						local slasherMob = playerGui2:FindFirstChild("Slasher-mob")

						if slasherMob then
							local controls = slasherMob:FindFirstChild("Controls")

							if controls then
								local attack = controls:FindFirstChild("attack")
								local quotient5 = numberValue2 // 196

								if attack and attack.Visible then
									local position = input.Position
									local absolutePosition = attack.AbsolutePosition
									local absoluteSize = attack.AbsoluteSize
									local x = position.X
									local xorValue16 = bit32.bxor(sum15, 560244824)
									local matches3 = x >= absolutePosition.X

									if matches3 and position.X <= absolutePosition.X + absoluteSize.X and position.Y >= absolutePosition.Y and position.Y <= absolutePosition.Y + absoluteSize.Y then
										isChargingSpear = true
										inputValue = input
									end

									bit32.bxor(xorValue16, 560244824)
								end

								bit32.bxor(quotient5, 2590102962)
							end
						end
					end
				end
			end
		end)

		UserInputService.InputEnded:Connect(function(input)
			local numberValue2 = 3789628756
			local sum15 = 720297288
			local matches = input.UserInputType == Enum.UserInputType.Touch

			if input.UserInputType == Enum.UserInputType.MouseButton2 then
				isChargingPistol = false
				lockedTarget = nil
				isAimingFlash = false
			end

			local matches2 = input == inputValue

			if not matches2 then
				matches2 = input.UserInputType == Enum.UserInputType.MouseButton1
				sum15 = bit32.bxor(sum15, 4151114658) + 1298970206
			end

			if matches2 then
				isChargingSpear = false

				if inputValue == input then
					inputValue = nil
				end

				return
			end

			if matches and input == inputValue then
				isChargingPistol = false
				inputValue = nil
				executeSilentAimFire()
				lockedTarget = nil
				isAimingFlash = false
				local xorValue16 = bit32.bxor(numberValue2, sum15)
				inputValue = nil
			end
		end)

		local ReplicatedStorage2 = game:GetService("ReplicatedStorage")
		maskedBits7 = bit32.band(quotient3, 120234501)
		local repairEvent = ReplicatedStorage2.Remotes.Generator.RepairEvent
		local entries6 = {}
		local timestamp3 = 0

		GetAllGenerators = function()
			local now = tick()
			if now - timestamp3 < 5 then
				return entries6
			end
			entries6 = {}
			timestamp3 = now
			local map = workspace:FindFirstChild("Map")
			if not map then
				return entries6
			end

			pcall(function()
				for _, descendant in pairs(map:GetDescendants()) do
					if descendant:IsA("Model") then
						if descendant.Name == "Generator" then
							if descendant:GetAttribute("RepairProgress") ~= nil or descendant:GetAttribute("kickcount") ~= nil or descendant:GetAttribute("ProgressRepair") ~= nil then
								table.insert(entries6, descendant)
							end
						end
					end
				end
			end)

			return entries6
		end

		PlayRepairAnim = function()
			local character = localPlayer.Character
			if not character then
				return
			end
			local humanoid = character:FindFirstChildOfClass("Humanoid")
			local animator = humanoid and humanoid:FindFirstChildOfClass("Animator")
			if not animator then
				return
			end

			if RepairAnimTrack.IsPlaying then
				return
			end

			pcall(function()
				local animation = Instance.new("Animation")
				animation.AnimationId = "rbxassetid://92960319113695"
				RepairAnimTrack = animator:LoadAnimation(animation)
				RepairAnimTrack.Priority = Enum.AnimationPriority.Action
				RepairAnimTrack:Play()
			end)
		end

		StopRepairAnim = function()
			if RepairAnimTrack.IsPlaying then
				pcall(function()
					RepairAnimTrack:Stop()
				end)
			end

			RepairAnimTrack = nil
		end

		GetGeneratorPoints = function(inputValue3)
			local entries7 = {}

			pcall(function()
				for _, child in pairs(inputValue3:GetChildren()) do
					if child.Name:find("GeneratorPoint") and child:IsA("BasePart") then
						table.insert(entries7, child)
					end
				end
			end)

			return entries7
		end

		StopAutoRepair = function()
			StopRepairAnim()
			local autoCurrentPoint = AutoCurrentPoint
			AutoCurrentPoint = nil

			pcall(function()
				repairEvent:FireServer(autoCurrentPoint, false)
			end)
		end

		StartAutoRepairLoop = function(autoCurrentGenModel)
			AutoCurrentGenModel = autoCurrentGenModel
			task.cancel(AutoRepairThread)
			AutoRepairThread = nil
			StopAutoRepair()

			AutoRepairThread = task.spawn(function()
				local numberValue2 = 3169505721

				while true do
					local character = localPlayer.Character
					character = character and character:FindFirstChild("HumanoidRootPart")
					if not character then
						task.wait(0.1)
						continue
					end
					local autoCurrentPoint = nil

					for _, item in pairs(GetAllGenerators()) do
						for _, autoCurrentPoint2 in pairs(GetGeneratorPoints(item)) do
							if (character.Position - autoCurrentPoint2.Position).Magnitude <= 5 then
								autoCurrentPoint = autoCurrentPoint2
								break
							end
						end

						if not autoCurrentPoint then
							continue
						end
						break
					end

					if autoCurrentPoint then
						AutoCurrentPoint = autoCurrentPoint
						local now = tick()

						if now - LastFireTime >= AutoFireInterval then
							PlayRepairAnim()
							local pcallValue = pcall
							local xorValue16 = 45641421

							local function callbackValue32()
								local matches = bit32.bxor(xorValue16, 0) == 375538486
								repairEvent:FireServer(autoCurrentPoint, true)
							end

							xorValue16 = bit32.bxor(xorValue16, numberValue2 + 1637781738)
							pcallValue(callbackValue32)
							LastFireTime = now
						end

						task.wait(0.1)
						continue
					end

					break
				end

				StopAutoRepair()
				AutoRepairEnabled = false
				ProcessedGens[AutoCurrentGenModel] = nil
				AutoCurrentGenModel = nil
				StopAutoRepair()
			end)
		end

		waitForRepairing = function(inputValue3, inputValue4)
			local now = tick()

			while tick() - now < (inputValue4 or 1) do
				if inputValue3:GetAttribute("IsRepairing") == true then
					return true
				end
				task.wait(0.05)
			end

			return false
		end

		bypassGenEnabled = false

		RecreateBypassButton = function()
			local numberValue2 = 1923643062
			local numberValue3 = 3479686017
			local bypassGenUI = CoreGui:FindFirstChild("BypassGenUI")

			if bypassGenUI then
				bypassGenUI:Destroy()
			end

			BypassUI = Instance.new("ScreenGui")
			BypassUI.Name = "BypassGenUI"
			BypassUI.ResetOnSpawn = false
			BypassUI.IgnoreGuiInset = true
			BypassUI.Parent = CoreGui
			BypassButton = Instance.new("ImageButton")
			BypassButton.Name = "BypassGenButton"
			BypassButton.Size = UDim2.new(0, 55, 0, 55)
			BypassButton.Position = UDim2.new(0.87999999523162842, 0, 0.55000001192092896, 0)
			BypassButton.AnchorPoint = Vector2.new(0.5, 0.5)
			local numberValue4 = numberValue3
			BypassButton.BackgroundColor3 = Color3.new(0.039215687662363052, 0.058823529630899429, 0.11764705926179886)
			BypassButton.BackgroundTransparency = 0.15
			BypassButton.AutoButtonColor = true
			BypassButton.Visible = false
			BypassButton.ZIndex = 10
			BypassButton.Parent = BypassUI
			local uiCorner2 = Instance.new("UICorner")
			uiCorner2.CornerRadius = UDim.new(1, 0)
			local xorValue16 = bit32.bxor(numberValue3, numberValue4)
			uiCorner2.Parent = BypassButton
			local uiStroke2 = Instance.new("UIStroke")
			uiStroke2.Color = Color3.new(0, 0.68235296010971069, 0.93725490570068359)
			uiStroke2.Thickness = 1.5
			uiStroke2.Transparency = 0.2
			uiStroke2.Parent = BypassButton
			local uiGradient = Instance.new("UIGradient")
			local new3 = ColorSequenceKeypoint.new

			uiGradient.Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, Color3.new(0, 0.20000000298023224, 0.80000001192092896)),
				new3(1, Color3.new(0, 0.68235296010971069, 0.93725490570068359)),
			})

			uiGradient.Rotation = 90
			uiGradient.Parent = uiStroke2
			local textLabel = Instance.new("TextLabel")
			textLabel.Size = UDim2.new(1, 0, 1, 0)
			textLabel.BackgroundTransparency = 1
			textLabel.Text = "GEN"
			textLabel.TextColor3 = Color3.new(0.70588237047195435, 0.90196079015731812, 1)
			textLabel.TextScaled = true
			local difference8 = numberValue4 - xorValue16
			textLabel.Font = Enum.Font.GothamBold
			textLabel.ZIndex = 11
			textLabel.Parent = BypassButton
			local uiStroke3 = Instance.new("UIStroke")
			uiStroke3.Color = Color3.new(0, 0.68235296010971069, 0.93725490570068359)
			bit32.bor(xorValue16, difference8)
			uiStroke3.Thickness = 1
			uiStroke3.Transparency = 0.5
			uiStroke3.Parent = textLabel
			BypassButton.Visible = bypassGenEnabled and UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
		end

		RecreateBypassButton()
		local sum15 = sum12 + maskedBits7

		DoMultiRepairPlain = function(inputValue3)
			local parent = inputValue3.Parent
			if ProcessedGens[parent] then
				return
			end
			ProcessedGens[parent] = true
			local getGeneratorPointsResult = GetGeneratorPoints(parent)
			local character = localPlayer.Character
			local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
			if not humanoidRootPart then
				ProcessedGens[parent] = nil
				return
			end
			local cFrame = humanoidRootPart.CFrame

			pcall(function()
				for _, item in pairs(getGeneratorPointsResult) do
					if item ~= inputValue3 and item.Parent then
						humanoidRootPart.Anchored = true
						humanoidRootPart.CFrame = item.CFrame
						task.wait(0.15)

						pcall(function()
							repairEvent:FireServer(item, true)
						end)

						if not waitForRepairing(item, 0.8) then
							pcall(function()
								repairEvent:FireServer(item, false)
							end)

							task.wait(0.1)
							humanoidRootPart.CFrame = item.CFrame
							task.wait(0.15)

							pcall(function()
								repairEvent:FireServer(item, true)
							end)

							waitForRepairing(item, 0.5)
						end

						humanoidRootPart.Anchored = false
						task.wait(0.05)
					end
				end
			end)

			pcall(function()
				if humanoidRootPart and humanoidRootPart.Parent then
					humanoidRootPart.Anchored = false
					humanoidRootPart.CFrame = cFrame
				end
			end)

			task.wait(0.1)

			if BypassGenMode == "Manual Repair" then
				pcall(function()
					repairEvent:FireServer(inputValue3, false)
				end)
			elseif BypassGenMode == "Auto Repair" then
				AutoRepairEnabled = true
				StartAutoRepairLoop(parent)
			end
		end

		BypassButton.MouseButton1Click:Connect(function()
			local character = localPlayer.Character
			character = character and character:FindFirstChild("HumanoidRootPart")
			if not character then
				return
			end
			local huge = math.huge
			local item = nil

			for _, item2 in pairs(GetAllGenerators()) do
				for _, item3 in pairs(GetGeneratorPoints(item2)) do
					local magnitude = (character.Position - item3.Position).Magnitude

					if magnitude < huge then
						huge = magnitude
						item = item3
					end
				end
			end

			if item and huge <= 8 then
				DoMultiRepairPlain(item)
			else
				notif("Ga deket generator manapun!")
			end
		end)

		isGeneratorPromptVisible = function()
			local ok, result = pcall(function()
				return localPlayer.PlayerGui.pcprompts.Frame.GeneratorRepair
			end)

			return ok and result and result.Visible
		end

		getNearestGenPoint = function()
			local character = localPlayer.Character
			character = character and character:FindFirstChild("HumanoidRootPart")
			if not character then
				return nil
			end
			local huge = math.huge
			local item = nil

			for _, item2 in pairs(GetAllGenerators()) do
				for _, item3 in pairs(GetGeneratorPoints(item2)) do
					local magnitude = (character.Position - item3.Position).Magnitude

					if magnitude < huge then
						huge = magnitude
						item = item3
					end
				end
			end

			return item, huge
		end

		UserInputService.InputBegan:Connect(function(input, gameProcessed)
			if gameProcessed then
				return
			end

			if input.UserInputType ~= Enum.UserInputType.MouseButton1 then
				return
			end

			if not isGeneratorPromptVisible() then
				return
			end
			local getNearestGenPointResult, valueValue5 = getNearestGenPoint()
			if not getNearestGenPointResult or valueValue5 > 8 then
				return
			end

			if ProcessedGens[getNearestGenPointResult.Parent] then
				return
			end
			DoMultiRepairPlain(getNearestGenPointResult)
		end)

		startProcessedGensWatcher = function()
			task.spawn(function()
				while true do
					task.wait(2)
					local character = localPlayer.Character
					local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
					if not humanoidRootPart then
						continue
					end

					for index2 in pairs(ProcessedGens) do
						if not index2 or not index2.Parent then
							ProcessedGens[index2] = nil
							continue
						end
						local getGeneratorPointsResult = GetGeneratorPoints(index2)
						local enabledValue4 = false

						for _, item in pairs(getGeneratorPointsResult) do
							if item.Parent and (humanoidRootPart.Position - item.Position).Magnitude <= 10 then
								enabledValue4 = true
								break
							end
							enabledValue4 = false
						end

						if not enabledValue4 then
							ProcessedGens[index2] = nil
						end
					end
				end
			end)
		end

		startProcessedGensWatcher()

		RecreateMoonwalkButton = function()
			local numberValue2 = 2800531214
			local numberValue3 = 2066761908
			local moonwalkUI = CoreGui:FindFirstChild("MoonwalkUI")

			if moonwalkUI then
				moonwalkUI:Destroy()
			end

			MoonwalkUI = Instance.new("ScreenGui")
			MoonwalkUI.Name = "MoonwalkUI"
			MoonwalkUI.ResetOnSpawn = false
			MoonwalkUI.IgnoreGuiInset = true
			MoonwalkUI.Parent = CoreGui
			local sum16 = numberValue2 + numberValue3
			MoonwalkButton = Instance.new("ImageButton")
			MoonwalkButton.Name = "MoonwalkButton"
			MoonwalkButton.Size = UDim2.new(0, 55, 0, 55)
			MoonwalkButton.Position = UDim2.new(0.87999999523162842, 0, 0.47999998927116394, 0)
			MoonwalkButton.AnchorPoint = Vector2.new(0.5, 0.5)
			MoonwalkButton.BackgroundColor3 = Color3.new(0.13725490868091583, 0.13725490868091583, 0.13725490868091583)
			MoonwalkButton.BackgroundTransparency = 0.15
			MoonwalkButton.AutoButtonColor = true
			MoonwalkButton.Visible = MoonwalkButtonVisible
			MoonwalkButton.ZIndex = 10
			MoonwalkButton.Parent = MoonwalkUI
			local uiCorner2 = Instance.new("UICorner")
			uiCorner2.CornerRadius = UDim.new(1, 0)
			uiCorner2.Parent = MoonwalkButton
			local uiStroke2 = Instance.new("UIStroke")
			uiStroke2.Color = Color3.new(1, 0.78431373834609985, 0.19607843458652496)
			uiStroke2.Thickness = 1.5
			uiStroke2.Transparency = 0.4
			uiStroke2.Parent = MoonwalkButton
			local textLabel = Instance.new("TextLabel")
			local packedResults22 = table.pack(bit32.band(numberValue3, 4294967295))
			local packedResults23 = table.pack(bit32.band(sum16, 4294967295))
			local packedResults24 = table.pack(bit32.band(packedResults22[1], 65535))
			local packedResults25 = table.pack(bit32.rshift(packedResults22[1], 16))
			local packedResults26 = table.pack(bit32.band(packedResults23[1], 65535))
			local maskedBits10 = bit32.band(packedResults24[1] * packedResults26[1] + bit32.lshift(bit32.band(packedResults24[1] * bit32.rshift(packedResults23[1], 16) + packedResults25[1] * packedResults26[1], 65535), 16), 4294967295)
			textLabel.Name = "MoonwalkLabel"
			textLabel.Size = UDim2.new(1, 0, 1, 0)
			textLabel.BackgroundTransparency = 1
			textLabel.Text = "🌙 OFF"
			textLabel.TextColor3 = Color3.new(1, 1, 1)
			textLabel.TextScaled = true
			textLabel.Font = Enum.Font.GothamBold
			textLabel.ZIndex = 11
			textLabel.Parent = MoonwalkButton
			local mouseButton1Click = MoonwalkButton.MouseButton1Click
			local connect = mouseButton1Click.Connect
			local xorValue16 = 370293320

			local function callbackValue32()
				local toggleMoonwalk = ToggleMoonwalk
				local matches = bit32.bxor(xorValue16, 0) + 257150250 ~= 304791128
				toggleMoonwalk()
			end

			local xorValue17 = bit32.bxor(maskedBits10, 1517727502)
			xorValue16 = bit32.bxor(xorValue16, xorValue17)
			connect(mouseButton1Click, callbackValue32)
			UpdateMoonwalkStatus()
		end

		local spawn_ = task.spawn
		local xorValue16 = bit32.bxor(sum15, 0)
		local combinedBits3 = bit32.bor(quotient4, xorValue16)

		spawn_(function()
			task.wait(1)
			RecreateMoonwalkButton()
			print("✅ Moonwalk button created!")
		end)

		localPlayer.CharacterAdded:Connect(function()
			task.wait(1)
			RecreateMoonwalkButton()
			setMoonwalk(true)
		end)

		tapMobileParryButton = function()
			local playerGui2 = localPlayer:FindFirstChild("PlayerGui")
			if not playerGui2 then
				return
			end
			local survivorMob = playerGui2:FindFirstChild("Survivor-mob")
			local guiMob = survivorMob and survivorMob:FindFirstChild("Controls") and survivorMob.Controls:FindFirstChild("Gui-mob")

			if guiMob and guiMob.Visible then
				pcall(function()
					firesignal(guiMob.MouseButton1Down)
					task.wait(0.01)
					firesignal(guiMob.MouseButton1Up)
				end)
			else
				pcall(function()
					mouse2click()
				end)
			end
		end

		ExecuteParry = function()
			if State.ParryCooldown then
				return
			end

			pcall(function()
				local parry = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes"):FindFirstChild("Items"):FindFirstChild("Parrying Dagger"):FindFirstChild("parry")

				if parry then
					for index2 = 1, 10 do
						parry:FireServer()
					end
				end

				task.spawn(tapMobileParryButton)
			end)
		end

		ListenToParryResult = function()
			task.spawn(function()
				local remotes = game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 5)
				remotes = remotes and remotes:WaitForChild("Items", 5):WaitForChild("Parrying Dagger", 5)
				remotes = remotes and remotes:WaitForChild("parryResult", 5)

				if remotes then
					remotes.OnClientEvent:Connect(function(inputValue3, inputValue4)
						local numericValue = tonumber(inputValue4)

						if not numericValue then
							numericValue = inputValue3 == true and 90 or 60
						end

						State.ParryCooldown = true

						if State.ParryCooldownThread then
							task.cancel(State.ParryCooldownThread)
						end

						State.ParryCooldownThread = task.delay(numericValue, function()
							State.ParryCooldown = false
						end)
					end)
				end
			end)
		end

		ListenToParryResult()

		local function attachParrySensor(inputValue3)
			if not (not inputValue3 or entries3[inputValue3]) then
				entries3[inputValue3] = true

				if entries3 then
					local humanoid = inputValue3:FindFirstChild("Humanoid")

					if not humanoid then
						humanoid = inputValue3:WaitForChild("Humanoid", 5)
						if not humanoid then
							return
						end
					end

					local animator = humanoid:FindFirstChildOfClass("Animator")

					if not animator then
						animator = humanoid:WaitForChild("Animator", 5)
						if not animator then
							return
						end
					end

					humanoid.ChildAdded:Connect(function(child)
						if child:IsA("Animator") then
							entries3[inputValue3] = nil
							AttachParrySensor(inputValue3)
						end
					end)

					inputValue3.AncestryChanged:Connect(function(child, parent)
						if not parent then
							entries3[inputValue3] = nil
						end
					end)

					animator.AnimationPlayed:Connect(function(inputValue4)
						local numberValue2 = 1753111827
						local numberValue3 = 4149167132
						local match = (inputValue4.Animation and inputValue4.Animation.AnimationId or ""):match("%d+")
						local entry = VALID_PARRY_IDS[match]
						if not entry then
							return
						end

						if match == "80411309607666" and Config.Surv_AutoCrouch then
							local character = localPlayer.Character
							if IsDowned(character) then
								return
							end
							character = character and character:FindFirstChild("HumanoidRootPart")
							local humanoidRootPart = inputValue3:FindFirstChild("HumanoidRootPart")

							if character and humanoidRootPart then
								if (character.Position - humanoidRootPart.Position).Magnitude <= 40 then
									TriggerCrouch()
								end
							end

							return
						end

						if not Config.Surv_AutoParry then
							return
						end

						if State.ParryCooldown then
							return
						end

						if Config.Ignored_Skills_List and Config.Ignored_Skills_List[entry] then
							return
						end
						local character = localPlayer.Character
						local isDownedResult = IsDowned(character)
						local packedResults22 = table.pack(bit32.band(numberValue3, 4294967295))
						local packedResults23 = table.pack(bit32.band(numberValue2, 4294967295))
						local packedResults24 = table.pack(bit32.band(packedResults22[1], 65535))
						local packedResults25 = table.pack(bit32.rshift(packedResults22[1], 16))
						local packedResults26 = table.pack(bit32.band(packedResults23[1], 65535))
						local maskedBits10 = bit32.band(packedResults24[1] * packedResults26[1] + bit32.lshift(bit32.band(packedResults24[1] * bit32.rshift(packedResults23[1], 16) + packedResults25[1] * packedResults26[1], 65535), 16), 4294967295)
						if isDownedResult or not IsSafeToParry(character) then
							return
						end
						local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
						local humanoidRootPart2 = inputValue3:FindFirstChild("HumanoidRootPart")
						if not humanoidRootPart or not humanoidRootPart2 then
							return
						end
						local magnitude = (humanoidRootPart.Position - humanoidRootPart2.Position).Magnitude

						if Config.Surv_ParryAggressive then
							local numberValue4 = 12
							if magnitude > Config.Surv_ParryRadius + 5 then
								return
							end

							if magnitude <= numberValue4 then
								ExecuteParry()
							else
								local valueValue5 = nil
								local now = os.clock()
								local heartbeat = RunService.Heartbeat
								local connect = heartbeat.Connect
								local xorValue17 = numberValue2 - 1653719412

								local function callbackValue32()
									if os.clock() - now >= 1.5 or State.ParryCooldown or not humanoidRootPart or not humanoidRootPart2 or IsDowned(character) then
										valueValue5:Disconnect()
										return
									end
									local position = humanoidRootPart.Position
									local matches = bit32.bxor(xorValue17, 0) + 226563704 == 15371318

									if (position - humanoidRootPart2.Position).Magnitude <= numberValue4 then
										ExecuteParry()
										valueValue5:Disconnect()
									end
								end

								xorValue17 = bit32.bxor(xorValue17, maskedBits10 + 198332320)
								valueValue5 = connect(heartbeat, callbackValue32)
							end
						else
							if Config.Surv_ParryRadius < magnitude then
								return
							end
							local difference8 = numberValue2 - maskedBits10
							local difference9 = Vector3.new(humanoidRootPart.Position.X, 0, humanoidRootPart.Position.Z) - Vector3.new(humanoidRootPart2.Position.X, 0, humanoidRootPart2.Position.Z)

							if difference9.Magnitude > 0 then
								local unit = difference9.Unit
								local unit2 = Vector3.new(humanoidRootPart2.CFrame.LookVector.X, 0, humanoidRootPart2.CFrame.LookVector.Z).Unit
								local survParryFace = Config.Surv_ParryFace
								if unit2:Dot(unit) < survParryFace then
									return
								end
							end

							ExecuteParry()
							bit32.bxor(difference8, 879263724)
						end
					end)

					return
				end
			end
		end

		difference7 = combinedBits3 - bit32.bxor(sum15, 0)
		AttachParrySensor = attachParrySensor

		TryAttach = function(inputValue3)
			if inputValue3 ~= localPlayerValue and IsKiller(inputValue3) and inputValue3.Character then
				AttachParrySensor(inputValue3.Character)
			end
		end

		SetupPlayer = function(inputValue3)
			if inputValue3 == localPlayerValue then
				return
			end

			inputValue3.CharacterAdded:Connect(function()
				TryAttach(inputValue3)
			end)

			inputValue3:GetPropertyChangedSignal("Team"):Connect(function()
				TryAttach(inputValue3)
			end)

			if inputValue3.Character then
				TryAttach(inputValue3)
			end
		end

		ApplyFullBright = function()
			Lighting.Brightness = 5
			Lighting.ClockTime = TimeOfDayValue
			Lighting.FogEnd = 100000
			Lighting.Ambient = Color3.new(1, 1, 1)
			Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
		end

		ApplyNoFog = function()
			Lighting.FogStart = 0
			Lighting.FogEnd = 100000
			Lighting.FogColor = Color3.new(1, 1, 1)
			local atmosphere = Lighting:FindFirstChildOfClass("Atmosphere")

			if atmosphere then
				atmosphere.Density = 0
				atmosphere.Offset = 0
				atmosphere.Glare = 0
				atmosphere.Haze = 0
			end
		end

		ApplyNoShadow = function()
			Lighting.GlobalShadows = not NoShadow
		end

		ReapplyPerformance = function()
			task.wait(1)
			ApplyFullBright()
			ApplyNoFog()
			ApplyNoShadow()
		end

		callbackValue22 = function()
			Connections.LeapBypass = task.spawn(function()
				local item = nil
				local item2 = nil

				for _, item3 in pairs(getgc(true)) do
					if type(item3) == "function" and islclosure(item3) then
						local getinfoResult = debug.getinfo(item3)

						if getinfoResult.name == "tryActivate" then
							item = item3
						end

						if getinfoResult.name == "playM2Animation" then
							item2 = item3
						end

						if not (item and item2) then
							continue
						end
					else
						continue
					end

					break
				end

				if not item and not item2 then
					warn("Function tidak ditemukan.")
					return
				end

				while task.wait(0.1) do
					if Killer.BypassLeap then
						for _, item4 in pairs({ item, item2 }) do
							if item4 then
								for index2, item5 in pairs(debug.getupvalues(item4)) do
									if type(item5) == "boolean" and item5 == true then
										debug.setupvalue(item4, index2, false)
									end
								end
							end
						end

						continue
					end

					break
				end
			end)
		end

		PlayEmote = function()
			local numberValue2 = 3169442375
			local numberValue3 = 631785713
			local character = localPlayerValue.Character
			if not character then
				return
			end
			local humanoid = character:FindFirstChildOfClass("Humanoid")
			local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
			if not humanoid or not humanoidRootPart then
				return
			end
			currentTrack:Stop()
			currentSound:Destroy()
			local animation = Instance.new("Animation")
			animation.AnimationId = SelectedAnim
			currentTrack = humanoid:LoadAnimation(animation)
			currentTrack.Looped = true
			currentTrack:Play()
			currentSound = Instance.new("Sound")
			local currentSoundValue = currentSound
			local xorValue17 = bit32.bxor(numberValue2, numberValue3)
			currentSoundValue.SoundId = SelectedSound
			currentSound.Looped = true
			currentSound.Volume = 2
			currentSound.Parent = humanoidRootPart
			currentSound:Play()
		end

		StopEmote = function()
			currentTrack:Stop()
			currentSound:Destroy()
		end

		local function startSpeedInputModeValue()
			print("✅ Speed Input aktif (via main RenderStepped)")
		end

		sum13 = sum15 + difference7
		startSpeedInputMode = startSpeedInputModeValue
	end

	stopSpeedInputMode = function()
		SpeedInputConnection:Disconnect()
		SpeedInputConnection = nil
	end

	do
		local valueValue5 = nil
		MoonwalkButtonVisible = false

		local function callbackValue32()
			if valueValue5 then
				valueValue5:Disconnect()
				valueValue5 = nil
			end

			local character = localPlayer.Character
			character = character and character:FindFirstChildOfClass("Humanoid")

			if character then
				character.AutoRotate = true
			end
		end

		local function callbackValue33()
			callbackValue32()
			local character = localPlayer.Character
			local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
			character = character and character:FindFirstChildOfClass("Humanoid")
			if not humanoidRootPart or not character then
				return
			end
			character.AutoRotate = false
			stateManager = true
			print("✅ Moonwalk aktif")
		end

		local function callbackValue34(stateManagerValue)
			stateManager = stateManagerValue

			if stateManagerValue then
				callbackValue33()
			else
				callbackValue32()
			end
		end

		RecreateMoonwalkButton = function()
			local numberValue2 = 794024788
			local numberValue3 = 2220539784
			local moonwalkUI = CoreGui:FindFirstChild("MoonwalkUI")

			if moonwalkUI then
				moonwalkUI:Destroy()
			end

			MoonwalkUI = Instance.new("ScreenGui")
			MoonwalkUI.Name = "MoonwalkUI"
			MoonwalkUI.ResetOnSpawn = false
			MoonwalkUI.IgnoreGuiInset = true
			MoonwalkUI.Parent = CoreGui
			MoonwalkUI.Enabled = false
			MoonwalkButton = Instance.new("TextButton")
			MoonwalkButton.Name = "MoonwalkButton"
			MoonwalkButton.Size = UDim2.new(0, 110, 0, 36)
			MoonwalkButton.Position = UDim2.new(0.89999997615814209, 0, 0.2800000011920929, 0)
			MoonwalkButton.BackgroundColor3 = Color3.new(0, 0, 0)
			MoonwalkButton.BackgroundTransparency = 0
			MoonwalkButton.Text = ""
			MoonwalkButton.AutoButtonColor = false
			MoonwalkButton.BorderSizePixel = 0
			MoonwalkButton.Visible = false
			MoonwalkButton.ZIndex = 10
			MoonwalkButton.Parent = MoonwalkUI
			local uiCorner = Instance.new("UICorner", MoonwalkButton)
			local maskedBits10 = bit32.band(numberValue2, numberValue3)
			uiCorner.CornerRadius = UDim.new(0, 8)
			local textLabel = Instance.new("TextLabel")
			textLabel.Name = "MoonwalkLabel"
			textLabel.Size = UDim2.new(1, 0, 1, 0)
			textLabel.BackgroundTransparency = 1
			textLabel.Text = "Moonwalk"
			textLabel.TextColor3 = Color3.new(0.94117647409439087, 0.94117647409439087, 0.94117647409439087)
			textLabel.Font = Enum.Font.GothamBold
			textLabel.TextSize = 12
			textLabel.ZIndex = 11
			textLabel.Parent = MoonwalkButton
			local enabledValue4 = false
			local enabledValue5 = false
			local enabledValue6 = false
			local position = nil
			local position2 = nil
			local thread2 = nil
			local numberValue4 = 18
			local numberValue5 = 469098660

			local function callbackValue35(inputValue3)
				local numberValue6 = 1641563041
				local numberValue7 = 1684470008
				if not enabledValue4 or not enabledValue6 or not position or not position2 then
					return
				end
				local sum16 = numberValue6 + bit32.bxor(numberValue5, 0)
				local difference8 = inputValue3.Position - position

				if not enabledValue5 and (math.abs(difference8.X) > numberValue4 or math.abs(difference8.Y) > numberValue4) then
					enabledValue5 = true
				end

				if enabledValue5 then
					local moonwalkButton = MoonwalkButton
					local udim2 = UDim2.new
					local scale = position2.X.Scale
					local sum17 = position2.X.Offset + difference8.X
					local scale2 = position2.Y.Scale
					local offset = position2.Y.Offset
					local sum18 = numberValue7 + bit32.bxor(numberValue5, 0)
					moonwalkButton.Position = udim2(scale, sum17, scale2, offset + difference8.Y)
				end
			end

			local numberValue6 = 424852789

			local function callbackValue36(input)
				local userInputType = input.UserInputType
				bit32.bxor(numberValue6, 0)

				if userInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					enabledValue4 = true
					enabledValue5 = false
					enabledValue6 = false
					position = input.Position
					position2 = MoonwalkButton.Position

					if thread2 then
						task.cancel(thread2)
						thread2 = nil
					end

					thread2 = task.delay(0.18, function()
						if enabledValue4 then
							enabledValue6 = true
						end
					end)
				end
			end

			numberValue6 = 151521426
			MoonwalkButton.InputBegan:Connect(callbackValue36)
			local inputEnded = MoonwalkButton.InputEnded
			local connect = inputEnded.Connect
			local xorValue17 = 244372248

			local function callbackValue37(inputValue3)
				local userInputType = inputValue3.UserInputType
				local mouseButton1 = Enum.UserInputType.MouseButton1
				bit32.bxor(bit32.bxor(xorValue17, 0), 31639492)

				if userInputType == mouseButton1 or inputValue3.UserInputType == Enum.UserInputType.Touch then
					if thread2 then
						task.cancel(thread2)
						thread2 = nil
					end

					if enabledValue4 and not enabledValue5 then
						ToggleMoonwalk()
					end

					enabledValue4 = false
					enabledValue5 = false
					enabledValue6 = false
					position = nil
					position2 = nil
				end
			end

			xorValue17 = bit32.bxor(xorValue17, maskedBits10 + 373076774)
			connect(inputEnded, callbackValue37)
			numberValue5 = 86668378
			local numberValue7 = 159529199

			local function callbackValue38(input)
				local enabledValue7 = enabledValue4
				local sum16 = bit32.bxor(numberValue7, 0) + 82160239

				if enabledValue7 and enabledValue6 and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
					callbackValue35(input)
				end
			end

			numberValue7 = 525008818
			UserInputService.InputChanged:Connect(callbackValue38)
			UpdateMoonwalkStatus()
		end

		UpdateMoonwalkStatus = function()
			local moonwalkLabel = MoonwalkButton:FindFirstChild("MoonwalkLabel")
			MoonwalkButton.BackgroundColor3 = Color3.new(0, 0, 0)
			MoonwalkButton.BackgroundTransparency = 0

			if moonwalkLabel then
				moonwalkLabel.Text = "Moonwalk"
				moonwalkLabel.TextColor3 = Color3.new(0.31372550129890442, 1, 0.47058823704719543)
			end
		end

		ToggleMoonwalk = function()
			MoonwalkEnabled = not MoonwalkEnabled
			callbackValue34(MoonwalkEnabled)
			UpdateMoonwalkStatus()
			Library:Notify({ Title = "Moonwalk", Description = "ON", Time = 2 })
		end

		SetMoonwalkButtonVisible = function(enabled)
			MoonwalkButtonVisible = enabled
			MoonwalkUI.Enabled = enabled
			MoonwalkButton.Visible = enabled

			if not enabled and MoonwalkEnabled then
				MoonwalkEnabled = false
				callbackValue34(false)
				UpdateMoonwalkStatus()
			end
		end

		UpdateMoonwalkVisibility = function()
			MoonwalkButton.Visible = MoonwalkEnabled
		end

		task.spawn(function()
			task.wait(1)
			RecreateMoonwalkButton()
			print("✅ Moonwalk button created!")
		end)

		localPlayer.CharacterAdded:Connect(function()
			task.wait(1)
			RecreateMoonwalkButton()
			callbackValue34(true)
			SetMoonwalkButtonVisible(true)
		end)
	end

	gatherGates = function()
		local entries7 = {}
		local map = workspace:FindFirstChild("Map")
		if not map then
			warn("Map not found")
			return entries7
		end

		for _, descendant in pairs(map:GetDescendants()) do
			if descendant.Name == "Gate" then
				table.insert(entries7, descendant)
			end
		end

		return entries7
	end

	setBypassGate = function(bypassGateEnabled)
		BypassGateEnabled = bypassGateEnabled
		local gatherGatesResult = gatherGates()

		for _, item in pairs(gatherGatesResult) do
			local leftGate = item:FindFirstChild("LeftGate")
			local rightGate = item:FindFirstChild("RightGate")
			local leftGateEnd = item:FindFirstChild("LeftGate-end") or item:FindFirstChild("LeftGate-end2")
			local rightGateEnd = item:FindFirstChild("RightGate-end") or item:FindFirstChild("RightGate-end2")
			local box = item:FindFirstChild("Box")

			if bypassGateEnabled then
				if leftGate then
					leftGate.Transparency = 1
					leftGate.CanCollide = false
				end

				if rightGate then
					rightGate.Transparency = 1
					rightGate.CanCollide = false
				end

				if leftGateEnd then
					leftGateEnd.Transparency = 0
				end

				if rightGateEnd then
					rightGateEnd.Transparency = 0
				end

				if box then
					box.CanCollide = false
				end
			else
				if leftGate then
					leftGate.Transparency = 0
					leftGate.CanCollide = true
				end

				if rightGate then
					rightGate.Transparency = 0
					rightGate.CanCollide = true
				end

				if leftGateEnd then
					leftGateEnd.Transparency = 1
				end

				if rightGateEnd then
					rightGateEnd.Transparency = 1
				end

				if box then
					box.CanCollide = true
				end
			end
		end
	end

	GetNearestKiller = function()
		local humanoidRootPart = localPlayerValue.Character and localPlayerValue.Character:FindFirstChild("HumanoidRootPart")
		if not humanoidRootPart then
			return nil, math.huge
		end
		local huge = math.huge
		local item = nil

		for _, player in ipairs(Players:GetPlayers()) do
			if player ~= localPlayerValue and player.Team and player.Team.Name == "Killer" and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
				local magnitude = (player.Character.HumanoidRootPart.Position - humanoidRootPart.Position).Magnitude

				if magnitude < huge then
					huge = magnitude
					item = player
				end
			end
		end

		return item, huge
	end

	FleeKiller = function()
		local humanoidRootPart = localPlayerValue.Character and localPlayerValue.Character:FindFirstChild("HumanoidRootPart")
		if not humanoidRootPart then
			return
		end
		local getNearestKillerResult, valueValue6 = GetNearestKiller()
		if not getNearestKillerResult or valueValue6 > FleeDistance then
			return
		end
		local fleeCooldown = FleeCooldown
		if tick() - fleeCooldown < 3 then
			return
		end
		local humanoidRootPart2 = getNearestKillerResult.Character and getNearestKillerResult.Character:FindFirstChild("HumanoidRootPart")
		if not humanoidRootPart2 then
			return
		end
		humanoidRootPart.CFrame = CFrame.new(humanoidRootPart.Position + (humanoidRootPart.Position - humanoidRootPart2.Position).Unit * 80)
		FleeCooldown = tick()
	end

	EnableInfiniteLunge = function()
		enabledValue = true
		local character = localPlayerValue.Character

		if character then
			character:SetAttribute("lungeboost", 999)
		end

		Library:Notify({ Title = "Infinite Lunge", Description = "✅ AKTIF (999x)", Time = 3 })
	end

	DisableInfiniteLunge = function()
		enabledValue = false
		local character = localPlayerValue.Character

		if character then
			character:SetAttribute("lungeboost", 1)
		end

		Library:Notify({ Title = "Infinite Lunge", Description = "Nonaktif", Time = 3 })
	end

	localPlayerValue.CharacterAdded:Connect(function(character)
		task.wait(0.8)

		if enabledValue and character then
			character:SetAttribute("lungeboost", 999)
		end
	end)

	AutoPalletEnabled = false
	local xorValue17, entries7, invisible, callbackValue35, callbackValue36, callbackValue37, lib, lib2, lib3, options
	local toggles, difference8, tabs, product, Ability, sum16, difference9

	do
		local product2 = maskedBits7 * bit32.bxor(sum13, 0)
		AutoPalletSafety = true
		AutoPalletDistance = 10
		local timestamp4 = 0
		local entries8 = {}
		local thread2 = nil

		GetKillerRoot = function()
			for _, player in ipairs(Players:GetPlayers()) do
				if player == localPlayer then
					continue
				end

				if player.Team and player.Team.Name == "Survivors" then
					continue
				end
				local character = player.Character

				if character then
					local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
					if humanoidRootPart then
						return humanoidRootPart
					end
				end
			end

			return nil
		end

		local xorValue18 = bit32.bxor(sum13, 0)
		xorValue17 = bit32.bxor(difference7, xorValue18)

		IsSafeToDropPallet = function(inputValue3)
			local numberValue2 = 1833599680
			local numberValue3 = 4064967504
			if not inputValue3 then
				return false
			end

			if inputValue3:GetAttribute("Knocked") == true then
				return false
			end

			if inputValue3:GetAttribute("IsCarried") == true then
				return false
			end

			if inputValue3:GetAttribute("IsHooked") == true then
				return false
			end
			local checkInterractable = inputValue3:FindFirstChild("CheckInterractable")

			if checkInterractable then
				if checkInterractable:GetAttribute("isVaulting") == true then
					return false
				end

				if checkInterractable:GetAttribute("isRepairing") == true then
					return false
				end

				if checkInterractable:GetAttribute("isUnhooking") == true then
					return false
				end

				if checkInterractable:GetAttribute("isHealing") == true then
					return false
				end

				if checkInterractable:GetAttribute("isSliding") == true then
					return false
				end

				if checkInterractable:GetAttribute("isCarrying") == true then
					return false
				end
			end

			local humanoid = inputValue3:FindFirstChildOfClass("Humanoid")

			if humanoid then
				humanoid = humanoid.Health <= 0
				bit32.bxor(bit32.bxor(numberValue2, numberValue3), 4064967504)
			end

			if humanoid then
				return false
			end
			return true
		end

		FindNearestPallet = function(inputValue3)
			local autoPalletDistance = AutoPalletDistance
			local ipairsValue = ipairs
			local pallets = espCache.Pallets or {}
			local item = nil

			for _, pallet in ipairsValue(pallets) do
				if not (not pallet or not pallet.Parent) then
					if not entries8[pallet] then
						local primaryPartPallet = pallet:FindFirstChild("PrimaryPartPallet") or pallet:FindFirstChild("PalletPoint") or pallet:FindFirstChild("PalletPointSlide") or pallet:FindFirstChildWhichIsA("BasePart")

						if primaryPartPallet then
							local ok, result = pcall(function()
								return primaryPartPallet.Position
							end)

							if not (not ok or not result) then
								local magnitude = (inputValue3.Position - result).Magnitude

								if magnitude < autoPalletDistance then
									autoPalletDistance = magnitude
									item = pallet
								end
							end
						end
					end
				end
			end

			return item
		end

		DropPallet = function(inputValue3)
			if not inputValue3 then
				return false
			end
			local palletPointSlide = inputValue3:FindFirstChild("PalletPointSlide") or inputValue3:FindFirstChild("PalletPoint") or inputValue3:FindFirstChildWhichIsA("BasePart")
			if not palletPointSlide then
				return false
			end
			local remotes = ReplicatedStorage:FindFirstChild("Remotes")
			local palletDropEvent = remotes and remotes:FindFirstChild("Pallet") and remotes.Pallet:FindFirstChild("PalletDropEvent")

			if palletDropEvent then
				pcall(function()
					palletDropEvent:FireServer(palletPointSlide)
				end)

				entries8[inputValue3] = true
				timestamp4 = tick()
				return true
			end

			return false
		end

		StartAutoPallet = function()
			if thread2 then
				return
			end

			thread2 = task.spawn(function()
				while true do
					task.wait(0.3)

					if GetRole() == "Survivor" then
						if not (tick() - timestamp4 < 2.5) then
							pcall(function()
								local character = localPlayer.Character
								local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
								local humanoid = character and character:FindFirstChildOfClass("Humanoid")
								if not humanoidRootPart or not humanoid or humanoid.Health <= 0 then
									return
								end

								if not IsSafeToDropPallet(character) then
									return
								end
								local getKillerRootResult = GetKillerRoot()
								if not getKillerRootResult then
									return
								end

								if AutoPalletDistance < (humanoidRootPart.Position - getKillerRootResult.Position).Magnitude then
									return
								end
								local findNearestPalletResult = FindNearestPallet(humanoidRootPart)

								if findNearestPalletResult then
									DropPallet(findNearestPalletResult)
								end
							end)
						end
					end
				end
			end)
		end

		StopAutoPallet = function()
			if thread2 then
				task.cancel(thread2)
				thread2 = nil
			end
		end

		localPlayer.CharacterAdded:Connect(function()
			entries8 = {}
			timestamp4 = 0
		end)

		RunService.RenderStepped:Connect(function()
			local xorValue19 = 922960672
			local xorValue20 = 1201133133
			local sum17 = 483008448
			local character = localPlayerValue.Character
			if not character then
				return
			end
			local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
			local humanoid = character:FindFirstChildOfClass("Humanoid")
			if not humanoidRootPart or not humanoid then
				return
			end
			local now = tick()

			if Config.Surv_Aimbot_Enabled then
				if GetRole() == "Survivor" then
					local getBestAimbotTargetResult = getBestAimbotTarget()

					if getBestAimbotTargetResult then
						local position = getBestAimbotTargetResult.Position
						local getDistanceResult = GetDistance(position)
						local difference10 = xorValue19 - xorValue20

						if getDistanceResult < 100 then
							position += currentCamera.CFrame.RightVector * (100 - getDistanceResult) * Config.Surv_Aimbot_Predict
						end

						local sum18 = sum17 + 483008448
						local survAimbotSmoothness = Config.Surv_Aimbot_Smoothness
						currentCamera.CFrame = currentCamera.CFrame:Lerp(CFrame.new(currentCamera.CFrame.Position, position), survAimbotSmoothness)
						humanoidRootPart.CFrame = humanoidRootPart.CFrame:Lerp(CFrame.new(humanoidRootPart.Position, Vector3.new(position.X, humanoidRootPart.Position.Y, position.Z)), Config.Surv_Aimbot_Smoothness)
						sum17 = sum18 - 483008448
						xorValue19 = difference10 - 3093834163
					end
				end
			end

			if Config.Killer_Aimbot_Enabled and isAimbotHolding then
				if GetRole() == "Killer" then
					local parent = lockedAimbotTarget.Parent
					local difference11 = xorValue20 - bit32.bxor(sum17, 0)
					local humanoid2 = parent and parent:FindFirstChild("Humanoid")

					if not humanoid2 or humanoid2.Health <= 0 or IsDowned(parent) then
						lockedAimbotTarget = getBestAimbotTarget()
					end

					local position = lockedAimbotTarget.Position

					if Config.Killer_Aimbot_MaxDist < GetDistance(position) then
						lockedAimbotTarget = getBestAimbotTarget()
					else
						local cframe = CFrame.new(currentCamera.CFrame.Position, position)
						local currentCameraValue = currentCamera
						local currentCameraValue2 = currentCamera
						local xorValue21 = bit32.bxor(sum17, 0)
						local xorValue22 = bit32.bxor(difference11, xorValue21)
						currentCameraValue.CFrame = currentCameraValue2.CFrame:Lerp(cframe, Config.Killer_Aimbot_Smoothness)
						humanoidRootPart.CFrame = humanoidRootPart.CFrame:Lerp(CFrame.new(humanoidRootPart.Position, Vector3.new(position.X, humanoidRootPart.Position.Y, position.Z)), Config.Killer_Aimbot_Smoothness)
						difference11 = xorValue22 - 188347072
					end

					xorValue20 = difference11 - 3811958848
				end
			end

			local matches = character:GetAttribute("spearmode") == true

			if callbackValue2() and AimConfig.Veil_ShowFOV and matches then
				frame.Visible = true
				local sum19 = sum17 + xorValue19
				local frameValue = frame
				local udim2 = UDim2.new
				local product3 = AimConfig.Veil_FOV * 2
				local xorValue23 = bit32.bxor(sum19, 0)
				local maskedBits10 = bit32.band(xorValue19, xorValue23)
				frameValue.Size = udim2(0, product3, 0, AimConfig.Veil_FOV * 2)
				sum17 = sum19 + 3372006624
				xorValue20 = xorValue20 + 2482703298 + 1812263998
				xorValue19 = bit32.bxor(maskedBits10, 604111104)
			else
				frame.Visible = false
			end

			local currentCamera2 = workspace.CurrentCamera
			local callbackValue38 = callbackValue2

			if callbackValue2() and matches and currentCamera2 then
				local adornee = getClosestSurvivor()

				if adornee and adornee.Parent then
					veilTargetHighlight.Parent = adornee.Parent

					if not valueValue4 or valueValue4.Parent ~= adornee then
						if valueValue4 then
							valueValue4:Destroy()
						end

						local callbackValue39 = createBillboardGui
						valueValue4 = createBillboardGui()
						valueValue4.Adornee = adornee
						valueValue4.Parent = adornee
						sum17 = sum17 + 125410066 - 125410066
					end

					local screenPosition, valueValue6 = currentCamera2:WorldToViewportPoint(adornee.Position)

					if valueValue6 and screenPosition.Z > 0 then
						local viewportSize = currentCamera2.ViewportSize
						local product4 = viewportSize.X * 0.5
						local y = viewportSize.Y
						local x = screenPosition.X
						local y2 = screenPosition.Y
						local difference12 = x - product4
						local difference13 = y2 - y
						frame2.Size = UDim2.fromOffset(math.max(math.sqrt(difference12 * difference12 + difference13 * difference13), 1), 1)
						local lineValue = frame2
						local udim2 = UDim2.fromOffset
						local xorValue24 = bit32.bxor(xorValue19, 4294967295)
						lineValue.Position = udim2((product4 + x) * 0.5, (y + y2) * 0.5)
						frame2.Rotation = math.deg(math.atan2(difference13, difference12))
						frame2.Visible = true
						xorValue19 = bit32.bxor(xorValue24, 4294967295)
					else
						frame2.Visible = false
					end
				else
					veilTargetHighlight.Parent = nil

					if valueValue4 then
						valueValue4:Destroy()
						valueValue4 = nil
						sum17 = sum17 + xorValue20 + 3093834163
					end

					frame2.Visible = false
				end
			else
				veilTargetHighlight.Parent = nil
				local difference14 = xorValue19 - 4051317924

				if valueValue4 then
					valueValue4:Destroy()
					valueValue4 = nil
				end

				frame2.Visible = false
				xorValue19 = difference14 + 4051317924
			end

			if AimConfig.Flash_Silent then
				local getKillerTargetForFlashResult = getKillerTargetForFlash()

				if getKillerTargetForFlashResult then
					local character2 = localPlayer.Character
					character2 = character2 and character2:FindFirstChild("HumanoidRootPart")
					local sum20 = getKillerTargetForFlashResult.Position + Vector3.new(0, AimConfig.Flash_YOffset, 0)
					local currentCamera3 = workspace.CurrentCamera
					currentCamera3.CFrame = currentCamera3.CFrame:Lerp(CFrame.lookAt(currentCamera3.CFrame.Position, sum20), 0.5)

					if character2 then
						local sum21 = sum17 + xorValue20
						local cframe = CFrame.lookAt(character2.Position, Vector3.new(sum20.X, character2.Position.Y, sum20.Z))
						local cFrame = character2.CFrame
						local xorValue25 = bit32.bxor(sum21, 0)
						local maskedBits11 = bit32.band(xorValue20, xorValue25)
						character2.CFrame = cFrame:Lerp(cframe, 0.5)
						sum17 = sum21 + 3093834163
						xorValue20 = bit32.bxor(maskedBits11, 60162112)
					end
				end
			end

			local currentCamera3 = workspace.CurrentCamera

			if currentCamera3 then
				local lookVector = currentCamera3.CFrame.LookVector
				local rightVector = currentCamera3.CFrame.RightVector
				local vector = Vector3.new(lookVector.X, 0, lookVector.Z)
				local vector2 = Vector3.new(rightVector.X, 0, rightVector.Z)

				if vector.Magnitude > 0.001 then
					vector = vector.Unit
				end

				local unit

				if vector2.Magnitude > 0.001 then
					unit = vector2.Unit
				else
					unit = vector2
				end

				local sinResult = math.sin(now * 35)
				local radResult = math.rad(30 * sinResult)
				local cframe = CFrame.Angles
				local xorValue26 = bit32.bxor(sum17, 0)
				local combinedBits4 = bit32.bor(xorValue19, xorValue26)
				humanoidRootPart.CFrame = CFrame.lookAt(humanoidRootPart.Position, humanoidRootPart.Position + cframe(0, radResult, 0) * vector)
				humanoid:Move(-vector * 1.2 + unit * sinResult * 1.05, false)
				xorValue19 = bit32.bxor(combinedBits4, 147332288)
			end

			if Auto.SkillCheck and not State.busy then
				local skillCheckPromptGui = playerGui:FindFirstChild("SkillCheckPromptGui")

				if skillCheckPromptGui then
					local check = skillCheckPromptGui:FindFirstChild("Check")

					if check and check.Visible then
						local line = check:FindFirstChild("Line")
						local goal = check:FindFirstChild("Goal")

						if line and goal then
							if Auto.SkillCheckMode == "Instant" then
								local rotation = goal.Rotation + 109
								local xorValue27 = bit32.bxor(sum17, 0)
								local maskedBits12 = bit32.band(xorValue19, xorValue27)
								line.Rotation = rotation
								State.busy = true
								local spawn_ = task.spawn
								local xorValue28 = bit32.bxor(sum17, 283469962)

								local function callbackValue40()
									local matches2 = bit32.bxor(xorValue28, 0) + 233514781 == 499138262
									callbackValue15()
									task.wait(0.05)
									State.busy = false
								end

								local xorValue29 = bit32.bxor(xorValue20, 1591701415)
								xorValue28 = bit32.bxor(xorValue28, xorValue29)
								spawn_(callbackValue40)
							else
								local remainder = line.Rotation % 360
								local remainder2 = goal.Rotation % 360
								local quotient5 = xorValue20 // xorValue19
								local remainder3, remainder4

								if Auto.SkillCheckMode == "Normal" then
									remainder3 = (remainder2 + 116) % 360
									remainder4 = (remainder2 + 140) % 360
								else
									remainder3 = (remainder2 + 102) % 360
									remainder4 = (remainder2 + 116) % 360
									sum17 = sum17 + xorValue19 + 3372006624
								end

								local selectedValue

								if remainder4 < remainder3 then
									selectedValue = remainder >= remainder3 or remainder <= remainder4
								else
									selectedValue = remainder >= remainder3 and remainder <= remainder4
								end

								if selectedValue then
									State.busy = true
									local spawn_ = task.spawn
									local xorValue30 = xorValue19 - 660376515

									local function callbackValue41()
										callbackValue15()
										local wait = task.wait
										local matches2 = bit32.bxor(xorValue30, 0) == 507152149
										wait(0.05)
										State.busy = false
									end

									local xorValue31 = bit32.bxor(sum17, 363577511)
									xorValue30 = bit32.bxor(xorValue30, xorValue31)
									spawn_(callbackValue41)
								end
							end
						end
					end
				end
			end
		end)

		local timestamp5 = 0
		local timestamp6 = 0
		local timestamp7 = 0

		RunService.Heartbeat:Connect(function()
			local xorValue19 = 1158058458
			local xorValue20 = 1193575782
			local character = localPlayerValue.Character
			local xorValue21 = bit32.bxor(41963678, xorValue19)
			if not character then
				return
			end
			local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
			local humanoid = character:FindFirstChildOfClass("Humanoid")
			if not humanoidRootPart or not humanoid then
				return
			end
			local now = tick()
			local moveDirection = humanoid.MoveDirection

			if moveDirection.Magnitude > 0 then
				local cFrame = humanoidRootPart.CFrame
				local difference10 = xorValue20 - bit32.bxor(xorValue21, 0)
				humanoidRootPart.CFrame = cFrame + moveDirection * SpeedInputValue
				xorValue20 = bit32.bxor(difference10, 3099148612)
			end

			local moveDirection2 = humanoid.MoveDirection

			if moveDirection2.Magnitude > 0 then
				local cFrame = humanoidRootPart.CFrame + moveDirection2 * SpeedAmount
				local packedResults22 = table.pack(bit32.band(xorValue19, 4294967295))
				local packedResults23 = table.pack(bit32.band(packedResults22[1], 65535))
				local maskedBits10 = bit32.band(packedResults23[1] * 9037 + bit32.lshift(bit32.band(packedResults23[1] * 0 + bit32.rshift(packedResults22[1], 16) * 9037, 65535), 16), 4294967295)
				humanoidRootPart.CFrame = cFrame
				xorValue19 = bit32.bxor(maskedBits10, 3991682376)
			end

			if humanoid.Health < humanoid.MaxHealth then
				humanoid.Health = humanoid.MaxHealth
			end

			if currentCamera then
				currentCamera.FieldOfView = TargetFOV
			end

			if now - timestamp7 >= 0.3 then
				timestamp7 = now
				FleeKiller()
			end

			if Config.Surv_ParryCircle and Config.Surv_AutoParry and humanoidRootPart then
				local matches = not State.AutoParryAdornment
				local xorValue22 = bit32.bxor(xorValue21, 0)
				local combinedBits4 = bit32.bor(xorValue19, xorValue22)

				if not matches then
					matches = State.AutoParryAdornment.Parent ~= humanoidRootPart
					xorValue21 = bit32.bxor(bit32.bxor(xorValue21, 1479059017), 1479059017)
				end

				if matches then
					if State.AutoParryAdornment then
						State.AutoParryAdornment:Destroy()
					end

					State.AutoParryAdornment = Instance.new("CylinderHandleAdornment")
					State.AutoParryAdornment.Name = "AutoParryCircleESP"
					State.AutoParryAdornment.Height = 0.05
					State.AutoParryAdornment.Transparency = 0.3
					State.AutoParryAdornment.Adornee = humanoidRootPart
					State.AutoParryAdornment.Parent = humanoidRootPart
					State.AutoParryAdornment.ZIndex = 0
					State.AutoParryAdornment.AlwaysOnTop = false
				end

				local survParryRadius = Config.Surv_ParryRadius
				State.AutoParryAdornment.Radius = survParryRadius
				State.AutoParryAdornment.InnerRadius = math.max(0.1, survParryRadius - 0.15)
				local autoParryAdornment = State.AutoParryAdornment
				local cframe = CFrame.new
				local xorValue23 = bit32.bxor(xorValue21, 0)
				local maskedBits11 = bit32.band(xorValue20, xorValue23)
				local xorValue24 = bit32.bxor(xorValue21, combinedBits4)
				autoParryAdornment.CFrame = cframe(0, -3, 0) * CFrame.Angles(1.5707963267948966, 0, 0)

				if State.ParryCooldown then
					State.AutoParryAdornment.Color3 = Color3.new(1, 0.50196081399917603, 0)
					combinedBits4 = combinedBits4 // maskedBits11 - 3094949411
				elseif Config.Surv_ParryAggressive then
					State.AutoParryAdornment.Color3 = Color3.new(1, 0, 0)
				else
					State.AutoParryAdornment.Color3 = Color3.new(0, 1, 1)
				end

				xorValue21 = bit32.bxor(xorValue24, 1200017886)
				xorValue20 = maskedBits11 - 4292869086
				xorValue19 = combinedBits4 + 4253007868
			elseif State.AutoParryAdornment then
				State.AutoParryAdornment:Destroy()
				State.AutoParryAdornment = nil
			end

			if now - timestamp6 >= 0.3 then
				timestamp6 = now
				local humanoid2 = character:FindFirstChildOfClass("Humanoid")

				if humanoid2 and GetRole() == "Killer" and humanoid2.WalkSpeed < 16 then
					humanoid2.WalkSpeed = 16
				end
			end

			local espMaster = Config.ESP_Master
			local xorValue25 = bit32.bxor(xorValue21, xorValue20)

			if espMaster then
				espMaster = now - timestamp5 >= 5
				bit32.bxor(xorValue20 // 3, 1351766596)
			end

			if espMaster then
				timestamp5 = now

				if Config.ESP_Player or Config.ESP_Killer or Config.ESP_Name or Config.ESP_ItemIcon or Config.ESP_KillerWarn then
					UpdatePlayerESP()
				end

				if Config.ESP_SCP then
					UpdateSCPESP()
				end

				if Config.ESP_Generator or Config.ESP_Pallet or Config.ESP_Hook or Config.ESP_Gate or Config.ESP_Window then
					UpdateStaticESP()
				end
			end
		end)

		local entries9 = { Gui = nil, IsActive = false, GuiVisible = false }

		local function callbackValue38(inputValue3)
			if not entries9.Gui then
				return
			end
			local frame3 = entries9.Gui:FindFirstChild("Frame")
			if not frame3 then
				return
			end
			local actionButton = frame3:FindFirstChild("ActionButton")
			local uiStroke = frame3:FindFirstChild("UIStroke")

			if inputValue3 then
				if actionButton then
					actionButton.Text = "PARRY [ON]"
					actionButton.TextColor3 = Color3.new(0.70588237047195435, 1, 0.70588237047195435)
					actionButton.BackgroundColor3 = Color3.new(0.15686275064945221, 0.15686275064945221, 0.17647059261798859)
				end

				if uiStroke then
					uiStroke.Color = Color3.new(0.39215686917304993, 0.78431373834609985, 0.39215686917304993)
				end
			else
				if actionButton then
					actionButton.Text = "PARRY [OFF]"
					actionButton.TextColor3 = Color3.new(0.78431373834609985, 0.78431373834609985, 0.78431373834609985)
					actionButton.BackgroundColor3 = Color3.new(0.11764705926179886, 0.11764705926179886, 0.13725490868091583)
				end

				if uiStroke then
					uiStroke.Color = Color3.new(0.35294118523597717, 0.35294118523597717, 0.37254902720451355)
				end
			end
		end

		local function toggleSurvAutoParry()
			Config.Surv_AutoParry = not Config.Surv_AutoParry
			entries9.IsActive = Config.Surv_AutoParry
			callbackValue38(Config.Surv_AutoParry)

			pcall(function()
				if Toggles.AutoParryKey then
					Toggles.AutoParryKey:SetValue(Config.Surv_AutoParry)
				end
			end)

			pcall(function()
				if Toggles.AutoParry then
					Toggles.AutoParry:SetValue(Config.Surv_AutoParry)
				end
			end)

			Library:Notify({ Title = "Auto Parry", Description = Config.Surv_AutoParry and "Aktif" or "Nonaktif", Time = 2 })
		end

		local function callbackValue39()
			local numberValue2 = 581260215
			local numberValue3 = 2379090218

			if entries9.Gui then
				entries9.Gui:Destroy()
				entries9.Gui = nil
			end

			local screenGui = Instance.new("ScreenGui")
			screenGui.Name = "AutoParryCustomGui"
			screenGui.ResetOnSpawn = false
			screenGui.IgnoreGuiInset = true
			screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			screenGui.Parent = CoreGui
			screenGui.Enabled = false
			entries9.Gui = screenGui
			entries9.GuiVisible = false
			local frame3 = Instance.new("Frame")
			local xorValue19 = bit32.bxor(numberValue3, numberValue2)
			frame3.Name = "Frame"
			frame3.Parent = screenGui
			frame3.Size = UDim2.new(0, 110, 0, 36)
			frame3.Position = UDim2.new(0.85000002384185791, 0, 0.34999999403953552, 0)
			frame3.BackgroundColor3 = Color3.new(0.098039217293262482, 0.098039217293262482, 0.11764705926179886)
			frame3.BackgroundTransparency = 0.1
			frame3.Active = true
			frame3.BorderSizePixel = 0
			Instance.new("UICorner", frame3).CornerRadius = UDim.new(0, 8)
			local uiStroke = Instance.new("UIStroke")
			uiStroke.Name = "UIStroke"
			uiStroke.Parent = frame3
			uiStroke.Color = Color3.new(0.35294118523597717, 0.35294118523597717, 0.37254902720451355)
			uiStroke.Thickness = 1.5
			uiStroke.Transparency = 0.2
			local textButton = Instance.new("TextButton")
			textButton.Name = "ActionButton"
			textButton.Size = UDim2.new(1, 0, 1, 0)
			textButton.Text = "PARRY [OFF]"
			textButton.BackgroundColor3 = Color3.new(0.11764705926179886, 0.11764705926179886, 0.13725490868091583)
			textButton.Font = Enum.Font.GothamBold
			textButton.TextSize = 12
			textButton.TextColor3 = Color3.new(0.78431373834609985, 0.78431373834609985, 0.78431373834609985)
			textButton.BorderSizePixel = 0
			textButton.AutoButtonColor = false
			textButton.Parent = frame3
			Instance.new("UICorner", textButton).CornerRadius = UDim.new(0, 8)
			local enabledValue4 = false
			local enabledValue5 = false
			local enabledValue6 = false
			local position = nil
			local position2 = nil
			local thread3 = nil
			local numberValue4 = 18
			local xorValue20 = 470032496

			local function callbackValue40(inputValue3)
				local numberValue5 = 3295342867
				local numberValue6 = 2009712737
				if not enabledValue4 or not enabledValue6 or not position or not position2 then
					return
				end
				local position3 = inputValue3.Position
				local xorValue21 = bit32.bxor(xorValue20, 0)
				local packedResults22 = table.pack(bit32.band(numberValue6, 4294967295))
				local packedResults23 = table.pack(bit32.band(xorValue21, 4294967295))
				local packedResults24 = table.pack(bit32.band(packedResults22[1], 65535))
				local packedResults25 = table.pack(bit32.rshift(packedResults22[1], 16))
				local packedResults26 = table.pack(bit32.band(packedResults23[1], 65535))
				bit32.band(packedResults24[1] * packedResults26[1] + bit32.lshift(bit32.band(packedResults24[1] * bit32.rshift(packedResults23[1], 16) + packedResults25[1] * packedResults26[1], 65535), 16), 4294967295)
				local difference10 = position3 - position

				if not enabledValue5 and (math.abs(difference10.X) > numberValue4 or math.abs(difference10.Y) > numberValue4) then
					enabledValue5 = true
				end

				if enabledValue5 then
					local parentValue = frame3
					local udim2 = UDim2.new
					local scale = position2.X.Scale
					local sum17 = position2.X.Offset + difference10.X
					local scale2 = position2.Y.Scale
					local positionValue = position2
					local sum18 = numberValue5 + bit32.bxor(xorValue20, 0)
					local matches = bit32.bxor(xorValue20, 0) == 151612350
					parentValue.Position = udim2(scale, sum17, scale2, positionValue.Y.Offset + difference10.Y)
				end
			end

			local numberValue5 = 469913396

			local function callbackValue41(input)
				local userInputType = input.UserInputType
				local mouseButton1 = Enum.UserInputType.MouseButton1
				local sum17 = bit32.bxor(numberValue5, 0) + 350422122

				if userInputType == mouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					enabledValue4 = true
					enabledValue5 = false
					enabledValue6 = false
					position = input.Position
					position2 = frame3.Position

					if thread3 then
						task.cancel(thread3)
						thread3 = nil
					end

					thread3 = task.delay(0.18, function()
						if enabledValue4 then
							enabledValue6 = true
						end
					end)
				end
			end

			numberValue5 = 112867455
			textButton.InputBegan:Connect(callbackValue41)
			xorValue20 = bit32.bxor(xorValue20, xorValue19 - 2690216319)

			textButton.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					if thread3 then
						task.cancel(thread3)
						thread3 = nil
					end

					if enabledValue4 and not enabledValue5 then
						toggleSurvAutoParry()
					end

					enabledValue4 = false
					enabledValue5 = false
					enabledValue6 = false
					position = nil
					position2 = nil
				end
			end)

			local inputChanged = UserInputService.InputChanged
			local connect = inputChanged.Connect
			local xorValue21 = 457327777

			local function callbackValue42(inputValue3)
				local selectedValue = enabledValue4
				local matches = bit32.bxor(xorValue21, 0) + 412593953 ~= 474338429
				selectedValue = selectedValue and enabledValue6
				local selectedValue2

				if selectedValue then
					selectedValue2 = inputValue3.UserInputType == Enum.UserInputType.MouseMovement or inputValue3.UserInputType == Enum.UserInputType.Touch
				else
					selectedValue2 = selectedValue
				end

				if selectedValue2 then
					callbackValue40(inputValue3)
				end
			end

			xorValue21 = bit32.bxor(xorValue21, xorValue19 // 144 + 397706930)
			connect(inputChanged, callbackValue42)

			if entries9._statusConn then
				entries9._statusConn:Disconnect()
			end

			local numberValue6 = 130478951

			local function callbackValue43()
				local entries10 = entries9
				local matches = bit32.bxor(numberValue6, 0) ~= 104508335

				if not entries10.Gui or not entries9.Gui.Parent then
					if entries9._statusConn then
						entries9._statusConn:Disconnect()
						entries9._statusConn = nil
					end

					return
				end

				if entries9.IsActive ~= Config.Surv_AutoParry then
					entries9.IsActive = Config.Surv_AutoParry
					callbackValue38(Config.Surv_AutoParry)
				end
			end

			numberValue6 = 104508335
			entries9._statusConn = RunService.Heartbeat:Connect(callbackValue43)
		end

		localPlayerValue.CharacterAdded:Connect(function()
			task.wait(1)

			if entries9.GuiVisible and entries9.Gui then
				entries9.Gui.Enabled = true
				callbackValue38(Config.Surv_AutoParry)
			end
		end)

		task.spawn(function()
			task.wait(1.5)
			entries9.IsActive = false
			entries9.GuiVisible = false
			callbackValue39()
		end)

		entries7 = { Gui = nil, IsActive = false }
		local packedResults22 = table.pack(bit32.band(product2, 4294967295))
		local packedResults23 = table.pack(bit32.band(xorValue17, 4294967295))
		local packedResults24 = table.pack(bit32.band(packedResults22[1], 65535))
		local packedResults25 = table.pack(bit32.rshift(packedResults22[1], 16))
		local packedResults26 = table.pack(bit32.band(packedResults23[1], 65535))
		local maskedBits10 = bit32.band(packedResults24[1] * packedResults26[1] + bit32.lshift(bit32.band(packedResults24[1] * bit32.rshift(packedResults23[1], 16) + packedResults25[1] * packedResults26[1], 65535), 16), 4294967295)
		entries7.GuiVisible = false
		invisible = nil
		local enabledValue4 = false

		callbackValue35 = function()
			if invisible then
				return true
			end

			if enabledValue4 then
				return false
			end
			enabledValue4 = true

			task.spawn(function()
				local ok, result = pcall(function()
					loadstring(game:HttpGet("https://raw.githubusercontent.com/willrev-424/yore/refs/heads/main/wilrevv.lua"))()
				end)

				task.wait(1.2)
				local mengHub = _G.MengHub

				if mengHub and _G.MengHub.Invisible then
					invisible = _G.MengHub.Invisible
					print("Invisibility loaded")

					pcall(function()
						Library:Notify({ Title = "Invisibility", Description = "Ready!", Time = 2 })
					end)
				else
					warn("Gagal load Invisibility:", tostring(result))

					pcall(function()
						Library:Notify({ Title = "Invisibility", Description = "Gagal load script!", Time = 3 })
					end)
				end

				enabledValue4 = false
			end)

			return false
		end

		task.spawn(function()
			task.wait(2)
			callbackValue35()
		end)

		callbackValue36 = function(inputValue3)
			if not entries7.Gui then
				return
			end
			local frame3 = entries7.Gui:FindFirstChild("Frame")
			if not frame3 then
				return
			end
			local actionButton = frame3:FindFirstChild("ActionButton")

			if inputValue3 then
				if actionButton then
					actionButton.Text = "Invisible"
					actionButton.TextColor3 = Color3.new(0.70588237047195435, 1, 0.70588237047195435)
					actionButton.BackgroundColor3 = Color3.new(0, 0, 0)
				end
			elseif actionButton then
				actionButton.Text = "Invisible"
				actionButton.TextColor3 = Color3.new(0.78431373834609985, 0.78431373834609985, 0.78431373834609985)
				actionButton.BackgroundColor3 = Color3.new(0, 0, 0)
			end
		end

		local function callbackValue40()
			local numberValue2 = 2891166832
			local numberValue3 = 142768597

			if not invisible then
				if enabledValue4 then
					Library:Notify({ Title = "Invisibility", Description = "Masih loading...", Time = 2 })
					return
				end
				Library:Notify({ Title = "Invisibility", Description = "Loading...", Time = 2 })
				callbackValue35()
				task.wait(1.5)
				if not invisible then
					Library:Notify({ Title = "Invisibility", Description = "Gagal load. Coba lagi.", Time = 3 })
					return
				end
			end

			entries7.IsActive = not entries7.IsActive
			local difference10 = numberValue3 - numberValue2

			if entries7.IsActive then
				local numberValue4 = 161516546

				local function protectedCallback()
					local invisibleValue = invisible
					local matches = bit32.bxor(numberValue4, 0) + 423121894 == 459421780
					invisibleValue.enable()
				end

				numberValue4 = 286882470
				pcall(protectedCallback)
			else
				local numberValue5 = 321724681

				local function protectedCallback2()
					local disable = invisible.disable
					local matches = bit32.bxor(numberValue5, 0) == 59810578
					disable()
				end

				numberValue5 = 464588294
				pcall(protectedCallback2)
			end

			local callbackValue41 = callbackValue36
			callbackValue36(entries7.IsActive)
			local pcallValue = pcall
			local xorValue19 = 232571487

			local function callbackValue42()
				local sum17 = bit32.bxor(xorValue19, 0) + 498331126

				if Toggles.Invis_Gacor then
					Toggles.Invis_Gacor:SetValue(entries7.IsActive)
				end
			end

			local xorValue20 = bit32.bxor(difference10, 1538909747)
			xorValue19 = bit32.bxor(xorValue19, xorValue20)
			pcallValue(callbackValue42)
			Library:Notify({ Title = "Invisibility", Description = entries7.IsActive and "Aktif" or "Nonaktif", Time = 2 })
		end

		callbackValue37 = function()
			local numberValue2 = 2281084664
			local numberValue3 = 4277525772

			if entries7.Gui then
				entries7.Gui:Destroy()
				entries7.Gui = nil
			end

			local screenGui = Instance.new("ScreenGui")
			screenGui.Name = "InvisCustomGui"
			screenGui.ResetOnSpawn = false
			screenGui.IgnoreGuiInset = true
			screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			screenGui.Parent = CoreGui
			screenGui.Enabled = false
			entries7.Gui = screenGui
			entries7.GuiVisible = false
			local frame3 = Instance.new("Frame")
			frame3.Name = "Frame"
			frame3.Parent = screenGui
			frame3.Size = UDim2.new(0, 110, 0, 36)
			frame3.Position = UDim2.new(0.85000002384185791, 0, 0.41999998688697815, 0)
			frame3.BackgroundColor3 = Color3.new(0, 0, 0)
			local combinedBits4 = bit32.bor(numberValue2, numberValue3)
			frame3.BackgroundTransparency = 0
			frame3.Active = true
			frame3.BorderSizePixel = 0
			Instance.new("UICorner", frame3).CornerRadius = UDim.new(0, 8)
			local difference10 = numberValue3 - 4277525772
			local textButton = Instance.new("TextButton")
			textButton.Name = "ActionButton"
			textButton.Size = UDim2.new(1, 0, 1, 0)
			textButton.Text = "INVIS [OFF]"
			textButton.BackgroundColor3 = Color3.new(0, 0, 0)
			textButton.Font = Enum.Font.GothamBold
			textButton.TextSize = 12
			textButton.TextColor3 = Color3.new(0.78431373834609985, 0.78431373834609985, 0.78431373834609985)
			textButton.BorderSizePixel = 0
			textButton.AutoButtonColor = false
			textButton.Parent = frame3
			Instance.new("UICorner", textButton).CornerRadius = UDim.new(0, 8)
			local enabledValue5 = false
			local enabledValue6 = false
			local enabledValue7 = false
			local position = nil
			local position2 = nil
			local thread3 = nil
			local numberValue4 = 18
			local xorValue19 = 432581632

			local function callbackValue41(inputValue3)
				local numberValue5 = 3342241736
				local numberValue6 = 3214154164
				if not enabledValue5 or not enabledValue7 or not position or not position2 then
					return
				end
				local difference11 = inputValue3.Position - position
				local xorValue20 = bit32.bxor(xorValue19, 0)
				bit32.bxor(numberValue5, xorValue20)

				if not enabledValue6 and (math.abs(difference11.X) > numberValue4 or math.abs(difference11.Y) > numberValue4) then
					enabledValue6 = true
				end

				if enabledValue6 then
					local parentValue = frame3
					local udim2 = UDim2.new
					local scale = position2.X.Scale
					local x = position2.X
					local difference12 = numberValue6 - bit32.bxor(xorValue19, 0)
					parentValue.Position = udim2(scale, x.Offset + difference11.X, position2.Y.Scale, position2.Y.Offset + difference11.Y)
				end
			end

			local numberValue5 = 462588797

			local function callbackValue42(input)
				local sum17 = bit32.bxor(numberValue5, 0) + 409966235

				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					enabledValue5 = true
					enabledValue6 = false
					enabledValue7 = false
					position = input.Position
					position2 = frame3.Position

					if thread3 then
						task.cancel(thread3)
						thread3 = nil
					end

					thread3 = task.delay(0.18, function()
						if enabledValue5 then
							enabledValue7 = true
						end
					end)
				end
			end

			numberValue5 = 135249464
			textButton.InputBegan:Connect(callbackValue42)
			local inputEnded = textButton.InputEnded
			local numberValue6 = 423054862

			local function callbackValue43(inputValue3)
				local userInputType = inputValue3.UserInputType
				local userInputType2 = Enum.UserInputType
				local sum17 = bit32.bxor(numberValue6, 0) + 311543576

				if userInputType == userInputType2.MouseButton1 or inputValue3.UserInputType == Enum.UserInputType.Touch then
					if thread3 then
						task.cancel(thread3)
						thread3 = nil
					end

					if enabledValue5 and not enabledValue6 then
						callbackValue40()
					end

					enabledValue5 = false
					enabledValue6 = false
					enabledValue7 = false
					position = nil
					position2 = nil
				end
			end

			numberValue6 = 172012729
			inputEnded:Connect(callbackValue43)
			local userInputServiceService = UserInputService
			xorValue19 = bit32.bxor(xorValue19, combinedBits4 + 302229268)
			local inputChanged = userInputServiceService.InputChanged
			local connect = inputChanged.Connect
			local xorValue20 = 347389429

			local function callbackValue44(inputValue3)
				local enabledValue8 = enabledValue5
				bit32.bxor(bit32.bxor(xorValue20, 0), 227636178)

				if enabledValue8 and enabledValue7 and (inputValue3.UserInputType == Enum.UserInputType.MouseMovement or inputValue3.UserInputType == Enum.UserInputType.Touch) then
					callbackValue41(inputValue3)
				end
			end

			xorValue20 = bit32.bxor(xorValue20, difference10 + 53481000)
			connect(inputChanged, callbackValue44)
		end

		task.spawn(function()
			task.wait(1.5)
			callbackValue37()
		end)

		lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/kezodxyz/KezodX/refs/heads/main/Library.lua"))()
		lib2 = loadstring(game:HttpGet("https://raw.githubusercontent.com/kezodxyz/KezodX/refs/heads/main/addons/ThemeManager.lua"))()
		local difference10 = sum13 - 422779361
		lib3 = loadstring(game:HttpGet("https://raw.githubusercontent.com/kezodxyz/KezodX/refs/heads/main/addons/SaveManager.lua"))()
		options = lib.Options
		toggles = lib.Toggles
		lib.ForceCheckbox = false
		local xorValue19 = bit32.bxor(difference10, 0)
		local packedResults27 = table.pack(bit32.band(maskedBits10, 4294967295))
		local packedResults28 = table.pack(bit32.band(xorValue19, 4294967295))
		local packedResults29 = table.pack(bit32.band(packedResults27[1], 65535))
		local packedResults30 = table.pack(bit32.rshift(packedResults27[1], 16))
		local packedResults31 = table.pack(bit32.band(packedResults28[1], 65535))
		local maskedBits11 = bit32.band(packedResults29[1] * packedResults31[1] + bit32.lshift(bit32.band(packedResults29[1] * bit32.rshift(packedResults28[1], 16) + packedResults30[1] * packedResults31[1], 65535), 16), 4294967295)
		lib.ShowToggleFrameInKeybinds = true
		difference8 = difference10 - 15768440
		lib.Scheme.AccentColor = Color3.new(0, 0.58823531866073608, 1)
		lib.Scheme.BackgroundColor = Color3.new(0.039215687662363052, 0.039215687662363052, 0.058823529630899429)
		lib.Scheme.MainColor = Color3.new(0.070588238537311554, 0.070588238537311554, 0.098039217293262482)
		lib.Scheme.OutlineColor = Color3.new(0.13725490868091583, 0.13725490868091583, 0.19607843458652496)
		lib.Scheme.FontColor = Color3.new(0.94117647409439087, 0.96078431606292725, 1)

		local ascendOfficialWindow = lib:CreateWindow({
			Title = "Ascend Official",
			Footer = "Violance District v 1.0 Freemium | https://discord.gg/ascendofficial",
			Icon = "108345915439792",
			IconSize = UDim2.new(0, 45, 0, 45),
			NotifySide = "Right",
			EnableSidebarResize = true,
			EnableCompacting = true,
			SidebarCompacted = true,
			Size = UDim2.new(0, 450, 0, 600),
			CornerRadius = 0,
			AutoShow = true,
		})

		local xorValue20 = bit32.bxor(difference8, 0)
		local packedResults32 = table.pack(bit32.band(xorValue17, 4294967295))
		local packedResults33 = table.pack(bit32.band(xorValue20, 4294967295))
		local packedResults34 = table.pack(bit32.band(packedResults32[1], 65535))
		local packedResults35 = table.pack(bit32.rshift(packedResults32[1], 16))
		local packedResults36 = table.pack(bit32.band(packedResults33[1], 65535))
		local maskedBits12 = bit32.band(packedResults34[1] * packedResults36[1] + bit32.lshift(bit32.band(packedResults34[1] * bit32.rshift(packedResults33[1], 16) + packedResults35[1] * packedResults36[1], 65535), 16), 4294967295)

		tabs = {
			Main = ascendOfficialWindow:AddTab("Ascend Official", "house"),
			Survivor = ascendOfficialWindow:AddTab("Survivor", "users"),
			Aimbot = ascendOfficialWindow:AddTab("Aim Features", "target"),
			Killer = ascendOfficialWindow:AddTab("Killer", "swords"),
			Visual = ascendOfficialWindow:AddTab("Visual", "sparkles"),
			Esp = ascendOfficialWindow:AddTab("ESP", "eye"),
			Teleport = ascendOfficialWindow:AddTab("Teleport", "map-pin"),
			["UI Settings"] = ascendOfficialWindow:AddTab("UI Settings", "settings"),
		}

		MinPlayers = 1
		MaxPlayers = 6
		autoReconnect = true

		ServerHop = function()
			local numberValue2 = 120736094
			local numberValue3 = 4294649216
			local placeId = game.PlaceId
			local entries10 = {}
			local nextPageCursor = ""

			while true do
				local sourceUrl = "https://games.roblox.com/v1/games/" .. placeId .. "/servers/Public?sortOrder=Asc&limit=100" .. (nextPageCursor ~= "" and "&cursor=" .. nextPageCursor or "")
				local pcallValue = pcall
				local xorValue21 = 287314613

				local function callbackValue41()
					local matches = bit32.bxor(bit32.bxor(xorValue21, 0), 369365284) == 42647229
					return HttpService:JSONDecode(game:HttpGet(sourceUrl))
				end

				local xorValue22 = bit32.bxor(numberValue2, 252452207)
				xorValue21 = bit32.bxor(xorValue21, xorValue22)
				local valueValue6, valueValue7 = pcallValue(callbackValue41)

				if valueValue6 and valueValue7 and valueValue7.data then
					for _, item in ipairs(valueValue7.data) do
						if item.id ~= game.JobId and item.playing >= MinPlayers and item.playing <= MaxPlayers and item.playing < item.maxPlayers then
							table.insert(entries10, item)
						end
					end

					nextPageCursor = valueValue7.nextPageCursor
					local selectedValue = not nextPageCursor or #entries10 > 0
					if not selectedValue then
						continue
					end
				else
					break
				end

				break
			end

			if #entries10 > 0 then
				local entry = entries10[math.random(#entries10)]

				lib:Notify({
					Title = "Server Found",
					Description = string.format("Players: %d/%d", entry.playing, entry.maxPlayers),
					Time = 3,
				})

				task.wait(0.3)
				TeleportService:TeleportToPlaceInstance(placeId, entry.id, localPlayer)
			else
				lib:Notify({ Title = "No Server", Description = "Try Again", Time = 3 })
			end
		end

		localPlayer.OnTeleport:Connect(function(inputValue3)
			if inputValue3 == Enum.TeleportState.Failed and autoReconnect then
				task.wait(3)
				TeleportService:Teleport(game.PlaceId, localPlayer)
			end
		end)

		local addLeftGroupboxResult = tabs.Main:AddLeftGroupbox("Server Tools", "server")

		addLeftGroupboxResult:AddInput("MinPlayersInput", {
			Default = "1",
			Text = "Min Players",
			Numeric = true,
			Callback = function(inputValue3)
				MinPlayers = math.clamp(math.floor(tonumber(inputValue3) or 1), 0, 50)
			end,
		})

		product = maskedBits11 * 6

		addLeftGroupboxResult:AddInput("MaxPlayersInput", {
			Default = "6",
			Text = "Max Players",
			Numeric = true,
			Callback = function(inputValue3)
				local clamp = math.clamp
				local floor = math.floor
				local selectedValue = tonumber(inputValue3) or 5
				local minPlayers = MinPlayers
				MaxPlayers = clamp(floor(selectedValue), minPlayers, 50)
			end,
		})

		addLeftGroupboxResult:AddButton({
			Text = "Hop Server",
			Func = function()
				ServerHop()
			end,
		})

		addLeftGroupboxResult:AddButton({
			Text = "Rejoin Server",
			Func = function()
				TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, localPlayer)
			end,
		})

		local addLeftGroupboxResult2 = tabs.Survivor:AddLeftGroupbox("Auto Parry", "swords")
		addLeftGroupboxResult2:AddDivider()

		addLeftGroupboxResult2:AddToggle("AutoParry", {
			Text = "Auto Parry",
			Default = false,
			Callback = function(survAutoParry)
				Config.Surv_AutoParry = survAutoParry
			end,
		}):AddKeyPicker("AutoParryKey", {
			Default = "None",
			Text = "Auto Parry Key",
			Mode = "Toggle",
			Callback = function(survAutoParry)
				Config.Surv_AutoParry = survAutoParry
			end,
		})

		addLeftGroupboxResult2:AddToggle("ParryCircle", {
			Text = "ESP Range Circle",
			Tooltip = "Tampilkan radius jarak parry di karakter",
			Default = true,
			Callback = function(survParryCircle)
				Config.Surv_ParryCircle = survParryCircle
			end,
		})

		addLeftGroupboxResult2:AddSlider("ParryRadius", {
			Text = "Parry Radius",
			Tooltip = "Jarak maksimal parry bereaksi",
			Default = 15,
			Min = 5,
			Max = 25,
			Rounding = 0,
			Callback = function(survParryRadius)
				Config.Surv_ParryRadius = survParryRadius
			end,
		})

		addLeftGroupboxResult2:AddSlider("ParryFace", {
			Text = "Face Sensitivity",
			Tooltip = "Sensitivitas arah pandang (1-10)",
			Default = 7,
			Min = -10,
			Max = 10,
			Rounding = 0,
			Callback = function(inputValue3)
				Config.Surv_ParryFace = inputValue3 / 10
			end,
		})

		local quotient5 = maskedBits12 // 183
		local addLeftGroupboxResult3 = tabs.Survivor:AddLeftGroupbox("Bypas Generator", "zap")

		addLeftGroupboxResult3:AddDropdown("BypassGenModeSelect", {
			Values = { "Manual Repair", "Auto Repair" },
			Default = "Manual Repair",
			Callback = function(bypassGenMode)
				BypassGenMode = bypassGenMode
			end,
		})

		addLeftGroupboxResult3:AddToggle("BypassGen", {
			Text = "Gen Boost (Multi-Repair)",
			Tooltip = "Memperbaiki generator dengan cepat tanpa terdeteksi",
			Default = false,
			Callback = function(bypassGenEnabled2)
				bypassGenEnabled = bypassGenEnabled2
				BypassGenEnabled = bypassGenEnabled2
				BypassButton.Visible = bypassGenEnabled2 and UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled

				if not bypassGenEnabled2 then
					ProcessedGens = {}
					AutoRepairEnabled = false
					AutoCurrentGenModel = nil
					task.cancel(AutoRepairThread)
					AutoRepairThread = nil
					StopAutoRepair()
				end
			end,
		})

		addLeftGroupboxResult3:AddToggle("Skill", {
			Text = "Auto Skill Check",
			Default = false,
			Callback = function(skillCheck)
				Auto.SkillCheck = skillCheck

				if skillCheck then
					callbackValue17()
				end
			end,
		}):AddKeyPicker("SkillCheckKey", {
			Default = "None",
			Text = "Toggle Skill Check",
			SyncToggleState = true,
			Mode = "Toggle",
			NoUI = false,
		})

		addLeftGroupboxResult3:AddDropdown("SkillCheckModeDropdown", {
			Values = { "Legit", "Instant", "Normal", "Random" },
			Default = 1,
			Multi = false,
			Text = "Skill Check Mode",
			Callback = function(skillCheckMode)
				Auto.SkillCheckMode = skillCheckMode
			end,
		})

		Ability = tabs.Survivor:AddLeftGroupbox("Ability", "shield")
		local w = getgenv().W or W or {}
		getgenv().W = w

		local function callbackValue41(inputValue3, inputValue4, time)
			if lib and lib.Notify then
				local valueValue6 = lib
				local notify = valueValue6.Notify
				local entries10 = { Title = inputValue3, Description = inputValue4 }
				entries10.Time = time or 2
				notify(valueValue6, entries10)
			end
		end

		local function callbackValue42(inputValue3, inputValue4)
			local numberValue2 = 1282750828
			local numberValue3 = 4081145637
			local state = inputValue4.state

			if state.Gui then
				state.Gui:Destroy()
			end

			local screenGui = Instance.new("ScreenGui")
			local xorValue21 = bit32.bxor(inputValue3, 0)
			local combinedBits4 = bit32.bor(numberValue3, xorValue21)
			screenGui.Name = "FB_" .. tostring(inputValue4.id)
			screenGui.ResetOnSpawn = false
			screenGui.IgnoreGuiInset = true
			screenGui.Parent = CoreGui
			state.Gui = screenGui
			screenGui.Enabled = false
			local textButton = Instance.new("TextButton")
			textButton.Size = UDim2.new(0, 110, 0, 36)
			textButton.Position = state.SavedPos or UDim2.new(0.89999997615814209, 0, 0.41999998688697815, 0)
			textButton.BackgroundColor3 = Color3.new(0, 0, 0)
			textButton.Text = ""
			textButton.AutoButtonColor = false
			textButton.BorderSizePixel = 0
			textButton.Parent = screenGui
			Instance.new("UICorner", textButton).CornerRadius = UDim.new(0, 8)
			local textLabel = Instance.new("TextLabel")
			textLabel.Size = UDim2.new(1, 0, 1, 0)
			textLabel.BackgroundTransparency = 1
			textLabel.Text = inputValue4.title or "UnHook"
			textLabel.TextColor3 = Color3.new(0.94117647409439087, 0.94117647409439087, 0.94117647409439087)
			textLabel.Font = Enum.Font.GothamBold
			textLabel.TextSize = 12
			textLabel.Parent = textButton
			local xorValue22 = 532430831

			local function callbackValue43()
				local isOnResult = inputValue4.isOn()
				local matches = bit32.bxor(xorValue22, 0) ~= 432699608

				if isOnResult then
					textLabel.TextColor3 = Color3.new(0.31372550129890442, 1, 0.47058823704719543)
				else
					textLabel.TextColor3 = Color3.new(0.94117647409439087, 0.94117647409439087, 0.94117647409439087)
				end
			end

			local enabledValue5 = false
			local enabledValue6 = false
			local enabledValue7 = false
			local position = nil
			local position2 = nil
			local thread3 = nil
			local numberValue4 = 18

			local function callbackValue44(inputValue5)
				local numberValue5 = 2448411797
				local numberValue6 = 4176095125
				if not enabledValue5 or not enabledValue7 or not position or not position2 then
					return
				end
				local difference11 = inputValue5.Position - position
				local invertedFlag = not enabledValue6
				bit32.bxor(numberValue5, 4294967295)

				if invertedFlag and (math.abs(difference11.X) > numberValue4 or math.abs(difference11.Y) > numberValue4) then
					enabledValue6 = true
				end

				if enabledValue6 then
					local parentValue = textButton
					local udim2 = UDim2.new
					local scale = position2.X.Scale
					local sum17 = position2.X.Offset + difference11.X
					local y = position2.Y
					local combinedBits5 = bit32.bor(numberValue6, 3770901966)
					parentValue.Position = udim2(scale, sum17, y.Scale, position2.Y.Offset + difference11.Y)
					state.SavedPos = textButton.Position
					bit32.bxor(combinedBits5, 81994)
				end
			end

			textButton.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					enabledValue5 = true
					enabledValue6 = false
					enabledValue7 = false
					position = input.Position
					position2 = textButton.Position

					if thread3 then
						task.cancel(thread3)
						thread3 = nil
					end

					thread3 = task.delay(0.18, function()
						if enabledValue5 then
							enabledValue7 = true
						end
					end)
				end
			end)

			local xorValue23 = bit32.bxor(inputValue3, 0)
			bit32.bor(numberValue2, xorValue23)
			local xorValue24 = bit32.bxor(inputValue3, 292570441)
			xorValue22 = bit32.bxor(xorValue22, xorValue24)
			local numberValue5 = 240684111

			local function callbackValue45(input)
				local userInputType = input.UserInputType
				local userInputType2 = Enum.UserInputType
				bit32.bxor(bit32.bxor(numberValue5, 0), 146972618)

				if userInputType == userInputType2.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					local matches = bit32.bxor(numberValue5, 0) == 180756153

					if thread3 then
						task.cancel(thread3)
						thread3 = nil
					end

					if enabledValue5 and not enabledValue6 then
						inputValue4.onToggle(not inputValue4.isOn())
						callbackValue43()
					end

					enabledValue5 = false
					enabledValue6 = false
					enabledValue7 = false
					position = nil
					position2 = nil
				end
			end

			numberValue5 = 59988833
			textButton.InputEnded:Connect(callbackValue45)
			local numberValue6 = 50191893

			local function callbackValue46(input)
				local enabledValue8 = enabledValue5
				bit32.bxor(bit32.bxor(numberValue6, 0), 471647963)

				if enabledValue8 and enabledValue7 and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
					callbackValue44(input)
				end
			end

			numberValue6 = 294751036
			UserInputService.InputChanged:Connect(callbackValue46)
			callbackValue43()
			local numberValue7 = 398643928

			local function callbackValue47(enabled)
				state.Enabled = enabled
				local parentValue = screenGui
				local matches = bit32.bxor(numberValue7, 0) + 151893554 ~= 178949961
				parentValue.Enabled = enabled
				callbackValue43()
			end

			numberValue7 = 27056407
			return { SetEnabled = callbackValue47, UpdateVisual = callbackValue43 }
		end

		local selfUnhook = w.SelfUnhook
		local selfUnhook2

		if selfUnhook then
			selfUnhook2 = selfUnhook
		else
			difference8 = difference8 + quotient5 - 14378944

			selfUnhook2 = {
				Enabled = false,
				Following = false,
				FollowDuration = 30,
				FollowDistance = 20,
				MonitorConn = nil,
				_lastTrigger = 0,
				_cooldown = 3,
				_activeThread = nil,
				_wasHooked = false,
			}
		end

		w.SelfUnhook = selfUnhook2
		local selfUnhook3 = w.SelfUnhook

		w.SU_IsHooked = function()
			local character = localPlayer.Character
			if not character then
				return false
			end
			return character:GetAttribute("IsHooked") == true or character:GetAttribute("isHooked") == true or character:GetAttribute("Hooked") == true or character:GetAttribute("HookedState") == true
		end

		w.SU_GetGenPoint = function()
			local getAllGeneratorsResult = GetAllGenerators()
			if not getAllGeneratorsResult or #getAllGeneratorsResult == 0 then
				return nil
			end
			local entries10 = {}

			for _, item in ipairs(getAllGeneratorsResult) do
				if item and item.Parent then
					for _, item2 in ipairs(GetGeneratorPoints(item)) do
						if item2 and item2.Parent then
							table.insert(entries10, item2)
						end
					end
				end
			end

			if #entries10 == 0 then
				return nil
			end
			return entries10[math.random(1, #entries10)]
		end

		local xorValue21 = bit32.bxor(difference8, 0)
		local maskedBits13 = bit32.band(quotient5, xorValue21)

		w.SU_GetKillerHRP = function()
			for _, player in ipairs(Players:GetPlayers()) do
				if player ~= localPlayer and IsKiller(player) and player.Character then
					local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
					if humanoidRootPart then
						return humanoidRootPart
					end
				end
			end

			return nil
		end

		w.SU_Abort = function()
			selfUnhook3.Following = false

			if selfUnhook3._activeThread then
				pcall(function()
					task.cancel(selfUnhook3._activeThread)
				end)
			end

			selfUnhook3._activeThread = nil
		end

		w.SU_Trigger = function()
			if selfUnhook3.Following then
				return
			end
			local now = tick()
			if now - selfUnhook3._lastTrigger < selfUnhook3._cooldown then
				return
			end

			if not w.SU_IsHooked() then
				return
			end
			selfUnhook3._lastTrigger = now
			selfUnhook3.Following = true

			local function taskCallback()
				local numberValue2 = 3640478633
				local numberValue3 = 3993502746
				local character = localPlayer.Character
				if not character then
					selfUnhook3.Following = false
					return
				end
				local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
				if not humanoidRootPart then
					selfUnhook3.Following = false
					return
				end
				local repairEvent = ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("Generator") and ReplicatedStorage.Remotes.Generator:FindFirstChild("RepairEvent")
				local getGenPointResult = w.SU_GetGenPoint()

				if getGenPointResult then
					pcall(function()
						humanoidRootPart.CFrame = getGenPointResult.CFrame + Vector3.new(0, 3, 0)
					end)

					task.wait(0.15)

					if repairEvent then
						local numberValue4 = 159493712

						local function protectedCallback()
							local matches = bit32.bxor(bit32.bxor(numberValue4, 0), 57865588) == 390362942
							repairEvent:FireServer(getGenPointResult, true)
						end

						numberValue4 = 166736910
						pcall(protectedCallback)
						task.wait(0.35)
						local numberValue5 = 536144732

						local function protectedCallback2()
							local matches = bit32.bxor(bit32.bxor(numberValue5, 0), 499868606) ~= 276824333
							repairEvent:FireServer(getGenPointResult, false)
						end

						numberValue5 = 223044275
						pcall(protectedCallback2)
						task.wait(0.15)

						pcall(function()
							repairEvent:FireServer(getGenPointResult, true)
						end)

						task.wait(0.35)
						local pcallValue = pcall
						local numberValue6 = 63778484

						local function callbackValue43()
							local matches = bit32.bxor(numberValue6, 0) + 271355730 == 245454827
							repairEvent:FireServer(getGenPointResult, false)
						end

						local xorValue22 = bit32.bxor(numberValue2, numberValue3)
						numberValue6 = 273059193
						pcallValue(callbackValue43)
						bit32.bxor(xorValue22, 3993502746)
					end
				end

				local sum17 = tick() + (selfUnhook3.FollowDuration or 30)
				local followDistance = selfUnhook3.FollowDistance or 20

				while tick() < sum17 and selfUnhook3.Enabled do
					if not w.SU_IsHooked() then
						selfUnhook3.Following = false
						callbackValue41("Self Unhook", "Udah lepas hook - STOP", 2)
						return
					end

					local character2 = localPlayer.Character
					local humanoidRootPart2 = character2 and character2:FindFirstChild("HumanoidRootPart")
					local getKillerHrpResult = w.SU_GetKillerHRP()

					if humanoidRootPart2 and getKillerHrpResult then
						local pcallValue2 = pcall
						local xorValue23 = 79179419

						local function callbackValue44()
							humanoidRootPart2.Velocity = Vector3.zero
							local vector = Vector3.new
							local x = getKillerHrpResult.Position.X
							local difference11 = getKillerHrpResult.Position.Y - followDistance
							local position = getKillerHrpResult.Position
							local matches = bit32.bxor(bit32.bxor(xorValue23, 0), 529661109) ~= 498947519
							xorValue23 = bit32.bxor(xorValue23, 3114730997)
							local valueValue6 = vector(x, difference11, position.Z)
							humanoidRootPart2.CFrame = CFrame.new(valueValue6, valueValue6 + Vector3.new(0, 0, -1))
						end

						local xorValue24 = bit32.bxor(numberValue3, 3902571403)
						xorValue23 = bit32.bxor(xorValue23, xorValue24)
						pcallValue2(callbackValue44)
					end

					task.wait(0.03)
				end

				selfUnhook3.Following = false
			end

			selfUnhook3._activeThread = task.spawn(taskCallback)
		end

		w.SU_Start = function()
			if selfUnhook3.MonitorConn then
				return
			end
			selfUnhook3._wasHooked = false

			selfUnhook3.MonitorConn = RunService.Heartbeat:Connect(function()
				if not selfUnhook3.Enabled then
					return
				end

				if not localPlayer.Character then
					return
				end

				if not w.SU_IsHooked() then
					selfUnhook3._wasHooked = false
					return
				end

				if not selfUnhook3._wasHooked and not selfUnhook3.Following then
					selfUnhook3._wasHooked = true
					w.SU_Trigger()
				end
			end)
		end

		w.SU_Stop = function()
			if selfUnhook3.MonitorConn then
				selfUnhook3.MonitorConn:Disconnect()
				selfUnhook3.MonitorConn = nil
			end

			w.SU_Abort()
			selfUnhook3._wasHooked = false
		end

		w.SU_SetEnabled = function(enabled)
			selfUnhook3.Enabled = enabled

			if enabled then
				w.SU_Start()
			else
				w.SU_Stop()
			end
		end

		local valueValue6 = callbackValue42((product - maskedBits13) // maskedBits13 - 3908698172, {
			id = "SelfUnhook",
			title = "UnHook",
			state = {
				Enabled = false,
				Gui = nil,
				SavedPos = UDim2.new(0.89999997615814209, 0, 0.41999998688697815, 0),
			},
			isOn = function()
				return w.SelfUnhook.Enabled
			end,
			onToggle = function(inputValue3)
				w.SU_SetEnabled(inputValue3)
			end,
		})

		getgenv().Gluto_SUB_SetEnabled = function(inputValue3)
			valueValue6.SetEnabled(inputValue3)
		end

		getgenv().Gluto_SUB_UpdateVisual = function()
			valueValue6.UpdateVisual()
		end

		Ability:AddToggle("EnableUnhook", {
			Text = "Enable Bypass Self Unhook",
			Default = false,
			Callback = function(inputValue3)
				w.SU_SetEnabled(inputValue3)
				getgenv().Gluto_SUB_UpdateVisual()

				if inputValue3 then
					callbackValue41("Bypass Self Unhook", "Enabled", 2)
				end
			end,
		}):AddKeyPicker("EnableUnhookKey", {
			Default = "None",
			Text = "Self Unhook Key",
			Mode = "Toggle",
			Callback = function(inputValue3)
				w.SU_SetEnabled(inputValue3)

				if toggles.EnableUnhook then
					toggles.EnableUnhook:SetValue(inputValue3)
				end
			end,
		})

		Ability:AddToggle("ShowUnhookButton", {
			Text = "Show Self Unhook Button",
			Default = false,
			Callback = function(inputValue3)
				getgenv().Gluto_SUB_SetEnabled(inputValue3)
			end,
		})

		Ability:AddToggle("Surv_AutoCrouch", {
			Text = "Auto Crouch (Dodge S1)",
			Tooltip = "Otomatis jongkok saat Abyssal menggunakan S1",
			Default = false,
			Callback = function(survAutoCrouch)
				Config.Surv_AutoCrouch = survAutoCrouch
			end,
		})

		Ability:AddToggle("Surv_CrouchV", {
			Text = "Auto Dodge Veil",
			Default = false,
			Callback = function(survCrouchV)
				Config.Surv_CrouchV = survCrouchV
				local valueValue7 = lib
				local notify = valueValue7.Notify
				local entries10 = { Title = "Ascend Official" }
				entries10.Description = "Auto Dodge Veil: " .. (survCrouchV and "ON" or "OFF")
				entries10.Time = 2
				notify(valueValue7, entries10)
			end,
		})

		Ability:AddToggle("InstantTPGate", {
			Text = "Instant TP Gate",
			Tooltip = "Teleport ke gate secara instan tanpa delay",
			Default = false,
			Callback = function(instantTPGate)
				Config.InstantTPGate = instantTPGate
				local valueValue7 = lib
				local notify = valueValue7.Notify
				notify(valueValue7, { Title = "Instant TP Gate", Description = instantTPGate and "✅ Aktif" or "❌ Nonaktif", Time = 2 })

				if instantTPGate then
					callbackValue4(0)
					callbackValue5()
				else
					callbackValue4(1.5)
					callbackValue6()
				end
			end,
		}):AddKeyPicker("InstantTPGateKey", {
			Default = "None",
			Text = "Instant TP Gate Key",
			Mode = "Toggle",
			Callback = function(instantTPGate)
				Config.InstantTPGate = instantTPGate

				if toggles.InstantTPGate then
					toggles.InstantTPGate:SetValue(instantTPGate)
				end

				if instantTPGate then
					callbackValue4(0)
					callbackValue5()
				else
					callbackValue4(1.5)
					callbackValue6()
				end
			end,
		})

		local enabledValue5 = false
		local fall = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Mechanics"):WaitForChild("Fall")
		local getrawmetatableResult = getrawmetatable(game)
		local namecall = getrawmetatableResult.__namecall
		setreadonly(getrawmetatableResult, false)
		sum16 = difference8 + 139343250

		getrawmetatableResult.__namecall = newcclosure(function(inputValue3, ...)
			local packedResults37 = table.pack(...)
			local entries10 = { ... }
			local getnamecallmethodResult = getnamecallmethod()
			local selectedValue = enabledValue5 and inputValue3 == fall
			local selectedValue2

			if selectedValue then
				selectedValue2 = getnamecallmethodResult == "FireServer" or getnamecallmethodResult == "fireServer"
			else
				selectedValue2 = selectedValue
			end

			if selectedValue2 then
				entries10[1] = 0
				return namecall(inputValue3, unpack(entries10))
			end
			return namecall(inputValue3, table.unpack(packedResults37, 1, packedResults37.n))
		end)

		setreadonly(getrawmetatableResult, true)

		Ability:AddToggle("NoFall", {
			Text = "No Fall Damage",
			Default = false,
			Callback = function(enabledValue6)
				enabledValue5 = enabledValue6
			end,
		})

		Ability:AddToggle("BypassGate", {
			Text = "Bypass Exite Gate",
			Tooltip = "Tembus gate tanpa collision",
			Default = false,
			Callback = function(inputValue3)
				setBypassGate(inputValue3)

				if inputValue3 then
					lib:Notify({ Title = "Bypass Exite Gate", Description = "Gate bypass aktif!", Time = 3 })
				else
					lib:Notify({ Title = "Bypass Exite Gate", Description = "Gate bypass dimatikan!", Time = 3 })
				end
			end,
		})

		local enabledValue6 = false
		local connection = nil

		local function callbackValue43()
			if connection then
				return
			end
			local character = localPlayer.Character
			if not character then
				return
			end
			local humanoid = character:FindFirstChildOfClass("Humanoid")
			if not humanoid then
				return
			end
			local animator = humanoid:FindFirstChildOfClass("Animator")
			if not animator then
				return
			end

			connection = animator.AnimationPlayed:Connect(function(inputValue3)
				if inputValue3.Animation and inputValue3.Animation.AnimationId:find("95836365038528") then
					inputValue3:Stop(0)
				end
			end)
		end

		local function callbackValue44()
			if connection then
				pcall(function()
					connection:Disconnect()
				end)

				connection = nil
			end
		end

		task.spawn(function()
			while true do
				task.wait(3)

				if enabledValue6 then
					if localPlayer.Team.Name == "Killer" then
						continue
					end
					local character = localPlayer.Character

					if character then
						local checkInterractable = character:FindFirstChild("CheckInterractable")
						local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
						local humanoid = character:FindFirstChildOfClass("Humanoid")
						local enabledValue7 = false

						if checkInterractable then
							local attribute = checkInterractable:GetAttribute("isVaulting") or checkInterractable:GetAttribute("isRepairing") or checkInterractable:GetAttribute("isUnhooking") or checkInterractable:GetAttribute("isHealing") or checkInterractable:GetAttribute("isSliding")
							enabledValue7 = false

							if attribute then
								enabledValue7 = true
							end
						end

						if not enabledValue7 and humanoidRootPart and humanoid and humanoid.Health < humanoid.MaxHealth then
							pcall(function()
								local remotes = ReplicatedStorage:FindFirstChild("Remotes")

								if remotes and remotes:FindFirstChild("Healing") then
									remotes.Healing.HealEvent:FireServer(humanoidRootPart, true)
								end
							end)
						end
					end
				end
			end
		end)

		localPlayer.CharacterRemoving:Connect(function()
			callbackValue44()
		end)

		localPlayer.CharacterAdded:Connect(function()
			task.wait(5)

			if enabledValue6 then
				callbackValue43()
			end
		end)

		Ability:AddToggle("SelfHeal", {
			Text = "Self Heal",
			Default = false,
			Callback = function(enabledValue7)
				if GetRole() == "Killer" then
					lib:Notify("Kamu harus Survivor!")
					toggles.SelfHeal:SetValue(false)
					return
				end

				enabledValue6 = enabledValue7

				if enabledValue7 then
					callbackValue43()
					lib:Notify("Self Heal: ENABLED (Tanpa Animasi)")
				else
					callbackValue44()
					lib:Notify("Self Heal: DISABLED")
				end
			end,
		}):AddKeyPicker("SelfHealKey", {
			Default = "None",
			Text = "Keybind Self Heal",
			Mode = "Toggle",
			SyncToggleState = true,
			Callback = function(enabledValue7)
				if GetRole() == "Killer" then
					lib:Notify("Kamu harus Survivor!")
					return
				end
				enabledValue6 = enabledValue7

				if enabledValue7 then
					callbackValue43()

					if toggles.SelfHeal then
						toggles.SelfHeal:SetValue(true)
					end

					lib:Notify("Self Heal: ENABLED (Tanpa Animasi)")
				else
					local callbackValue45 = callbackValue44
					callbackValue44()

					if toggles.SelfHeal then
						toggles.SelfHeal:SetValue(false)
					end

					lib:Notify("Self Heal: DISABLED")
				end
			end,
		})

		difference9 = maskedBits13 - bit32.bxor(sum16, 0)
	end

	Ability:AddToggle("GodMode", {
		Text = "Anti Knockdown",
		Tooltip = "Ga bisa mati (semi god)",
		Default = false,
		Callback = function(godMode)
			GodMode = godMode
		end,
	})

	Ability:AddToggle("FleeKiller", {
		Text = "Flee Killer",
		Tooltip = "Teleport saat killer terlalu dekat",
		Default = false,
		Callback = function(fleeKillerEnabled)
			FleeKillerEnabled = fleeKillerEnabled
		end,
	})

	local xorValue22

	do
		local enabledValue7 = false

		Ability:AddToggle("EndScreen", {
			Text = "Skip Endscreen",
			Default = false,
			Callback = function(enabledValue8)
				enabledValue7 = enabledValue8
			end,
		})

		local spawn_ = task.spawn

		local function callbackValue45()
			while true do
				pcall(function()
					local map = workspace:FindFirstChild("Map")

					if map then
						local endscreen = map:FindFirstChild("endscreen", true)

						if endscreen then
							for _, descendant in ipairs(endscreen:GetDescendants()) do
								if descendant:IsA("LocalScript") then
									descendant.Disabled = true
								end
							end

							endscreen:Destroy()
						end
					end

					local frame3 = playerGui.Results.Frame
					local close = frame3.Close

					if frame3.Visible and close.Visible then
						pcall(function()
							firesignal(close.MouseButton1Click)
						end)
					end
				end)

				task.wait(1)
			end
		end

		xorValue22 = bit32.bxor(sum16, 0)
		spawn_(callbackValue45)
	end

	Ability:AddSlider("FleeDistance", {
		Text = "Flee Distance",
		Tooltip = "Jarak trigger teleport",
		Default = 40,
		Min = 15,
		Max = 80,
		Rounding = 0,
		Callback = function(fleeDistance)
			FleeDistance = fleeDistance
		end,
	})

	Ability:AddButton({
		Text = "instan escape",
		Func = function()
			callbackValue20()
		end,
	})

	local addLeftGroupboxResult4 = tabs.Survivor:AddLeftGroupbox("Auto Pallet", "table")

	addLeftGroupboxResult4:AddButton({
		Text = "Drop All Pallet",
		Func = function()
			local remotes = ReplicatedStorage:FindFirstChild("Remotes")
			local palletDropEvent = remotes and remotes:FindFirstChild("Pallet") and remotes.Pallet:FindFirstChild("PalletDropEvent")
			local entries10 = {}

			refreshPalletCache = function()
				entries10 = {}
				local map = workspace:FindFirstChild("Map")
				if not map then
					return
				end

				for _, descendant in ipairs(map:GetDescendants()) do
					if descendant.Name == "PalletPoint" and descendant:IsA("BasePart") then
						local model = descendant:FindFirstAncestorWhichIsA("Model")

						if model then
							if not entries10[model] then
								entries10[model] = {}
							end

							table.insert(entries10[model], descendant)
						end
					end
				end
			end

			refreshPalletCache()
			local numberValue2 = 0

			for _, item in pairs(entries10) do
				for _, item2 in ipairs(item) do
					pcall(function()
						palletDropEvent:FireServer(item2)
						numberValue2 += 1
					end)
				end
			end
		end,
	})

	addLeftGroupboxResult4:AddToggle("AutoPallet", {
		Text = "Auto Drop Pallet",
		Default = false,
		Callback = function(autoPalletEnabled)
			AutoPalletEnabled = autoPalletEnabled

			if autoPalletEnabled then
				StartAutoPallet()
				lib:Notify({ Title = "Auto Pallet", Description = "AKTIF", Time = 2 })
			else
				StopAutoPallet()
				lib:Notify({ Title = "Auto Pallet", Description = "NONAKTIF", Time = 2 })
			end
		end,
	}):AddKeyPicker("AutoPalletKey", {
		Default = "None",
		Text = "Auto Pallet Key",
		Mode = "Toggle",
		Callback = function(autoPalletEnabled)
			AutoPalletEnabled = autoPalletEnabled

			if autoPalletEnabled then
				StartAutoPallet()
			else
				StopAutoPallet()
			end
		end,
	})

	addLeftGroupboxResult4:AddCheckbox("AutoPalletSafety", {
		Text = "Safety Pallet",
		Tooltip = "Cegah drop pallet saat down/carry/hook (biar aman)",
		Default = true,
		Callback = function(autoPalletSafety)
			AutoPalletSafety = autoPalletSafety
		end,
	})

	addLeftGroupboxResult4:AddSlider("AutoPalletDist", {
		Text = "Trigger Distance",
		Default = 10,
		Min = 8,
		Max = 30,
		Rounding = 0,
		Callback = function(autoPalletDistance)
			AutoPalletDistance = autoPalletDistance
		end,
	})

	addLeftGroupboxResult4:AddToggle("AutoPalletSlide", {
		Text = "Auto Pallet Slide",
		Default = false,
		Callback = function(autoPalletSlideEnabledValue)
			autoPalletSlideEnabled = autoPalletSlideEnabledValue
		end,
	})

	local Movement = tabs.Survivor:AddLeftGroupbox("Movement", "shoe")
	getgenv().AutoRunEnabled = false

	Movement:AddToggle("AutoRunPC", {
		Text = "Auto Run [PC]",
		Default = false,
		Callback = function(autoRunEnabled)
			getgenv().AutoRunEnabled = autoRunEnabled

			if autoRunEnabled then
				task.spawn(function()
					while getgenv().AutoRunEnabled do
						VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.LeftShift, false, localPlayer:GetMouse())
						task.wait(0.1)
					end
				end)
			else
				VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.LeftShift, false, localPlayer:GetMouse())
			end
		end,
	})

	Movement:AddToggle("AutoRunMobile", {
		Text = "Auto Run [Mobile]",
		Default = false,
		Callback = function(autoRunMobileEnabled)
			getgenv().AutoRunMobileEnabled = autoRunMobileEnabled

			if autoRunMobileEnabled then
				callbackValue7()
				lib:Notify({ Title = "Auto Run Mobile", Description = "ON", Time = 2 })
			else
				callbackValue13()
				lib:Notify({ Title = "Auto Run Mobile", Description = "OFF", Time = 2 })
			end
		end,
	})

	Movement:AddToggle("SpeedBoost", {
		Text = "Enable Speed Boost",
		Default = false,
		Callback = function(speedEnabled)
			SpeedEnabled = speedEnabled
		end,
	})

	Movement:AddSlider("SpeedAmount", {
		Text = "Speed Boost Value",
		Default = 0.02,
		Min = 0.01,
		Max = 3,
		Rounding = 2,
		Callback = function(speedAmount)
			SpeedAmount = speedAmount
		end,
	})

	tabs.Survivor:AddRightGroupbox("Streamer Mode", "eye"):AddToggle("Misc_FakeName", {
		Text = "Hide Name",
		Default = false,
		Callback = function(miscFakeName)
			Config.Misc_FakeName = miscFakeName

			if miscFakeName then
				enableSpoofer()
			else
				disableSpoofer()
			end
		end,
	}):AddKeyPicker("FakeNameKey", {
		Default = "None",
		Text = "Hide Name Key",
		Mode = "Toggle",
		Callback = function(miscFakeName)
			Config.Misc_FakeName = miscFakeName

			if miscFakeName then
				enableSpoofer()
			else
				disableSpoofer()
			end
		end,
	})

	local Invisibility = tabs.Survivor:AddRightGroupbox("Invisibility", "ghost")

	Invisibility:AddToggle("Invisibility", {
		Text = "Invisibility",
		Default = false,
		Callback = function(inputValue3)
			local numberValue2 = 3513731140
			local numberValue3 = 1261758137

			if not invisible then
				callbackValue35()
				task.wait(1.5)
				if not invisible then
					lib:Notify({ Title = "Invisibility", Description = "Not Ready Yet!", Time = 2 })
					return
				end
			end

			if inputValue3 then
				local pcallValue = pcall
				local combinedBits4 = bit32.bor(numberValue2, numberValue3)
				local xorValue23 = 50781255

				local function callbackValue46()
					local invisibleValue = invisible
					local matches = bit32.bxor(bit32.bxor(xorValue23, 0), 131302888) == 154672629
					invisibleValue.enable()
				end

				local xorValue24 = bit32.bxor(numberValue3, 1335431034)
				xorValue23 = bit32.bxor(xorValue23, xorValue24)
				pcallValue(callbackValue46)
				entries7.IsActive = true
				callbackValue36(true)
				lib:Notify({ Title = "Invisibility", Description = "Aktif!", Time = 2 })
			else
				local xorValue25 = 412671578

				local function protectedCallback()
					local invisibleValue = invisible
					local matches = bit32.bxor(xorValue25, 0) + 38827695 ~= 494099417
					xorValue25 = bit32.bxor(xorValue25, 2818898305)
					invisibleValue.disable()
				end

				xorValue25 = 455271722
				pcall(protectedCallback)
				entries7.IsActive = false
				callbackValue36(false)
				lib:Notify({ Title = "Invisibility", Description = "Nonaktif!", Time = 2 })
			end
		end,
	}):AddKeyPicker("Invisibility Key", {
		Default = "None",
		Text = "Invisibility Key",
		Mode = "Toggle",
		SyncToggleState = true,
		Callback = function(inputValue3)
			local numberValue2 = 1644909942
			local xorValue23 = 107514072

			if not invisible then
				callbackValue35()
				local wait = task.wait
				local packedResults37 = table.pack(bit32.band(xorValue23, 4294967295))
				local packedResults38 = table.pack(bit32.band(numberValue2, 4294967295))
				local packedResults39 = table.pack(bit32.band(packedResults37[1], 65535))
				local packedResults40 = table.pack(bit32.rshift(packedResults37[1], 16))
				local packedResults41 = table.pack(bit32.band(packedResults38[1], 65535))
				local maskedBits14 = bit32.band(packedResults39[1] * packedResults41[1] + bit32.lshift(bit32.band(packedResults39[1] * bit32.rshift(packedResults38[1], 16) + packedResults40[1] * packedResults41[1], 65535), 16), 4294967295)
				wait(1.5)
				if not invisible then
					lib:Notify({ Title = "Invisibility", Description = "Not Ready Yet!", Time = 2 })
					return
				end
				xorValue23 = bit32.bxor(maskedBits14, 1015956296)
			end

			if inputValue3 then
				local pcallValue = pcall
				local xorValue24 = 111942991

				local function callbackValue46()
					local invisibleValue = invisible
					local matches = bit32.bxor(bit32.bxor(xorValue24, 0), 257191450) ~= 229203973
					xorValue24 = bit32.bxor(xorValue24, 1079731583)
					invisibleValue.enable()
				end

				local xorValue25 = bit32.bxor(numberValue2, 1717192230)
				xorValue24 = bit32.bxor(xorValue24, xorValue25)
				pcallValue(callbackValue46)
				entries7.IsActive = true
				callbackValue36(true)

				if toggles and toggles.Invis_Gacor then
					toggles.Invis_Gacor:SetValue(true)
				end

				lib:Notify({ Title = "Invisibility", Description = "Aktif!", Time = 2 })
			else
				local numberValue3 = 527041575

				local function protectedCallback()
					local disable = invisible.disable
					local matches = bit32.bxor(bit32.bxor(numberValue3, 0), 167921167) == 433995408
					disable()
				end

				numberValue3 = 46869428
				pcall(protectedCallback)
				entries7.IsActive = false
				callbackValue36(false)

				if toggles and toggles.Invis_Gacor then
					toggles.Invis_Gacor:SetValue(false)
				end

				lib:Notify({ Title = "Invisibility", Description = "Nonaktif!", Time = 2 })
			end
		end,
	})

	Invisibility:AddToggle("CustomInvisToggle", {
		Text = "Invisibility Button",
		Default = false,
		Callback = function(inputValue3)
			local numberValue2 = 3385156651

			if inputValue3 then
				if not entries7.Gui then
					callbackValue37()
				end

				entries7.Gui.Enabled = true
				entries7.GuiVisible = true
				callbackValue36(entries7.IsActive)
				lib:Notify({ Title = "Invis GUI", Description = "Gui Loaded", Time = 2 })
			else
				if entries7.IsActive and invisible then
					entries7.IsActive = false
					local numberValue3 = 517636629

					local function protectedCallback()
						local disable = invisible.disable
						local matches = bit32.bxor(numberValue3, 0) + 322047370 ~= 497594850
						disable()
					end

					numberValue3 = 175547480
					pcall(protectedCallback)
					local pcallValue = pcall
					local xorValue23 = 209120430

					local function callbackValue46()
						local togglesValue = toggles
						local matches = bit32.bxor(xorValue23, 0) + 347705216 == 77374712
						local invisGacor = toggles

						if togglesValue then
							invisGacor = toggles.Invis_Gacor
						end

						if invisGacor then
							toggles.Invis_Gacor:SetValue(false)
						end
					end

					xorValue23 = bit32.bxor(xorValue23, numberValue2 - 2859719055)
					pcallValue(callbackValue46)
				end

				local shiftedBits = bit32.rshift(numberValue2, 22)

				if entries7.Gui then
					entries7.Gui.Enabled = false
					entries7.GuiVisible = false
				end

				lib:Notify({ Title = "Invis GUI", Description = "Gui Destroyed", Time = 2 })
				bit32.bxor(shiftedBits, 3385157388)
			end
		end,
	})

	local Utility = tabs.Survivor:AddRightGroupbox("Utility", "sliders-horizontal")

	Utility:AddToggle("MoonwalkToggle", {
		Text = "Show Moonwalk Button",
		Tooltip = "Tampilkan button Moonwalk di layar (pencet button untuk aktif)",
		Default = false,
		Callback = function(inputValue3)
			SetMoonwalkButtonVisible(inputValue3)

			if inputValue3 then
				lib:Notify({ Title = "Moonwalk", Description = "Button muncul! Tekan untuk aktif", Time = 3 })
			else
				lib:Notify({ Title = "Moonwalk", Description = "Button disembunyikan", Time = 2 })
			end
		end,
	})

	Utility:AddToggle("MoonwalkPCToggle", {
		Text = "Moonwalk [PC]",
		Default = false,
		Callback = function(moonwalkEnabled)
			MoonwalkEnabled = moonwalkEnabled

			if moonwalkEnabled then
				lib:Notify({ Title = "Moonwalk PC", Description = "AKTIF", Time = 2 })
			else
				lib:Notify({ Title = "Moonwalk PC", Description = "NONAKTIF", Time = 2 })
			end
		end,
	}):AddKeyPicker("MoonwalkPCKey", {
		Default = "None",
		Text = "Keybind Moonwalk",
		Mode = "Toggle",
		Callback = function(moonwalkEnabled)
			MoonwalkEnabled = moonwalkEnabled

			if toggles.MoonwalkPCToggle then
				toggles.MoonwalkPCToggle:SetValue(moonwalkEnabled)
			end

			if moonwalkEnabled then
				lib:Notify({ Title = "Moonwalk PC", Description = "AKTIF", Time = 2 })
			else
				lib:Notify({ Title = "Moonwalk PC", Description = "NONAKTIF", Time = 2 })
			end
		end,
	})

	Utility:AddButton({
		Text = "Fly GUI",
		Func = function()
			local enabledValue8 = false

			for _, child in pairs(game.CoreGui:GetChildren()) do
				if child.Name:lower():find("fly") then
					enabledValue8 = true
				end
			end

			if not enabledValue8 then
				loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
				lib:Notify({ Title = "Fly", Description = "Fly GUI Dimuat", Time = 3 })
			else
				lib:Notify({ Title = "Fly", Description = "Fly GUI terbuka", Time = 3 })
			end
		end,
	})

	local sum17, xorValue23

	do
		local addRightGroupboxResult = tabs.Survivor:AddRightGroupbox("Info Player", "info")
		local addDraggableLabelResult = lib:AddDraggableLabel("Ascend Official Hub")
		sum17 = sum16 + xorValue22 + difference9
		WatermarkEnabled = false
		WatermarkConnection = nil

		StartWatermark = function()
			WatermarkConnection:Disconnect()
			WatermarkConnection = nil
			if not addDraggableLabelResult then
				return
			end
			local now = tick()
			local numberValue2 = 0
			local numberValue3 = 60

			WatermarkConnection = game:GetService("RunService").Heartbeat:Connect(function()
				numberValue2 += 1
				local numberValue4 = 3797678014

				if tick() - now >= 1 then
					numberValue3 = numberValue2
					now = tick()
					numberValue2 = 0
				end

				local floor = math.floor
				local valueValue7 = floor(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue() or 0)
				addDraggableLabelResult:SetText(("Ascend Official | %s fps | %s ms"):format(math.floor(numberValue3), valueValue7))
				addDraggableLabelResult:SetVisible(true)
			end)
		end

		local function stopWatermark()
			WatermarkEnabled = false
			WatermarkConnection:Disconnect()
			WatermarkConnection = nil

			if addDraggableLabelResult then
				addDraggableLabelResult:SetVisible(false)
			end
		end

		local difference11 = difference9 - bit32.bxor(sum17, 0)
		StopWatermark = stopWatermark

		addRightGroupboxResult:AddToggle("WatermarkToggle", {
			Text = "Enable FPS + Ping Display",
			Default = false,
			Tooltip = "Tampilkan FPS dan Ping",
			Callback = function(watermarkEnabled)
				WatermarkEnabled = watermarkEnabled

				if watermarkEnabled then
					StartWatermark()
					lib:Notify({ Title = "Watermark", Description = "AKTIF", Time = 2 })
				else
					StopWatermark()
					lib:Notify({ Title = "Watermark", Description = "NONAKTIF", Time = 2 })
				end
			end,
		})

		task.spawn(function()
			task.wait(0.5)
			StopWatermark()
		end)

		addRightGroupboxResult:AddToggle("NextKillerToggle", {
			Text = "Next Killer Display",
			Default = false,
			Tooltip = "Menampilkan prediksi killer selanjutnya di layar",
			Callback = function(nextKillerEnabledValue)
				nextKillerEnabled = nextKillerEnabledValue

				if nextKillerEnabledValue then
					StartNextKiller()
				else
					StopNextKiller()
				end
			end,
		})

		local enabledValue8 = false
		local parentValue = nil
		local invertedFlag = false

		CreateKillerPerksGUI = function()
			local numberValue2 = 426753331
			local numberValue3 = 2572890095
			local numberValue4 = 270872477

			if parentValue then
				pcall(function()
					parentValue:Destroy()
				end)

				parentValue = nil
			end

			if not enabledValue8 then
				return
			end
			local Players2 = game:GetService("Players")
			local UserInputService2 = game:GetService("UserInputService")
			local CoreGui2 = game:GetService("CoreGui")
			local Workspace = game:GetService("Workspace")
			local localPlayer2 = Players2.LocalPlayer

			local function callbackValue46(inputValue3)
				local pcallValue = pcall
				local xorValue24 = 508800577

				local function callbackValue47()
					local matches = bit32.bxor(xorValue24, 0) + 488983515 == 508284956
					return CoreGui2
				end

				local xorValue25 = bit32.bxor(inputValue3, 517214638)
				xorValue24 = bit32.bxor(xorValue24, xorValue25)
				local valueValue7, valueValue8 = pcallValue(callbackValue47)
				if valueValue7 and valueValue8 then
					return valueValue8
				end
				return localPlayer2:WaitForChild("PlayerGui")
			end

			local xorValue24 = 423649741

			local function callbackValue47(inputValue3)
				local textValue = tostring(inputValue3 or "")
				bit32.bxor(bit32.bxor(xorValue24, 0), 510427231)
				return (textValue:gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;"))
			end

			local xorValue25 = 417682418

			local function callbackValue48(inputValue3)
				local match, valueValue7 = tostring(inputValue3 or ""):match("^(.+)%s+(%d+)$")
				if not match then
					return nil
				end
				local replacedText = match:gsub("^%s+", ""):gsub("%s+$", "")
				local matches = bit32.bxor(xorValue25, 0) + 376963887 ~= 412143495
				if replacedText == "" then
					return nil
				end

				if ({
					head = true,
					torso = true,
					humanoid = true,
					humanoidrootpart = true,
					["left arm"] = true,
					["right arm"] = true,
					["left leg"] = true,
					["right leg"] = true,
				})[replacedText:lower()] then
					return nil
				end

				return replacedText, valueValue7
			end

			local function callbackValue49()
				for _, player in ipairs(Players2:GetPlayers()) do
					local name = player.Team and player.Team.Name
					if name and name:lower():find("killer") then
						return player
					end
				end

				return nil
			end

			local xorValue26 = bit32.bxor(numberValue3, 2208739397)
			xorValue25 = bit32.bxor(xorValue25, xorValue26)

			local function callbackValue50(inputValue3)
				if not inputValue3 then
					return {}
				end
				local character = inputValue3.Character or Workspace:FindFirstChild(inputValue3.Name) or Workspace:FindFirstChild(inputValue3.DisplayName)
				if not character then
					return {}
				end
				local compareEntries = {}
				local entries10 = {}

				for _, child in ipairs(character:GetChildren()) do
					local valueValue7, valueValue8 = callbackValue48(child.Name)

					if valueValue7 and not entries10[valueValue7] then
						entries10[valueValue7] = true
						table.insert(compareEntries, { Name = valueValue7, Level = valueValue8 })
					end
				end

				table.sort(compareEntries, function(inputValue4, inputValue5)
					return tostring(inputValue4.Name) < tostring(inputValue5.Name)
				end)

				return compareEntries
			end

			local xorValue27 = bit32.bxor(numberValue4, 190878290)
			xorValue24 = bit32.bxor(xorValue24, xorValue27)

			local function callbackValue51()
				local numberValue5 = 1919782386
				local valueValue7 = callbackValue49()
				local displayName = valueValue7 and (valueValue7.DisplayName or valueValue7.Name) or "Unknown"
				local valueValue8 = callbackValue50(valueValue7)

				if #valueValue8 == 0 then
					for _, player in ipairs(Players2:GetPlayers()) do
						local valueValue9 = callbackValue50(player)

						if #valueValue9 > 0 then
							displayName = player.DisplayName

							if displayName then
								valueValue8 = valueValue9
							else
								displayName = player.Name
								valueValue8 = valueValue9
							end

							break
						end
					end
				end

				local entries10 = { "Killer Perks [<font color=\"rgb(255,80,80)\">" .. callbackValue47(displayName) .. "</font>]" }

				if #valueValue8 == 0 then
					table.insert(entries10, "<font color=\"rgb(200,200,200)\">- Waiting for perk data...</font>")
				else
					for index2 = 1, math.min(#valueValue8, 4) do
						local entry = valueValue8[index2]
						table.insert(entries10, "<font color=\"rgb(200,200,200)\">- " .. callbackValue47(entry.Name .. (entry.Level and " lvl " .. tostring(entry.Level) or "")) .. "</font>")
					end
				end

				return table.concat(entries10, "\n"), #valueValue8
			end

			local screenGui = Instance.new("ScreenGui")
			screenGui.Name = "NEX_KillerPerksGui"
			screenGui.ResetOnSpawn = false
			screenGui.IgnoreGuiInset = true
			local frame3 = Instance.new("Frame")
			frame3.Name = "Holder"
			frame3.Size = UDim2.new(0, 180, 0, 85)
			local maskedBits14 = bit32.band(numberValue3, numberValue2)
			frame3.Position = UDim2.new(0.079999998211860657, 0, 0.2199999988079071, 0)
			frame3.BackgroundTransparency = 1
			frame3.Active = true
			frame3.Parent = screenGui
			local frame4 = Instance.new("Frame")
			frame4.Name = "Panel"
			frame4.Size = UDim2.new(1, 0, 1, 0)
			frame4.BackgroundColor3 = Color3.new(0.039215687662363052, 0.039215687662363052, 0.047058824449777603)
			frame4.BackgroundTransparency = 0.15
			frame4.BorderSizePixel = 0
			frame4.Parent = frame3
			Instance.new("UICorner", frame4).CornerRadius = UDim.new(0, 6)
			local uiStroke = Instance.new("UIStroke")
			uiStroke.Color = Color3.new(0.23529411852359772, 0.23529411852359772, 0.27450981736183167)
			uiStroke.Thickness = 1
			uiStroke.Transparency = 0.3
			uiStroke.Parent = frame4
			local maskedBits15 = maskedBits14
			local frame5 = Instance.new("Frame")
			local sum18 = bit32.bxor(numberValue4, maskedBits15) + 3521104446
			local packedResults37 = table.pack(bit32.band(xorValue27, 4294967295))
			local packedResults38 = table.pack(bit32.band(packedResults37[1], 65535))
			local maskedBits16 = bit32.band(51774 * packedResults38[1] + bit32.lshift(bit32.band(51774 * bit32.rshift(packedResults37[1], 16) + 53727 * packedResults38[1], 65535), 16), 4294967295)
			local packedResults39 = table.pack(bit32.band(bit32.bnot(xorValue27), 4294967295))
			local packedResults40 = table.pack(bit32.band(packedResults39[1], 65535))
			local sum19 = sum18 + maskedBits16 + bit32.band(51774 * packedResults40[1] + bit32.lshift(bit32.band(51774 * bit32.rshift(packedResults39[1], 16) + 53727 * packedResults40[1], 65535), 16), 4294967295)
			frame5.Size = UDim2.new(1, 0, 0, 24)
			frame5.BackgroundColor3 = Color3.new(0.058823529630899429, 0.058823529630899429, 0.078431375324726105)
			frame5.BorderSizePixel = 0
			frame5.Parent = frame4
			local difference12 = maskedBits14 - 3564684825
			Instance.new("UICorner", frame5).CornerRadius = UDim.new(0, 6)
			local textLabel = Instance.new("TextLabel")
			textLabel.Size = UDim2.new(1, -60, 1, 0)
			textLabel.Position = UDim2.new(0, 8, 0, 0)
			textLabel.BackgroundTransparency = 1
			textLabel.Font = Enum.Font.GothamSemibold
			textLabel.Text = "Killer Perks Info"
			textLabel.TextColor3 = Color3.new(0.86274510622024536, 0.86274510622024536, 0.90196079015731812)
			textLabel.TextSize = 11
			textLabel.TextXAlignment = Enum.TextXAlignment.Left
			local xorValue28 = bit32.bxor(sum19, difference12)
			textLabel.Parent = frame5

			local function createTextButton(text, inputValue3, backgroundColor3, inputValue4)
				local textButton = Instance.new("TextButton")
				textButton.Size = UDim2.new(0, 26, 0, 16)
				textButton.Position = UDim2.new(1, inputValue3, 0, 4)
				textButton.BackgroundColor3 = backgroundColor3 or Color3.new(0.098039217293262482, 0.098039217293262482, 0.11764705926179886)
				textButton.BorderSizePixel = 0
				local matches = bit32.bxor(inputValue4, 414239645) ~= 237629478
				textButton.Font = Enum.Font.GothamMedium
				textButton.Text = text
				textButton.TextColor3 = Color3.new(0.78431373834609985, 0.78431373834609985, 0.82352942228317261)
				textButton.TextSize = 9
				textButton.Parent = frame5
				Instance.new("UICorner", textButton).CornerRadius = UDim.new(0, 4)
				return textButton
			end

			local Minimize = createTextButton("Minimize", -54, Color3.new(0.11764705926179886, 0.11764705926179886, 0.15686275064945221), 379141051)
			local Close = createTextButton("Close", -28, Color3.new(0.15686275064945221, 0.098039217293262482, 0.098039217293262482), 379141051)
			local textLabel2 = Instance.new("TextLabel")
			textLabel2.Name = "KillerPerksText"
			textLabel2.Size = UDim2.new(1, -14, 1, -32)
			textLabel2.Position = UDim2.new(0, 8, 0, 28)
			textLabel2.BackgroundTransparency = 1
			textLabel2.Font = Enum.Font.GothamMedium
			textLabel2.RichText = true
			textLabel2.TextXAlignment = Enum.TextXAlignment.Left
			textLabel2.TextYAlignment = Enum.TextYAlignment.Top
			textLabel2.TextColor3 = Color3.new(0.86274510622024536, 0.86274510622024536, 0.90196079015731812)
			textLabel2.TextSize = 11
			textLabel2.TextWrapped = false
			textLabel2.Parent = frame4

			Minimize.MouseButton1Click:Connect(function()
				invertedFlag = not invertedFlag
				textLabel2.Visible = not invertedFlag
				local valueValue7 = Minimize
				valueValue7.Text = invertedFlag and "Show" or "Minimize"
				frame3.Size = invertedFlag and UDim2.new(0, 180, 0, 24) or UDim2.new(0, 180, 0, 85)
			end)

			Close.MouseButton1Click:Connect(function()
				enabledValue8 = false

				if parentValue then
					pcall(function()
						parentValue:Destroy()
					end)

					parentValue = nil
				end

				if toggles.KillerPerksToggle then
					toggles.KillerPerksToggle:SetValue(false)
				end
			end)

			local enabledValue9 = false
			local position = nil
			local position2 = nil

			frame3.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					enabledValue9 = true
					position = input.Position
					position2 = frame3.Position

					input.Changed:Connect(function()
						if input.UserInputState == Enum.UserInputState.End then
							enabledValue9 = false
						end
					end)
				end
			end)

			local inputChanged = UserInputService2.InputChanged
			local connect = inputChanged.Connect
			local xorValue29 = bit32.bxor(xorValue28, 1239509543)

			local function callbackValue52(inputValue3)
				if not enabledValue9 or not position or not position2 then
					return
				end

				if inputValue3.UserInputType ~= Enum.UserInputType.MouseMovement and inputValue3.UserInputType ~= Enum.UserInputType.Touch then
					return
				end
				local position3 = inputValue3.Position
				local sum20 = bit32.bxor(xorValue29, 0) + 534144764
				local difference13 = position3 - position
				local parentValue2 = frame3
				local udim2 = UDim2.new
				local positionValue = position2
				local matches = bit32.bxor(xorValue29, 0) == 125255963
				parentValue2.Position = udim2(positionValue.X.Scale, position2.X.Offset + difference13.X, position2.Y.Scale, position2.Y.Offset + difference13.Y)
			end

			xorValue29 = bit32.bxor(xorValue29, maskedBits15 - 4285223769 - 401798467)
			connect(inputChanged, callbackValue52)
			screenGui.Parent = callbackValue46(249893050)
			parentValue = screenGui

			task.spawn(function()
				while enabledValue8 and parentValue do
					if not invertedFlag then
						local textValue, valueValue7 = callbackValue51()
						textLabel2.Text = textValue
						frame3.Size = UDim2.new(0, 180, 0, math.max(65, 28 + math.max(2, math.min(valueValue7 + 1, 5)) * 15))
					end

					task.wait(1)
				end
			end)
		end

		addRightGroupboxResult:AddToggle("KillerPerksToggle", {
			Text = "Killer Perks Display",
			Default = false,
			Tooltip = "Menampilkan perk killer yang sedang digunakan",
			Callback = function(enabledValue9)
				enabledValue8 = enabledValue9

				if enabledValue9 then
					CreateKillerPerksGUI()
				elseif parentValue then
					pcall(function()
						parentValue:Destroy()
					end)

					parentValue = nil
				end
			end,
		})

		spectatorEnabled = false
		SpectatorGui = nil
		xorValue23 = bit32.bxor(sum17, 0)
		SpectatorLabel = nil

		CreateSpectatorUI = function()
			local numberValue2 = 665469947
			local numberValue3 = 194654248
			local xorValue24 = bit32.bxor(numberValue3, 0)
			local combinedBits4 = bit32.bor(2316993804, xorValue24)
			SpectatorGui:Destroy()
			SpectatorGui = Instance.new("ScreenGui")
			SpectatorGui.Name = "SpectatorCounter"
			SpectatorGui.ResetOnSpawn = false
			SpectatorGui.IgnoreGuiInset = true
			local pcallValue = pcall
			local xorValue25 = bit32.bxor(combinedBits4, 2296807917)

			local function callbackValue46()
				local spectatorGui = SpectatorGui
				local gameValue = game
				local matches = bit32.bxor(xorValue25, 0) ~= 335677106
				spectatorGui.Parent = gameValue:GetService("CoreGui")
			end

			local xorValue26 = bit32.bxor(numberValue3, 484704859)
			xorValue25 = bit32.bxor(xorValue25, xorValue26)
			pcallValue(callbackValue46)

			if not SpectatorGui.Parent then
				SpectatorGui.Parent = localPlayerValue:WaitForChild("PlayerGui")
			end

			local frame3 = Instance.new("Frame", SpectatorGui)
			frame3.Name = "MainBox"
			frame3.AnchorPoint = Vector2.new(0.5, 0)
			frame3.Position = UDim2.new(0.61000001430511475, 0, 0.0099999997764825821, 0)
			frame3.Size = UDim2.new(0, 145, 0, 52)
			frame3.BackgroundColor3 = Color3.new(0.070588238537311554, 0.070588238537311554, 0.086274512112140656)
			frame3.BackgroundTransparency = 0.1
			frame3.BorderSizePixel = 0
			frame3.Active = true
			Instance.new("UICorner", frame3).CornerRadius = UDim.new(0, 6)
			local frame4 = Instance.new("Frame", frame3)
			frame4.Size = UDim2.new(1, 0, 0, 4)
			frame4.BackgroundColor3 = Color3.new(0.11764705926179886, 0.58823531866073608, 1)
			frame4.BorderSizePixel = 0
			Instance.new("UICorner", frame4).CornerRadius = UDim.new(0, 6)
			local frame5 = Instance.new("Frame", frame4)
			frame5.Size = UDim2.new(1, 0, 0.5, 0)
			frame5.Position = UDim2.new(0, 0, 0.5, 0)
			frame5.BackgroundColor3 = Color3.new(0.11764705926179886, 0.58823531866073608, 1)
			frame5.BorderSizePixel = 0
			local frame6 = Instance.new("Frame", frame3)
			local quotient6 = numberValue2 // bit32.bxor(numberValue3, 0)
			frame6.Size = UDim2.new(1, 0, 0, 18)
			frame6.Position = UDim2.new(0, 0, 0, 4)
			local xorValue27 = bit32.bxor(numberValue3, combinedBits4)
			frame6.BackgroundTransparency = 1
			frame6.Active = true
			local textLabel = Instance.new("TextLabel", frame6)
			textLabel.Size = UDim2.new(1, -20, 1, 0)
			textLabel.BackgroundTransparency = 1
			textLabel.Font = Enum.Font.GothamBold
			local xorValue28 = bit32.bxor(xorValue27, 0)
			local combinedBits5 = bit32.bor(quotient6, xorValue28)
			textLabel.Text = "Spectators"
			textLabel.TextColor3 = Color3.new(0.90196079015731812, 0.90196079015731812, 0.90196079015731812)
			textLabel.TextSize = 10
			textLabel.TextXAlignment = Enum.TextXAlignment.Center
			textLabel.Parent = frame6
			local textButton = Instance.new("TextButton", frame6)
			textButton.Size = UDim2.new(0, 18, 0, 18)
			textButton.Position = UDim2.new(1, -19, 0, 0)
			textButton.BackgroundTransparency = 1
			textButton.Text = "−"
			textButton.TextColor3 = Color3.new(0.70588237047195435, 0.70588237047195435, 0.70588237047195435)
			textButton.Font = Enum.Font.GothamBold
			textButton.TextSize = 13
			textButton.AutoButtonColor = false
			textButton.Parent = frame6
			local frame7 = Instance.new("Frame", frame3)
			frame7.Size = UDim2.new(1, -12, 0, 1)
			frame7.Position = UDim2.new(0, 6, 0, 23)
			frame7.BackgroundColor3 = Color3.new(0.23529411852359772, 0.23529411852359772, 0.27450981736183167)
			frame7.BorderSizePixel = 0
			local frame8 = Instance.new("Frame", frame3)
			frame8.Size = UDim2.new(1, 0, 1, -25)
			frame8.Position = UDim2.new(0, 0, 0, 25)
			frame8.BackgroundTransparency = 1
			local uiListLayout = Instance.new("UIListLayout", frame8)
			uiListLayout.FillDirection = Enum.FillDirection.Horizontal
			uiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			uiListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
			uiListLayout.Padding = UDim.new(0, 5)
			local difference12 = combinedBits4 - 2033793275
			local imageLabel = Instance.new("ImageLabel", frame8)
			imageLabel.Size = UDim2.new(0, 13, 0, 13)
			local xorValue29 = bit32.bxor(xorValue27, difference12)
			imageLabel.BackgroundTransparency = 1
			imageLabel.Image = "rbxassetid://13321848320"
			imageLabel.ImageColor3 = Color3.new(0.11764705926179886, 0.58823531866073608, 1)
			imageLabel.LayoutOrder = 1
			SpectatorLabel = Instance.new("TextLabel", frame8)
			SpectatorLabel.BackgroundTransparency = 1
			SpectatorLabel.Font = Enum.Font.GothamMedium
			SpectatorLabel.Text = "No spectators"
			local maskedBits14 = bit32.band(combinedBits5, 2866676719)
			SpectatorLabel.TextColor3 = Color3.new(0.86274510622024536, 0.86274510622024536, 0.86274510622024536)
			SpectatorLabel.TextSize = 10
			SpectatorLabel.AutomaticSize = Enum.AutomaticSize.X
			SpectatorLabel.LayoutOrder = 2
			local enabledValue9 = true

			local function callbackValue47(enabledValue10)
				enabledValue9 = enabledValue10

				if enabledValue10 then
					frame3.Size = UDim2.new(0, 145, 0, 52)
					frame7.Visible = true
					frame8.Visible = true
					textButton.Text = "−"
				else
					frame3.Size = UDim2.new(0, 145, 0, 22)
					frame7.Visible = false
					frame8.Visible = false
					textButton.Text = "+"
				end
			end

			local mouseButton1Click = textButton.MouseButton1Click
			local connect = mouseButton1Click.Connect
			local xorValue30 = bit32.bxor(xorValue29, 2229731809)

			local function callbackValue48()
				local matches = bit32.bxor(bit32.bxor(xorValue30, 0), 475555641) == 456903375
				callbackValue47(not enabledValue9)
			end

			local xorValue31 = bit32.bxor(maskedBits14, 2237268164)
			xorValue30 = bit32.bxor(xorValue30, xorValue31)
			connect(mouseButton1Click, callbackValue48)
			callbackValue47(true)
			local enabledValue10 = false
			local position = nil
			local position2 = nil

			frame3.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					enabledValue10 = true
					position = input.Position
					position2 = frame3.Position
				end
			end)

			local inputChanged = UserInputService.InputChanged
			local connect2 = inputChanged.Connect
			local xorValue32 = bit32.bxor(maskedBits14, 2161438932)

			local function callbackValue49(inputValue3)
				if not enabledValue10 then
					return
				end
				local matches = bit32.bxor(xorValue32, 0) ~= 158189460
				local userInputType = inputValue3.UserInputType
				local userInputType2 = Enum.UserInputType
				bit32.bxor(bit32.bxor(xorValue32, 0), 56046435)

				if userInputType == userInputType2.MouseMovement or inputValue3.UserInputType == Enum.UserInputType.Touch then
					local difference13 = inputValue3.Position - position
					frame3.Position = UDim2.new(position2.X.Scale, position2.X.Offset + difference13.X, position2.Y.Scale, position2.Y.Offset + difference13.Y)
				end
			end

			xorValue32 = bit32.bxor(xorValue32, difference12 - 55100100)
			connect2(inputChanged, callbackValue49)
			local inputEnded = UserInputService.InputEnded
			local connect3 = inputEnded.Connect
			local xorValue33 = 438075912

			local function callbackValue50(inputValue3)
				local userInputType = inputValue3.UserInputType
				local mouseButton1 = Enum.UserInputType.MouseButton1
				local sum18 = bit32.bxor(xorValue33, 0) + 276357082

				if userInputType == mouseButton1 or inputValue3.UserInputType == Enum.UserInputType.Touch then
					enabledValue10 = false
					position = nil
					position2 = nil
				end
			end

			local xorValue34 = bit32.bxor(maskedBits14, 2483354613)
			xorValue33 = bit32.bxor(xorValue33, xorValue34)
			connect3(inputEnded, callbackValue50)
		end

		UpdateSpectatorCount = function()
			local numberValue2 = 0

			for _, player in ipairs(Players:GetPlayers()) do
				if player.Team and player.Team.Name == "Spectator" then
					numberValue2 += 1
				end
			end

			if numberValue2 == 0 then
				SpectatorLabel.Text = "No spectators"
				SpectatorLabel.TextColor3 = Color3.new(0.58823531866073608, 0.58823531866073608, 0.62745100259780884)
			else
				SpectatorLabel.Text = numberValue2 .. " spectators"
				SpectatorLabel.TextColor3 = Color3.new(0.94117647409439087, 0.94117647409439087, 0.94117647409439087)
			end
		end

		StartSpectatorInfo = function()
		end

		StopSpectatorInfo = function()
			spectatorEnabled = false
			SpectatorGui:Destroy()
			SpectatorGui = nil
			SpectatorLabel = nil
			lib:Notify({ Title = "Spectator Info", Description = "Display dimatikan", Time = 2 })
		end

		addRightGroupboxResult:AddToggle("SpectatorToggle", {
			Text = "Enable Spectator Counter",
			Default = false,
			Tooltip = "Menampilkan jumlah player yang sedang jadi Spectator",
			Callback = function(inputValue3)
				if inputValue3 then
					StartSpectatorInfo()
				else
					StopSpectatorInfo()
				end
			end,
		})

		addRightGroupboxResult:AddButton({
			Text = "Refresh Count",
			Func = function()
				UpdateSpectatorCount()
			end,
		})
	end

	local enabledValue9, enabledValue10, callbackValue46, enabledValue11, enabledValue12, enabledValue13, part, entries10, maskedBits14, entries11
	local timestamp8, sum18, difference12

	do
		local addRightGroupboxResult2 = tabs.Survivor:AddRightGroupbox("Quick Vault", "wind")

		addRightGroupboxResult2:AddToggle("AutoVault", {
			Text = "Auto Vault",
			Default = false,
			Callback = function(autoVaultEnabledValue)
				autoVaultEnabled = autoVaultEnabledValue
			end,
		})

		task.spawn(function()
			while true do
				task.wait(0.1)

				if not UserInputService.TouchEnabled then
					local lastActionTimeValue = lastActionTime
					if tick() - lastActionTimeValue < COOLDOWN then
						continue
					end
					local pcprompts = playerGui:FindFirstChild("pcprompts")
					local frame3 = pcprompts and pcprompts:FindFirstChild("Frame")
					if not frame3 then
						continue
					end
					local vaultPromptGui = frame3:FindFirstChild("VaultPromptGui")
					local palletSlidePromptGui = frame3:FindFirstChild("PalletSlidePromptGui")

					if vaultPromptGui and vaultPromptGui.Visible or palletSlidePromptGui and palletSlidePromptGui.Visible then
						VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
						task.wait(0.01)
						VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
						lastActionTime = tick()
					end
				end
			end
		end)

		local function taskCallback()
			if not UserInputService.TouchEnabled then
				return
			end
			local survivorMob = playerGui:FindFirstChild("Survivor-mob") or playerGui:WaitForChild("Survivor-mob", 8)
			if not survivorMob then
				return
			end
			local controls = survivorMob:FindFirstChild("Controls") or survivorMob:WaitForChild("Controls", 5)
			local action = controls and (controls:FindFirstChild("action") or controls:WaitForChild("action", 5))
			if not action then
				return
			end
			local entries12 = { vault = true, palletvault = true, palletslide = true, slide = true }

			local function callbackValue47(inputValue3)
				if not (inputValue3:IsA("ImageLabel") or inputValue3:IsA("ImageButton")) then
					return
				end
				local lowerResult = inputValue3.Name:lower()
				if not entries12[lowerResult] then
					return
				end

				inputValue3:GetPropertyChangedSignal("Visible"):Connect(function()
					if not inputValue3.Visible then
						return
					end
					local lastActionTimeValue = lastActionTime
					if tick() - lastActionTimeValue < COOLDOWN then
						return
					end
					local selectedValue = lowerResult:find("vault") and not lowerResult:find("pallet")
					local pos = lowerResult:find("pallet") or lowerResult:find("slide")

					if selectedValue and autoVaultEnabled or pos and autoPalletSlideEnabled then
						pcall(function()
							firesignal(action.MouseButton1Down)
							task.wait(0.01)
							firesignal(action.MouseButton1Up)
						end)

						lastActionTime = tick()
					end
				end)
			end

			for _, child in pairs(action:GetChildren()) do
				callbackValue47(child)
			end

			action.ChildAdded:Connect(function(child)
				task.wait()
				callbackValue47(child)
			end)
		end

		task.spawn(taskCallback)
		local characterAdded = localPlayer.CharacterAdded
		local connect = characterAdded.Connect
		local xorValue24 = bit32.bxor(sum17, 766777915)

		local function callbackValue47()
			local wait = task.wait
			local matches = bit32.bxor(xorValue24, 0) ~= 246573386
			wait(2)
			taskCallback()
		end

		xorValue24 = bit32.bxor(xorValue24, xorValue23 + 3707882799)
		connect(characterAdded, callbackValue47)

		playerGui.ChildAdded:Connect(function(child)
			if child.Name == "Survivor-mob" then
				task.wait(1)
				taskCallback()
			end
		end)

		local enabledValue14 = false

		EnableUnlimitedVault = function()
			if enabledValue14 then
				return
			end
			enabledValue14 = true

			if _G.UnlimitedVaultConn then
				_G.UnlimitedVaultConn:Disconnect()
			end

			for _, item in ipairs(CollectionService:GetTagged("Blocked")) do
				CollectionService:RemoveTag(item, "Blocked")
			end

			_G.UnlimitedVaultConn = CollectionService:GetInstanceAddedSignal("Blocked"):Connect(function(inputValue3)
				CollectionService:RemoveTag(inputValue3, "Blocked")
			end)

			lib:Notify({ Title = "Unlimited Vault", Description = "Aktif", Time = 3 })
		end

		DisableUnlimitedVault = function()
			enabledValue14 = false

			if _G.UnlimitedVaultConn then
				_G.UnlimitedVaultConn:Disconnect()
				_G.UnlimitedVaultConn = nil
			end

			lib:Notify({ Title = "Unlimited Vault", Description = "Nonaktif", Time = 2 })
		end

		addRightGroupboxResult2:AddToggle("UnlimitedVault", {
			Text = "Unlimited Vault",
			Tooltip = "Vault/ lompat jendela tanpa batas (tanpa cooldown)",
			Default = false,
			Callback = function(inputValue3)
				if inputValue3 then
					EnableUnlimitedVault()
				else
					DisableUnlimitedVault()
				end
			end,
		}):AddKeyPicker("UnlimitedVaultKey", {
			Default = "None",
			Text = "Keybind Unlimited Vault",
			Mode = "Toggle",
			Callback = function(inputValue3)
				if inputValue3 then
					EnableUnlimitedVault()
				else
					DisableUnlimitedVault()
				end
			end,
		})

		localPlayer.CharacterAdded:Connect(function()
			task.wait(1)

			if enabledValue14 then
				for _, item in ipairs(CollectionService:GetTagged("Blocked")) do
					CollectionService:RemoveTag(item, "Blocked")
				end
			end
		end)

		addRightGroupboxResult2:AddToggle("Surv_PerfectVault", {
			Text = "Anti Slow Vault",
			Tooltip = "Mencegah perlambatan saat vault (perfect vault)",
			Default = false,
			Callback = function(survPerfectVault)
				Config.Surv_PerfectVault = survPerfectVault

				if survPerfectVault then
					lib:Notify({ Title = "Anti Slow Vault", Description = "On", Time = 2 })
				else
					lib:Notify({ Title = "Anti Slow Vault", Description = "Off", Time = 2 })
				end
			end,
		}):AddKeyPicker("PerfectVaultKey", {
			Default = "None",
			Text = "Toggle Anti Slow Vault",
			Mode = "Toggle",
			SyncToggleState = true,
			Callback = function(survPerfectVault)
				Config.Surv_PerfectVault = survPerfectVault

				if survPerfectVault then
					lib:Notify({ Title = "Anti Slow Vault", Description = "On", Time = 2 })
				else
					lib:Notify({ Title = "Anti Slow Vault", Description = "Off", Time = 2 })
				end
			end,
		})

		local enabledValue15 = false
		local connection = nil
		local xorValue25 = bit32.bxor(sum17, 0)
		local packedResults37 = table.pack(bit32.band(xorValue22, 4294967295))
		local packedResults38 = table.pack(bit32.band(xorValue25, 4294967295))
		local packedResults39 = table.pack(bit32.band(packedResults37[1], 65535))
		local packedResults40 = table.pack(bit32.rshift(packedResults37[1], 16))
		local packedResults41 = table.pack(bit32.band(packedResults38[1], 65535))
		local maskedBits15 = bit32.band(packedResults39[1] * packedResults41[1] + bit32.lshift(bit32.band(packedResults39[1] * bit32.rshift(packedResults38[1], 16) + packedResults40[1] * packedResults41[1], 65535), 16), 4294967295)
		local connection2 = nil

		setupFlowstateCharacter = function(inputValue3)
			if not inputValue3 then
				return
			end
			inputValue3:SetAttribute("Flowstate", true)

			if connection then
				connection:Disconnect()
				connection = nil
			end

			connection = inputValue3:GetAttributeChangedSignal("Flowstate"):Connect(function()
				if not enabledValue15 then
					return
				end

				if inputValue3:GetAttribute("Flowstate") == false then
					task.wait(0.05)
					inputValue3:SetAttribute("Flowstate", true)
				end
			end)
		end

		addRightGroupboxResult2:AddToggle("FlowState", {
			Text = "Flowstate No CD",
			Default = false,
			Callback = function(enabledValue16)
				enabledValue15 = enabledValue16

				if connection then
					connection:Disconnect()
					connection = nil
				end

				if connection2 then
					connection2:Disconnect()
					connection2 = nil
				end

				if not enabledValue16 then
					local character = localPlayer.Character

					if character then
						character:SetAttribute("Flowstate", false)
					end

					return
				end

				setupFlowstateCharacter(localPlayer.Character)

				connection2 = localPlayer.CharacterAdded:Connect(function(character)
					if not enabledValue15 then
						return
					end
					task.wait(1)
					setupFlowstateCharacter(character)
				end)
			end,
		}):AddKeyPicker("FlowStateKey", {
			Default = "None",
			Text = "Keybind Flowstate No CD",
			Mode = "Toggle",
			Callback = function(inputValue3)
				toggles.FlowState:SetValue(inputValue3)
			end,
		})

		local addRightGroupboxResult3 = tabs.Survivor:AddRightGroupbox("Fake Perks", "sparkles")

		addRightGroupboxResult3:AddToggle("FakeQuickRecovery", {
			Text = "Fake Quick Recovery",
			Tooltip = "Speed boost 1.4x selama 3 detik setelah vault cepat",
			Default = false,
			Callback = function(inputValue3)
				FakePerks.ToggleQuickRecovery(inputValue3)
			end,
		}):AddKeyPicker("FakeQuickRecoveryKey", {
			Default = "None",
			Text = "Keybind Quick Recovery",
			Mode = "Toggle",
			Callback = function(inputValue3)
				FakePerks.ToggleQuickRecovery(inputValue3)

				if toggles.FakeQuickRecovery then
					toggles.FakeQuickRecovery:SetValue(inputValue3)
				end
			end,
		})

		addRightGroupboxResult3:AddToggle("FakePerfectLanding", {
			Text = "Fake Perfect Landing",
			Tooltip = "Speed boost 1.4x selama 3 detik setelah landing",
			Default = false,
			Callback = function(inputValue3)
				FakePerks.TogglePerfectLanding(inputValue3)
			end,
		}):AddKeyPicker("FakePerfectLandingKey", {
			Default = "None",
			Text = "Keybind Perfect Landing",
			Mode = "Toggle",
			Callback = function(inputValue3)
				FakePerks.TogglePerfectLanding(inputValue3)

				if toggles.FakePerfectLanding then
					toggles.FakePerfectLanding:SetValue(inputValue3)
				end
			end,
		})

		addRightGroupboxResult3:AddToggle("FakeFlowstate", {
			Text = "Fake Flowstate",
			Tooltip = "Flowstate unlimited dengan cooldown realistis",
			Default = false,
			Callback = function(inputValue3)
				FakePerks.ToggleFlowstate(inputValue3)
			end,
		}):AddKeyPicker("FakeFlowstateKey", {
			Default = "None",
			Text = "Keybind Flowstate",
			Mode = "Toggle",
			Callback = function(inputValue3)
				FakePerks.ToggleFlowstate(inputValue3)

				if toggles.FakeFlowstate then
					toggles.FakeFlowstate:SetValue(inputValue3)
				end
			end,
		})

		addRightGroupboxResult3:AddSlider("FakePerksDelay", {
			Text = "Perks Cooldown (detik)",
			Tooltip = "Cooldown antar trigger perk",
			Default = 10,
			Min = 0,
			Max = 180,
			Rounding = 1,
			Callback = function(perkCooldown)
				FakePerks.PerkCooldown = perkCooldown

				if FakePerks.FlowstateEnabled and localPlayer.Character then
					localPlayer.Character:SetAttribute("Flowstate", true)
					FakePerks.fsOnCooldown = false
					FakePerks.lastFSTime = tick()
				end
			end,
		})

		local addRightGroupboxResult4 = tabs.Survivor:AddRightGroupbox("Camera Settings", "camera")

		addRightGroupboxResult4:AddToggle("InfinityZoom", {
			Text = "Infinity Zoom Out",
			Tooltip = "Zoom Out tanpa batas",
			Default = false,
			Callback = function(inputValue3)
				if inputValue3 then
					localPlayerValue.CameraMaxZoomDistance = math.huge
					localPlayerValue.CameraMinZoomDistance = 0
				else
					localPlayerValue.CameraMaxZoomDistance = 12
					localPlayerValue.CameraMinZoomDistance = 0.5
				end
			end,
		})

		addRightGroupboxResult4:AddToggle("CameraFOV", {
			Text = "Camera FOV",
			Tooltip = "Atur jarak pandang kamera",
			Default = false,
			Callback = function(fovEnabled)
				FOVEnabled = fovEnabled
				local currentCamera2 = workspace.CurrentCamera

				if currentCamera2 then
					if fovEnabled then
						currentCamera2.FieldOfView = TargetFOV
					else
						currentCamera2.FieldOfView = 70
					end
				end
			end,
		})

		addRightGroupboxResult4:AddSlider("FOVValue", {
			Text = "FOV Value",
			Default = 90,
			Min = 60,
			Max = 120,
			Rounding = 0,
			Callback = function(fieldOfView)
				TargetFOV = fieldOfView
				local currentCamera2 = workspace.CurrentCamera

				if currentCamera2 then
					currentCamera2.FieldOfView = fieldOfView
				end
			end,
		})

		local function callbackValue48()
			local remotes = ReplicatedStorage:FindFirstChild("Remotes")
			remotes = remotes and remotes:FindFirstChild("Items")
			remotes = remotes and remotes:FindFirstChild("Twist of Fate")
			return remotes and remotes:FindFirstChild("Fire")
		end

		enabledValue9 = false
		enabledValue10 = false

		callbackValue46 = function()
			return enabledValue9
		end

		enabledValue11 = true
		enabledValue12 = false
		enabledValue13 = false
		local connection3 = nil
		part = nil
		local internal = "Killer"
		local udim2 = UDim2.new(0.5, -120, 0, 110)
		entries10 = {}
		local sum19 = sum17 + xorValue23
		local entries12 = { PredictionEfficiency = 0.85, LerpSmoothness = 0.4, EnableJitter = false }
		maskedBits14 = bit32.band(maskedBits15, xorValue23)
		entries12.MaxJitterStuds = 0

		getGunObject = function()
			local character = localPlayer.Character
			if not character then
				return nil
			end
			local twistOfFate = character:FindFirstChild("Twist of Fate", true)
			if not twistOfFate then
				return nil
			end
			local rightArm = twistOfFate:FindFirstChild("Right Arm")

			if rightArm then
				local gun = rightArm:FindFirstChild("gun")
				if gun then
					return gun
				end
				local emperorGun = rightArm:FindFirstChild("EmperorGun")
				if emperorGun then
					return emperorGun
				end
			end

			return twistOfFate
		end

		isTargetVisible = function(inputValue3, inputValue4, inputValue5)
			local difference13 = inputValue4 - inputValue3
			local magnitude = difference13.Magnitude
			if magnitude < 0.1 then
				return true
			end
			local raycastParams = RaycastParams.new()
			raycastParams.FilterType = Enum.RaycastFilterType.Exclude
			local filterDescendantsInstances = {}
			local character = localPlayer.Character

			if character then
				table.insert(filterDescendantsInstances, character)
			end

			if inputValue5 and inputValue5 ~= character then
				table.insert(filterDescendantsInstances, inputValue5)
			end

			if part then
				table.insert(filterDescendantsInstances, part)
			end

			raycastParams.FilterDescendantsInstances = filterDescendantsInstances
			return workspace:Raycast(inputValue3, difference13.Unit * magnitude, raycastParams) == nil
		end

		entries11 = {}
		timestamp8 = 0

		GetSCPs = function()
			if tick() - timestamp8 < 0.5 then
				return entries11
			end
			local entries13 = {}
			local map = workspace:FindFirstChild("Map")

			if map then
				for _, descendant in pairs(map:GetDescendants()) do
					if descendant:IsA("Model") then
						local attributes = descendant:GetAttributes()

						if descendant:GetAttribute("CorpseCreated0492") or next(attributes) ~= nil then
							local humanoidRootPart = descendant:FindFirstChild("HumanoidRootPart")

							if humanoidRootPart then
								table.insert(entries13, humanoidRootPart)
							end
						end
					end
				end
			end

			entries11 = entries13
			timestamp8 = tick()
			return entries11
		end

		local function callbackValue49(inputValue3)
			local humanoidRootPart = inputValue3:FindFirstChild("HumanoidRootPart")
			if not humanoidRootPart then
				return Vector3.zero
			end
			local position = humanoidRootPart.Position
			local entry = entries10[inputValue3]

			if entry then
				local time = entry.time
				local difference13 = tick() - time

				if difference13 > 0.001 and difference13 < 0.1 then
					local lerpResult = entry.vel:Lerp((position - entry.pos) / difference13, entries12.LerpSmoothness)
					entries10[inputValue3] = { pos = position, vel = lerpResult, time = tick() }
					return lerpResult
				end
			end

			local entries13 = entries10
			local entries14 = { pos = position, vel = humanoidRootPart.Velocity }
			entries14.time = tick()
			entries13[inputValue3] = entries14
			return humanoidRootPart.Velocity
		end

		local function callbackValue50(inputValue3, inputValue4, inputValue5, selectedValue)
			local difference13 = 2642860134
			local numberValue2 = 4046942368
			selectedValue = selectedValue or 500
			local position = inputValue4.Position
			if (position - inputValue3).Magnitude < 8 then
				return position
			end
			local valueValue7 = callbackValue49(inputValue5)
			local difference14 = position - inputValue3
			local difference15 = valueValue7:Dot(valueValue7) - selectedValue * selectedValue
			local product3 = 2 * difference14:Dot(valueValue7)
			local dotResult = difference14:Dot(difference14)
			local absoluteValue = math.abs(difference15)
			local maskedBits16 = bit32.band(numberValue2, 1428262568)
			local product4

			if absoluteValue < 0.01 then
				product4 = nil

				if math.abs(product3) > 0.01 then
					product4 = -dotResult / product3
				end
			else
				local difference16 = product3 * product3 - 4 * difference15 * dotResult
				local maskedBits17 = bit32.band(difference13, maskedBits16)
				product4 = nil

				if difference16 >= 0 then
					local squareRoot = math.sqrt(difference16)
					product4 = (-product3 - squareRoot) / 2 * difference15
					local product5 = (-product3 + squareRoot) / 2 * difference15

					if not (product4 > 0.001) then
						product4 = nil

						if product5 > 0.001 then
							product4 = product5
						end
					end
				end

				difference13 = maskedBits17 - 1937319866
			end

			if product4 then
				position += valueValue7 * entries12.PredictionEfficiency * product4

				if entries12.EnableJitter then
					local vector = Vector3.new
					local packedResults42 = table.pack(bit32.band(maskedBits16, 4294967295))
					local packedResults43 = table.pack(bit32.band(difference13, 4294967295))
					local packedResults44 = table.pack(bit32.band(packedResults42[1], 65535))
					local packedResults45 = table.pack(bit32.rshift(packedResults42[1], 16))
					local packedResults46 = table.pack(bit32.band(packedResults43[1], 65535))
					local maskedBits18 = bit32.band(packedResults44[1] * packedResults46[1] + bit32.lshift(bit32.band(packedResults44[1] * bit32.rshift(packedResults43[1], 16) + packedResults45[1] * packedResults46[1], 65535), 16), 4294967295)
					local maxJitterStuds = entries12.MaxJitterStuds
					local ratio = entries12.MaxJitterStuds / 2
					local maxJitterStuds2 = entries12.MaxJitterStuds
					position += vector((math.random() - 0.5) * maxJitterStuds, (math.random() - 0.5) * ratio, (math.random() - 0.5) * maxJitterStuds2)
					bit32.bxor(maskedBits18, 3461103456)
				end
			end

			return position
		end

		local xorValue26 = bit32.bxor(sum19, 0)
		local xorValue27 = bit32.bxor(xorValue23, xorValue26)

		getTargetPosition = function()
			local numberValue2 = 1411638283
			local xorValue28 = 1321643695
			local getGunObjectResult = getGunObject()
			local character = localPlayer.Character
			if not (getGunObjectResult and character) then
				return nil, nil, nil, nil
			end
			local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
			if not humanoidRootPart then
				return nil, nil, nil, nil
			end
			local position = humanoidRootPart.Position
			local positionValue = nil

			if character:GetAttribute("IsCarried") then
				positionValue = character.HumanoidRootPart.Position + character.HumanoidRootPart.CFrame.LookVector * 2
			else
				local pcallValue = pcall
				local xorValue29 = 488883754

				local function callbackValue51()
					positionValue = getGunObjectResult:IsA("BasePart") and getGunObjectResult.Position or getGunObjectResult:FindFirstChildOfClass("BasePart") and getGunObjectResult:FindFirstChildOfClass("BasePart").Position
					local sum20 = bit32.bxor(xorValue29, 0) + 56720794
				end

				xorValue29 = bit32.bxor(xorValue29, xorValue28 - 1263283578)
				pcallValue(callbackValue51)

				if not positionValue then
					local vector = Vector3.new(position.X, position.Y + 1.5, position.Z)
					xorValue28 = bit32.bxor(numberValue2, 451234468)
					positionValue = vector
				end
			end

			local function callbackValue52(inputValue3, inputValue4, inputValue5)
				local position2 = inputValue3.Position
				if enabledValue12 and not isTargetVisible(positionValue, position2, inputValue4) then
					return nil, nil, nil, nil
				end
				local getGunObjectResult2 = getGunObject()
				local position3 = positionValue
				local pcallValue2 = pcall
				local xorValue30 = 451006985

				local function callbackValue53()
					local getGunObjectResult3 = getGunObjectResult2
					bit32.bxor(bit32.bxor(xorValue30, 0), 533518154)
					local isBasePart = getGunObjectResult2

					if getGunObjectResult3 then
						isBasePart = getGunObjectResult2:IsA("BasePart")
					end

					if isBasePart then
						position3 = getGunObjectResult2.Position
					elseif getGunObjectResult2 then
						local basePart = getGunObjectResult2:FindFirstChildOfClass("BasePart")

						if basePart then
							position3 = basePart.Position
						end
					end
				end

				local xorValue31 = bit32.bxor(inputValue5, 307488785)
				xorValue30 = bit32.bxor(xorValue30, xorValue31)
				pcallValue2(callbackValue53)
				if (position2 - position3).Magnitude < 8 then
					return (position2 - position3).Unit, getGunObjectResult2, position3, position2
				end
				local valueValue7 = callbackValue50(position3, inputValue3, inputValue4, 500)
				return (valueValue7 - position3).Unit, getGunObjectResult2, position3, valueValue7
			end

			if internal == "Killer" then
				local huge = math.huge
				local torsoValue = nil
				local character2 = nil

				for _, player in ipairs(Players:GetPlayers()) do
					if player ~= localPlayer then
						if player.Team and player.Team.Name == "Killer" and player.Character then
							local torso = player.Character:FindFirstChild("Torso")

							if torso then
								local magnitude = (position - torso.Position).Magnitude

								if magnitude < huge then
									character2 = player.Character
									huge = magnitude
									torsoValue = torso
								end
							end
						end
					end
				end

				if not torsoValue then
					return nil, nil, nil, nil
				end
				local valueValue7, valueValue8, valueValue9, valueValue10 = callbackValue52(torsoValue, character2, 46753504)
				return valueValue7, valueValue8, valueValue9, valueValue10
			end

			if internal == "Survivors" then
				local currentCamera2 = workspace.CurrentCamera
				local lookVector = currentCamera2.CFrame.LookVector
				local dotResult = -math.huge
				local torsoValue2 = nil
				local character2 = nil

				for _, player in ipairs(Players:GetPlayers()) do
					if player ~= localPlayer and player.Team and player.Team.Name == "Survivors" and player.Character then
						local torso = player.Character:FindFirstChild("Torso")

						if torso then
							local dotResult2 = lookVector:Dot((torso.Position - currentCamera2.CFrame.Position).Unit)

							if dotResult2 > 0.5 and dotResult2 > dotResult then
								character2 = player.Character
								dotResult = dotResult2
								torsoValue2 = torso
							end
						end
					end
				end

				if not torsoValue2 then
					return nil, nil, nil, nil
				end
				local valueValue11, valueValue12, valueValue13, valueValue14 = callbackValue52(torsoValue2, character2, 46753504)
				return valueValue11, valueValue12, valueValue13, valueValue14
			end

			if internal == "Zombie" then
				local getScPsResult = GetSCPs()
				local currentCamera2 = workspace.CurrentCamera
				local lookVector = currentCamera2.CFrame.LookVector
				local dotResult3 = -math.huge
				local item = nil

				for _, item2 in ipairs(getScPsResult) do
					if item2 and item2.Parent then
						local dotResult4 = lookVector:Dot((item2.Position - currentCamera2.CFrame.Position).Unit)

						if dotResult4 > 0.5 and dotResult4 > dotResult3 then
							dotResult3 = dotResult4
							item = item2
						end
					end
				end

				if not item then
					return nil, nil, nil, nil
				end
				local valueValue15, valueValue16, valueValue17, valueValue18 = callbackValue52(item, item.Parent, 46753504)
				return valueValue15, valueValue16, valueValue17, valueValue18
			end

			bit32.band(numberValue2, xorValue28)
			return nil, nil, nil, nil
		end

		updateLaser = function(inputValue3, inputValue4)
			local numberValue2 = 2877247682
			local sum20 = 4094052054

			if not part then
				part = Instance.new("Part")
				part.Name = "ToFLaser"
				part.Anchored = true
				part.CanCollide = false
				part.CanTouch = false
				part.CastShadow = false
				part.Material = Enum.Material.Neon
				part.Color = Color3.new(1, 0.19607843458652496, 0.19607843458652496)
				part.Parent = workspace
				sum20 = sum20 + 2919623695 + 1375343601
			end

			part.Size = Vector3.new(0.05, 0.05, (inputValue4 - inputValue3).Magnitude)
			part.CFrame = CFrame.new((inputValue3 + inputValue4) / 2, inputValue4)
			part.Transparency = 0
		end

		clearLaser = function()
			if part then
				part:Destroy()
				part = nil
			end
		end

		doShoot = function()
			if not callbackValue46() then
				return
			end

			if not enabledValue10 then
				if not enabledValue13 then
					return
				end
			end

			local character = localPlayer.Character

			if character then
				if AimConfig.Pistol_BlockKnocked and IsDowned(character) then
					return
				end
			end

			local getTargetPositionResult, valueValue7, valueValue8, valueValue9 = getTargetPosition()
			if not (getTargetPositionResult and valueValue7 and valueValue9 and valueValue8) then
				return
			end
			local valueValue10 = callbackValue48()
			if not valueValue10 then
				return
			end
			local unit = (valueValue9 - valueValue8).Unit

			pcall(function()
				valueValue10:FireServer(valueValue7, unit)
			end)
		end

		startConnection = function()
			if connection3 then
				return
			end

			connection3 = RunService.Heartbeat:Connect(function()
				if enabledValue13 and callbackValue46() then
					local getTargetPositionResult, valueValue7, valueValue8, valueValue9 = getTargetPosition()

					if getTargetPositionResult and valueValue7 and valueValue9 then
						pcall(function()
							local character = localPlayer.Character
							local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

							if humanoidRootPart and not character:GetAttribute("IsCarried") then
								humanoidRootPart.CFrame = CFrame.new(humanoidRootPart.Position, Vector3.new(valueValue9.X, humanoidRootPart.Position.Y, valueValue9.Z))
							end
						end)

						if AimConfig.LockAim then
							currentCamera.CFrame = currentCamera.CFrame:Lerp(CFrame.lookAt(currentCamera.CFrame.Position, valueValue9), 0.15)
						end

						if enabledValue11 and valueValue8 and valueValue9 then
							updateLaser(valueValue8, valueValue9)
						end
					elseif part then
						part.Transparency = 1
					end
				elseif part then
					part.Transparency = 1
				end
			end)
		end

		stopConnection = function()
			if connection3 then
				connection3:Disconnect()
				connection3 = nil
			end

			clearLaser()
		end

		local parentValue2 = nil
		local connection4 = nil
		local entries13 = {}
		sum18 = sum19 + xorValue27
		local entries14 = { internal = "Survivors", display = "Survivors (J)" }
		difference12 = xorValue27 - bit32.bxor(sum18, 0)
		entries14.activeColor = Color3.new(0.098039217293262482, 0.31372550129890442, 0.58823531866073608)
		entries14.activeTxt = Color3.new(0.62745100259780884, 0.82352942228317261, 1)

		entries13[1] = {
			internal = "Killer",
			display = "Killer (K)",
			activeColor = Color3.new(0.70588237047195435, 0.17647059261798859, 0.17647059261798859),
			activeTxt = Color3.new(1, 0.70588237047195435, 0.70588237047195435),
		}

		entries13[2] = entries14

		entries13[3] = {
			internal = "Zombie",
			display = "Zombie (L)",
			activeColor = Color3.new(0.47058823704719543, 0.31372550129890442, 0.039215687662363052),
			activeTxt = Color3.new(1, 0.82352942228317261, 0.39215686917304993),
		}

		createTargetSelectorUI = function()
			local numberValue2 = 311521447
			local numberValue3 = 943550473
			local numberValue4 = 501063894
			local parentValue3 = CoreGui
			if not parentValue3 then
				return
			end

			if parentValue2 and parentValue2.Parent then
				return
			end
			local toFTargetSelector = CoreGui:FindFirstChild("ToFTargetSelector")

			if toFTargetSelector then
				toFTargetSelector:Destroy()
			end

			if CoreGui:FindFirstChild("ToFTargetSelector") then
				parentValue3.ToFTargetSelector:Destroy()
			end

			local screenGui = Instance.new("ScreenGui")
			screenGui.Name = "ToFTargetSelector"
			screenGui.ResetOnSpawn = false
			screenGui.IgnoreGuiInset = true
			screenGui.Parent = parentValue3
			local product3 = numberValue3 * 2
			local frame3 = Instance.new("Frame")
			frame3.Name = "Main"
			frame3.Size = UDim2.new(0, 165, 0, 130)
			frame3.Position = udim2 or UDim2.new(0.5, -82, 0.5, -65)
			frame3.BackgroundColor3 = Color3.new(0.086274512112140656, 0.086274512112140656, 0.086274512112140656)
			frame3.BorderSizePixel = 0
			frame3.Active = true
			frame3.Parent = screenGui
			Instance.new("UICorner", frame3).CornerRadius = UDim.new(0, 10)
			local uiStroke = Instance.new("UIStroke", frame3)
			uiStroke.Color = Color3.new(0.21568627655506134, 0.21568627655506134, 0.21568627655506134)
			local sum20 = numberValue4 + numberValue2
			uiStroke.Thickness = 0.8
			local frame4 = Instance.new("Frame")
			frame4.Size = UDim2.new(1, 0, 0, 24)
			frame4.BackgroundColor3 = Color3.new(0.11764705926179886, 0.11764705926179886, 0.11764705926179886)
			frame4.BorderSizePixel = 0
			frame4.Parent = frame3
			Instance.new("UICorner", frame4).CornerRadius = UDim.new(0, 10)
			local new = Instance.new
			local combinedBits4 = bit32.bor(numberValue2, 2413787281)
			local Frame = new("Frame")
			Frame.Size = UDim2.new(1, 0, 0, 10)
			Frame.Position = UDim2.new(0, 0, 1, -10)
			Frame.BackgroundColor3 = Color3.new(0.11764705926179886, 0.11764705926179886, 0.11764705926179886)
			Frame.BorderSizePixel = 0
			Frame.Parent = frame4
			local frame5 = Instance.new("Frame")
			frame5.Size = UDim2.new(1, 0, 0, 1)
			frame5.Position = UDim2.new(0, 0, 1, -1)
			local shiftedBits = bit32.rshift(product3, 23)
			frame5.BackgroundColor3 = Color3.new(0.19607843458652496, 0.19607843458652496, 0.19607843458652496)
			frame5.BorderSizePixel = 0
			frame5.Parent = frame4
			local frame6 = Instance.new("Frame")
			frame6.Size = UDim2.new(1, -30, 1, 0)
			frame6.BackgroundTransparency = 1
			frame6.Parent = frame4
			local textButton = Instance.new("TextButton")
			textButton.Size = UDim2.new(0, 24, 1, 0)
			textButton.Position = UDim2.new(1, -26, 0, 0)
			textButton.BackgroundTransparency = 1
			textButton.Text = "−"
			textButton.TextColor3 = Color3.new(0.47058823704719543, 0.47058823704719543, 0.47058823704719543)
			textButton.Font = Enum.Font.GothamBold
			textButton.TextSize = 14
			textButton.TextXAlignment = Enum.TextXAlignment.Center
			textButton.TextYAlignment = Enum.TextYAlignment.Center
			textButton.Parent = frame4
			local textLabel = Instance.new("TextLabel")
			textLabel.Size = UDim2.new(1, -30, 1, 0)
			textLabel.Position = UDim2.new(0, 0, 0, 0)
			textLabel.BackgroundTransparency = 1
			textLabel.Text = "Target: Killer v"
			textLabel.TextColor3 = Color3.new(0.47058823704719543, 0.47058823704719543, 0.47058823704719543)
			local font = Enum.Font
			local sum21 = combinedBits4 + bit32.bxor(sum20, 0)
			textLabel.Font = font.GothamBold
			textLabel.TextSize = 9
			textLabel.TextXAlignment = Enum.TextXAlignment.Center
			textLabel.Parent = frame4
			local frame7 = Instance.new("Frame")
			frame7.Size = UDim2.new(1, -16, 0, 92)
			frame7.Position = UDim2.new(0, 8, 0, 30)
			frame7.BackgroundTransparency = 1
			frame7.Parent = frame3
			local uiListLayout = Instance.new("UIListLayout", frame7)
			local sum22 = shiftedBits + 3223215545
			local sum23 = sum20 + sum21
			uiListLayout.FillDirection = Enum.FillDirection.Vertical
			uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			uiListLayout.Padding = UDim.new(0, 6)
			local entries15 = {}
			local invertedFlag2 = false

			updateButtons = function()
				for _, item in ipairs(entries13) do
					local entry = entries15[item.internal]

					if entry then
						if item.internal == internal then
							entry.BackgroundColor3 = item.activeColor
							entry.TextColor3 = item.activeTxt

							if textLabel then
								textLabel.Text = "Target: " .. item.display .. " v"
							end
						else
							entry.BackgroundColor3 = Color3.new(0.14901961386203766, 0.14901961386203766, 0.14901961386203766)
							entry.TextColor3 = Color3.new(0.50980395078659058, 0.50980395078659058, 0.50980395078659058)
						end
					end
				end
			end

			local xorValue28 = 82016452

			local function toggleMinimizeValue()
				invertedFlag2 = not invertedFlag2
				bit32.bxor(bit32.bxor(xorValue28, 0), 189156061)

				if invertedFlag2 then
					textButton.Text = "+"
					frame7.Visible = false
					frame3.Size = UDim2.new(0, 165, 0, 24)
				else
					textButton.Text = "−"
					frame7.Visible = true
					frame3.Size = UDim2.new(0, 165, 0, 130)
				end
			end

			local xorValue29 = bit32.bxor(sum23, 331759518)
			xorValue28 = bit32.bxor(xorValue28, xorValue29)
			toggleMinimize = toggleMinimizeValue
			textButton.MouseButton1Click:Connect(toggleMinimize)

			for _, child in ipairs(frame7:GetChildren()) do
				if child:IsA("TextButton") then
					child:Destroy()
				end
			end

			for layoutOrder, item in ipairs(entries13) do
				local textButton2 = Instance.new("TextButton")
				textButton2.Size = UDim2.new(1, 0, 0, 26)
				textButton2.BorderSizePixel = 0
				textButton2.Font = Enum.Font.GothamBold
				textButton2.TextSize = 11
				textButton2.Text = item.display
				textButton2.LayoutOrder = layoutOrder
				textButton2.Parent = frame7
				Instance.new("UICorner", textButton2).CornerRadius = UDim.new(0, 6)

				textButton2.MouseButton1Click:Connect(function()
					internal = item.internal
					updateButtons()
				end)

				local inputEnded = textButton2.InputEnded
				local connect2 = inputEnded.Connect
				local xorValue30 = sum21 - 3119353662

				local function callbackValue51(inputValue3)
					local matches = inputValue3.UserInputType == Enum.UserInputType.Touch
					local matches2 = bit32.bxor(xorValue30, 0) + 420352432 == 161714924

					if matches then
						internal = item.internal
						updateButtons()
					end
				end

				xorValue30 = bit32.bxor(xorValue30, sum22 + 1175990732)
				connect2(inputEnded, callbackValue51)
				entries15[item.internal] = textButton2
			end

			updateButtons()
			local enabledValue16 = false
			local position = nil
			local position2 = nil
			local inputBegan = frame6.InputBegan
			local connect2 = inputBegan.Connect
			local xorValue31 = sum22 + 1169208331

			local function callbackValue52(inputValue3)
				local userInputType = inputValue3.UserInputType
				local mouseButton1 = Enum.UserInputType.MouseButton1
				local matches = bit32.bxor(xorValue31, 0) == 281097338

				if userInputType == mouseButton1 or inputValue3.UserInputType == Enum.UserInputType.Touch then
					position = inputValue3.Position
					position2 = frame3.Position
					enabledValue16 = true
				end
			end

			local xorValue32 = bit32.bxor(sum23, 59496342)
			xorValue31 = bit32.bxor(xorValue31, xorValue32)
			connect2(inputBegan, callbackValue52)

			frame6.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					enabledValue16 = false
				end
			end)

			local inputChanged = UserInputService.InputChanged
			local connect3 = inputChanged.Connect
			local xorValue33 = bit32.bxor(sum23, 132392724)

			local function callbackValue53(inputValue3)
				local invertedFlag3 = not enabledValue16
				bit32.bxor(xorValue33, 0)
				xorValue33 = bit32.bxor(xorValue33, 3195340963)

				if not invertedFlag3 then
					if not (inputValue3.UserInputType == Enum.UserInputType.MouseMovement or inputValue3.UserInputType == Enum.UserInputType.Touch) then
						return
					end
					local matches = bit32.bxor(xorValue33, 0) == 210228058
				end
			end

			local xorValue34 = bit32.bxor(sum21, 3683706315)
			xorValue33 = bit32.bxor(xorValue33, xorValue34)
			connect3(inputChanged, callbackValue53)

			if connection4 then
				connection4:Disconnect()
				connection4 = nil
			end

			connection4 = UserInputService.InputBegan:Connect(function(input, gameProcessed)
				local numberValue5 = 4197596356
				local numberValue6 = 2867052119
				if not callbackValue46() then
					return
				end

				if gameProcessed or input.UserInputType ~= Enum.UserInputType.Keyboard then
					return
				end
				bit32.bor(numberValue5, numberValue6)
				local internal2

				if input.KeyCode == Enum.KeyCode.K then
					lib:Notify({ Title = "Target Mode", Description = "Killer", Time = 1 })
					internal2 = "Killer"
				elseif input.KeyCode == Enum.KeyCode.J then
					lib:Notify({ Title = "Target Mode", Description = "Survivors", Time = 1 })
					internal2 = "Survivors"
				else
					internal2 = nil

					if input.KeyCode == Enum.KeyCode.L then
						lib:Notify({ Title = "Target Mode", Description = "Zombie", Time = 1 })
						internal2 = "Zombie"
					end
				end

				if internal2 and internal2 ~= internal then
					internal = internal2

					for index2, item2 in pairs(entries15) do
						if item2 and item2.Parent then
							local matches = index2 == internal

							for _, item3 in ipairs(entries13) do
								if item3.internal == index2 then
									item2.BackgroundColor3 = matches and item3.activeColor or Color3.new(0.14901961386203766, 0.14901961386203766, 0.14901961386203766)
									item2.TextColor3 = matches and item3.activeTxt or Color3.new(0.50980395078659058, 0.50980395078659058, 0.50980395078659058)

									if matches and textLabel then
										textLabel.Text = "Target: " .. item3.display .. " v"
									end
								end
							end
						end
					end
				end
			end)

			parentValue2 = screenGui
		end

		destroyTargetSelectorUI = function()
			if connection4 then
				connection4:Disconnect()
				connection4 = nil
			end

			if parentValue2 then
				parentValue2:Destroy()
				parentValue2 = nil
			end
		end
	end

	local maskedBits16

	do
		local addLeftGroupboxResult5 = tabs.Aimbot:AddLeftGroupbox("Silent Aim (Pistol)", "crosshair")

		addLeftGroupboxResult5:AddToggle("SilentAimToF", {
			Text = "Silent ToF",
			Default = false,
			Callback = function(enabledValue16)
				enabledValue9 = enabledValue16

				if enabledValue16 then
					createTargetSelectorUI()
					startConnection()
				elseif not callbackValue46() then
					destroyTargetSelectorUI()
					stopConnection()
				end

				lib:Notify({ Title = "Silent ToF", Description = enabledValue16 and "ON (Hold)" or "OFF", Time = 2 })
			end,
		}):AddKeyPicker("SilentAimToFKey", {
			Default = "None",
			Text = "ToF Key",
			Mode = "Toggle",
			Callback = function(enabledValue16)
				enabledValue9 = enabledValue16

				if toggles.SilentAimToFV1 then
					toggles.SilentAimToFV1:SetValue(enabledValue16)
				end

				if enabledValue16 then
					createTargetSelectorUI()
					startConnection()
				elseif not callbackValue46() then
					destroyTargetSelectorUI()
					stopConnection()
				end
			end,
		})

		addLeftGroupboxResult5:AddToggle("Predict", {
			Text = "Predict Aim ToF",
			Default = false,
			Premium = true,
			Callback = function(silentAimPredictValue)
				silentAimPredict = silentAimPredictValue
				lib:Notify("auto predict aim: " .. (silentAimPredictValue and "enabled" or "disabled"))
			end,
		})

		addLeftGroupboxResult5:AddCheckbox("Pistol_BlockKnocked", {
			Text = "Block aim Knocked",
			Default = false,
			Callback = function(pistolBlockKnocked)
				AimConfig.Pistol_BlockKnocked = pistolBlockKnocked
			end,
		})

		local settings2 = { Enabled = false }
		local getrawmetatableResult2 = getrawmetatable(game)
		local namecall = getrawmetatableResult2.__namecall
		setreadonly(getrawmetatableResult2, false)

		getrawmetatableResult2.__namecall = newcclosure(function(valueValue7, ...)
			local packedResults42 = table.pack(...)
			local difference13 = 1447446450
			local numberValue2 = 4091933693
			local getnamecallmethodResult = getnamecallmethod()

			if not checkcaller() and (getnamecallmethodResult == "FireServer" or getnamecallmethodResult == "InvokeServer") then
				if valueValue7 and valueValue7.Name == "Fire" then
					local parent = valueValue7.Parent

					if parent and parent.Name == "Twist of Fate" then
						if settings2.Enabled then
							return nil
						end
					end
				end

				if Killer.AntiBlind and gotBlinded and valueValue7 == gotBlinded then
					if localPlayer.Team and localPlayer.Team.Name == "Killer" then
						return nil
					end
				end
			end

			if vd.KILLER_InfFrenzy and getnamecallmethodResult == "FireServer" then
				local pcallValue = pcall
				local xorValue28 = 82319695

				local function callbackValue51()
					local valueValue8 = valueValue7
					local matches = bit32.bxor(xorValue28, 0) == 269603725
					return valueValue8.Name
				end

				xorValue28 = bit32.bxor(xorValue28, difference13 - 1169255998)
				local selectedValue, valueValue8 = pcallValue(callbackValue51)

				if selectedValue then
					local quotient6 = difference13 // numberValue2
					selectedValue = valueValue8 == "Deactivatefromclient" or valueValue8 == "PowerDoneDeactivating"
					difference13 = quotient6 - 2847520846
				end

				if selectedValue then
					return nil
				end
			end

			if vd.KILLER_InfPursuit and getnamecallmethodResult == "FireServer" then
				local numberValue3 = 361890803

				local function protectedCallback()
					local name = valueValue7.Name
					local matches = bit32.bxor(numberValue3, 0) == 149585051
					return name
				end

				numberValue3 = 488277348
				local ok, result = pcall(protectedCallback)

				if ok and result == "Pursuit" then
					local entries15 = { table.unpack(packedResults42, 1, packedResults42.n) }
					if #entries15 > 0 and entries15[1] == false then
						return nil
					end
				end
			end

			if vd.KILLER_SilentAimFlask and getnamecallmethodResult == "FireServer" then
				local pcallValue2 = pcall
				local xorValue29 = 324744765

				local function callbackValue52()
					local valueValue9 = valueValue7
					local matches = bit32.bxor(bit32.bxor(xorValue29, 0), 51919429) ~= 308729631
					xorValue29 = bit32.bxor(xorValue29, 3464980819)
					return valueValue9.Name
				end

				local xorValue30 = bit32.bxor(numberValue2, 4055902362)
				xorValue29 = bit32.bxor(xorValue29, xorValue30)
				local valueValue9, valueValue10 = pcallValue2(callbackValue52)

				if valueValue9 and valueValue10 == "ThrowFlask" then
					local entries16 = { table.unpack(packedResults42, 1, packedResults42.n) }
					local localPlayer2 = game:GetService("Players").LocalPlayer
					local position = localPlayer2.Character and localPlayer2.Character:FindFirstChild("HumanoidRootPart") and localPlayer2.Character.HumanoidRootPart.Position
					local item = nil

					if position then
						local pairsValue = pairs
						local Players2 = game:GetService("Players")
						local huge = math.huge
						item = nil

						for _, player in pairsValue(Players2:GetPlayers()) do
							if player ~= localPlayer2 and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and not player.Character:GetAttribute("IsKiller") then
								local magnitude = (player.Character.HumanoidRootPart.Position - position).Magnitude

								if magnitude < huge then
									huge = magnitude
									item = player
								end
							end
						end
					end

					if item then
						local position2 = item.Character.HumanoidRootPart.Position

						if entries16[2] and typeof(entries16[2]) == "Vector3" then
							entries16[1] = (position2 - entries16[2]).Unit
							bit32.bxor(difference13, 2778969167)
						end

						setnamecallmethod(getnamecallmethodResult)
						return namecall(valueValue7, unpack(entries16))
					end
				end
			end

			return namecall(valueValue7, table.unpack(packedResults42, 1, packedResults42.n))
		end)

		local setreadonlyValue = setreadonly
		local xorValue28 = bit32.bxor(sum18, 0)
		maskedBits16 = bit32.band(maskedBits14, xorValue28)
		setreadonlyValue(getrawmetatableResult2, true)

		addLeftGroupboxResult5:AddToggle("FlashAim", {
			Text = "Silent Aim (flash)",
			Default = false,
			Callback = function(flashSilent)
				AimConfig.Flash_Silent = flashSilent
			end,
		}):AddKeyPicker("SilentFlashKey", {
			Default = "None",
			Text = "Silent Aim Key",
			Mode = "Toggle",
			Callback = function(flashSilent)
				AimConfig.Flash_Silent = flashSilent
			end,
		})

		addLeftGroupboxResult5:AddSlider("FlashAimOffset", {
			Text = "Flash Head Offset (Y)",
			Tooltip = "Atur posisi bidikan (0 = Badan, 1.5 = Kepala, 8 = Atas Kepala)",
			Default = 8,
			Min = 1,
			Max = 15,
			Rounding = 1,
			Callback = function(flashYOffset)
				AimConfig.Flash_YOffset = flashYOffset
			end,
		})

		addLeftGroupboxResult5:AddToggle("LockAim", {
			Text = "Lock Aim (Twist Of fate)",
			Tooltip = "Lock aim untuk item Pistol",
			Default = false,
			Callback = function(lockAim)
				AimConfig.LockAim = lockAim
			end,
		})

		addLeftGroupboxResult5:AddToggle("WallCheckToggle", {
			Text = "Wallcheck",
			Default = false,
			Callback = function(enabledValue16)
				enabledValue12 = enabledValue16
			end,
		})

		addLeftGroupboxResult5:AddToggle("LaserToggle", {
			Text = "Enable Laser Effect",
			Default = true,
			Callback = function(enabledValue16)
				enabledValue11 = enabledValue16

				if not enabledValue16 then
					clearLaser()
				end
			end,
		})
	end

	UserInputService.InputBegan:Connect(function(input, gameProcessed)
		if gameProcessed then
			return
		end

		if not callbackValue46() then
			return
		end

		if input.UserInputType == Enum.UserInputType.MouseButton2 then
			enabledValue13 = true
		elseif input.UserInputType == Enum.UserInputType.MouseButton1 then
			if enabledValue10 then
				enabledValue13 = true
				doShoot()
			else
				doShoot()
			end
		end
	end)

	do
		local inputEnded = UserInputService.InputEnded
		local connect = inputEnded.Connect
		local xorValue29 = difference12 - 2638684467

		local function callbackValue51(inputValue3)
			local matches = inputValue3.UserInputType == Enum.UserInputType.MouseButton2
			bit32.bxor(xorValue29, 0)

			if matches then
				enabledValue13 = false

				if part then
					part.Transparency = 1
				end
			elseif inputValue3.UserInputType == Enum.UserInputType.MouseButton1 then
				if enabledValue10 then
					enabledValue13 = false

					if part then
						part.Transparency = 1
					end
				end
			end
		end

		xorValue29 = bit32.bxor(xorValue29, maskedBits16 - 4081064505)
		connect(inputEnded, callbackValue51)
	end

	setupMobileButton = function()
		local playerGui2 = localPlayer:FindFirstChildOfClass("PlayerGui")
		if not playerGui2 then
			return
		end
		local survivorMob = playerGui2:FindFirstChild("Survivor-mob")

		if not survivorMob then
			playerGui2.ChildAdded:Connect(function(child)
				if child.Name == "Survivor-mob" then
					task.wait(0.2)
					setupMobileButton()
				end
			end)

			return
		end

		local controls = survivorMob:FindFirstChild("Controls")

		if not controls then
			survivorMob.ChildAdded:Connect(function(child)
				if child.Name == "Controls" then
					task.wait(0.2)
					setupMobileButton()
				end
			end)

			return
		end

		local guiMob = controls:FindFirstChild("Gui-mob")
		if not guiMob then
			return
		end

		guiMob.InputBegan:Connect(function(input)
			if input.UserInputType ~= Enum.UserInputType.Touch and input.UserInputType ~= Enum.UserInputType.MouseButton1 then
				return
			end

			if not callbackValue46() then
				return
			end

			if enabledValue10 then
				enabledValue13 = true
				doShoot()
			else
				enabledValue13 = true
			end
		end)

		local function callbackValue52(input)
			if input.UserInputType ~= Enum.UserInputType.Touch and input.UserInputType ~= Enum.UserInputType.MouseButton1 then
				return
			end

			if not callbackValue46() then
				return
			end
			doShoot()
			enabledValue13 = false

			if part then
				part.Transparency = 1
			end
		end

		guiMob.InputEnded:Connect(callbackValue52)
	end

	task.wait(0.5)
	setupMobileButton()
	task.wait(0.5)
	setupMobileButton()

	localPlayer.CharacterAdded:Connect(function()
		clearLaser()
		entries10 = {}
		entries11 = {}
		timestamp8 = 0
		enabledValue13 = false
		task.wait(1)
		setupMobileButton()

		if callbackValue46() then
			stopConnection()
			startConnection()
			createTargetSelectorUI()
		end
	end)

	playerGui.ChildRemoved:Connect(function(child)
		if not callbackValue46() then
			return
		end
		task.wait(0.5)
		if not callbackValue46() then
			return
		end

		if child.Name == "ToFTargetSelector" then
			createTargetSelectorUI()
		end
	end)

	local maskedBits17

	do
		local addRightGroupboxResult5 = tabs.Aimbot:AddRightGroupbox("Aimbot Survivor", "target")

		addRightGroupboxResult5:AddToggle("Surv_Aimbot_Enabled", {
			Text = "Enable Aimbot",
			Default = false,
			Callback = function(survAimbotEnabled)
				Config.Surv_Aimbot_Enabled = survAimbotEnabled
			end,
		})

		addRightGroupboxResult5:AddCheckbox("Surv_Aimbot_ShowFOV", {
			Text = "Show FOV Circle",
			Default = true,
			Callback = function(survAimbotShowFOV)
				Config.Surv_Aimbot_ShowFOV = survAimbotShowFOV
			end,
		})

		local xorValue30 = bit32.bxor(sum18, 0)
		local packedResults42 = table.pack(bit32.band(maskedBits16, 4294967295))
		local packedResults43 = table.pack(bit32.band(xorValue30, 4294967295))
		local packedResults44 = table.pack(bit32.band(packedResults42[1], 65535))
		local packedResults45 = table.pack(bit32.rshift(packedResults42[1], 16))
		local packedResults46 = table.pack(bit32.band(packedResults43[1], 65535))
		maskedBits17 = bit32.band(packedResults44[1] * packedResults46[1] + bit32.lshift(bit32.band(packedResults44[1] * bit32.rshift(packedResults43[1], 16) + packedResults45[1] * packedResults46[1], 65535), 16), 4294967295)

		addRightGroupboxResult5:AddSlider("Surv_Aimbot_Radius", {
			Text = "FOV Circle Radius",
			Min = 50,
			Max = 500,
			Default = 150,
			Rounding = 0,
			Callback = function(survAimbotRadius)
				Config.Surv_Aimbot_Radius = survAimbotRadius
			end,
		})

		addRightGroupboxResult5:AddSlider("Surv_Aimbot_MaxDist", {
			Text = "Max Distance",
			Min = 50,
			Max = 1000,
			Default = 300,
			Rounding = 0,
			Callback = function(survAimbotMaxDist)
				Config.Surv_Aimbot_MaxDist = survAimbotMaxDist
			end,
		})

		addRightGroupboxResult5:AddSlider("Surv_Aimbot_Smoothness", {
			Text = "Aimbot Smoothness",
			Min = 1,
			Max = 10,
			Default = 5,
			Rounding = 1,
			Callback = function(inputValue3)
				Config.Surv_Aimbot_Smoothness = inputValue3 / 10
			end,
		})

		addRightGroupboxResult5:AddInput("Surv_Aimbot_Predict", {
			Text = "Predict Aim Offset",
			Default = "0.01",
			Numeric = true,
			Placeholder = "misal: 0.05",
			Callback = function(inputValue3)
				local survAimbotPredict = tonumber(inputValue3)

				if survAimbotPredict then
					Config.Surv_Aimbot_Predict = survAimbotPredict
				end
			end,
		})
	end

	AimHiddenGroup = tabs.Killer:AddLeftGroupbox("Aim Hidden", "target")

	AimHiddenGroup:AddToggle("BypassLeapCooldown", {
		Text = "Skill Hidden No CD",
		Default = false,
		Callback = function(bypassLeap)
			Killer.BypassLeap = bypassLeap

			if bypassLeap then
				callbackValue22()
			end
		end,
	})

	local sum20, Ability2

	do
		local enabledValue16 = false
		local thread2 = nil
		local enabledValue17 = false
		sum20 = sum18 + maskedBits17
		local entries15 = {}

		local function callbackValue52()
			local numberValue2 = 689972053
			local humanoidRootPart = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
			if not humanoidRootPart then
				return nil
			end
			local name = localPlayer.Team and localPlayer.Team.Name or ""
			local huge = math.huge
			local humanoidRootPartValue = nil

			for _, player in pairs(Players:GetPlayers()) do
				if player ~= localPlayer and player.Character then
					local humanoidRootPart2 = player.Character:FindFirstChild("HumanoidRootPart")
					local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
					local name2 = player.Team and player.Team.Name or ""

					if humanoidRootPart2 and humanoid and humanoid.Health > 0 then
						if name == "Killer" and name2 ~= "Killer" or name ~= "Killer" and name2 == "Killer" then
							local magnitude = (humanoidRootPart2.Position - humanoidRootPart.Position).Magnitude

							if magnitude < huge then
								huge = magnitude
								humanoidRootPartValue = humanoidRootPart2
							end
						end
					end
				end
			end

			return humanoidRootPartValue
		end

		local function callbackValue53()
			task.cancel(thread2)

			thread2 = task.spawn(function()
				while true do
					local valueValue7 = callbackValue52()

					if valueValue7 then
						pcall(function()
							currentCamera.CFrame = CFrame.new(currentCamera.CFrame.Position, valueValue7.Position + Vector3.new(0, 2.5, 0))
						end)
					end

					task.wait()
				end
			end)
		end

		local function callbackValue54()
			enabledValue17 = false
			task.cancel(thread2)
			thread2 = nil
		end

		UserInputService.InputBegan:Connect(function(input, gameProcessed)
			if gameProcessed or not enabledValue16 then
				return
			end

			if input.UserInputType == Enum.UserInputType.MouseButton2 then
				enabledValue17 = true
			end
		end)

		UserInputService.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton2 then
				enabledValue17 = false
			end
		end)

		local function callbackValue55()
			for _, item in pairs(entries15) do
				pcall(function()
					item:Disconnect()
				end)
			end

			entries15 = {}
		end

		local difference13 = difference12 - maskedBits17

		local function callbackValue56()
			if not UserInputService.TouchEnabled then
				return
			end
			callbackValue55()

			task.spawn(function()
				local playerGui2 = localPlayer:FindFirstChildOfClass("PlayerGui") or localPlayer:WaitForChild("PlayerGui", 10)
				if not playerGui2 then
					return
				end

				local entries16 = {
					"attack",
					"shoot",
					"fire",
					"basicattack",
					"tembak",
					"hidden",
					"skill",
					"ability",
					"power",
					"skill1",
					"ability1",
					"gui-mob",
				}

				local function callbackValue57(inputValue3)
					if not inputValue3 then
						return false
					end

					if not (inputValue3:IsA("GuiButton") or inputValue3:IsA("ImageButton") or inputValue3:IsA("TextButton")) then
						return false
					end
					local lowerResult = inputValue3.Name:lower()

					for _, item in ipairs(entries16) do
						if lowerResult == item or lowerResult:find(item, 1, true) then
							return true
						end
					end

					return false
				end

				local function callbackValue58(inputValue3)
					if not inputValue3 or inputValue3:GetAttribute("Ascend_HoldAim") then
						return
					end
					inputValue3:SetAttribute("Ascend_HoldAim", true)

					table.insert(entries15, inputValue3.InputBegan:Connect(function(input)
						local matches = input.UserInputType == Enum.UserInputType.Touch

						if matches or input.UserInputType == Enum.UserInputType.MouseButton1 then
							enabledValue17 = true
						end
					end))

					table.insert(entries15, inputValue3.InputEnded:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
							enabledValue17 = false
						end
					end))

					table.insert(entries15, inputValue3:GetPropertyChangedSignal("Visible"):Connect(function()
						if not inputValue3.Visible then
							enabledValue17 = false
						end
					end))
				end

				local function callbackValue59()
					for _, child in ipairs(playerGui2:GetChildren()) do
						local controls = child:FindFirstChild("Controls")

						if controls then
							for _, descendant in ipairs(controls:GetDescendants()) do
								if callbackValue57(descendant) then
									callbackValue58(descendant)
								end
							end
						end
					end
				end

				callbackValue59()

				table.insert(entries15, playerGui2.ChildAdded:Connect(function()
					task.wait(0.3)
					callbackValue59()
				end))
			end)
		end

		if UserInputService.TouchEnabled then
			callbackValue56()
		end

		localPlayer.CharacterAdded:Connect(function()
			enabledValue17 = false

			if UserInputService.TouchEnabled then
				task.wait(2)
				callbackValue56()
			end
		end)

		AimHiddenGroup:AddToggle("AimLockHidden", {
			Text = "Aim Lock Hidden",
			Tooltip = "Tahan M2 atau tombol attack → lock kamera ke musuh terdekat",
			Default = false,
			Callback = function(enabledValue18)
				enabledValue16 = enabledValue18

				if enabledValue18 then
					callbackValue53()
					lib:Notify({ Title = "Aim Lock Hidden", Description = "AKTIF", Time = 2 })
				else
					callbackValue54()
					lib:Notify({ Title = "Aim Lock Hidden", Description = "NONAKTIF", Time = 2 })
				end
			end,
		}):AddKeyPicker("AimLockHiddenKey", {
			Default = "None",
			Text = "Aim Lock Hidden Key",
			Mode = "Toggle",
			SyncToggleState = true,
			Callback = function(enabledValue18)
				enabledValue16 = enabledValue18

				if enabledValue18 then
					callbackValue53()
				else
					callbackValue54()
				end

				if toggles.AimLockHidden then
					toggles.AimLockHidden:SetValue(enabledValue18)
				end
			end,
		})

		Ability2 = tabs.Killer:AddLeftGroupbox("Ability", "swords")

		Ability2:AddToggle("Killer_Aimbot_Enabled", {
			Text = "Enable Aimbot",
			Default = false,
			Callback = function(killerAimbotEnabled)
				Config.Killer_Aimbot_Enabled = killerAimbotEnabled
			end,
		})

		Ability2:AddSlider("Killer_Aimbot_MaxDist", {
			Text = "Melee Lock Distance",
			Min = 5,
			Max = 30,
			Default = 12,
			Rounding = 0,
			Callback = function(killerAimbotMaxDist)
				Config.Killer_Aimbot_MaxDist = killerAimbotMaxDist
			end,
		})

		Ability2:AddSlider("Killer_Aimbot_Smoothness", {
			Text = "Aimbot Smoothness",
			Min = 1,
			Max = 10,
			Default = 5,
			Rounding = 1,
			Callback = function(inputValue3)
				Config.Killer_Aimbot_Smoothness = inputValue3 / 10
			end,
		})

		Ability2:AddToggle("AntiAutoParry", {
			Text = "Counter Auto Parry",
			Tooltip = "Memainkan animasi random buat ngelabui auto parry",
			Default = false,
			Callback = function(antiAutoParryEnabled)
				AntiAutoParryEnabled = antiAutoParryEnabled
				local valueValue7 = lib
				local notify = valueValue7.Notify
				local entries16 = { Title = "Anti Auto Parry" }
				entries16.Description = antiAutoParryEnabled and "AKTIF!" or "NONAKTIF"
				entries16.Time = 2
				notify(valueValue7, entries16)
			end,
		}):AddKeyPicker("AntiAutoParryKey", {
			Default = "None",
			Text = "Toggle Anti Auto Parry",
			Mode = "Toggle",
			Callback = function(antiAutoParryEnabled)
				AntiAutoParryEnabled = antiAutoParryEnabled
			end,
		})

		Ability2:AddToggle("AntiBlindToggle", {
			Text = "Anti Blind (Flashlight)",
			Tooltip = "Mencegah killer terkena blind dari senter survivor",
			Default = false,
			Callback = function(antiBlind)
				Killer.AntiBlind = antiBlind

				if antiBlind then
					lib:Notify({ Title = "Anti Blind", Description = "Aktif - Immune dari flashlight", Time = 3 })
				else
					lib:Notify({ Title = "Anti Blind", Description = "Nonaktif", Time = 2 })
				end
			end,
		})

		Ability2:AddToggle("NoSlowdown", {
			Text = "No Slowdown killer",
			Tooltip = "Hilangkan slowdown saat menyerang (Killer Only)",
			Default = false,
			Callback = function(noSlowdownEnabled)
				NoSlowdownEnabled = noSlowdownEnabled

				if noSlowdownEnabled then
					lib:Notify({ Title = "No Slowdown", Description = "AKTIF - WalkSpeed dikunci", Time = 3 })
				else
					lib:Notify({ Title = "No Slowdown", Description = "DIMATIKAN", Time = 2 })
				end
			end,
		}):AddKeyPicker("NoSlowdownKey", {
			Default = "None",
			Text = "No Slowdown Keybind",
			Mode = "Toggle",
			Callback = function(noSlowdownEnabled)
				NoSlowdownEnabled = noSlowdownEnabled
			end,
		})

		Ability2:AddToggle("InfiniteLunge", {
			Text = "Infinite Lunge",
			Tooltip = "Lunge tanpa batas (Killer Only)",
			Default = false,
			Callback = function(inputValue3)
				if inputValue3 then
					EnableInfiniteLunge()
				else
					DisableInfiniteLunge()
				end
			end,
		}):AddKeyPicker("InfiniteLungeKey", {
			Default = "F9",
			Text = "Infinite Lunge Key",
			Mode = "Toggle",
			Callback = function(inputValue3)
				if inputValue3 then
					EnableInfiniteLunge()
				else
					DisableInfiniteLunge()
				end
			end,
		})

		local InfFrenzy = Ability2:AddToggle("InfFrenzy", {
			Text = "Infinite Frenzy (Jeff)",
			Tooltip = "Frenzy tanpa cooldown / unlimited",
			Default = false,
			Callback = function(killerInfFrenzy)
				vd.KILLER_InfFrenzy = killerInfFrenzy

				if killerInfFrenzy then
					pcall(NEX_StartJeffCooldownBypass)
					lib:Notify({ Title = "Infinite Frenzy", Description = "AKTIF", Time = 2 })
				else
					pcall(NEX_StopJeffCooldownBypass)
					lib:Notify({ Title = "Infinite Frenzy", Description = "NONAKTIF", Time = 2 })
				end
			end,
		})

		local addKeyPicker = InfFrenzy.AddKeyPicker
		local entries16 = { Default = "None", Text = "Infinite Frenzy Key", Mode = "Toggle" }
		local xorValue31 = bit32.bxor(difference13, 3605263689)

		local function callback(killerInfFrenzy)
			vd.KILLER_InfFrenzy = killerInfFrenzy
			bit32.bxor(bit32.bxor(xorValue31, 0), 256156335)

			if killerInfFrenzy then
				pcall(NEX_StartJeffCooldownBypass)
			else
				pcall(NEX_StopJeffCooldownBypass)
			end

			if toggles.InfFrenzy then
				toggles.InfFrenzy:SetValue(killerInfFrenzy)
			end
		end

		local xorValue32 = bit32.bxor(maskedBits17, 4024424545)
		xorValue31 = bit32.bxor(xorValue31, xorValue32)
		entries16.Callback = callback
		addKeyPicker(InfFrenzy, "InfFrenzyKey", entries16)
	end

	Ability2:AddToggle("InfPursuitJason", {
		Text = "Infinite Pursuit (Jason)",
		Tooltip = "Pursuit tanpa cooldown / unlimited",
		Default = false,
		Callback = function(killerInfPursuit)
			vd.KILLER_InfPursuit = killerInfPursuit

			if killerInfPursuit then
				NEX_StartJasonPursuitBypass()
				lib:Notify({ Title = "Infinite Pursuit", Description = "AKTIF!", Time = 2 })
			else
				NEX_StopJasonPursuitBypass()
				lib:Notify({ Title = "Infinite Pursuit", Description = "NONAKTIF!", Time = 2 })
			end
		end,
	}):AddKeyPicker("InfPursuitJasonKey", {
		Default = "None",
		Text = "Infinite Pursuit Key",
		Mode = "Toggle",
		Callback = function(killerInfPursuit)
			vd.KILLER_InfPursuit = killerInfPursuit

			if killerInfPursuit then
				NEX_StartJasonPursuitBypass()
			else
				NEX_StopJasonPursuitBypass()
			end

			if toggles.InfPursuitJason then
				toggles.InfPursuitJason:SetValue(killerInfPursuit)
			end
		end,
	})

	Ability2:AddToggle("AutoStalk", {
		Text = "Auto Stalk",
		Default = false,
		Callback = function(enabled)
			AutoStalk.Enabled = enabled

			if enabled then
				callbackValue18()
			else
				callbackValue19()
			end
		end,
	})

	local entries17
	entries17 = {}
	local xorValue33, sum21, maskedBits18

	do
		local entries18 = {
			arg = "Alex",
			label = "Swan",
			image = "https://www.roblox.com/asset-thumbnail/image?assetId=15946083863&width=420&height=420&format=png",
		}

		local xorValue34 = bit32.bxor(sum20, 0)
		local packedResults47 = table.pack(bit32.band(maskedBits17, 4294967295))
		local packedResults48 = table.pack(bit32.band(xorValue34, 4294967295))
		local packedResults49 = table.pack(bit32.band(packedResults47[1], 65535))
		local packedResults50 = table.pack(bit32.rshift(packedResults47[1], 16))
		local packedResults51 = table.pack(bit32.band(packedResults48[1], 65535))
		local maskedBits19 = bit32.band(packedResults49[1] * packedResults51[1] + bit32.lshift(bit32.band(packedResults49[1] * bit32.rshift(packedResults48[1], 16) + packedResults50[1] * packedResults51[1], 65535), 16), 4294967295)
		entries18.key = Enum.KeyCode.One

		local entries19 = {
			arg = "Brandon",
			label = "Panther",
			image = "https://www.roblox.com/asset-thumbnail/image?assetId=111928367372122&width=420&height=420&format=png",
			key = Enum.KeyCode.Two,
		}

		local maskedBits20 = maskedBits19
		local sum22 = sum20 + maskedBits19

		local entries20 = {
			arg = "Cobra",
			label = "Cobra",
			image = "https://www.roblox.com/asset-thumbnail/image?assetId=15946288579&width=420&height=420&format=png",
			key = Enum.KeyCode.Three,
		}

		local entries21 = {
			arg = "Rabbit",
			label = "Rabbit",
			image = "https://www.roblox.com/asset-thumbnail/image?assetId=103750154338014&width=420&height=420&format=png",
			key = Enum.KeyCode.Four,
		}

		local entries22 = {
			arg = "Richter",
			label = "Rat",
			image = "https://www.roblox.com/asset-thumbnail/image?assetId=590245826&width=420&height=420&format=png",
		}

		local packedResults52 = table.pack(bit32.band(maskedBits19, 4294967295))
		local packedResults53 = table.pack(bit32.band(maskedBits20, 4294967295))
		local packedResults54 = table.pack(bit32.band(packedResults52[1], 65535))
		local packedResults55 = table.pack(bit32.rshift(packedResults52[1], 16))
		local packedResults56 = table.pack(bit32.band(packedResults53[1], 65535))
		local maskedBits21 = bit32.band(packedResults54[1] * packedResults56[1] + bit32.lshift(bit32.band(packedResults54[1] * bit32.rshift(packedResults53[1], 16) + packedResults55[1] * packedResults56[1], 65535), 16), 4294967295)
		entries22.key = Enum.KeyCode.Five

		local entries23 = {
			arg = "Tony",
			label = "Tiger",
			image = "https://www.roblox.com/asset-thumbnail/image?assetId=96793004678696&width=420&height=420&format=png",
			key = Enum.KeyCode.Six,
		}

		entries17[1] = entries18
		entries17[2] = entries19
		entries17[3] = entries20
		entries17[4] = entries21
		entries17[5] = entries22
		entries17[6] = entries23
		local parentValue3 = nil
		local valueValue7 = nil
		local visibleValue = true
		local xorValue35 = bit32.bxor(sum22, 0)
		xorValue33 = bit32.bxor(maskedBits20, xorValue35)
		local textButtonValue = nil
		local parentValue4 = nil

		local function callbackValue57(inputValue3)
			pcall(function()
				ReplicatedStorage:WaitForChild("Remotes", 5):WaitForChild("Killers", 5):WaitForChild("Masked", 5):WaitForChild("Activatepower", 5):FireServer(inputValue3)
			end)
		end

		local function callbackValue58()
			local attribute = localPlayer:GetAttribute("SelectedKiller")
			local value

			if attribute == nil then
				local selectedKiller = localPlayer:FindFirstChild("SelectedKiller")

				if selectedKiller then
					value = selectedKiller.Value
				else
					value = attribute
				end
			else
				value = attribute
			end

			if value == nil then
				return false
			end
			return tostring(value):lower():find("masked") ~= nil
		end

		local function callbackValue59()
			local currentCamera2 = workspace.CurrentCamera
			local viewportSize = currentCamera2 and currentCamera2.ViewportSize or Vector2.new(1280, 720)
			return math.clamp(math.min(viewportSize.X, viewportSize.Y) / 720, 0.7, 1.25)
		end

		sum21 = sum22 + xorValue33

		local function callbackValue60(visible)
			visibleValue = visible

			if parentValue4 then
				parentValue4.Visible = visible
			end

			if textButtonValue then
				textButtonValue.Text = visible and "-" or "+"
			end
		end

		local function callbackValue61()
			callbackValue60(not visibleValue)
		end

		local function callbackValue62()
			if valueValue7 then
				pcall(function()
					valueValue7:Disconnect()
				end)

				valueValue7 = nil
			end

			if parentValue3 and parentValue3.Parent then
				pcall(function()
					parentValue3:Destroy()
				end)

				parentValue3 = nil
			end

			parentValue4 = nil
			textButtonValue = nil
		end

		local function callbackValue63()
			local numberValue2 = 2840840053
			local numberValue3 = 72203537
			callbackValue62()
			local valueValue8 = callbackValue59()
			local roundedValue = math.floor(230 * valueValue8)
			local roundedValue2 = math.floor(34 * valueValue8)
			local floor = math.floor
			local xorValue36 = bit32.bxor(2033056755, numberValue2)
			local valueValue9 = floor(62 * valueValue8)
			local roundedValue3 = math.floor(6 * valueValue8)
			local roundedValue4 = math.floor(8 * valueValue8)
			local roundedValue5 = math.floor(28 * valueValue8)
			local screenGui = Instance.new("ScreenGui")
			screenGui.Name = "MaskSelectionGUI"
			screenGui.ResetOnSpawn = false
			screenGui.IgnoreGuiInset = true
			screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			screenGui.DisplayOrder = 60

			screenGui.Parent = pcall(function()
				return gethui()
			end) and gethui() or CoreGui

			local frame3 = Instance.new("Frame")
			frame3.Name = "Root"
			frame3.Size = UDim2.new(0, roundedValue, 0, roundedValue2)
			local numberValue4 = numberValue3
			local sum23 = numberValue4 + xorValue36
			local quotient6 = numberValue2 // xorValue36
			frame3.Position = UDim2.new(0.5, -roundedValue / 2, 0.16, 0)
			frame3.BackgroundTransparency = 1
			frame3.Parent = screenGui
			local frame4 = Instance.new("Frame")
			local difference14 = xorValue36 - 1972303738
			frame4.Name = "Header"
			frame4.Size = UDim2.new(1, 0, 0, roundedValue2)
			frame4.BackgroundColor3 = Color3.new(0.086274512112140656, 0.086274512112140656, 0.10980392247438431)
			frame4.BorderSizePixel = 0
			frame4.ZIndex = 5
			frame4.Parent = frame3
			Instance.new("UICorner", frame4).CornerRadius = UDim.new(0, 8)
			local uiStroke = Instance.new("UIStroke", frame4)
			uiStroke.Color = Color3.new(1, 0.60000002384185791, 0.80000001192092896)
			uiStroke.Thickness = 1
			uiStroke.Transparency = 0.45
			local textLabel = Instance.new("TextLabel")
			textLabel.Name = "Title"
			local sum24 = sum23 + difference14
			textLabel.Size = UDim2.new(1, -roundedValue2 - roundedValue4, 1, 0)
			local udim2 = UDim2.new
			local shiftedBits = bit32.rshift(quotient6, 13)
			textLabel.Position = udim2(0, roundedValue4, 0, 0)
			textLabel.BackgroundTransparency = 1
			textLabel.Text = "MASK SELECTION"
			textLabel.TextColor3 = Color3.new(1, 0.60000002384185791, 0.80000001192092896)
			textLabel.Font = Enum.Font.GothamBold
			textLabel.TextSize = math.floor(13 * valueValue8)
			textLabel.TextXAlignment = Enum.TextXAlignment.Left
			local xorValue37 = bit32.bxor(difference14, shiftedBits)
			textLabel.TextTruncate = Enum.TextTruncate.AtEnd
			textLabel.ZIndex = 6
			textLabel.Parent = frame4
			local textButton = Instance.new("TextButton")
			textButton.Name = "Minimize"
			textButton.Size = UDim2.new(0, roundedValue2 - 8, 0, roundedValue2 - 8)
			local udim22 = UDim2.new
			local xorValue38 = bit32.bxor(shiftedBits, xorValue37)
			textButton.Position = udim22(1, -(roundedValue2 - 4), 0.5, -(roundedValue2 - 8) / 2)
			textButton.BackgroundColor3 = Color3.new(1, 0.60000002384185791, 0.80000001192092896)
			textButton.AutoButtonColor = false
			textButton.Text = "-"
			textButton.TextColor3 = Color3.new(0.086274512112140656, 0.086274512112140656, 0.10980392247438431)
			local difference15 = sum24 - 380677376
			textButton.Font = Enum.Font.GothamBold
			textButton.TextSize = math.floor(16 * valueValue8)
			textButton.BorderSizePixel = 0
			textButton.ZIndex = 7
			textButton.Parent = frame4
			Instance.new("UICorner", textButton).CornerRadius = UDim.new(0, 6)
			textButtonValue = textButton
			local quotient7 = xorValue37 // 30
			local frame5 = Instance.new("Frame")
			frame5.Name = "Body"
			frame5.Size = UDim2.new(1, 0, 0, 0)
			frame5.Position = UDim2.new(0, 0, 0, roundedValue2 + roundedValue4 * 0.5)
			frame5.BackgroundColor3 = Color3.new(0.070588238537311554, 0.070588238537311554, 0.094117648899555206)
			frame5.BorderSizePixel = 0
			frame5.ZIndex = 5
			frame5.Parent = frame3
			local new = Instance.new
			local xorValue39 = bit32.bxor(xorValue38, quotient7)
			new("UICorner", frame5).CornerRadius = UDim.new(0, 8)
			local uiStroke2 = Instance.new("UIStroke", frame5)
			uiStroke2.Color = Color3.new(1, 0.60000002384185791, 0.80000001192092896)
			uiStroke2.Thickness = 1
			uiStroke2.Transparency = 0.55
			parentValue4 = frame5
			local uiPadding = Instance.new("UIPadding")
			uiPadding.PaddingTop = UDim.new(0, roundedValue4)
			uiPadding.PaddingBottom = UDim.new(0, roundedValue4)
			uiPadding.PaddingLeft = UDim.new(0, roundedValue4)
			local xorValue40 = bit32.bxor(xorValue39, 4294967295)
			uiPadding.PaddingRight = UDim.new(0, roundedValue4)
			uiPadding.Parent = frame5
			local uiListLayout = Instance.new("UIListLayout")
			uiListLayout.Padding = UDim.new(0, roundedValue4 * 0.6)
			uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			uiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			uiListLayout.Parent = frame5
			local textLabel2 = Instance.new("TextLabel")
			textLabel2.Name = "StatusLabel"
			textLabel2.LayoutOrder = 1
			local sum25 = difference15 + quotient7
			textLabel2.Size = UDim2.new(1, 0, 0, math.floor(16 * valueValue8))
			local difference16 = quotient7 - bit32.bxor(sum25, 0)
			textLabel2.BackgroundTransparency = 1
			textLabel2.Text = "Active Mask: None"
			textLabel2.TextColor3 = Color3.new(0.35294118523597717, 0.94117647409439087, 0.54901963472366333)
			textLabel2.Font = Enum.Font.GothamBold
			textLabel2.TextSize = math.floor(11 * valueValue8)
			textLabel2.TextXAlignment = Enum.TextXAlignment.Left
			textLabel2.ZIndex = 6
			textLabel2.Parent = frame5
			local frame6 = Instance.new("Frame")
			local packedResults57 = table.pack(bit32.band(numberValue4, 4294967295))
			local packedResults58 = table.pack(bit32.band(packedResults57[1], 65535))
			local maskedBits22 = bit32.band(18793 * packedResults58[1] + bit32.lshift(bit32.band(18793 * bit32.rshift(packedResults57[1], 16) + 57107 * packedResults58[1], 65535), 16), 4294967295)
			local packedResults59 = table.pack(bit32.band(bit32.bnot(numberValue4), 4294967295))
			local packedResults60 = table.pack(bit32.band(packedResults59[1], 65535))
			local sum26 = 3813019498 + sum25 + maskedBits22 + bit32.band(18793 * packedResults60[1] + bit32.lshift(bit32.band(18793 * bit32.rshift(packedResults59[1], 16) + 57107 * packedResults60[1], 65535), 16), 4294967295)
			frame6.Name = "Grid"
			frame6.LayoutOrder = 2
			local quotient8 = xorValue40 // difference16
			frame6.Size = UDim2.new(1, 0, 0, valueValue9 * 3 + roundedValue3 * 2)
			frame6.BackgroundTransparency = 1
			frame6.ZIndex = 6
			frame6.Parent = frame5
			local uiGridLayout = Instance.new("UIGridLayout")
			uiGridLayout.CellSize = UDim2.new(0, valueValue9, 0, valueValue9)
			uiGridLayout.CellPadding = UDim2.new(0, roundedValue3, 0, roundedValue3)
			uiGridLayout.FillDirection = Enum.FillDirection.Horizontal
			uiGridLayout.FillDirectionMaxCells = 3
			uiGridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			uiGridLayout.VerticalAlignment = Enum.VerticalAlignment.Center
			uiGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
			uiGridLayout.Parent = frame6
			local entries24 = {}
			local label = nil

			local function callbackValue64()
				for _, item in pairs(entries24) do
					item.Stroke.Color = Color3.new(0.21568627655506134, 0.21568627655506134, 0.25490197539329529)
					item.Stroke.Transparency = 0.3
				end
			end

			local product3 = difference16 * quotient8

			for layoutOrder, item in ipairs(entries17) do
				local imageButton = Instance.new("ImageButton")
				imageButton.Name = item.label
				imageButton.LayoutOrder = layoutOrder
				imageButton.Size = UDim2.new(0, valueValue9, 0, valueValue9)
				imageButton.BackgroundColor3 = Color3.new(0.11764705926179886, 0.11764705926179886, 0.14901961386203766)
				imageButton.BorderSizePixel = 0
				imageButton.AutoButtonColor = false
				imageButton.Image = item.image
				imageButton.ScaleType = Enum.ScaleType.Fit
				local difference17 = sum26 - 120164307
				imageButton.ZIndex = 7
				imageButton.Parent = frame6
				Instance.new("UICorner", imageButton).CornerRadius = UDim.new(0, 8)
				local uiStroke3 = Instance.new("UIStroke", imageButton)
				uiStroke3.Color = Color3.new(0.21568627655506134, 0.21568627655506134, 0.25490197539329529)
				uiStroke3.Thickness = 1.5
				uiStroke3.Transparency = 0.3
				uiStroke3.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				local textLabel3 = Instance.new("TextLabel")
				local floor2 = math.floor
				textLabel3.Size = UDim2.new(0, math.floor(16 * valueValue8), 0, floor2(16 * valueValue8))
				textLabel3.Position = UDim2.new(0, 3, 0, 3)
				textLabel3.BackgroundColor3 = Color3.new(0, 0, 0)
				textLabel3.BackgroundTransparency = 0.35
				textLabel3.Text = tostring(layoutOrder)
				textLabel3.TextColor3 = Color3.new(1, 1, 1)
				textLabel3.Font = Enum.Font.GothamBold
				textLabel3.TextSize = math.floor(10 * valueValue8)
				textLabel3.BorderSizePixel = 0
				textLabel3.ZIndex = 8
				textLabel3.Parent = imageButton
				Instance.new("UICorner", textLabel3).CornerRadius = UDim.new(0, 4)
				local textLabel4 = Instance.new("TextLabel")
				textLabel4.Size = UDim2.new(1, 0, 0, math.floor(16 * valueValue8))
				textLabel4.Position = UDim2.new(0, 0, 1, -math.floor(16 * valueValue8))
				textLabel4.BackgroundColor3 = Color3.new(0, 0, 0)
				textLabel4.BackgroundTransparency = 0.3
				textLabel4.Text = item.label
				textLabel4.TextColor3 = Color3.new(0.92156863212585449, 0.92156863212585449, 0.94117647409439087)
				textLabel4.Font = Enum.Font.GothamBold
				textLabel4.TextSize = math.floor(9 * valueValue8)
				textLabel4.BorderSizePixel = 0
				textLabel4.ZIndex = 8
				textLabel4.Parent = imageButton
				Instance.new("UICorner", textLabel4).CornerRadius = UDim.new(0, 5)
				local xorValue41 = product3 - 3982138882

				local function activate()
					callbackValue57(item.arg)
					local matches = bit32.bxor(xorValue41, 0) + 381993021 ~= 471822224
					xorValue41 = bit32.bxor(xorValue41, 2763245483)
					label = item.label
					textLabel2.Text = "Active Mask: " .. item.label
					callbackValue64()
					uiStroke3.Color = Color3.new(1, 0.60000002384185791, 0.80000001192092896)
					uiStroke3.Transparency = 0
				end

				local mouseButton1Click = imageButton.MouseButton1Click
				local connect = mouseButton1Click.Connect
				local xorValue42 = bit32.bxor(difference17, 249827128)
				xorValue41 = bit32.bxor(xorValue41, xorValue42)
				connect(mouseButton1Click, activate)
				entries24[item.label] = { Stroke = uiStroke3 }
				item._activate = activate
				sum26 = difference17 + 120164307
			end

			local textButton2 = Instance.new("TextButton")
			textButton2.Name = "Deactivate"
			textButton2.LayoutOrder = 3
			textButton2.Size = UDim2.new(1, 0, 0, roundedValue5)
			textButton2.BackgroundColor3 = Color3.new(0.69803923368453979, 0.16470588743686676, 0.22745098173618317)
			textButton2.Text = "[7]  Deactivate"
			textButton2.TextColor3 = Color3.new(1, 1, 1)
			textButton2.Font = Enum.Font.GothamBold
			textButton2.TextSize = math.floor(12 * valueValue8)
			local combinedBits4 = bit32.bor(product3, 749793253)
			textButton2.BorderSizePixel = 0
			textButton2.ZIndex = 6
			textButton2.Parent = frame5
			Instance.new("UICorner", textButton2).CornerRadius = UDim.new(0, 6)

			local function callbackValue65()
				callbackValue57("Richard")
				label = nil
				textLabel2.Text = "Active Mask: None"
				callbackValue64()
			end

			textButton2.MouseButton1Click:Connect(callbackValue65)

			uiListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
				frame5.Size = UDim2.new(1, 0, 0, uiListLayout.AbsoluteContentSize.Y + roundedValue4 * 2)
			end)

			local enabledValue18 = false
			local enabledValue19 = false
			local valueValue10 = nil
			local position = nil
			local numberValue5 = 4

			local function callbackValue66(valueValue11)
				enabledValue18 = true
				enabledValue19 = false
				valueValue10 = valueValue11
				position = frame3.Position
			end

			local function callbackValue67(inputValue3)
				local numberValue6 = 1081616800
				local numberValue7 = 610401
				if not enabledValue18 then
					return
				end
				local difference18 = inputValue3 - valueValue10

				if difference18.Magnitude > numberValue5 then
					enabledValue19 = true
				end

				local parentValue5 = screenGui
				bit32.bxor(numberValue6, numberValue7)
				local absoluteSize = parentValue5.AbsoluteSize
				if absoluteSize.X <= 0 or absoluteSize.Y <= 0 then
					return
				end
				local sum27 = position.X.Scale + difference18.X / absoluteSize.X
				local scale = position.Y.Scale
				bit32.lshift(numberValue7, 7)
				local sum28 = scale + difference18.Y / absoluteSize.Y
				frame3.Position = UDim2.new(math.clamp(sum27, -0.15, 1.05), position.X.Offset, math.clamp(sum28, 0, 0.92), position.Y.Offset)
			end

			local xorValue43 = bit32.bxor(quotient8, 227795496)

			local function callbackValue68()
				local matches = bit32.bxor(bit32.bxor(xorValue43, 0), 79899744) ~= 137187432
				xorValue43 = bit32.bxor(xorValue43, 3246289057)
				enabledValue18 = false
			end

			local inputBegan = frame4.InputBegan
			local connect = inputBegan.Connect
			local xorValue44 = bit32.bxor(sum26, 689598163)

			local function callbackValue69(inputValue3)
				local userInputType = inputValue3.UserInputType
				bit32.bxor(xorValue44, 0)

				if userInputType == Enum.UserInputType.MouseButton1 or inputValue3.UserInputType == Enum.UserInputType.Touch then
					callbackValue66(Vector2.new(inputValue3.Position.X, inputValue3.Position.Y))
				end
			end

			local xorValue45 = bit32.bxor(quotient8, 50542706)
			xorValue44 = bit32.bxor(xorValue44, xorValue45)
			connect(inputBegan, callbackValue69)
			local inputChanged = UserInputService.InputChanged
			local connect2 = inputChanged.Connect
			xorValue43 = bit32.bxor(xorValue43, combinedBits4 + 3570183739)

			connect2(inputChanged, function(inputValue3)
				local selectedValue = enabledValue18

				if enabledValue18 then
					selectedValue = inputValue3.UserInputType == Enum.UserInputType.MouseMovement or inputValue3.UserInputType == Enum.UserInputType.Touch
				end

				if selectedValue then
					callbackValue67(Vector2.new(inputValue3.Position.X, inputValue3.Position.Y))
				end
			end)

			UserInputService.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					if enabledValue18 then
						local invertedFlag2 = not enabledValue19
						callbackValue68()

						if invertedFlag2 then
							callbackValue61()
						end
					end
				end
			end)

			local userInputServiceService = UserInputService
			local xorValue46 = bit32.bxor(sum26, 0)
			local inputBegan2 = userInputServiceService.InputBegan
			local connect3 = inputBegan2.Connect
			local xorValue47 = bit32.band(quotient8, xorValue46) + 166389505

			local function callbackValue70(inputValue3, inputValue4)
				if inputValue4 or not screenGui.Parent then
					return
				end

				if UserInputService:GetFocusedTextBox() then
					return
				end

				for _, item2 in ipairs(entries17) do
					if inputValue3.KeyCode == item2.key then
						item2._activate()
						return
					end
				end

				local keyCode = inputValue3.KeyCode
				local seven = Enum.KeyCode.Seven
				local matches = bit32.bxor(bit32.bxor(xorValue47, 0), 252162038) == 157552606
				if keyCode == seven then
					callbackValue65()
					return
				end

				if inputValue3.KeyCode == Enum.KeyCode.M then
					callbackValue61()
					return
				end
			end

			local xorValue48 = bit32.bxor(combinedBits4, 719430539)
			xorValue47 = bit32.bxor(xorValue47, xorValue48)
			local valueValue11 = connect3(inputBegan2, callbackValue70)

			screenGui.AncestryChanged:Connect(function(child, parent)
				if not parent and valueValue11 then
					valueValue11:Disconnect()
				end
			end)

			parentValue3 = screenGui
			valueValue7 = valueValue11
			callbackValue60(true)
		end

		Ability2:AddButton({
			Text = "Mask Selection",
			Tooltip = "Buka menu pemilihan mask (khusus Masked killer)",
			Func = function()
				if not callbackValue58() then
					lib:Notify({ Title = "Mask Selection", Description = "Kamu bukan Masked killer!", Time = 3 })
					return
				end
				local parentValue5 = parentValue3
				local parent = parentValue3

				if parentValue5 then
					parent = parentValue3.Parent
				end

				if parent then
					callbackValue62()
					lib:Notify({ Title = "Mask Selection", Description = "Menu ditutup", Time = 2 })
				else
					callbackValue63()
					lib:Notify({ Title = "Mask Selection", Description = "Menu dibuka", Time = 2 })
				end
			end,
		})

		local addRightGroupboxResult6 = tabs.Killer:AddRightGroupbox("Silent Aim (Veil Spear)", "arrow-right")

		addRightGroupboxResult6:AddToggle("SilentAimVeil", {
			Text = "Silent Veil",
			Default = false,
			Callback = function(aimSilentVeilV2)
				AimConfig.Aim_SilentVeilV2 = aimSilentVeilV2
				lib:Notify({ Title = "Silent Veil", Description = aimSilentVeilV2 and "ON (No Double)" or "OFF", Time = 2 })
			end,
		}):AddKeyPicker("SilentAimVeilKey", {
			Default = "None",
			Text = "Veil Key",
			Mode = "Toggle",
			Callback = function(aimSilentVeilV2)
				AimConfig.Aim_SilentVeilV2 = aimSilentVeilV2

				if toggles.SilentAimVeilV2 then
					toggles.SilentAimVeilV2:SetValue(aimSilentVeilV2)
				end
			end,
		})

		addRightGroupboxResult6:AddToggle("PAimVeil", {
			Text = "Auto Predict",
			Default = false,
			Callback = function(spearSmartEnable)
				Config.SpearSmart_enable = spearSmartEnable
			end,
		}):AddKeyPicker("SilentAimVeilKey", {
			Default = "None",
			Text = "Veil Aim Key",
			Mode = "Toggle",
			Callback = function(aimSilentVeil)
				AimConfig.Aim_SilentVeil = aimSilentVeil
			end,
		})

		addRightGroupboxResult6:AddSlider("Veil_LeadMultiplier", {
			Text = "Lead Multiplier",
			Tooltip = "Semakin tinggi, semakin agresif prediksi gerakan target",
			Min = 0.5,
			Max = 5,
			Default = 1.4,
			Rounding = 1,
			Callback = function(veilLeadMultiplier)
				AimConfig.Veil_LeadMultiplier = veilLeadMultiplier
			end,
		})

		addRightGroupboxResult6:AddSlider("Veil_SpearSpeed", {
			Text = "Spear Speed",
			Min = 50,
			Max = 200,
			Default = 165,
			Rounding = 0,
			Callback = function(spearSpeed)
				AimConfig.SPEAR_Speed = spearSpeed
			end,
		})

		addRightGroupboxResult6:AddSlider("Veil_SpearGravity", {
			Text = "Spear Gravity",
			Min = 0,
			Max = 200,
			Default = 103,
			Rounding = 0,
			Callback = function(spearGravity)
				AimConfig.SPEAR_Gravity = spearGravity
			end,
		})

		addRightGroupboxResult6:AddToggle("VeilTracker", {
			Text = "ESP Tracker Target",
			Default = false,
			Callback = function(veilTrackerEnabled)
				VeilTrackerEnabled = veilTrackerEnabled

				if not veilTrackerEnabled then
					frame2.Visible = false

					if valueValue4 then
						valueValue4:Destroy()
						valueValue4 = nil
					end
				end
			end,
		})

		addRightGroupboxResult6:AddToggle("VeilShowFOV", {
			Text = "Show Veil FOV",
			Default = true,
			Callback = function(veilShowFOV)
				AimConfig.Veil_ShowFOV = veilShowFOV
			end,
		})

		maskedBits18 = bit32.band(maskedBits21, xorValue33)

		addRightGroupboxResult6:AddSlider("VeilFOV", {
			Text = "Veil FOV Radius",
			Default = 150,
			Min = 50,
			Max = 500,
			Rounding = 0,
			Callback = function(veilFov)
				AimConfig.Veil_FOV = veilFov
			end,
		})
	end

	local addRightGroupboxResult7 = tabs.Killer:AddRightGroupbox("Silent Aim Flask (Cure)", "arrow-right")

	addRightGroupboxResult7:AddToggle("AimFlask", {
		Text = "Silent Aim Flask (Cure)",
		Default = false,
		Callback = function(killerSilentAimFlask)
			vd.KILLER_SilentAimFlask = killerSilentAimFlask
			local valueValue8 = lib
			local notify = valueValue8.Notify
			local entries24 = { Title = "Silent Aim Flask" }
			entries24.Description = killerSilentAimFlask and "AKTIF" or "NONAKTIF"
			entries24.Time = 2
			notify(valueValue8, entries24)
		end,
	}):AddKeyPicker("AimFlaskKey", {
		Default = "None",
		Text = "Silent Aim Flask Key",
		Mode = "Toggle",
		Callback = function(killerSilentAimFlask)
			vd.KILLER_SilentAimFlask = killerSilentAimFlask

			if toggles.AimFlask then
				toggles.AimFlask:SetValue(killerSilentAimFlask)
			end

			lib:Notify({ Title = "Silent Aim Flask", Description = killerSilentAimFlask and "AKTIF" or "NONAKTIF", Time = 2 })
		end,
	})

	addRightGroupboxResult7:AddToggle("Laser", {
		Text = "Enable Laser",
		Tooltip = "Muncul saat tombol flask di-hold",
		Default = false,
		Callback = function(killerFlaskLaser)
			vd.KILLER_FlaskLaser = killerFlaskLaser

			if killerFlaskLaser then
				pcall(NEX_StartCureFlaskLaser)
				lib:Notify({ Title = "Flask Laser", Description = "AKTIF - Laser merah", Time = 2 })
			else
				if getgenv().NEX_CureFlaskLaserThread then
					getgenv().NEX_CureFlaskLaserThread:Disconnect()
					getgenv().NEX_CureFlaskLaserThread = nil
				end

				if getgenv().NEX_CureFlaskLaserPart then
					local function protectedCallback()
						getgenv().NEX_CureFlaskLaserPart:Destroy()
					end

					pcall(protectedCallback)
					getgenv().NEX_CureFlaskLaserPart = nil
				end

				lib:Notify({ Title = "Flask Laser", Description = "NONAKTIF", Time = 2 })
			end
		end,
	})

	tabs.Killer:AddRightGroupbox("Anti Looping", "skull"):AddToggle("AntiLooping", {
		Text = "Block Vault & Pallets",
		Default = false,
		Keybind = true,
		Callback = function(blockPalletEnabled)
			local numberValue2 = 73494081
			local numberValue3 = 1149877616
			_G.BlockPalletEnabled = blockPalletEnabled

			if not blockPalletEnabled then
				local vaultCompleteEvent = game:GetService("ReplicatedStorage").Remotes.Window.VaultCompleteEvent
				local palletSlideCompleteEvent = game:GetService("ReplicatedStorage").Remotes.Pallet.PalletSlideCompleteEvent
				local map = workspace:FindFirstChild("Map")

				if map then
					for _, descendant in pairs(map:GetDescendants()) do
						if descendant.Name == "VaultPointInUse" then
							local xorValue36 = 71840246

							local function protectedCallback()
								local matches = bit32.bxor(bit32.bxor(xorValue36, 0), 19600418) ~= 161504120
								xorValue36 = bit32.bxor(xorValue36, 4282351797)
								vaultCompleteEvent:FireServer(descendant.Parent, false)
							end

							xorValue36 = 143347546
							pcall(protectedCallback)
						elseif descendant.Name == "PalletPointSlideInUse" then
							local pcallValue = pcall
							local xorValue37 = 175574435

							local function callbackValue64()
								local matches = bit32.bxor(xorValue37, 0) ~= 459722900
								palletSlideCompleteEvent:FireServer(descendant.Parent, false)
							end

							local xorValue38 = bit32.bxor(numberValue3, 1436049479)
							xorValue37 = bit32.bxor(xorValue37, xorValue38)
							pcallValue(callbackValue64)
						end
					end
				end

				return
			end

			local vaultEvent = game:GetService("ReplicatedStorage").Remotes.Window.VaultEvent
			local palletSlideEvent = game:GetService("ReplicatedStorage").Remotes.Pallet.PalletSlideEvent
			local map = workspace:FindFirstChild("Map")

			if map then
				for _, descendant in pairs(map:GetDescendants()) do
					if descendant.Name == "VaultTrigger" then
						local xorValue39 = 279755161

						local function protectedCallback2()
							local matches = bit32.bxor(bit32.bxor(xorValue39, 0), 412339717) ~= 214568000
							xorValue39 = bit32.bxor(xorValue39, 2116617063)
							vaultEvent:FireServer(descendant, true)
						end

						xorValue39 = 341426757
						pcall(protectedCallback2)
					end

					if descendant.Name == "PalletPointSlide" and descendant:IsA("BasePart") then
						local numberValue4 = 122426940

						local function protectedCallback3()
							local matches = bit32.bxor(bit32.bxor(numberValue4, 0), 458044968) == 364080274
							palletSlideEvent:FireServer(descendant, true)
						end

						numberValue4 = 516456651
						pcall(protectedCallback3)
					end
				end
			end

			task.spawn(function()
				local map2 = workspace:FindFirstChild("Map")
				if not map2 then
					return
				end
				local entries24 = {}

				watchPallet = function(inputValue3)
					local isBasePart = inputValue3:IsA("BasePart")

					if isBasePart and inputValue3.Name == "PalletPoint" then
						local connection = inputValue3:GetPropertyChangedSignal("Name"):Connect(function()
							if not _G.BlockPalletEnabled then
								return
							end

							if inputValue3.Name == "PalletPointSlide" then
								task.wait(0.1)

								pcall(function()
									palletSlideEvent:FireServer(inputValue3, true)
								end)
							end
						end)

						table.insert(entries24, connection)
					end
				end

				for _, descendant in pairs(map2:GetDescendants()) do
					watchPallet(descendant)
				end

				local connection = map2.DescendantAdded:Connect(function(descendant)
					watchPallet(descendant)
				end)

				table.insert(entries24, connection)

				while _G.BlockPalletEnabled do
					task.wait(0.5)
				end

				for _, item in pairs(entries24) do
					item:Disconnect()
				end

				entries24 = {}
			end)

			lib:Notify({ Title = "Anti Looping", Description = "✅ Aktif!", Time = 2 })
		end,
	}):AddKeyPicker("AntiLoopingKey", {
		Default = "None",
		Text = "Keybind Block Vault & Pallets",
		Mode = "Toggle",
		Callback = function(inputValue3)
			toggles.AntiLooping:SetValue(inputValue3)
		end,
	})

	tabs.Killer:AddRightGroupbox("Camera Setting", "camera"):AddToggle("KillerThirdPerson", {
		Text = "Third Person (Killer)",
		Tooltip = "Mengubah posisi kamera ke belakang karakter",
		Default = false,
		Callback = function(killer3rdPerson)
			local numberValue2 = 2167327806
			local numberValue3 = 3748654202
			local selectedValue = localPlayerValue.Team and localPlayerValue.Team.Name == "Killer"
			if killer3rdPerson and not selectedValue then
				lib:Notify({ Title = "Akses Ditolak", Description = "Fitur ini khusus Killer!", Time = 3 })
				return
			end
			Config.Killer_3rdPerson = killer3rdPerson

			if not killer3rdPerson then
				if State.ThirdPersonConn then
					State.ThirdPersonConn:Disconnect()
					State.ThirdPersonConn = nil
				end

				if selectedValue then
					localPlayerValue.CameraMode = Enum.CameraMode.LockFirstPerson
					localPlayerValue.CameraMinZoomDistance = 0.5
					localPlayerValue.CameraMaxZoomDistance = 0.5
				else
					localPlayerValue.CameraMode = Enum.CameraMode.Classic
					localPlayerValue.CameraMinZoomDistance = 0.5
					localPlayerValue.CameraMaxZoomDistance = 128
					local sum23 = bit32.bxor(numberValue3, numberValue2) + 2167327798
				end

				ResetAllTransparency()

				if localPlayerValue.Character then
					ResetCharacterTransparency(false)
				end
			else
				localPlayerValue.CameraMode = Enum.CameraMode.Classic
				localPlayerValue.CameraMinZoomDistance = 7
				localPlayerValue.CameraMaxZoomDistance = 128

				if State.ThirdPersonConn then
					State.ThirdPersonConn:Disconnect()
					State.ThirdPersonConn = nil
				end

				local stateValue2 = State
				local renderStepped = RunService.RenderStepped
				local connect = renderStepped.Connect
				local xorValue36 = 76994575

				local function callbackValue64()
					if not Config.Killer_3rdPerson then
						return
					end

					if localPlayerValue.Team and localPlayerValue.Team.Name ~= "Killer" then
						Config.Killer_3rdPerson = false
						local matches = bit32.bxor(xorValue36, 0) == 31038256

						if State.ThirdPersonConn then
							State.ThirdPersonConn:Disconnect()
							State.ThirdPersonConn = nil
						end

						return
					end

					local localPlayerValue2 = localPlayerValue
					local sum24 = bit32.bxor(xorValue36, 0) + 371203948
					localPlayerValue2.CameraMode = Enum.CameraMode.Classic
					localPlayerValue.CameraMinZoomDistance = 7
					localPlayerValue.CameraMaxZoomDistance = 128
					SetWorldTransparency(1)

					if localPlayerValue.Character then
						SetCharacterTransparency(localPlayerValue.Character, 0)
					end
				end

				xorValue36 = bit32.bxor(xorValue36, numberValue2 + 2216720129)
				stateValue2.ThirdPersonConn = connect(renderStepped, callbackValue64)
			end
		end,
	})

	ResetAllTransparency = function()
		for _, child in pairs(currentCamera:GetChildren()) do
			if child ~= localPlayerValue.Character then
				for _, descendant in pairs(child:GetDescendants()) do
					if descendant:IsA("BasePart") or descendant:IsA("Decal") then
						pcall(function()
							descendant.LocalTransparencyModifier = 0
							descendant.Transparency = 0
						end)
					end
				end
			end
		end
	end

	SetWorldTransparency = function(localTransparencyModifier)
		for _, child in pairs(currentCamera:GetChildren()) do
			if child ~= localPlayerValue.Character then
				for _, descendant in pairs(child:GetDescendants()) do
					if descendant:IsA("BasePart") or descendant:IsA("Decal") then
						pcall(function()
							descendant.LocalTransparencyModifier = localTransparencyModifier
							descendant.Transparency = localTransparencyModifier
						end)
					end
				end
			end
		end
	end

	SetCharacterTransparency = function(inputValue3, localTransparencyModifier)
		if not inputValue3 then
			return
		end

		for _, child in pairs(inputValue3:GetChildren()) do
			if child.Name == "Hat" then
				for _, descendant in pairs(child:GetDescendants()) do
					if descendant:IsA("BasePart") or descendant:IsA("Decal") then
						pcall(function()
							descendant.LocalTransparencyModifier = localTransparencyModifier
							descendant.Transparency = localTransparencyModifier
						end)
					end
				end
			end

			if child:IsA("BasePart") and entries4 and entries4[child.Name] then
				pcall(function()
					child.LocalTransparencyModifier = localTransparencyModifier
					child.Transparency = localTransparencyModifier
				end)
			end

			if isWeapon(child) then
				local descendants = child:IsA("BasePart") and { child } or child:GetDescendants()

				for _, descendant in pairs(descendants) do
					if descendant:IsA("BasePart") or descendant:IsA("Decal") then
						pcall(function()
							descendant.LocalTransparencyModifier = localTransparencyModifier
							descendant.Transparency = localTransparencyModifier
						end)
					end
				end
			end
		end
	end

	ResetCharacterTransparency = function(inputValue3)
		local numberValue2 = 977620406
		if not localPlayerValue.Character then
			return
		end

		if inputValue3 then
			for _, child in pairs(localPlayerValue.Character:GetChildren()) do
				if child.Name == "Hat" then
					for _, descendant in pairs(child:GetDescendants()) do
						if descendant:IsA("BasePart") or descendant:IsA("Decal") then
							local numberValue3 = 376586882

							local function protectedCallback()
								local item = descendant
								local matches = bit32.bxor(numberValue3, 0) == 29027764
								item.LocalTransparencyModifier = 1
								descendant.Transparency = 1
							end

							numberValue3 = 40219215
							pcall(protectedCallback)
						end
					end
				end

				if child:IsA("BasePart") and entries4 and entries4[child.Name] then
					local pcallValue = pcall
					local xorValue36 = 378131148

					local function callbackValue64()
						child.LocalTransparencyModifier = 1
						local item = child
						local matches = bit32.bxor(xorValue36, 0) + 177604424 == 149350634
						item.Transparency = 1
					end

					local xorValue37 = bit32.bxor(numberValue2, 881357497)
					xorValue36 = bit32.bxor(xorValue36, xorValue37)
					pcallValue(callbackValue64)
				end

				if isWeapon(child) then
					local descendants = child:IsA("BasePart") and { child } or child:GetDescendants()

					for _, descendant in pairs(descendants) do
						if descendant:IsA("BasePart") or descendant:IsA("Decal") then
							local numberValue4 = 81533238

							local function protectedCallback2()
								descendant.LocalTransparencyModifier = 1
								descendant.Transparency = 1
								local matches = bit32.bxor(bit32.bxor(numberValue4, 0), 459858665) == 105573049
							end

							numberValue4 = 183216108
							pcall(protectedCallback2)
						end
					end
				end
			end
		else
			SetCharacterTransparency(localPlayerValue.Character, 0)
		end
	end

	local addLeftGroupboxResult6 = tabs.Visual:AddLeftGroupbox("Player Emote", "smile")

	addLeftGroupboxResult6:AddToggle("EmoteEnabled", {
		Text = "Aktifkan Emote",
		Default = false,
		Callback = function(emoteEnabled)
			EmoteEnabled = emoteEnabled

			if emoteEnabled then
				PlayEmote()
			else
				StopEmote()
			end
		end,
	})

	addLeftGroupboxResult6:AddDropdown("EmoteSelect", {
		Values = {
			"Friday Night",
			"WarCry",
			"24 Hour Cinderella",
			"Applause",
			"Arm Swing",
			"Backflip",
			"California Girls",
			"Christmas Spirit",
			"Floating Rest",
			"Ghoul",
			"Griddy",
			"Kyoufuu",
			"OnePlays",
			"Vulnerable",
		},
		Default = "Friday Night",
		Text = "Pilih Emote",
		Callback = function(inputValue3)
			local numberValue2 = 48936571
			local numberValue3 = 2793526447

			if inputValue3 == "Friday Night" then
				SelectedAnim = "rbxassetid://83229063951016"
				SelectedSound = "rbxassetid://85355610204255"
			elseif inputValue3 == "WarCry" then
				local packedResults57 = table.pack(bit32.band(numberValue2, 4294967295))
				local packedResults58 = table.pack(bit32.band(numberValue3, 4294967295))
				local packedResults59 = table.pack(bit32.band(packedResults57[1], 65535))
				local packedResults60 = table.pack(bit32.rshift(packedResults57[1], 16))
				local packedResults61 = table.pack(bit32.band(packedResults58[1], 65535))
				local maskedBits22 = bit32.band(packedResults59[1] * packedResults61[1] + bit32.lshift(bit32.band(packedResults59[1] * bit32.rshift(packedResults58[1], 16) + packedResults60[1] * packedResults61[1], 65535), 16), 4294967295)
				SelectedAnim = "rbxassetid://82600868380136"
				SelectedSound = "rbxassetid://120101930689931"
			elseif inputValue3 == "24 Hour Cinderella" then
				SelectedAnim = "rbxassetid://137195203725366"
				SelectedSound = "rbxassetid://121099446613414"
			elseif inputValue3 == "Applause" then
				SelectedAnim = "rbxassetid://96328361165090"
				SelectedSound = "rbxassetid://115490787020749"
			elseif inputValue3 == "Arm Swing" then
				SelectedAnim = "rbxassetid://80552139463944"
				SelectedSound = "rbxassetid://74216458932348"
			elseif inputValue3 == "Backflip" then
				SelectedAnim = "rbxassetid://74705617908505"
				SelectedSound = nil
			elseif inputValue3 == "California Girls" then
				SelectedAnim = "rbxassetid://123552803041504"
				SelectedSound = "rbxassetid://87899327891544"
			elseif inputValue3 == "Christmas Spirit" then
				SelectedAnim = "rbxassetid://137859761110514"
				SelectedSound = nil
			elseif inputValue3 == "Floating Rest" then
				SelectedAnim = "rbxassetid://114593021219597"
				SelectedSound = nil
			elseif inputValue3 == "Ghoul" then
				SelectedAnim = "rbxassetid://130415594909401"
				SelectedSound = "rbxassetid://123004139176580"
			elseif inputValue3 == "Griddy" then
				SelectedAnim = "rbxassetid://75586690784894"
				local xorValue36 = bit32.bxor(numberValue3, 2793526447)
				SelectedSound = nil
			elseif inputValue3 == "Kyoufuu" then
				SelectedAnim = "rbxassetid://137322894494527"
				SelectedSound = "rbxassetid://129064643026442"
			elseif inputValue3 == "OnePlays" then
				SelectedAnim = "rbxassetid://140625405103474"
				SelectedSound = "rbxassetid://94749073728335"
			elseif inputValue3 == "Vulnerable" then
				SelectedAnim = "rbxassetid://121773684313913"
				SelectedSound = "rbxassetid://135265751184744"
			end

			PlayEmote()
		end,
	})

	addLeftGroupboxResult6:AddButton({
		Text = "Apply Korless",
		Callback = function()
			callbackValue21()
			lib:Notify({ Title = "Ascend Official", Description = "Korless Morph Applied", Time = 3 })
		end,
	})

	local maskedBits22

	do
		local addRightGroupboxResult8 = tabs.Visual:AddRightGroupbox("Troll Player", "skull")

		addRightGroupboxResult8:AddButton({
			Text = "Tools Jerk",
			Func = function()
				if pcall(function()
					loadstring(game:HttpGet("https://pastefy.app/wa3v2Vgm/raw"))()
				end) then
					lib:Notify({ Title = "Tools Jerk", Description = "Tools Jerk berhasil dimuat!", Time = 3 })
				else
					lib:Notify({ Title = "Error", Description = "Gagal memuat Tools Jerk", Time = 3 })
				end
			end,
		})

		local findFirstChildResult = nil
		local compareEntries = {}

		local function callbackValue64()
			compareEntries = {}

			for _, player in pairs(Players:GetPlayers()) do
				if player ~= localPlayer then
					table.insert(compareEntries, player.Name)
				end
			end

			table.sort(compareEntries)
		end

		callbackValue64()
		local xorValue36 = bit32.bxor(sum21, 0)
		maskedBits22 = bit32.band(xorValue33, xorValue36)

		addRightGroupboxResult8:AddDropdown("SharedTargetDropdown", {
			Text = "Pilih Target (Shared)",
			Values = compareEntries,
			Default = "None",
			Multi = false,
			Callback = function(inputValue3)
				if inputValue3 and inputValue3 ~= "None" then
					findFirstChildResult = Players:FindFirstChild(inputValue3)
				else
					findFirstChildResult = nil
				end
			end,
		})

		addRightGroupboxResult8:AddButton({
			Text = "Refresh Target List",
			Func = function()
				callbackValue64()
				options.SharedTargetDropdown:SetValues(compareEntries)
				lib:Notify({ Title = "Target", Description = "Daftar player di-refresh!", Time = 2 })
			end,
		})

		SusR6Enabled = false
		susAnimTrack = nil
		susCoroutine = nil

		addRightGroupboxResult8:AddToggle("SusR6Toggle", {
			Text = "Di Ew Player",
			Default = false,
			Callback = function(sus6Enabled)
				local numberValue2 = 963831104
				local numberValue3 = 1341842551
				SusR6Enabled = sus6Enabled

				if sus6Enabled then
					if not findFirstChildResult then
						lib:Notify({ Title = "Sus R6", Description = "Pilih target dulu!", Time = 3 })
						toggles.SusR6Toggle:SetValue(false)
						return
					end

					local character = localPlayer.Character
					local humanoidValue

					if character then
						local humanoid = localPlayer.Character:FindFirstChildOfClass("Humanoid")
						bit32.bxor(bit32.bor(numberValue3, numberValue2), 805306624)
						humanoidValue = humanoid
					else
						humanoidValue = character
					end

					if humanoidValue then
						local animation = Instance.new("Animation")
						animation.AnimationId = "rbxassetid://189854234"
						susAnimTrack = humanoidValue:LoadAnimation(animation)
						susAnimTrack:Play()
					end

					susCoroutine = coroutine.wrap(function()
						while true do
							if findFirstChildResult and findFirstChildResult.Character then
								local humanoidRootPart = findFirstChildResult.Character:FindFirstChild("HumanoidRootPart")
								local humanoidRootPart2 = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")

								if humanoidRootPart and humanoidRootPart2 then
									local product3 = humanoidRootPart.CFrame * CFrame.new(0, 0, -2.5)
									local product4 = humanoidRootPart.CFrame * CFrame.new(0, 0, -1.3)
									TweenService:Create(humanoidRootPart2, TweenInfo.new(0.15), { CFrame = product3 }):Play()
									task.wait(0.15)
									TweenService:Create(humanoidRootPart2, TweenInfo.new(0.15), { CFrame = product4 }):Play()
									task.wait(0.15)
									continue
								end
							end

							break
						end
					end)()
				else
					susAnimTrack:Stop()
					susAnimTrack = nil
					susCoroutine = nil
				end
			end,
		})

		GetSuckedEnabled = false
		suckedAttachmentLoop = nil
		suckedAnimTrack = nil
		local gravity = workspace.Gravity

		addRightGroupboxResult8:AddToggle("GetSuckedToggle", {
			Text = "Ew Player",
			Default = false,
			Callback = function(getSuckedEnabled)
				local numberValue2 = 4017532083
				local numberValue3 = 214957573
				GetSuckedEnabled = getSuckedEnabled

				if getSuckedEnabled then
					if not findFirstChildResult then
						lib:Notify({ Title = "Get Sucked", Description = "Pilih target dulu!", Time = 3 })
						toggles.GetSuckedToggle:SetValue(false)
						return
					end

					local character = localPlayer.Character
					local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
					local humanoidRootPart2 = findFirstChildResult.Character and findFirstChildResult.Character:FindFirstChild("HumanoidRootPart")

					if humanoidRootPart and humanoidRootPart2 then
						gravity = workspace.Gravity
						workspace.Gravity = 0

						spawn(function()
							while humanoidRootPart.Position.Y <= 44 do
								humanoidRootPart.CFrame = humanoidRootPart.CFrame * CFrame.new(0, 1.5, 0)
								task.wait()
							end
						end)

						task.wait(1)
						local stepped = RunService.Stepped
						local connect = stepped.Connect
						local xorValue37 = 257409403

						local function callbackValue65()
							local selectedValue = humanoidRootPart
							bit32.bxor(bit32.bxor(xorValue37, 0), 78219199)
							local selectedValue2 = humanoidRootPart

							if selectedValue then
								selectedValue2 = humanoidRootPart2
							end

							if selectedValue2 then
								humanoidRootPart.CFrame = humanoidRootPart2.CFrame * CFrame.new(0, 0, -1.1) * CFrame.Angles(0, 3.1415926535897931, 0)
								humanoidRootPart.Velocity = Vector3.zero
							end
						end

						xorValue37 = bit32.bxor(xorValue37, numberValue2 + 671998395)
						suckedAttachmentLoop = connect(stepped, callbackValue65)
						local animation = Instance.new("Animation")
						animation.AnimationId = "rbxassetid://148840371"
						local humanoid = character:FindFirstChildOfClass("Humanoid")

						if humanoid then
							suckedAnimTrack = humanoid:LoadAnimation(animation)
							suckedAnimTrack:Play()
							suckedAnimTrack:AdjustSpeed(3)
						end
					end
				else
					workspace.Gravity = gravity
					suckedAttachmentLoop:Disconnect()
					suckedAnimTrack:Stop()
					bit32.bxor(numberValue2 // 3, 2695140642)
					suckedAttachmentLoop = nil
					suckedAnimTrack = nil
				end
			end,
		})
	end

	do
		local function callbackValue65()
		end

		local function callbackValue66()
			CopyAvaActive = false

			pcall(function()
				local CoreGui2 = game:GetService("CoreGui")
				CoreGui2 = CoreGui2 and CoreGui2:FindFirstChild("Ascend_COPY_AVA")

				if CoreGui2 then
					CoreGui2:Destroy()
				end
			end)
		end

		CopyAvaToggleRef = tabs.Visual:AddRightGroupbox("Copy Avatar", "user"):AddToggle("CopyAvaToggle", {
			Text = "Enable Copy Ava",
			Tooltip = "Buka panel Copy Ava",
			Default = false,
			Callback = function(inputValue3)
				if inputValue3 then
					callbackValue65()
				else
					callbackValue66()
				end
			end,
		}):AddKeyPicker("CopyAvaKey", {
			Default = "None",
			Text = "Copy Ava Key",
			Mode = "Toggle",
			SyncToggleState = true,
			Callback = function(inputValue3)
				if inputValue3 then
					callbackValue65()
				else
					callbackValue66()
				end
			end,
		})
	end

	local sum23
	sum23 = sum21 + maskedBits18
	local addLeftGroupboxResult7 = tabs.Esp:AddLeftGroupbox("ESP Players", "user")

	addLeftGroupboxResult7:AddToggle("ESP_Master", {
		Text = "Enable Esp",
		Default = false,
		Callback = function(espMaster)
			Config.ESP_Master = espMaster

			if espMaster then
				ForceRefreshMap()
			else
				ClearAllESP()
			end
		end,
	})

	addLeftGroupboxResult7:AddCheckbox("ESP_Player", {
		Text = "Player",
		Default = false,
		Callback = function(espPlayer)
			Config.ESP_Player = espPlayer

			if Config.ESP_Master then
				if not espPlayer then
					ClearESP("Player")
				else
					ScanMap()
				end
			end
		end,
	}):AddColorPicker("Color_Player", {
		Default = visualSettings.Colors.Player,
		Title = "Player Color",
		Callback = function(player)
			visualSettings.Colors.Player = player
		end,
	})

	addLeftGroupboxResult7:AddCheckbox("ESP_Killer", {
		Text = "Killer",
		Default = false,
		Callback = function(espKiller)
			Config.ESP_Killer = espKiller

			if Config.ESP_Master then
				if not espKiller then
					ClearESP("Killer")
				else
					ScanMap()
				end
			end
		end,
	}):AddColorPicker("Color_Killer", {
		Default = visualSettings.Colors.Killer,
		Title = "Killer Color",
		Callback = function(killer)
			visualSettings.Colors.Killer = killer
		end,
	})

	addLeftGroupboxResult7:AddCheckbox("ESP_SCP", {
		Text = "SCP / Zombie",
		Default = false,
		Callback = function(espScp)
			Config.ESP_SCP = espScp

			if Config.ESP_Master then
				if not espScp then
					ClearESP("SCP")
				else
					ScanMap()
				end
			end
		end,
	}):AddColorPicker("Color_SCP", {
		Default = visualSettings.Colors.SCP,
		Title = "SCP Color",
		Callback = function(scp)
			visualSettings.Colors.SCP = scp
		end,
	})

	addLeftGroupboxResult7:AddCheckbox("ESP_Name", {
		Text = "Esp Name",
		Default = false,
		Callback = function(espName)
			Config.ESP_Name = espName

			if espName then
				ScanMap()
			else
				ClearAllESP()
			end
		end,
	})

	addLeftGroupboxResult7:AddCheckbox("ESP_Distance", {
		Text = "Esp Distance",
		Default = false,
		Callback = function(espDistance)
			Config.ESP_Distance = espDistance

			if Config.ESP_Master then
				UpdatePlayerESP()
			end
		end,
	})

	addLeftGroupboxResult7:AddCheckbox("ESP_ItemIcon", {
		Text = "Esp Item Icon",
		Default = false,
		Callback = function(espItemIcon)
			Config.ESP_ItemIcon = espItemIcon

			if Config.ESP_Master then
				UpdatePlayerESP()
			end
		end,
	})

	addLeftGroupboxResult7:AddCheckbox("ESP_KillerWarn", {
		Text = "Killer Warn",
		Default = false,
		Callback = function(espKillerWarn)
			Config.ESP_KillerWarn = espKillerWarn

			if not espKillerWarn then
				local humanoidRootPart = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")

				if humanoidRootPart and humanoidRootPart:FindFirstChild("KillerWarn") then
					humanoidRootPart.KillerWarn:Destroy()
				end
			end
		end,
	})

	local addLeftGroupboxResult8 = tabs.Esp:AddLeftGroupbox("ESP Maps", "map")

	addLeftGroupboxResult8:AddCheckbox("ESP_Generator", {
		Text = "Generator",
		Default = false,
		Callback = function(espGenerator)
			Config.ESP_Generator = espGenerator

			if Config.ESP_Master then
				if not espGenerator then
					ClearESP("Generator")
				else
					ScanMap()
				end
			end
		end,
	}):AddColorPicker("Color_Generator", {
		Default = visualSettings.Colors.Generator,
		Title = "Generator Color",
		Callback = function(generator)
			visualSettings.Colors.Generator = generator
		end,
	})

	addLeftGroupboxResult8:AddCheckbox("ESP_GeneratorName", {
		Text = "Gen Name & Progress",
		Default = true,
		Callback = function(espGeneratorName)
			Config.ESP_GeneratorName = espGeneratorName

			if Config.ESP_Master then
				ScanMap()
			end
		end,
	})

	addLeftGroupboxResult8:AddCheckbox("ESP_Pallet", {
		Text = "Pallet",
		Default = false,
		Callback = function(espPallet)
			Config.ESP_Pallet = espPallet

			if Config.ESP_Master then
				if not espPallet then
					ClearESP("Pallet")
				else
					ScanMap()
				end
			end
		end,
	}):AddColorPicker("Color_Pallet", {
		Default = visualSettings.Colors.Pallet,
		Title = "Pallet Color",
		Callback = function(pallet)
			visualSettings.Colors.Pallet = pallet
		end,
	})

	addLeftGroupboxResult8:AddCheckbox("ESP_Window", {
		Text = "Window / Vault",
		Default = false,
		Callback = function(espWindow)
			Config.ESP_Window = espWindow

			if Config.ESP_Master then
				if not espWindow then
					ClearESP("Window")
				else
					ScanMap()
				end
			end
		end,
	}):AddColorPicker("Color_Window", {
		Default = visualSettings.Colors.Window,
		Title = "Window Color",
		Callback = function(window)
			visualSettings.Colors.Window = window
		end,
	})

	addLeftGroupboxResult8:AddCheckbox("ESP_Hook", {
		Text = "Hook",
		Default = false,
		Callback = function(espHook)
			Config.ESP_Hook = espHook

			if Config.ESP_Master then
				if not espHook then
					ClearESP("Hook")
				else
					ScanMap()
				end
			end
		end,
	}):AddColorPicker("Color_Hook", {
		Default = visualSettings.Colors.Hook,
		Title = "Hook Color",
		Callback = function(hook)
			visualSettings.Colors.Hook = hook
		end,
	})

	addLeftGroupboxResult8:AddCheckbox("ESP_Gate", {
		Text = "Exit Gate",
		Default = false,
		Callback = function(espGate)
			Config.ESP_Gate = espGate

			if Config.ESP_Master then
				if not espGate then
					ClearESP("Gate")
				else
					ScanMap()
				end
			end
		end,
	}):AddColorPicker("Color_Gate", {
		Default = visualSettings.Colors.Gate,
		Title = "Gate Color",
		Callback = function(gate)
			visualSettings.Colors.Gate = gate
		end,
	})

	do
		local enabledValue18 = false
		local screenGui = nil

		SetupNextKillerIndicator = function()
			if screenGui then
				screenGui:Destroy()
			end

			screenGui = Instance.new("ScreenGui")
			screenGui.Name = "NextKillerIndicator"
			screenGui.ResetOnSpawn = false
			screenGui.Parent = localPlayerValue:WaitForChild("PlayerGui")
		end

		StartNextKiller = function()
			if screenGui then
				return
			end
			SetupNextKillerIndicator()

			task.spawn(function()
				local numberValue2 = 87086164

				while true do
					local parentValue5 = false

					if enabledValue18 then
						parentValue5 = screenGui
					end

					if parentValue5 then
						local nextKillerDisplay = screenGui:FindFirstChild("NextKillerDisplay")

						if not nextKillerDisplay then
							nextKillerDisplay = Instance.new("TextLabel")
							nextKillerDisplay.Name = "NextKillerDisplay"
							nextKillerDisplay.Size = UDim2.new(0, 150, 0, 22)
							nextKillerDisplay.Position = UDim2.new(0.5, 0, 0, 10)
							nextKillerDisplay.AnchorPoint = Vector2.new(0.5, 0)
							nextKillerDisplay.BackgroundTransparency = 0.15
							nextKillerDisplay.BackgroundColor3 = Color3.new(0.039215687662363052, 0.039215687662363052, 0.047058824449777603)
							nextKillerDisplay.TextColor3 = Color3.new(0.86274510622024536, 0.86274510622024536, 0.90196079015731812)
							nextKillerDisplay.Font = Enum.Font.GothamMedium
							nextKillerDisplay.TextSize = 11
							nextKillerDisplay.RichText = true
							nextKillerDisplay.Parent = screenGui
							local uiCorner = Instance.new("UICorner")
							uiCorner.CornerRadius = UDim.new(0, 6)
							uiCorner.Parent = nextKillerDisplay
							local uiStroke = Instance.new("UIStroke")
							uiStroke.Thickness = 1
							uiStroke.Color = Color3.new(0.23529411852359772, 0.23529411852359772, 0.27450981736183167)
							uiStroke.Transparency = 0.3
							uiStroke.Parent = nextKillerDisplay
						end

						local players = Players:GetPlayers()
						local sort = table.sort
						local xorValue37 = 454093248

						local function callbackValue67(inputValue3, inputValue4)
							local attribute = inputValue3:GetAttribute("AllowKiller") or false
							if attribute ~= (inputValue4:GetAttribute("AllowKiller") or false) then
								return attribute
							end
							local attribute2 = inputValue3:GetAttribute("KillerChance") or 0
							local attribute3 = inputValue4:GetAttribute("KillerChance") or 0
							local sum24 = bit32.bxor(xorValue37, 0) + 193229551
							xorValue37 = bit32.bxor(xorValue37, 3400236519)
							return attribute2 > attribute3
						end

						local xorValue38 = bit32.bxor(numberValue2, 282567467)
						xorValue37 = bit32.bxor(xorValue37, xorValue38)
						sort(players, callbackValue67)
						local entry = players[1]

						if entry then
							nextKillerDisplay.Text = "Next Killer: " .. (entry == localPlayerValue and "<font color='#ff5555'>KAMU</font>" or entry.Name)
						else
							nextKillerDisplay.Text = "Next Killer: <font color='#888888'>Waiting...</font>"
						end

						task.wait(1.5)
						continue
					end

					break
				end
			end)
		end

		StopNextKiller = function()
			if screenGui then
				screenGui:Destroy()
				screenGui = nil
			end
		end
	end

	do
		local addRightGroupboxResult9 = tabs.Esp:AddRightGroupbox("World Effects", "sun")

		addRightGroupboxResult9:AddToggle("FullBright", {
			Text = "Full Bright",
			Tooltip = "Bikin map jadi terang biar lebih jelas",
			Default = false,
			Callback = function(fullBright)
				FullBright = fullBright

				if fullBright then
					ApplyFullBright()
					lib:Notify({ Title = "Full Bright", Description = "Full Bright aktif!", Time = 3 })
				else
					Lighting.Brightness = 1
					Lighting.ClockTime = 14
					Lighting.Ambient = Color3.new(0.50196081399917603, 0.50196081399917603, 0.50196081399917603)
					Lighting.OutdoorAmbient = Color3.new(0.50196081399917603, 0.50196081399917603, 0.50196081399917603)
					lib:Notify({ Title = "Full Bright", Description = "Full Bright dimatikan", Time = 3 })
				end
			end,
		})

		addRightGroupboxResult9:AddSlider("TimeOfDay", {
			Text = "Time Of Day",
			Tooltip = "Atur waktu di game",
			Default = 14,
			Min = 0,
			Max = 24,
			Rounding = 0,
			Callback = function(clockTime)
				TimeOfDayValue = clockTime
				Lighting.ClockTime = clockTime
			end,
		})

		addRightGroupboxResult9:AddToggle("NoFog", {
			Text = "No Fog",
			Tooltip = "Hapus kabut biar map lebih jelas",
			Default = false,
			Callback = function(noFog)
				NoFog = noFog

				if noFog then
					ApplyNoFog()
					lib:Notify({ Title = "No Fog", Description = "Kabut berhasil dihilangkan!", Time = 3 })
				else
					Lighting.FogStart = 0
					Lighting.FogEnd = 1000
					local atmosphere = Lighting:FindFirstChildOfClass("Atmosphere")

					if atmosphere then
						atmosphere.Density = 0.35
					end

					lib:Notify({ Title = "No Fog", Description = "No Fog dimatikan", Time = 3 })
				end
			end,
		})

		addRightGroupboxResult9:AddToggle("NoShadow", {
			Text = "No Shadow",
			Tooltip = "Matikan shadow",
			Default = false,
			Callback = function(noShadow)
				NoShadow = noShadow
				ApplyNoShadow()
				local valueValue8 = lib
				local notify = valueValue8.Notify

				notify(valueValue8, {
					Title = "No Shadow",
					Description = noShadow and "Shadow berhasil dihapus!" or "Shadow dikembalikan normal",
					Time = 3,
				})
			end,
		})

		local numberValue2 = 60
		local enabledValue19 = false

		local function callbackValue67(numberValue3)
			numberValue2 = numberValue3

			if enabledValue19 then
				setfpscap(numberValue3)
				lib:Notify({ Title = "FPS Cap", Description = " " .. numberValue3 .. " FPS", Time = 1 })
			end
		end

		addRightGroupboxResult9:AddToggle("FPSCapToggle", {
			Text = "Enable FPS Cap",
			Tooltip = "Aktifkan pembatas FPS",
			Default = false,
			Callback = function(enabledValue20)
				enabledValue19 = enabledValue20

				if enabledValue20 then
					setfpscap(numberValue2)
					lib:Notify({ Title = "FPS Cap", Description = "" .. numberValue2 .. " FPS", Time = 2 })
				else
					setfpscap(0)
					lib:Notify({ Title = "FPS Cap", Description = "Nonaktif", Time = 2 })
				end
			end,
		}):AddKeyPicker("FPSCapKey", {
			Default = "None",
			Text = "Keybind FPS Cap",
			Mode = "Toggle",
			Callback = function(enabledValue20)
				enabledValue19 = enabledValue20

				if enabledValue20 then
					setfpscap(numberValue2)
				else
					setfpscap(0)
				end

				if options.FPSCapToggle then
					options.FPSCapToggle:SetValue(enabledValue20)
				end
			end,
		})

		addRightGroupboxResult9:AddSlider("FPSCapSlider", {
			Text = "FPS Limit",
			Min = 1,
			Max = 4000,
			Default = 60,
			Color = Color3.new(0, 0.78431373834609985, 1),
			Callback = function(inputValue3)
				callbackValue67(inputValue3)
			end,
		})

		addRightGroupboxResult9:AddButton({
			Text = "Reset to 60 FPS",
			Func = function()
				callbackValue67(60)

				if options.FPSCapSlider then
					options.FPSCapSlider:SetValue(60)
				end

				lib:Notify({ Title = "FPS Cap", Description = "Reset ke 60 FPS", Time = 2 })
			end,
		})

		localPlayer.CharacterAdded:Connect(function()
			task.wait(2)

			if enabledValue19 then
				setfpscap(numberValue2)
			end
		end)
	end

	local xorValue37, sum24

	do
		local addRightGroupboxResult10 = tabs.Main:AddRightGroupbox("Keybind Open/Close UI", "keyboard")
		local addLabelResult = addRightGroupboxResult10:AddLabel("Menu bind")
		local xorValue38 = bit32.bxor(sum23, 0)
		local combinedBits4 = bit32.bor(maskedBits22, xorValue38)
		addLabelResult:AddKeyPicker("MenuKeybind", { Default = "RightShift", NoUI = true, Text = "Menu keybind" })

		addRightGroupboxResult10:AddToggle("LockMenu", {
			Default = false,
			Text = "Lock Gui",
			Callback = function(cantDragForced)
				lib.CantDragForced = cantDragForced
			end,
		})

		lib.ToggleKeybind = options.MenuKeybind
		lib.ShowToggleFrameInKeybinds = true

		addRightGroupboxResult10:AddButton("Unload script", function()
			lib:Unload()
		end)

		local addLeftGroupboxResult9 = tabs.Teleport:AddLeftGroupbox("Teleport Players", "users")
		local valueValue8 = nil
		local compareEntries2 = {}

		UpdatePlayerList = function()
			compareEntries2 = {}

			for _, player in pairs(Players:GetPlayers()) do
				if player ~= localPlayerValue and player.Character then
					table.insert(compareEntries2, player.Name)
				end
			end

			table.sort(compareEntries2)
		end

		xorValue37 = bit32.bxor(sum23, 0)
		UpdatePlayerList()

		local PlayerDropdown = addLeftGroupboxResult9:AddDropdown("PlayerDropdown", {
			Values = compareEntries2,
			Default = "",
			Text = "Pilih Player",
			Tooltip = "TP ke player yang di pilih",
			Callback = function(valueValue9)
				valueValue8 = valueValue9
			end,
		})

		sum24 = sum23 + combinedBits4

		addLeftGroupboxResult9:AddButton({
			Text = "Refresh Player",
			Func = function()
				UpdatePlayerList()

				if PlayerDropdown then
					PlayerDropdown:SetValues(compareEntries2)
				end

				lib:Notify({ Title = "Teleport", Description = "List player direfresh! (" .. #compareEntries2 .. " player)", Time = 3 })
			end,
		})

		addLeftGroupboxResult9:AddButton({
			Text = "Teleport ke player yang dipilih",
			Func = function()
				if not valueValue8 or valueValue8 == "" then
					lib:Notify({ Title = "Error", Description = "Pilih pemain terlebih dulu!", Time = 3 })
					return
				end
				local findFirstChildResult2 = Players:FindFirstChild(valueValue8)

				if findFirstChildResult2 and findFirstChildResult2.Character and findFirstChildResult2.Character:FindFirstChild("HumanoidRootPart") then
					local character = localPlayerValue.Character

					if character and character:FindFirstChild("HumanoidRootPart") then
						character.HumanoidRootPart.CFrame = findFirstChildResult2.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
					end
				end
			end,
		})
	end

	TeleportToPart = function(inputValue3)
		if not inputValue3 then
			return
		end
		local character = localPlayerValue.Character
		character = character and character:FindFirstChild("HumanoidRootPart")

		if character then
			if inputValue3:IsA("BasePart") then
				character.CFrame = inputValue3.CFrame + Vector3.new(0, 3, 0)
			elseif inputValue3:IsA("Model") then
				local basePart = inputValue3:FindFirstChildWhichIsA("BasePart")

				if basePart then
					character.CFrame = basePart.CFrame + Vector3.new(0, 3, 0)
				end
			end

			lib:Notify({ Title = "Teleport", Description = "Berhasil!", Time = 1 })
		end
	end

	do
		local addRightGroupboxResult11 = tabs.Teleport:AddRightGroupbox("Teleport Maps", "map")
		genIndex = 1
		hookIndex = 1
		gateIndex = 1
		palletIndex = 1
		windowIndex = 1

		TeleportToGenerator = function()
			if #espCache.Generators == 0 then
				ScanMap()
			end

			local genIndexValue = genIndex
			local espCache2 = espCache

			if #(espCache2 and espCache2.Generators) < genIndexValue then
				genIndex = 1
			end

			local entry = espCache.Generators[genIndex]

			if entry and entry.part then
				TeleportToPart(entry.part)
				lib:Notify({ Title = "TP Generator", Description = "Generator " .. genIndex, Time = 1.2 })
			else
				lib:Notify({ Title = "TP Generator", Description = "Generator tidak ditemukan!", Time = 2 })
			end

			genIndex = genIndex + 1
		end

		addRightGroupboxResult11:AddButton({ Text = "TP Generator", Func = TeleportToGenerator })

		addRightGroupboxResult11:AddLabel("Keybind TP Gen"):AddKeyPicker("Key_TPGen", {
			Default = "I",
			SyncToggleState = false,
			Mode = "Toggle",
			Text = "Teleport ke Generator",
			NoUI = false,
		})

		options.Key_TPGen:OnClick(function()
			TeleportToGenerator()
		end)

		addRightGroupboxResult11:AddButton({
			Text = "TP Hook (Loop)",
			Func = function()
				if #espCache.Hooks == 0 then
					ScanMap()
				end

				if hookIndex > #espCache.Hooks then
					hookIndex = 1
				end

				local hookPoint = espCache.Hooks[hookIndex]

				if hookPoint then
					hookPoint = hookPoint:FindFirstChild("HookPoint") or hookPoint:FindFirstChildWhichIsA("BasePart")
				end

				if hookPoint then
					TeleportToPart(hookPoint)
				end

				hookIndex = hookIndex + 1
			end,
		})

		local addButton = addRightGroupboxResult11.AddButton
		local entries24 = { Text = "TP Gate (Loop)" }
		local xorValue39 = xorValue37 + 463263976

		local function func()
			if #espCache.Gates == 0 then
				ScanMap()
			end

			if #espCache.Gates < gateIndex then
				gateIndex = 1
			end

			local gates = espCache.Gates
			local gateIndexValue = gateIndex
			bit32.bxor(xorValue39, 0)
			local basePart = gates[gateIndexValue]
			basePart = basePart and basePart:FindFirstChildWhichIsA("BasePart")

			if basePart then
				TeleportToPart(basePart)
			end

			gateIndex = gateIndex + 1
		end

		local xorValue40 = bit32.bxor(sum24, 4212897375)
		xorValue39 = bit32.bxor(xorValue39, xorValue40)
		entries24.Func = func
		addButton(addRightGroupboxResult11, entries24)

		addRightGroupboxResult11:AddButton({
			Text = "TP Pallet (Loop)",
			Func = function()
				if #espCache.Pallets == 0 then
					ScanMap()
				end

				if palletIndex > #espCache.Pallets then
					palletIndex = 1
				end

				local primaryPartPallet = espCache.Pallets[palletIndex]

				if primaryPartPallet then
					primaryPartPallet = primaryPartPallet:FindFirstChild("PrimaryPartPallet") or primaryPartPallet:FindFirstChildWhichIsA("BasePart")
				end

				if primaryPartPallet then
					TeleportToPart(primaryPartPallet)
				end

				palletIndex = palletIndex + 1
			end,
		})

		addRightGroupboxResult11:AddButton({
			Text = "TP Window (Loop)",
			Func = function()
				if #espCache.Windows == 0 then
					ScanMap()
				end

				if #espCache.Windows < windowIndex then
					windowIndex = 1
				end

				local entry = espCache.Windows[windowIndex]
				local bottom = entry and (entry:FindFirstChild("Bottom") or entry:FindFirstChildWhichIsA("BasePart"))

				if bottom then
					TeleportToPart(bottom)
				end

				windowIndex = windowIndex + 1
			end,
		})

		addRightGroupboxResult11:AddButton({
			Text = "Refresh Map",
			Func = function()
				ForceRefreshMap()
			end,
		})
	end

	localPlayer.CharacterAdded:Connect(function()
		HeartbeatConnection:Disconnect()
		VisibilityConnection:Disconnect()
		task.wait(1.2)
		ReapplyPerformance()
		task.wait(1)
		ScanMap()
		genIndex = 1
		hookIndex = 1
		gateIndex = 1
		palletIndex = 1
		windowIndex = 1

		if Config.ESP_Master then
			task.spawn(function()
				task.wait(1)
				ForceRefreshMap()
			end)
		end

		if Config.Surv_InstanSkillCheck then
			task.spawn(function()
				local character = localPlayer.Character
				local skillcheckGen = character:WaitForChild("Skillcheck-gen", 3)
				local skillcheckPlayer = character:WaitForChild("Skillcheck-player", 3)

				if skillcheckGen then
					skillcheckGen.Disabled = true
				end

				if skillcheckPlayer then
					skillcheckPlayer.Disabled = true
				end
			end)
		end
	end)

	do
		local pairsValue = pairs
		local xorValue41 = bit32.bxor(sum24, 0)

		for _, player in pairsValue(Players:GetPlayers()) do
			SetupPlayer(player)
		end
	end

	Players.PlayerAdded:Connect(SetupPlayer)

	task.spawn(function()
		while true do
			task.wait(5)

			for _, player in pairs(Players:GetPlayers()) do
				TryAttach(player)
			end
		end
	end)

	do
		local invertedFlag2 = false
		local connection = nil

		UserInputService.InputBegan:Connect(function(input, gameProcessed)
			if gameProcessed then
				return
			end

			if input.KeyCode == Enum.KeyCode.RightAlt then
				invertedFlag2 = not invertedFlag2

				if invertedFlag2 then
					UserInputService.MouseIconEnabled = true
					UserInputService.MouseBehavior = Enum.MouseBehavior.Default

					if connection then
						connection:Disconnect()
					end

					connection = RunService.RenderStepped:Connect(function()
						if UserInputService.MouseBehavior ~= Enum.MouseBehavior.Default then
							UserInputService.MouseBehavior = Enum.MouseBehavior.Default
						end

						if not UserInputService.MouseIconEnabled then
							UserInputService.MouseIconEnabled = true
						end
					end)
				else
					if connection then
						connection:Disconnect()
					end

					connection = nil
					UserInputService.MouseIconEnabled = false
					UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
				end
			end
		end)
	end

	getKillerTargetForFlash = function()
		local character = localPlayer.Character
		character = character and character:FindFirstChild("HumanoidRootPart")
		if not character then
			return nil
		end
		local huge = math.huge
		local humanoidRootPartValue = nil

		for _, player in ipairs(Players:GetPlayers()) do
			if player ~= localPlayer and IsKiller(player) and player.Character then
				local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
				local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")

				if humanoid and humanoid.Health > 0 and humanoidRootPart and not IsDowned(player.Character) then
					local magnitude = (humanoidRootPart.Position - character.Position).Magnitude

					if magnitude < huge then
						huge = magnitude
						humanoidRootPartValue = humanoidRootPart
					end
				end
			end
		end

		return humanoidRootPartValue
	end

	NEX_UpdateCureFlaskLaser = function()
		local difference14 = 2312375342
		local sum25 = 1466909230
		local character = game:GetService("Players").LocalPlayer.Character
		if not character then
			return
		end
		local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
		local leftHand = nil
		local item = nil

		if humanoidRootPart then
			leftHand = character:FindFirstChild("LeftHand") or character:FindFirstChild("Left Arm")
			leftHand = leftHand and leftHand.Position or humanoidRootPart.Position
			local pairsValue2 = pairs
			local gameValue = game
			local shiftedBits = bit32.rshift(sum25, 10)
			local Players2 = gameValue:GetService("Players")
			local huge = math.huge
			local item2 = nil

			for _, player in pairsValue2(Players2:GetPlayers()) do
				if player ~= game:GetService("Players").LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and not player.Character:GetAttribute("IsKiller") then
					local magnitude = (player.Character.HumanoidRootPart.Position - humanoidRootPart.Position).Magnitude

					if magnitude < huge then
						huge = magnitude
						item2 = player
					end
				end
			end

			sum25 = shiftedBits + 1465476702
			item = item2
		end

		local position = nil

		if item then
			position = item.Character.HumanoidRootPart.Position
		end

		local enabledValue20 = false

		for _, child in pairs(character:GetChildren()) do
			if child:IsA("LocalScript") and child:GetAttribute("action") == true then
				enabledValue20 = true
				break
			end
		end

		if leftHand and position and enabledValue20 then
			if not getgenv().NEX_CureFlaskLaserPart then
				local part2 = Instance.new("Part")
				part2.Name = "FlaskSilentAimLaser"
				part2.Anchored = true
				part2.CanCollide = false
				part2.CanTouch = false
				part2.CastShadow = false
				part2.Material = Enum.Material.Neon
				part2.Color = Color3.new(1, 0.19607843458652496, 0.19607843458652496)
				part2.Transparency = 0
				part2.Parent = workspace
				getgenv().NEX_CureFlaskLaserPart = part2
				difference14 = bit32.bxor(difference14, sum25) - 1424441810
			end

			local magnitude = (position - leftHand).Magnitude

			if magnitude > 0.1 then
				local nexCureFlaskLaserPart = getgenv().NEX_CureFlaskLaserPart
				local vector = Vector3.new(0.16, 0.16, magnitude)
				local quotient6 = difference14 // sum25
				nexCureFlaskLaserPart.Size = vector
				nexCureFlaskLaserPart.CFrame = CFrame.new((leftHand + position) / 2, position)
				nexCureFlaskLaserPart.Transparency = 0
				bit32.bxor(quotient6, 2312375343)
			end
		elseif getgenv().NEX_CureFlaskLaserPart then
			getgenv().NEX_CureFlaskLaserPart.Transparency = 1
		end
	end

	NEX_StartCureFlaskLaser = function()
		if getgenv().NEX_CureFlaskLaserThread then
			return
		end

		getgenv().NEX_CureFlaskLaserThread = game:GetService("RunService").RenderStepped:Connect(function()
			if not vd.KILLER_FlaskLaser then
				if getgenv().NEX_CureFlaskLaserPart then
					pcall(function()
						getgenv().NEX_CureFlaskLaserPart:Destroy()
					end)

					getgenv().NEX_CureFlaskLaserPart = nil
				end

				if getgenv().NEX_CureFlaskLaserThread then
					getgenv().NEX_CureFlaskLaserThread:Disconnect()
					getgenv().NEX_CureFlaskLaserThread = nil
				end

				return
			end

			pcall(NEX_UpdateCureFlaskLaser)
		end)
	end

	NEX_StartJeffCooldownBypass = function()
		if getgenv().NEX_JeffCooldownBypassThread then
			return
		end

		getgenv().NEX_JeffCooldownBypassThread = task.spawn(function()
			local localPlayerValue2 = localPlayer

			while vd.KILLER_InfFrenzy do
				pcall(function()
					local character = localPlayerValue2.Character

					if character and character:GetAttribute("Frenzy") ~= true then
						character:SetAttribute("Frenzy", true)
					end
				end)

				task.wait(0.1)
			end

			getgenv().NEX_JeffCooldownBypassThread = nil
		end)
	end

	NEX_StopJeffCooldownBypass = function()
		pcall(function()
			local character = localPlayer.Character

			if character and character:GetAttribute("Frenzy") == true then
				character:SetAttribute("Frenzy", false)
				local killer = ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("Killers") and ReplicatedStorage.Remotes.Killers:FindFirstChild("Killer")

				if killer then
					local deactivatefromclient = killer:FindFirstChild("Deactivatefromclient")

					if deactivatefromclient then
						deactivatefromclient:FireServer()
					end
				end
			end
		end)
	end

	NEX_StartJasonPursuitBypass = function()
		if thread then
			return
		end

		thread = task.spawn(function()
			local localPlayerValue2 = localPlayer

			while vd.KILLER_InfPursuit do
				pcall(function()
					local character = localPlayerValue2.Character

					if character and character:GetAttribute("Pursuit") ~= true then
						character:SetAttribute("Pursuit", true)
					end
				end)

				task.wait(0.1)
			end

			thread = nil
		end)
	end

	NEX_StopJasonPursuitBypass = function()
		pcall(function()
			local character = localPlayer.Character

			if character and character:GetAttribute("Pursuit") == true then
				character:SetAttribute("Pursuit", false)
				local jason = ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("Killers") and ReplicatedStorage.Remotes.Killers:FindFirstChild("Jason")

				if jason then
					local deactivatefromclient = jason:FindFirstChild("Deactivatefromclient")

					if deactivatefromclient then
						deactivatefromclient:FireServer()
					end
				end
			end
		end)
	end

	NEX_StartJasonLakeMistBypass = function()
	end

	do
		local function stopJasonLakeMistBypass()
			vd.KILLER_InfLakeMist = false
			task.cancel(InfLakeMistThread)
			InfLakeMistThread = nil

			pcall(function()
				local character = localPlayer.Character

				if character then
					character:SetAttribute("LakeMist", false)
					character:SetAttribute("speedboost", 1)
				end
			end)
		end

		local xorValue42 = bit32.bxor(sum24, 0)
		bit32.bxor(xorValue37, xorValue42)
		NEX_StopJasonLakeMistBypass = stopJasonLakeMistBypass
	end

	local function taskCallback2()
		while true do
			task.wait(0.5)
			local character = localPlayer.Character

			if character then
				local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
				if not humanoidRootPart then
					continue
				end
				local enabledValue20 = false

				for _, player in ipairs(Players:GetPlayers()) do
					if player ~= localPlayer and player.Team and player.Team.Name == "Survivors" then
						local humanoidRootPart2 = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
						if humanoidRootPart2 and (humanoidRootPart.Position - humanoidRootPart2.Position).Magnitude <= 15 then
							enabledValue20 = true
							break
						end
					end
				end

				if enabledValue20 then
					local entry = entries2[math.random(1, #entries2)]
					local animation = Instance.new("Animation")
					animation.AnimationId = "rbxassetid://" .. entry
					local humanoid = character:FindFirstChildOfClass("Humanoid")
					local animator = humanoid and humanoid:FindFirstChildOfClass("Animator")

					if animator then
						local loadAnimationResult = animator:LoadAnimation(animation)
						loadAnimationResult:Play()
						loadAnimationResult:AdjustWeight(0)
						task.wait(0.05)
						loadAnimationResult:Stop()
						animation:Destroy()
					end
				end
			end
		end
	end

	task.spawn(taskCallback2)

	task.spawn(function()
		if not game:IsLoaded() then
			game.Loaded:Wait()
		end

		local valueValue9 = nil
		local numberValue3 = 0

		while not valueValue9 and numberValue3 < 10 do
			numberValue3 += 1

			local ok, result = pcall(function()
				local modules = ReplicatedStorage:WaitForChild("Modules", 5)
				if not modules then
					return nil
				end
				local survivors = modules:WaitForChild("Survivors", 5)
				if not survivors then
					return nil
				end
				local survivorAnimationsController = survivors:WaitForChild("SurvivorAnimationsController", 5)
				if not survivorAnimationsController then
					return nil
				end
				return require(survivorAnimationsController)
			end)

			if ok and result then
				valueValue9 = result
			else
				task.wait(1)
			end
		end

		if not valueValue9 then
			return
		end
		local isFacingStraightEnough = valueValue9._isFacingStraightEnough

		valueValue9._isFacingStraightEnough = function(inputValue3, inputValue4, inputValue5, inputValue6)
			if Config.Surv_PerfectVault then
				inputValue3.characterspeed = 20
				return true, 0
			end
			return isFacingStraightEnough(inputValue3, inputValue4, inputValue5, inputValue6)
		end

		local onVaultAnimation = valueValue9._onVaultAnimation

		valueValue9._onVaultAnimation = function(inputValue3, inputValue4, inputValue5)
			if Config.Surv_PerfectVault then
				return onVaultAnimation(inputValue3, inputValue4, true)
			end
			return onVaultAnimation(inputValue3, inputValue4, inputValue5)
		end
	end)

	setupSpearInterceptor = function()
	end

	setupSpearInterceptor()
	lib.CantDragForced = false
	lib2:SetLibrary(lib)
	lib3:SetLibrary(lib)
	lib3:IgnoreThemeSettings()
	lib3:SetIgnoreIndexes({ "MenuKeybind" })
	lib2:SetFolder("Ascend Official")
	lib3:SetFolder("Ascend Official/FullFeature")
	lib3:BuildConfigSection(tabs["UI Settings"])
	lib2:ApplyToTab(tabs["UI Settings"])
	lib3:LoadAutoloadConfig()
	lib:Notify({ Title = "Ascend Official Hub", Description = "Berhasil Dimuat!", Time = 3 })
end

callbackValue(193314489)
