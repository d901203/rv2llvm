; ModuleID = 'qsort.c'
source_filename = "qsort.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64-unknown-unknown"

@.str = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @qsort(ptr noundef %0, i64 noundef %1, i64 noundef %2, ptr noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca i64, align 8
  %17 = alloca i64, align 8
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i64, align 8
  %23 = alloca i32, align 4
  %24 = alloca i64, align 8
  %25 = alloca i32, align 4
  %26 = alloca i64, align 8
  %27 = alloca i32, align 4
  %28 = alloca i64, align 8
  %29 = alloca i32, align 4
  %30 = alloca i64, align 8
  %31 = alloca i32, align 4
  %32 = alloca i64, align 8
  %33 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store i64 %1, ptr %6, align 8
  store i64 %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  br label %34

34:                                               ; preds = %609, %4
  %35 = load ptr, ptr %5, align 8
  %36 = ptrtoint ptr %35 to i64
  %37 = sub i64 %36, 0
  %38 = urem i64 %37, 8
  %39 = icmp ne i64 %38, 0
  br i1 %39, label %44, label %40

40:                                               ; preds = %34
  %41 = load i64, ptr %7, align 8
  %42 = urem i64 %41, 8
  %43 = icmp ne i64 %42, 0
  br i1 %43, label %44, label %45

44:                                               ; preds = %40, %34
  br label %50

45:                                               ; preds = %40
  %46 = load i64, ptr %7, align 8
  %47 = icmp eq i64 %46, 8
  %48 = zext i1 %47 to i64
  %49 = select i1 %47, i32 0, i32 1
  br label %50

50:                                               ; preds = %45, %44
  %51 = phi i32 [ 2, %44 ], [ %49, %45 ]
  store i32 %51, ptr %19, align 4
  %52 = load ptr, ptr %5, align 8
  %53 = ptrtoint ptr %52 to i64
  %54 = sub i64 %53, 0
  %55 = urem i64 %54, 4
  %56 = icmp ne i64 %55, 0
  br i1 %56, label %61, label %57

57:                                               ; preds = %50
  %58 = load i64, ptr %7, align 8
  %59 = urem i64 %58, 4
  %60 = icmp ne i64 %59, 0
  br i1 %60, label %61, label %62

61:                                               ; preds = %57, %50
  br label %67

62:                                               ; preds = %57
  %63 = load i64, ptr %7, align 8
  %64 = icmp eq i64 %63, 4
  %65 = zext i1 %64 to i64
  %66 = select i1 %64, i32 0, i32 1
  br label %67

67:                                               ; preds = %62, %61
  %68 = phi i32 [ 2, %61 ], [ %66, %62 ]
  store i32 %68, ptr %20, align 4
  store i32 0, ptr %21, align 4
  %69 = load i64, ptr %6, align 8
  %70 = icmp ult i64 %69, 7
  br i1 %70, label %71, label %157

71:                                               ; preds = %67
  %72 = load ptr, ptr %5, align 8
  %73 = load i64, ptr %7, align 8
  %74 = getelementptr inbounds i8, ptr %72, i64 %73
  store ptr %74, ptr %14, align 8
  br label %75

75:                                               ; preds = %152, %71
  %76 = load ptr, ptr %14, align 8
  %77 = load ptr, ptr %5, align 8
  %78 = load i64, ptr %6, align 8
  %79 = load i64, ptr %7, align 8
  %80 = mul i64 %78, %79
  %81 = getelementptr inbounds i8, ptr %77, i64 %80
  %82 = icmp ult ptr %76, %81
  br i1 %82, label %83, label %156

83:                                               ; preds = %75
  %84 = load ptr, ptr %14, align 8
  store ptr %84, ptr %13, align 8
  br label %85

85:                                               ; preds = %146, %83
  %86 = load ptr, ptr %13, align 8
  %87 = load ptr, ptr %5, align 8
  %88 = icmp ugt ptr %86, %87
  br i1 %88, label %89, label %98

89:                                               ; preds = %85
  %90 = load ptr, ptr %8, align 8
  %91 = load ptr, ptr %13, align 8
  %92 = load i64, ptr %7, align 8
  %93 = sub i64 0, %92
  %94 = getelementptr inbounds i8, ptr %91, i64 %93
  %95 = load ptr, ptr %13, align 8
  %96 = call signext i32 %90(ptr noundef %94, ptr noundef %95)
  %97 = icmp sgt i32 %96, 0
  br label %98

98:                                               ; preds = %89, %85
  %99 = phi i1 [ false, %85 ], [ %97, %89 ]
  br i1 %99, label %100, label %151

100:                                              ; preds = %98
  %101 = load i32, ptr %19, align 4
  %102 = icmp eq i32 %101, 0
  br i1 %102, label %103, label %117

103:                                              ; preds = %100
  %104 = load ptr, ptr %13, align 8
  %105 = load i64, ptr %104, align 8
  store i64 %105, ptr %22, align 8
  %106 = load ptr, ptr %13, align 8
  %107 = load i64, ptr %7, align 8
  %108 = sub i64 0, %107
  %109 = getelementptr inbounds i8, ptr %106, i64 %108
  %110 = load i64, ptr %109, align 8
  %111 = load ptr, ptr %13, align 8
  store i64 %110, ptr %111, align 8
  %112 = load i64, ptr %22, align 8
  %113 = load ptr, ptr %13, align 8
  %114 = load i64, ptr %7, align 8
  %115 = sub i64 0, %114
  %116 = getelementptr inbounds i8, ptr %113, i64 %115
  store i64 %112, ptr %116, align 8
  br label %145

117:                                              ; preds = %100
  %118 = load i32, ptr %20, align 4
  %119 = icmp eq i32 %118, 0
  br i1 %119, label %120, label %134

120:                                              ; preds = %117
  %121 = load ptr, ptr %13, align 8
  %122 = load i32, ptr %121, align 4
  store i32 %122, ptr %23, align 4
  %123 = load ptr, ptr %13, align 8
  %124 = load i64, ptr %7, align 8
  %125 = sub i64 0, %124
  %126 = getelementptr inbounds i8, ptr %123, i64 %125
  %127 = load i32, ptr %126, align 4
  %128 = load ptr, ptr %13, align 8
  store i32 %127, ptr %128, align 4
  %129 = load i32, ptr %23, align 4
  %130 = load ptr, ptr %13, align 8
  %131 = load i64, ptr %7, align 8
  %132 = sub i64 0, %131
  %133 = getelementptr inbounds i8, ptr %130, i64 %132
  store i32 %129, ptr %133, align 4
  br label %144

134:                                              ; preds = %117
  %135 = load ptr, ptr %13, align 8
  %136 = load ptr, ptr %13, align 8
  %137 = load i64, ptr %7, align 8
  %138 = sub i64 0, %137
  %139 = getelementptr inbounds i8, ptr %136, i64 %138
  %140 = load i64, ptr %7, align 8
  %141 = trunc i64 %140 to i32
  %142 = load i32, ptr %19, align 4
  %143 = load i32, ptr %20, align 4
  call void @swapfunc(ptr noundef %135, ptr noundef %139, i32 noundef signext %141, i32 noundef signext %142, i32 noundef signext %143)
  br label %144

144:                                              ; preds = %134, %120
  br label %145

145:                                              ; preds = %144, %103
  br label %146

146:                                              ; preds = %145
  %147 = load i64, ptr %7, align 8
  %148 = load ptr, ptr %13, align 8
  %149 = sub i64 0, %147
  %150 = getelementptr inbounds i8, ptr %148, i64 %149
  store ptr %150, ptr %13, align 8
  br label %85, !llvm.loop !6

151:                                              ; preds = %98
  br label %152

152:                                              ; preds = %151
  %153 = load i64, ptr %7, align 8
  %154 = load ptr, ptr %14, align 8
  %155 = getelementptr inbounds i8, ptr %154, i64 %153
  store ptr %155, ptr %14, align 8
  br label %75, !llvm.loop !8

156:                                              ; preds = %75
  br label %617

157:                                              ; preds = %67
  %158 = load ptr, ptr %5, align 8
  %159 = load i64, ptr %6, align 8
  %160 = udiv i64 %159, 2
  %161 = load i64, ptr %7, align 8
  %162 = mul i64 %160, %161
  %163 = getelementptr inbounds i8, ptr %158, i64 %162
  store ptr %163, ptr %14, align 8
  %164 = load i64, ptr %6, align 8
  %165 = icmp ugt i64 %164, 7
  br i1 %165, label %166, label %219

166:                                              ; preds = %157
  %167 = load ptr, ptr %5, align 8
  store ptr %167, ptr %13, align 8
  %168 = load ptr, ptr %5, align 8
  %169 = load i64, ptr %6, align 8
  %170 = sub i64 %169, 1
  %171 = load i64, ptr %7, align 8
  %172 = mul i64 %170, %171
  %173 = getelementptr inbounds i8, ptr %168, i64 %172
  store ptr %173, ptr %15, align 8
  %174 = load i64, ptr %6, align 8
  %175 = icmp ugt i64 %174, 40
  br i1 %175, label %176, label %213

176:                                              ; preds = %166
  %177 = load i64, ptr %6, align 8
  %178 = udiv i64 %177, 8
  %179 = load i64, ptr %7, align 8
  %180 = mul i64 %178, %179
  store i64 %180, ptr %16, align 8
  %181 = load ptr, ptr %13, align 8
  %182 = load ptr, ptr %13, align 8
  %183 = load i64, ptr %16, align 8
  %184 = getelementptr inbounds i8, ptr %182, i64 %183
  %185 = load ptr, ptr %13, align 8
  %186 = load i64, ptr %16, align 8
  %187 = mul i64 2, %186
  %188 = getelementptr inbounds i8, ptr %185, i64 %187
  %189 = load ptr, ptr %8, align 8
  %190 = call ptr @med3(ptr noundef %181, ptr noundef %184, ptr noundef %188, ptr noundef %189)
  store ptr %190, ptr %13, align 8
  %191 = load ptr, ptr %14, align 8
  %192 = load i64, ptr %16, align 8
  %193 = sub i64 0, %192
  %194 = getelementptr inbounds i8, ptr %191, i64 %193
  %195 = load ptr, ptr %14, align 8
  %196 = load ptr, ptr %14, align 8
  %197 = load i64, ptr %16, align 8
  %198 = getelementptr inbounds i8, ptr %196, i64 %197
  %199 = load ptr, ptr %8, align 8
  %200 = call ptr @med3(ptr noundef %194, ptr noundef %195, ptr noundef %198, ptr noundef %199)
  store ptr %200, ptr %14, align 8
  %201 = load ptr, ptr %15, align 8
  %202 = load i64, ptr %16, align 8
  %203 = mul i64 2, %202
  %204 = sub i64 0, %203
  %205 = getelementptr inbounds i8, ptr %201, i64 %204
  %206 = load ptr, ptr %15, align 8
  %207 = load i64, ptr %16, align 8
  %208 = sub i64 0, %207
  %209 = getelementptr inbounds i8, ptr %206, i64 %208
  %210 = load ptr, ptr %15, align 8
  %211 = load ptr, ptr %8, align 8
  %212 = call ptr @med3(ptr noundef %205, ptr noundef %209, ptr noundef %210, ptr noundef %211)
  store ptr %212, ptr %15, align 8
  br label %213

213:                                              ; preds = %176, %166
  %214 = load ptr, ptr %13, align 8
  %215 = load ptr, ptr %14, align 8
  %216 = load ptr, ptr %15, align 8
  %217 = load ptr, ptr %8, align 8
  %218 = call ptr @med3(ptr noundef %214, ptr noundef %215, ptr noundef %216, ptr noundef %217)
  store ptr %218, ptr %14, align 8
  br label %219

219:                                              ; preds = %213, %157
  %220 = load i32, ptr %19, align 4
  %221 = icmp eq i32 %220, 0
  br i1 %221, label %222, label %230

222:                                              ; preds = %219
  %223 = load ptr, ptr %5, align 8
  %224 = load i64, ptr %223, align 8
  store i64 %224, ptr %24, align 8
  %225 = load ptr, ptr %14, align 8
  %226 = load i64, ptr %225, align 8
  %227 = load ptr, ptr %5, align 8
  store i64 %226, ptr %227, align 8
  %228 = load i64, ptr %24, align 8
  %229 = load ptr, ptr %14, align 8
  store i64 %228, ptr %229, align 8
  br label %249

230:                                              ; preds = %219
  %231 = load i32, ptr %20, align 4
  %232 = icmp eq i32 %231, 0
  br i1 %232, label %233, label %241

233:                                              ; preds = %230
  %234 = load ptr, ptr %5, align 8
  %235 = load i32, ptr %234, align 4
  store i32 %235, ptr %25, align 4
  %236 = load ptr, ptr %14, align 8
  %237 = load i32, ptr %236, align 4
  %238 = load ptr, ptr %5, align 8
  store i32 %237, ptr %238, align 4
  %239 = load i32, ptr %25, align 4
  %240 = load ptr, ptr %14, align 8
  store i32 %239, ptr %240, align 4
  br label %248

241:                                              ; preds = %230
  %242 = load ptr, ptr %5, align 8
  %243 = load ptr, ptr %14, align 8
  %244 = load i64, ptr %7, align 8
  %245 = trunc i64 %244 to i32
  %246 = load i32, ptr %19, align 4
  %247 = load i32, ptr %20, align 4
  call void @swapfunc(ptr noundef %242, ptr noundef %243, i32 noundef signext %245, i32 noundef signext %246, i32 noundef signext %247)
  br label %248

248:                                              ; preds = %241, %233
  br label %249

249:                                              ; preds = %248, %222
  %250 = load ptr, ptr %5, align 8
  %251 = load i64, ptr %7, align 8
  %252 = getelementptr inbounds i8, ptr %250, i64 %251
  store ptr %252, ptr %10, align 8
  store ptr %252, ptr %9, align 8
  %253 = load ptr, ptr %5, align 8
  %254 = load i64, ptr %6, align 8
  %255 = sub i64 %254, 1
  %256 = load i64, ptr %7, align 8
  %257 = mul i64 %255, %256
  %258 = getelementptr inbounds i8, ptr %253, i64 %257
  store ptr %258, ptr %12, align 8
  store ptr %258, ptr %11, align 8
  br label %259

259:                                              ; preds = %404, %249
  br label %260

260:                                              ; preds = %309, %259
  %261 = load ptr, ptr %10, align 8
  %262 = load ptr, ptr %11, align 8
  %263 = icmp ule ptr %261, %262
  br i1 %263, label %264, label %270

264:                                              ; preds = %260
  %265 = load ptr, ptr %8, align 8
  %266 = load ptr, ptr %10, align 8
  %267 = load ptr, ptr %5, align 8
  %268 = call signext i32 %265(ptr noundef %266, ptr noundef %267)
  store i32 %268, ptr %18, align 4
  %269 = icmp sle i32 %268, 0
  br label %270

270:                                              ; preds = %264, %260
  %271 = phi i1 [ false, %260 ], [ %269, %264 ]
  br i1 %271, label %272, label %313

272:                                              ; preds = %270
  %273 = load i32, ptr %18, align 4
  %274 = icmp eq i32 %273, 0
  br i1 %274, label %275, label %309

275:                                              ; preds = %272
  store i32 1, ptr %21, align 4
  %276 = load i32, ptr %19, align 4
  %277 = icmp eq i32 %276, 0
  br i1 %277, label %278, label %286

278:                                              ; preds = %275
  %279 = load ptr, ptr %9, align 8
  %280 = load i64, ptr %279, align 8
  store i64 %280, ptr %26, align 8
  %281 = load ptr, ptr %10, align 8
  %282 = load i64, ptr %281, align 8
  %283 = load ptr, ptr %9, align 8
  store i64 %282, ptr %283, align 8
  %284 = load i64, ptr %26, align 8
  %285 = load ptr, ptr %10, align 8
  store i64 %284, ptr %285, align 8
  br label %305

286:                                              ; preds = %275
  %287 = load i32, ptr %20, align 4
  %288 = icmp eq i32 %287, 0
  br i1 %288, label %289, label %297

289:                                              ; preds = %286
  %290 = load ptr, ptr %9, align 8
  %291 = load i32, ptr %290, align 4
  store i32 %291, ptr %27, align 4
  %292 = load ptr, ptr %10, align 8
  %293 = load i32, ptr %292, align 4
  %294 = load ptr, ptr %9, align 8
  store i32 %293, ptr %294, align 4
  %295 = load i32, ptr %27, align 4
  %296 = load ptr, ptr %10, align 8
  store i32 %295, ptr %296, align 4
  br label %304

297:                                              ; preds = %286
  %298 = load ptr, ptr %9, align 8
  %299 = load ptr, ptr %10, align 8
  %300 = load i64, ptr %7, align 8
  %301 = trunc i64 %300 to i32
  %302 = load i32, ptr %19, align 4
  %303 = load i32, ptr %20, align 4
  call void @swapfunc(ptr noundef %298, ptr noundef %299, i32 noundef signext %301, i32 noundef signext %302, i32 noundef signext %303)
  br label %304

304:                                              ; preds = %297, %289
  br label %305

305:                                              ; preds = %304, %278
  %306 = load i64, ptr %7, align 8
  %307 = load ptr, ptr %9, align 8
  %308 = getelementptr inbounds i8, ptr %307, i64 %306
  store ptr %308, ptr %9, align 8
  br label %309

309:                                              ; preds = %305, %272
  %310 = load i64, ptr %7, align 8
  %311 = load ptr, ptr %10, align 8
  %312 = getelementptr inbounds i8, ptr %311, i64 %310
  store ptr %312, ptr %10, align 8
  br label %260, !llvm.loop !9

313:                                              ; preds = %270
  br label %314

314:                                              ; preds = %364, %313
  %315 = load ptr, ptr %10, align 8
  %316 = load ptr, ptr %11, align 8
  %317 = icmp ule ptr %315, %316
  br i1 %317, label %318, label %324

318:                                              ; preds = %314
  %319 = load ptr, ptr %8, align 8
  %320 = load ptr, ptr %11, align 8
  %321 = load ptr, ptr %5, align 8
  %322 = call signext i32 %319(ptr noundef %320, ptr noundef %321)
  store i32 %322, ptr %18, align 4
  %323 = icmp sge i32 %322, 0
  br label %324

324:                                              ; preds = %318, %314
  %325 = phi i1 [ false, %314 ], [ %323, %318 ]
  br i1 %325, label %326, label %369

326:                                              ; preds = %324
  %327 = load i32, ptr %18, align 4
  %328 = icmp eq i32 %327, 0
  br i1 %328, label %329, label %364

329:                                              ; preds = %326
  store i32 1, ptr %21, align 4
  %330 = load i32, ptr %19, align 4
  %331 = icmp eq i32 %330, 0
  br i1 %331, label %332, label %340

332:                                              ; preds = %329
  %333 = load ptr, ptr %11, align 8
  %334 = load i64, ptr %333, align 8
  store i64 %334, ptr %28, align 8
  %335 = load ptr, ptr %12, align 8
  %336 = load i64, ptr %335, align 8
  %337 = load ptr, ptr %11, align 8
  store i64 %336, ptr %337, align 8
  %338 = load i64, ptr %28, align 8
  %339 = load ptr, ptr %12, align 8
  store i64 %338, ptr %339, align 8
  br label %359

340:                                              ; preds = %329
  %341 = load i32, ptr %20, align 4
  %342 = icmp eq i32 %341, 0
  br i1 %342, label %343, label %351

343:                                              ; preds = %340
  %344 = load ptr, ptr %11, align 8
  %345 = load i32, ptr %344, align 4
  store i32 %345, ptr %29, align 4
  %346 = load ptr, ptr %12, align 8
  %347 = load i32, ptr %346, align 4
  %348 = load ptr, ptr %11, align 8
  store i32 %347, ptr %348, align 4
  %349 = load i32, ptr %29, align 4
  %350 = load ptr, ptr %12, align 8
  store i32 %349, ptr %350, align 4
  br label %358

351:                                              ; preds = %340
  %352 = load ptr, ptr %11, align 8
  %353 = load ptr, ptr %12, align 8
  %354 = load i64, ptr %7, align 8
  %355 = trunc i64 %354 to i32
  %356 = load i32, ptr %19, align 4
  %357 = load i32, ptr %20, align 4
  call void @swapfunc(ptr noundef %352, ptr noundef %353, i32 noundef signext %355, i32 noundef signext %356, i32 noundef signext %357)
  br label %358

358:                                              ; preds = %351, %343
  br label %359

359:                                              ; preds = %358, %332
  %360 = load i64, ptr %7, align 8
  %361 = load ptr, ptr %12, align 8
  %362 = sub i64 0, %360
  %363 = getelementptr inbounds i8, ptr %361, i64 %362
  store ptr %363, ptr %12, align 8
  br label %364

364:                                              ; preds = %359, %326
  %365 = load i64, ptr %7, align 8
  %366 = load ptr, ptr %11, align 8
  %367 = sub i64 0, %365
  %368 = getelementptr inbounds i8, ptr %366, i64 %367
  store ptr %368, ptr %11, align 8
  br label %314, !llvm.loop !10

369:                                              ; preds = %324
  %370 = load ptr, ptr %10, align 8
  %371 = load ptr, ptr %11, align 8
  %372 = icmp ugt ptr %370, %371
  br i1 %372, label %373, label %374

373:                                              ; preds = %369
  br label %412

374:                                              ; preds = %369
  %375 = load i32, ptr %19, align 4
  %376 = icmp eq i32 %375, 0
  br i1 %376, label %377, label %385

377:                                              ; preds = %374
  %378 = load ptr, ptr %10, align 8
  %379 = load i64, ptr %378, align 8
  store i64 %379, ptr %30, align 8
  %380 = load ptr, ptr %11, align 8
  %381 = load i64, ptr %380, align 8
  %382 = load ptr, ptr %10, align 8
  store i64 %381, ptr %382, align 8
  %383 = load i64, ptr %30, align 8
  %384 = load ptr, ptr %11, align 8
  store i64 %383, ptr %384, align 8
  br label %404

385:                                              ; preds = %374
  %386 = load i32, ptr %20, align 4
  %387 = icmp eq i32 %386, 0
  br i1 %387, label %388, label %396

388:                                              ; preds = %385
  %389 = load ptr, ptr %10, align 8
  %390 = load i32, ptr %389, align 4
  store i32 %390, ptr %31, align 4
  %391 = load ptr, ptr %11, align 8
  %392 = load i32, ptr %391, align 4
  %393 = load ptr, ptr %10, align 8
  store i32 %392, ptr %393, align 4
  %394 = load i32, ptr %31, align 4
  %395 = load ptr, ptr %11, align 8
  store i32 %394, ptr %395, align 4
  br label %403

396:                                              ; preds = %385
  %397 = load ptr, ptr %10, align 8
  %398 = load ptr, ptr %11, align 8
  %399 = load i64, ptr %7, align 8
  %400 = trunc i64 %399 to i32
  %401 = load i32, ptr %19, align 4
  %402 = load i32, ptr %20, align 4
  call void @swapfunc(ptr noundef %397, ptr noundef %398, i32 noundef signext %400, i32 noundef signext %401, i32 noundef signext %402)
  br label %403

403:                                              ; preds = %396, %388
  br label %404

404:                                              ; preds = %403, %377
  store i32 1, ptr %21, align 4
  %405 = load i64, ptr %7, align 8
  %406 = load ptr, ptr %10, align 8
  %407 = getelementptr inbounds i8, ptr %406, i64 %405
  store ptr %407, ptr %10, align 8
  %408 = load i64, ptr %7, align 8
  %409 = load ptr, ptr %11, align 8
  %410 = sub i64 0, %408
  %411 = getelementptr inbounds i8, ptr %409, i64 %410
  store ptr %411, ptr %11, align 8
  br label %259

412:                                              ; preds = %373
  %413 = load i32, ptr %21, align 4
  %414 = icmp eq i32 %413, 0
  br i1 %414, label %415, label %501

415:                                              ; preds = %412
  %416 = load ptr, ptr %5, align 8
  %417 = load i64, ptr %7, align 8
  %418 = getelementptr inbounds i8, ptr %416, i64 %417
  store ptr %418, ptr %14, align 8
  br label %419

419:                                              ; preds = %496, %415
  %420 = load ptr, ptr %14, align 8
  %421 = load ptr, ptr %5, align 8
  %422 = load i64, ptr %6, align 8
  %423 = load i64, ptr %7, align 8
  %424 = mul i64 %422, %423
  %425 = getelementptr inbounds i8, ptr %421, i64 %424
  %426 = icmp ult ptr %420, %425
  br i1 %426, label %427, label %500

427:                                              ; preds = %419
  %428 = load ptr, ptr %14, align 8
  store ptr %428, ptr %13, align 8
  br label %429

429:                                              ; preds = %490, %427
  %430 = load ptr, ptr %13, align 8
  %431 = load ptr, ptr %5, align 8
  %432 = icmp ugt ptr %430, %431
  br i1 %432, label %433, label %442

433:                                              ; preds = %429
  %434 = load ptr, ptr %8, align 8
  %435 = load ptr, ptr %13, align 8
  %436 = load i64, ptr %7, align 8
  %437 = sub i64 0, %436
  %438 = getelementptr inbounds i8, ptr %435, i64 %437
  %439 = load ptr, ptr %13, align 8
  %440 = call signext i32 %434(ptr noundef %438, ptr noundef %439)
  %441 = icmp sgt i32 %440, 0
  br label %442

442:                                              ; preds = %433, %429
  %443 = phi i1 [ false, %429 ], [ %441, %433 ]
  br i1 %443, label %444, label %495

444:                                              ; preds = %442
  %445 = load i32, ptr %19, align 4
  %446 = icmp eq i32 %445, 0
  br i1 %446, label %447, label %461

447:                                              ; preds = %444
  %448 = load ptr, ptr %13, align 8
  %449 = load i64, ptr %448, align 8
  store i64 %449, ptr %32, align 8
  %450 = load ptr, ptr %13, align 8
  %451 = load i64, ptr %7, align 8
  %452 = sub i64 0, %451
  %453 = getelementptr inbounds i8, ptr %450, i64 %452
  %454 = load i64, ptr %453, align 8
  %455 = load ptr, ptr %13, align 8
  store i64 %454, ptr %455, align 8
  %456 = load i64, ptr %32, align 8
  %457 = load ptr, ptr %13, align 8
  %458 = load i64, ptr %7, align 8
  %459 = sub i64 0, %458
  %460 = getelementptr inbounds i8, ptr %457, i64 %459
  store i64 %456, ptr %460, align 8
  br label %489

461:                                              ; preds = %444
  %462 = load i32, ptr %20, align 4
  %463 = icmp eq i32 %462, 0
  br i1 %463, label %464, label %478

464:                                              ; preds = %461
  %465 = load ptr, ptr %13, align 8
  %466 = load i32, ptr %465, align 4
  store i32 %466, ptr %33, align 4
  %467 = load ptr, ptr %13, align 8
  %468 = load i64, ptr %7, align 8
  %469 = sub i64 0, %468
  %470 = getelementptr inbounds i8, ptr %467, i64 %469
  %471 = load i32, ptr %470, align 4
  %472 = load ptr, ptr %13, align 8
  store i32 %471, ptr %472, align 4
  %473 = load i32, ptr %33, align 4
  %474 = load ptr, ptr %13, align 8
  %475 = load i64, ptr %7, align 8
  %476 = sub i64 0, %475
  %477 = getelementptr inbounds i8, ptr %474, i64 %476
  store i32 %473, ptr %477, align 4
  br label %488

478:                                              ; preds = %461
  %479 = load ptr, ptr %13, align 8
  %480 = load ptr, ptr %13, align 8
  %481 = load i64, ptr %7, align 8
  %482 = sub i64 0, %481
  %483 = getelementptr inbounds i8, ptr %480, i64 %482
  %484 = load i64, ptr %7, align 8
  %485 = trunc i64 %484 to i32
  %486 = load i32, ptr %19, align 4
  %487 = load i32, ptr %20, align 4
  call void @swapfunc(ptr noundef %479, ptr noundef %483, i32 noundef signext %485, i32 noundef signext %486, i32 noundef signext %487)
  br label %488

488:                                              ; preds = %478, %464
  br label %489

489:                                              ; preds = %488, %447
  br label %490

490:                                              ; preds = %489
  %491 = load i64, ptr %7, align 8
  %492 = load ptr, ptr %13, align 8
  %493 = sub i64 0, %491
  %494 = getelementptr inbounds i8, ptr %492, i64 %493
  store ptr %494, ptr %13, align 8
  br label %429, !llvm.loop !11

495:                                              ; preds = %442
  br label %496

496:                                              ; preds = %495
  %497 = load i64, ptr %7, align 8
  %498 = load ptr, ptr %14, align 8
  %499 = getelementptr inbounds i8, ptr %498, i64 %497
  store ptr %499, ptr %14, align 8
  br label %419, !llvm.loop !12

500:                                              ; preds = %419
  br label %617

501:                                              ; preds = %412
  %502 = load ptr, ptr %5, align 8
  %503 = load i64, ptr %6, align 8
  %504 = load i64, ptr %7, align 8
  %505 = mul i64 %503, %504
  %506 = getelementptr inbounds i8, ptr %502, i64 %505
  store ptr %506, ptr %15, align 8
  %507 = load ptr, ptr %9, align 8
  %508 = load ptr, ptr %5, align 8
  %509 = ptrtoint ptr %507 to i64
  %510 = ptrtoint ptr %508 to i64
  %511 = sub i64 %509, %510
  %512 = load ptr, ptr %10, align 8
  %513 = load ptr, ptr %9, align 8
  %514 = ptrtoint ptr %512 to i64
  %515 = ptrtoint ptr %513 to i64
  %516 = sub i64 %514, %515
  %517 = icmp slt i64 %511, %516
  br i1 %517, label %518, label %524

518:                                              ; preds = %501
  %519 = load ptr, ptr %9, align 8
  %520 = load ptr, ptr %5, align 8
  %521 = ptrtoint ptr %519 to i64
  %522 = ptrtoint ptr %520 to i64
  %523 = sub i64 %521, %522
  br label %530

524:                                              ; preds = %501
  %525 = load ptr, ptr %10, align 8
  %526 = load ptr, ptr %9, align 8
  %527 = ptrtoint ptr %525 to i64
  %528 = ptrtoint ptr %526 to i64
  %529 = sub i64 %527, %528
  br label %530

530:                                              ; preds = %524, %518
  %531 = phi i64 [ %523, %518 ], [ %529, %524 ]
  store i64 %531, ptr %17, align 8
  %532 = load i64, ptr %17, align 8
  %533 = icmp ugt i64 %532, 0
  br i1 %533, label %534, label %544

534:                                              ; preds = %530
  %535 = load ptr, ptr %5, align 8
  %536 = load ptr, ptr %10, align 8
  %537 = load i64, ptr %17, align 8
  %538 = sub i64 0, %537
  %539 = getelementptr inbounds i8, ptr %536, i64 %538
  %540 = load i64, ptr %17, align 8
  %541 = trunc i64 %540 to i32
  %542 = load i32, ptr %19, align 4
  %543 = load i32, ptr %20, align 4
  call void @swapfunc(ptr noundef %535, ptr noundef %539, i32 noundef signext %541, i32 noundef signext %542, i32 noundef signext %543)
  br label %544

544:                                              ; preds = %534, %530
  %545 = load ptr, ptr %12, align 8
  %546 = load ptr, ptr %11, align 8
  %547 = ptrtoint ptr %545 to i64
  %548 = ptrtoint ptr %546 to i64
  %549 = sub i64 %547, %548
  %550 = load ptr, ptr %15, align 8
  %551 = load ptr, ptr %12, align 8
  %552 = ptrtoint ptr %550 to i64
  %553 = ptrtoint ptr %551 to i64
  %554 = sub i64 %552, %553
  %555 = load i64, ptr %7, align 8
  %556 = sub i64 %554, %555
  %557 = icmp ult i64 %549, %556
  br i1 %557, label %558, label %564

558:                                              ; preds = %544
  %559 = load ptr, ptr %12, align 8
  %560 = load ptr, ptr %11, align 8
  %561 = ptrtoint ptr %559 to i64
  %562 = ptrtoint ptr %560 to i64
  %563 = sub i64 %561, %562
  br label %572

564:                                              ; preds = %544
  %565 = load ptr, ptr %15, align 8
  %566 = load ptr, ptr %12, align 8
  %567 = ptrtoint ptr %565 to i64
  %568 = ptrtoint ptr %566 to i64
  %569 = sub i64 %567, %568
  %570 = load i64, ptr %7, align 8
  %571 = sub i64 %569, %570
  br label %572

572:                                              ; preds = %564, %558
  %573 = phi i64 [ %563, %558 ], [ %571, %564 ]
  store i64 %573, ptr %17, align 8
  %574 = load i64, ptr %17, align 8
  %575 = icmp ugt i64 %574, 0
  br i1 %575, label %576, label %586

576:                                              ; preds = %572
  %577 = load ptr, ptr %10, align 8
  %578 = load ptr, ptr %15, align 8
  %579 = load i64, ptr %17, align 8
  %580 = sub i64 0, %579
  %581 = getelementptr inbounds i8, ptr %578, i64 %580
  %582 = load i64, ptr %17, align 8
  %583 = trunc i64 %582 to i32
  %584 = load i32, ptr %19, align 4
  %585 = load i32, ptr %20, align 4
  call void @swapfunc(ptr noundef %577, ptr noundef %581, i32 noundef signext %583, i32 noundef signext %584, i32 noundef signext %585)
  br label %586

586:                                              ; preds = %576, %572
  %587 = load ptr, ptr %10, align 8
  %588 = load ptr, ptr %9, align 8
  %589 = ptrtoint ptr %587 to i64
  %590 = ptrtoint ptr %588 to i64
  %591 = sub i64 %589, %590
  store i64 %591, ptr %17, align 8
  %592 = load i64, ptr %7, align 8
  %593 = icmp ugt i64 %591, %592
  br i1 %593, label %594, label %601

594:                                              ; preds = %586
  %595 = load ptr, ptr %5, align 8
  %596 = load i64, ptr %17, align 8
  %597 = load i64, ptr %7, align 8
  %598 = udiv i64 %596, %597
  %599 = load i64, ptr %7, align 8
  %600 = load ptr, ptr %8, align 8
  call void @qsort(ptr noundef %595, i64 noundef %598, i64 noundef %599, ptr noundef %600)
  br label %601

601:                                              ; preds = %594, %586
  %602 = load ptr, ptr %12, align 8
  %603 = load ptr, ptr %11, align 8
  %604 = ptrtoint ptr %602 to i64
  %605 = ptrtoint ptr %603 to i64
  %606 = sub i64 %604, %605
  store i64 %606, ptr %17, align 8
  %607 = load i64, ptr %7, align 8
  %608 = icmp ugt i64 %606, %607
  br i1 %608, label %609, label %617

609:                                              ; preds = %601
  %610 = load ptr, ptr %15, align 8
  %611 = load i64, ptr %17, align 8
  %612 = sub i64 0, %611
  %613 = getelementptr inbounds i8, ptr %610, i64 %612
  store ptr %613, ptr %5, align 8
  %614 = load i64, ptr %17, align 8
  %615 = load i64, ptr %7, align 8
  %616 = udiv i64 %614, %615
  store i64 %616, ptr %6, align 8
  br label %34

617:                                              ; preds = %156, %500, %601
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @swapfunc(ptr noundef %0, ptr noundef %1, i32 noundef signext %2, i32 noundef signext %3, i32 noundef signext %4) #0 {
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i64, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca i64, align 8
  %15 = alloca i64, align 8
  %16 = alloca ptr, align 8
  %17 = alloca ptr, align 8
  %18 = alloca i32, align 4
  %19 = alloca i64, align 8
  %20 = alloca ptr, align 8
  %21 = alloca ptr, align 8
  %22 = alloca i8, align 1
  store ptr %0, ptr %6, align 8
  store ptr %1, ptr %7, align 8
  store i32 %2, ptr %8, align 4
  store i32 %3, ptr %9, align 4
  store i32 %4, ptr %10, align 4
  %23 = load i32, ptr %9, align 4
  %24 = icmp sle i32 %23, 1
  br i1 %24, label %25, label %46

25:                                               ; preds = %5
  %26 = load i32, ptr %8, align 4
  %27 = sext i32 %26 to i64
  %28 = udiv i64 %27, 8
  store i64 %28, ptr %11, align 8
  %29 = load ptr, ptr %6, align 8
  store ptr %29, ptr %12, align 8
  %30 = load ptr, ptr %7, align 8
  store ptr %30, ptr %13, align 8
  br label %31

31:                                               ; preds = %41, %25
  %32 = load ptr, ptr %12, align 8
  %33 = load i64, ptr %32, align 8
  store i64 %33, ptr %14, align 8
  %34 = load ptr, ptr %13, align 8
  %35 = load i64, ptr %34, align 8
  %36 = load ptr, ptr %12, align 8
  %37 = getelementptr inbounds i64, ptr %36, i32 1
  store ptr %37, ptr %12, align 8
  store i64 %35, ptr %36, align 8
  %38 = load i64, ptr %14, align 8
  %39 = load ptr, ptr %13, align 8
  %40 = getelementptr inbounds i64, ptr %39, i32 1
  store ptr %40, ptr %13, align 8
  store i64 %38, ptr %39, align 8
  br label %41

41:                                               ; preds = %31
  %42 = load i64, ptr %11, align 8
  %43 = add nsw i64 %42, -1
  store i64 %43, ptr %11, align 8
  %44 = icmp sgt i64 %43, 0
  br i1 %44, label %31, label %45, !llvm.loop !13

45:                                               ; preds = %41
  br label %92

46:                                               ; preds = %5
  %47 = load i32, ptr %10, align 4
  %48 = icmp sle i32 %47, 1
  br i1 %48, label %49, label %70

49:                                               ; preds = %46
  %50 = load i32, ptr %8, align 4
  %51 = sext i32 %50 to i64
  %52 = udiv i64 %51, 4
  store i64 %52, ptr %15, align 8
  %53 = load ptr, ptr %6, align 8
  store ptr %53, ptr %16, align 8
  %54 = load ptr, ptr %7, align 8
  store ptr %54, ptr %17, align 8
  br label %55

55:                                               ; preds = %65, %49
  %56 = load ptr, ptr %16, align 8
  %57 = load i32, ptr %56, align 4
  store i32 %57, ptr %18, align 4
  %58 = load ptr, ptr %17, align 8
  %59 = load i32, ptr %58, align 4
  %60 = load ptr, ptr %16, align 8
  %61 = getelementptr inbounds i32, ptr %60, i32 1
  store ptr %61, ptr %16, align 8
  store i32 %59, ptr %60, align 4
  %62 = load i32, ptr %18, align 4
  %63 = load ptr, ptr %17, align 8
  %64 = getelementptr inbounds i32, ptr %63, i32 1
  store ptr %64, ptr %17, align 8
  store i32 %62, ptr %63, align 4
  br label %65

65:                                               ; preds = %55
  %66 = load i64, ptr %15, align 8
  %67 = add nsw i64 %66, -1
  store i64 %67, ptr %15, align 8
  %68 = icmp sgt i64 %67, 0
  br i1 %68, label %55, label %69, !llvm.loop !14

69:                                               ; preds = %65
  br label %91

70:                                               ; preds = %46
  %71 = load i32, ptr %8, align 4
  %72 = sext i32 %71 to i64
  %73 = udiv i64 %72, 1
  store i64 %73, ptr %19, align 8
  %74 = load ptr, ptr %6, align 8
  store ptr %74, ptr %20, align 8
  %75 = load ptr, ptr %7, align 8
  store ptr %75, ptr %21, align 8
  br label %76

76:                                               ; preds = %86, %70
  %77 = load ptr, ptr %20, align 8
  %78 = load i8, ptr %77, align 1
  store i8 %78, ptr %22, align 1
  %79 = load ptr, ptr %21, align 8
  %80 = load i8, ptr %79, align 1
  %81 = load ptr, ptr %20, align 8
  %82 = getelementptr inbounds i8, ptr %81, i32 1
  store ptr %82, ptr %20, align 8
  store i8 %80, ptr %81, align 1
  %83 = load i8, ptr %22, align 1
  %84 = load ptr, ptr %21, align 8
  %85 = getelementptr inbounds i8, ptr %84, i32 1
  store ptr %85, ptr %21, align 8
  store i8 %83, ptr %84, align 1
  br label %86

86:                                               ; preds = %76
  %87 = load i64, ptr %19, align 8
  %88 = add nsw i64 %87, -1
  store i64 %88, ptr %19, align 8
  %89 = icmp sgt i64 %88, 0
  br i1 %89, label %76, label %90, !llvm.loop !15

90:                                               ; preds = %86
  br label %91

91:                                               ; preds = %90, %69
  br label %92

92:                                               ; preds = %91, %45
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal ptr @med3(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  %9 = load ptr, ptr %8, align 8
  %10 = load ptr, ptr %5, align 8
  %11 = load ptr, ptr %6, align 8
  %12 = call signext i32 %9(ptr noundef %10, ptr noundef %11)
  %13 = icmp slt i32 %12, 0
  br i1 %13, label %14, label %36

14:                                               ; preds = %4
  %15 = load ptr, ptr %8, align 8
  %16 = load ptr, ptr %6, align 8
  %17 = load ptr, ptr %7, align 8
  %18 = call signext i32 %15(ptr noundef %16, ptr noundef %17)
  %19 = icmp slt i32 %18, 0
  br i1 %19, label %20, label %22

20:                                               ; preds = %14
  %21 = load ptr, ptr %6, align 8
  br label %34

22:                                               ; preds = %14
  %23 = load ptr, ptr %8, align 8
  %24 = load ptr, ptr %5, align 8
  %25 = load ptr, ptr %7, align 8
  %26 = call signext i32 %23(ptr noundef %24, ptr noundef %25)
  %27 = icmp slt i32 %26, 0
  br i1 %27, label %28, label %30

28:                                               ; preds = %22
  %29 = load ptr, ptr %7, align 8
  br label %32

30:                                               ; preds = %22
  %31 = load ptr, ptr %5, align 8
  br label %32

32:                                               ; preds = %30, %28
  %33 = phi ptr [ %29, %28 ], [ %31, %30 ]
  br label %34

34:                                               ; preds = %32, %20
  %35 = phi ptr [ %21, %20 ], [ %33, %32 ]
  br label %58

36:                                               ; preds = %4
  %37 = load ptr, ptr %8, align 8
  %38 = load ptr, ptr %6, align 8
  %39 = load ptr, ptr %7, align 8
  %40 = call signext i32 %37(ptr noundef %38, ptr noundef %39)
  %41 = icmp sgt i32 %40, 0
  br i1 %41, label %42, label %44

42:                                               ; preds = %36
  %43 = load ptr, ptr %6, align 8
  br label %56

44:                                               ; preds = %36
  %45 = load ptr, ptr %8, align 8
  %46 = load ptr, ptr %5, align 8
  %47 = load ptr, ptr %7, align 8
  %48 = call signext i32 %45(ptr noundef %46, ptr noundef %47)
  %49 = icmp slt i32 %48, 0
  br i1 %49, label %50, label %52

50:                                               ; preds = %44
  %51 = load ptr, ptr %5, align 8
  br label %54

52:                                               ; preds = %44
  %53 = load ptr, ptr %7, align 8
  br label %54

54:                                               ; preds = %52, %50
  %55 = phi ptr [ %51, %50 ], [ %53, %52 ]
  br label %56

56:                                               ; preds = %54, %42
  %57 = phi ptr [ %43, %42 ], [ %55, %54 ]
  br label %58

58:                                               ; preds = %56, %34
  %59 = phi ptr [ %35, %34 ], [ %57, %56 ]
  ret ptr %59
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local signext i32 @compare(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %7 = load ptr, ptr %3, align 8
  store ptr %7, ptr %5, align 8
  %8 = load ptr, ptr %4, align 8
  store ptr %8, ptr %6, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = load i32, ptr %9, align 4
  %11 = load ptr, ptr %6, align 8
  %12 = load i32, ptr %11, align 4
  %13 = sub nsw i32 %10, %12
  ret i32 %13
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @printArray(ptr noundef %0, i32 noundef signext %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %6

6:                                                ; preds = %17, %2
  %7 = load i32, ptr %5, align 4
  %8 = load i32, ptr %4, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %20

10:                                               ; preds = %6
  %11 = load ptr, ptr %3, align 8
  %12 = load i32, ptr %5, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds i32, ptr %11, i64 %13
  %15 = load i32, ptr %14, align 4
  %16 = call signext i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef signext %15)
  br label %17

17:                                               ; preds = %10
  %18 = load i32, ptr %5, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, ptr %5, align 4
  br label %6, !llvm.loop !16

20:                                               ; preds = %6
  %21 = call signext i32 (ptr, ...) @printf(ptr noundef @.str.1)
  ret void
}

declare dso_local signext i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local signext i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %5 = call noalias ptr @malloc(i64 noundef 40004) #3
  store ptr %5, ptr %2, align 8
  store i32 1, ptr %3, align 4
  store i32 10001, ptr %4, align 4
  br label %6

6:                                                ; preds = %15, %0
  %7 = load i32, ptr %4, align 4
  %8 = icmp sge i32 %7, 0
  br i1 %8, label %9, label %18

9:                                                ; preds = %6
  %10 = load i32, ptr %4, align 4
  %11 = load ptr, ptr %2, align 8
  %12 = load i32, ptr %4, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds i32, ptr %11, i64 %13
  store i32 %10, ptr %14, align 4
  br label %15

15:                                               ; preds = %9
  %16 = load i32, ptr %4, align 4
  %17 = add nsw i32 %16, -1
  store i32 %17, ptr %4, align 4
  br label %6, !llvm.loop !17

18:                                               ; preds = %6
  %19 = load ptr, ptr %2, align 8
  call void @qsort(ptr noundef %19, i64 noundef 10001, i64 noundef 4, ptr noundef @compare)
  %20 = load ptr, ptr %2, align 8
  call void @printArray(ptr noundef %20, i32 noundef signext 10001)
  ret i32 0
}

; Function Attrs: allocsize(0)
declare dso_local noalias ptr @malloc(i64 noundef) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv64" "target-features"="+64bit,+m,+relax,-a,-c,-d,-e,-experimental-zca,-experimental-zcb,-experimental-zcd,-experimental-zcf,-experimental-zfa,-experimental-zicond,-experimental-zihintntl,-experimental-ztso,-experimental-zvfh,-experimental-zvkb,-experimental-zvkg,-experimental-zvkn,-experimental-zvkned,-experimental-zvknha,-experimental-zvknhb,-experimental-zvks,-experimental-zvksed,-experimental-zvksh,-f,-h,-save-restore,-svinval,-svnapot,-svpbmt,-v,-xsfvcp,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zdinx,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zicbom,-zicbop,-zicboz,-zicsr,-zifencei,-zihintpause,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv64" "target-features"="+64bit,+m,+relax,-a,-c,-d,-e,-experimental-zca,-experimental-zcb,-experimental-zcd,-experimental-zcf,-experimental-zfa,-experimental-zicond,-experimental-zihintntl,-experimental-ztso,-experimental-zvfh,-experimental-zvkb,-experimental-zvkg,-experimental-zvkn,-experimental-zvkned,-experimental-zvknha,-experimental-zvknhb,-experimental-zvks,-experimental-zvksed,-experimental-zvksh,-f,-h,-save-restore,-svinval,-svnapot,-svpbmt,-v,-xsfvcp,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zdinx,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zicbom,-zicbop,-zicboz,-zicsr,-zifencei,-zihintpause,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv64" "target-features"="+64bit,+m,+relax,-a,-c,-d,-e,-experimental-zca,-experimental-zcb,-experimental-zcd,-experimental-zcf,-experimental-zfa,-experimental-zicond,-experimental-zihintntl,-experimental-ztso,-experimental-zvfh,-experimental-zvkb,-experimental-zvkg,-experimental-zvkn,-experimental-zvkned,-experimental-zvknha,-experimental-zvknhb,-experimental-zvks,-experimental-zvksed,-experimental-zvksh,-f,-h,-save-restore,-svinval,-svnapot,-svpbmt,-v,-xsfvcp,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zdinx,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zicbom,-zicbop,-zicboz,-zicsr,-zifencei,-zihintpause,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #3 = { allocsize(0) }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64"}
!2 = !{i32 7, !"uwtable", i32 2}
!3 = !{i32 7, !"frame-pointer", i32 2}
!4 = !{i32 8, !"SmallDataLimit", i32 8}
!5 = !{!"clang version 17.0.0 (https://github.com/llvm/llvm-project.git 2db031528e3e0e2d6ab6087af9bae9e0ccbdfc06)"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
!14 = distinct !{!14, !7}
!15 = distinct !{!15, !7}
!16 = distinct !{!16, !7}
!17 = distinct !{!17, !7}
