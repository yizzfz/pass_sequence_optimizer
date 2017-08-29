; ModuleID = 'decompress.ll'
source_filename = "decompress.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.DState = type { %struct.bz_stream*, i32, i8, i32, i8, i32, i32, i32, i32, i32, i8, i32, i32, i32, i32, i32, [256 x i32], i32, [257 x i32], [257 x i32], i32*, i16*, i8*, i32, i32, i32, i32, i32, [256 x i8], [16 x i8], [256 x i8], [4096 x i8], [16 x i32], [18002 x i8], [18002 x i8], [6 x [258 x i8]], [6 x [258 x i32]], [6 x [258 x i32]], [6 x [258 x i32]], [6 x i32], i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32*, i32*, i32* }
%struct.bz_stream = type { i8*, i32, i32, i32, i8*, i32, i32, i32, i8*, i8* (i8*, i32, i32)*, void (i8*, i8*)*, i8* }

@stderr = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [20 x i8] c"\0A    [%d: huff+mtf \00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"rt+rld\00", align 1
@BZ2_rNums = external global [512 x i32], align 16

; Function Attrs: noinline nounwind uwtable
define i32 @BZ2_decompress(%struct.DState*) #0 {
  %2 = alloca %struct.DState*, align 8
  %3 = alloca i8, align 1
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct.bz_stream*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  %28 = alloca i32, align 4
  %29 = alloca i32*, align 8
  %30 = alloca i32*, align 8
  %31 = alloca i32*, align 8
  %32 = alloca i32, align 4
  %33 = alloca i32, align 4
  %34 = alloca i32, align 4
  %35 = alloca i32, align 4
  %36 = alloca i32, align 4
  %37 = alloca i32, align 4
  %38 = alloca i32, align 4
  %39 = alloca i32, align 4
  %40 = alloca i32, align 4
  %41 = alloca i32, align 4
  %42 = alloca i32, align 4
  %43 = alloca i32, align 4
  %44 = alloca i32, align 4
  %45 = alloca i32, align 4
  %46 = alloca i32, align 4
  %47 = alloca i32, align 4
  %48 = alloca i32, align 4
  %49 = alloca i32, align 4
  %50 = alloca i32, align 4
  %51 = alloca i32, align 4
  %52 = alloca i32, align 4
  %53 = alloca i32, align 4
  %54 = alloca i32, align 4
  %55 = alloca [6 x i8], align 1
  %56 = alloca i8, align 1
  %57 = alloca i8, align 1
  %58 = alloca i32, align 4
  %59 = alloca i32, align 4
  %60 = alloca i32, align 4
  %61 = alloca i32, align 4
  %62 = alloca i32, align 4
  %63 = alloca i32, align 4
  %64 = alloca i32, align 4
  %65 = alloca i32, align 4
  %66 = alloca i32, align 4
  %67 = alloca i32, align 4
  %68 = alloca i32, align 4
  %69 = alloca i32, align 4
  %70 = alloca i32, align 4
  %71 = alloca i32, align 4
  %72 = alloca i32, align 4
  %73 = alloca i32, align 4
  %74 = alloca i32, align 4
  %75 = alloca i32, align 4
  %76 = alloca i32, align 4
  %77 = alloca i32, align 4
  %78 = alloca i32, align 4
  %79 = alloca i32, align 4
  %80 = alloca i32, align 4
  %81 = alloca i32, align 4
  %82 = alloca i32, align 4
  %83 = alloca i32, align 4
  %84 = alloca i32, align 4
  %85 = alloca i32, align 4
  %86 = alloca i32, align 4
  %87 = alloca i32, align 4
  store %struct.DState* %0, %struct.DState** %2, align 8
  %88 = load %struct.DState*, %struct.DState** %2, align 8
  %89 = getelementptr inbounds %struct.DState, %struct.DState* %88, i32 0, i32 0
  %90 = load %struct.bz_stream*, %struct.bz_stream** %89, align 8
  store %struct.bz_stream* %90, %struct.bz_stream** %7, align 8
  %91 = load %struct.DState*, %struct.DState** %2, align 8
  %92 = getelementptr inbounds %struct.DState, %struct.DState* %91, i32 0, i32 1
  %93 = load i32, i32* %92, align 8
  %94 = icmp eq i32 %93, 10
  br i1 %94, label %95, label %144

; <label>:95:                                     ; preds = %1
  %96 = load %struct.DState*, %struct.DState** %2, align 8
  %97 = getelementptr inbounds %struct.DState, %struct.DState* %96, i32 0, i32 40
  store i32 0, i32* %97, align 4
  %98 = load %struct.DState*, %struct.DState** %2, align 8
  %99 = getelementptr inbounds %struct.DState, %struct.DState* %98, i32 0, i32 41
  store i32 0, i32* %99, align 8
  %100 = load %struct.DState*, %struct.DState** %2, align 8
  %101 = getelementptr inbounds %struct.DState, %struct.DState* %100, i32 0, i32 42
  store i32 0, i32* %101, align 4
  %102 = load %struct.DState*, %struct.DState** %2, align 8
  %103 = getelementptr inbounds %struct.DState, %struct.DState* %102, i32 0, i32 43
  store i32 0, i32* %103, align 8
  %104 = load %struct.DState*, %struct.DState** %2, align 8
  %105 = getelementptr inbounds %struct.DState, %struct.DState* %104, i32 0, i32 44
  store i32 0, i32* %105, align 4
  %106 = load %struct.DState*, %struct.DState** %2, align 8
  %107 = getelementptr inbounds %struct.DState, %struct.DState* %106, i32 0, i32 45
  store i32 0, i32* %107, align 8
  %108 = load %struct.DState*, %struct.DState** %2, align 8
  %109 = getelementptr inbounds %struct.DState, %struct.DState* %108, i32 0, i32 46
  store i32 0, i32* %109, align 4
  %110 = load %struct.DState*, %struct.DState** %2, align 8
  %111 = getelementptr inbounds %struct.DState, %struct.DState* %110, i32 0, i32 47
  store i32 0, i32* %111, align 8
  %112 = load %struct.DState*, %struct.DState** %2, align 8
  %113 = getelementptr inbounds %struct.DState, %struct.DState* %112, i32 0, i32 48
  store i32 0, i32* %113, align 4
  %114 = load %struct.DState*, %struct.DState** %2, align 8
  %115 = getelementptr inbounds %struct.DState, %struct.DState* %114, i32 0, i32 49
  store i32 0, i32* %115, align 8
  %116 = load %struct.DState*, %struct.DState** %2, align 8
  %117 = getelementptr inbounds %struct.DState, %struct.DState* %116, i32 0, i32 50
  store i32 0, i32* %117, align 4
  %118 = load %struct.DState*, %struct.DState** %2, align 8
  %119 = getelementptr inbounds %struct.DState, %struct.DState* %118, i32 0, i32 51
  store i32 0, i32* %119, align 8
  %120 = load %struct.DState*, %struct.DState** %2, align 8
  %121 = getelementptr inbounds %struct.DState, %struct.DState* %120, i32 0, i32 52
  store i32 0, i32* %121, align 4
  %122 = load %struct.DState*, %struct.DState** %2, align 8
  %123 = getelementptr inbounds %struct.DState, %struct.DState* %122, i32 0, i32 53
  store i32 0, i32* %123, align 8
  %124 = load %struct.DState*, %struct.DState** %2, align 8
  %125 = getelementptr inbounds %struct.DState, %struct.DState* %124, i32 0, i32 54
  store i32 0, i32* %125, align 4
  %126 = load %struct.DState*, %struct.DState** %2, align 8
  %127 = getelementptr inbounds %struct.DState, %struct.DState* %126, i32 0, i32 55
  store i32 0, i32* %127, align 8
  %128 = load %struct.DState*, %struct.DState** %2, align 8
  %129 = getelementptr inbounds %struct.DState, %struct.DState* %128, i32 0, i32 56
  store i32 0, i32* %129, align 4
  %130 = load %struct.DState*, %struct.DState** %2, align 8
  %131 = getelementptr inbounds %struct.DState, %struct.DState* %130, i32 0, i32 57
  store i32 0, i32* %131, align 8
  %132 = load %struct.DState*, %struct.DState** %2, align 8
  %133 = getelementptr inbounds %struct.DState, %struct.DState* %132, i32 0, i32 58
  store i32 0, i32* %133, align 4
  %134 = load %struct.DState*, %struct.DState** %2, align 8
  %135 = getelementptr inbounds %struct.DState, %struct.DState* %134, i32 0, i32 59
  store i32 0, i32* %135, align 8
  %136 = load %struct.DState*, %struct.DState** %2, align 8
  %137 = getelementptr inbounds %struct.DState, %struct.DState* %136, i32 0, i32 60
  store i32 0, i32* %137, align 4
  %138 = load %struct.DState*, %struct.DState** %2, align 8
  %139 = getelementptr inbounds %struct.DState, %struct.DState* %138, i32 0, i32 61
  store i32* null, i32** %139, align 8
  %140 = load %struct.DState*, %struct.DState** %2, align 8
  %141 = getelementptr inbounds %struct.DState, %struct.DState* %140, i32 0, i32 62
  store i32* null, i32** %141, align 8
  %142 = load %struct.DState*, %struct.DState** %2, align 8
  %143 = getelementptr inbounds %struct.DState, %struct.DState* %142, i32 0, i32 63
  store i32* null, i32** %143, align 8
  br label %144

; <label>:144:                                    ; preds = %95, %1
  %145 = load %struct.DState*, %struct.DState** %2, align 8
  %146 = getelementptr inbounds %struct.DState, %struct.DState* %145, i32 0, i32 40
  %147 = load i32, i32* %146, align 4
  store i32 %147, i32* %8, align 4
  %148 = load %struct.DState*, %struct.DState** %2, align 8
  %149 = getelementptr inbounds %struct.DState, %struct.DState* %148, i32 0, i32 41
  %150 = load i32, i32* %149, align 8
  store i32 %150, i32* %9, align 4
  %151 = load %struct.DState*, %struct.DState** %2, align 8
  %152 = getelementptr inbounds %struct.DState, %struct.DState* %151, i32 0, i32 42
  %153 = load i32, i32* %152, align 4
  store i32 %153, i32* %10, align 4
  %154 = load %struct.DState*, %struct.DState** %2, align 8
  %155 = getelementptr inbounds %struct.DState, %struct.DState* %154, i32 0, i32 43
  %156 = load i32, i32* %155, align 8
  store i32 %156, i32* %11, align 4
  %157 = load %struct.DState*, %struct.DState** %2, align 8
  %158 = getelementptr inbounds %struct.DState, %struct.DState* %157, i32 0, i32 44
  %159 = load i32, i32* %158, align 4
  store i32 %159, i32* %12, align 4
  %160 = load %struct.DState*, %struct.DState** %2, align 8
  %161 = getelementptr inbounds %struct.DState, %struct.DState* %160, i32 0, i32 45
  %162 = load i32, i32* %161, align 8
  store i32 %162, i32* %13, align 4
  %163 = load %struct.DState*, %struct.DState** %2, align 8
  %164 = getelementptr inbounds %struct.DState, %struct.DState* %163, i32 0, i32 46
  %165 = load i32, i32* %164, align 4
  store i32 %165, i32* %14, align 4
  %166 = load %struct.DState*, %struct.DState** %2, align 8
  %167 = getelementptr inbounds %struct.DState, %struct.DState* %166, i32 0, i32 47
  %168 = load i32, i32* %167, align 8
  store i32 %168, i32* %15, align 4
  %169 = load %struct.DState*, %struct.DState** %2, align 8
  %170 = getelementptr inbounds %struct.DState, %struct.DState* %169, i32 0, i32 48
  %171 = load i32, i32* %170, align 4
  store i32 %171, i32* %16, align 4
  %172 = load %struct.DState*, %struct.DState** %2, align 8
  %173 = getelementptr inbounds %struct.DState, %struct.DState* %172, i32 0, i32 49
  %174 = load i32, i32* %173, align 8
  store i32 %174, i32* %17, align 4
  %175 = load %struct.DState*, %struct.DState** %2, align 8
  %176 = getelementptr inbounds %struct.DState, %struct.DState* %175, i32 0, i32 50
  %177 = load i32, i32* %176, align 4
  store i32 %177, i32* %18, align 4
  %178 = load %struct.DState*, %struct.DState** %2, align 8
  %179 = getelementptr inbounds %struct.DState, %struct.DState* %178, i32 0, i32 51
  %180 = load i32, i32* %179, align 8
  store i32 %180, i32* %19, align 4
  %181 = load %struct.DState*, %struct.DState** %2, align 8
  %182 = getelementptr inbounds %struct.DState, %struct.DState* %181, i32 0, i32 52
  %183 = load i32, i32* %182, align 4
  store i32 %183, i32* %20, align 4
  %184 = load %struct.DState*, %struct.DState** %2, align 8
  %185 = getelementptr inbounds %struct.DState, %struct.DState* %184, i32 0, i32 53
  %186 = load i32, i32* %185, align 8
  store i32 %186, i32* %21, align 4
  %187 = load %struct.DState*, %struct.DState** %2, align 8
  %188 = getelementptr inbounds %struct.DState, %struct.DState* %187, i32 0, i32 54
  %189 = load i32, i32* %188, align 4
  store i32 %189, i32* %22, align 4
  %190 = load %struct.DState*, %struct.DState** %2, align 8
  %191 = getelementptr inbounds %struct.DState, %struct.DState* %190, i32 0, i32 55
  %192 = load i32, i32* %191, align 8
  store i32 %192, i32* %23, align 4
  %193 = load %struct.DState*, %struct.DState** %2, align 8
  %194 = getelementptr inbounds %struct.DState, %struct.DState* %193, i32 0, i32 56
  %195 = load i32, i32* %194, align 4
  store i32 %195, i32* %24, align 4
  %196 = load %struct.DState*, %struct.DState** %2, align 8
  %197 = getelementptr inbounds %struct.DState, %struct.DState* %196, i32 0, i32 57
  %198 = load i32, i32* %197, align 8
  store i32 %198, i32* %25, align 4
  %199 = load %struct.DState*, %struct.DState** %2, align 8
  %200 = getelementptr inbounds %struct.DState, %struct.DState* %199, i32 0, i32 58
  %201 = load i32, i32* %200, align 4
  store i32 %201, i32* %26, align 4
  %202 = load %struct.DState*, %struct.DState** %2, align 8
  %203 = getelementptr inbounds %struct.DState, %struct.DState* %202, i32 0, i32 59
  %204 = load i32, i32* %203, align 8
  store i32 %204, i32* %27, align 4
  %205 = load %struct.DState*, %struct.DState** %2, align 8
  %206 = getelementptr inbounds %struct.DState, %struct.DState* %205, i32 0, i32 60
  %207 = load i32, i32* %206, align 4
  store i32 %207, i32* %28, align 4
  %208 = load %struct.DState*, %struct.DState** %2, align 8
  %209 = getelementptr inbounds %struct.DState, %struct.DState* %208, i32 0, i32 61
  %210 = load i32*, i32** %209, align 8
  store i32* %210, i32** %29, align 8
  %211 = load %struct.DState*, %struct.DState** %2, align 8
  %212 = getelementptr inbounds %struct.DState, %struct.DState* %211, i32 0, i32 62
  %213 = load i32*, i32** %212, align 8
  store i32* %213, i32** %30, align 8
  %214 = load %struct.DState*, %struct.DState** %2, align 8
  %215 = getelementptr inbounds %struct.DState, %struct.DState* %214, i32 0, i32 63
  %216 = load i32*, i32** %215, align 8
  store i32* %216, i32** %31, align 8
  store i32 0, i32* %4, align 4
  %217 = load %struct.DState*, %struct.DState** %2, align 8
  %218 = getelementptr inbounds %struct.DState, %struct.DState* %217, i32 0, i32 1
  %219 = load i32, i32* %218, align 8
  switch i32 %219, label %5739 [
    i32 10, label %220
    i32 11, label %309
    i32 12, label %398
    i32 13, label %487
    i32 14, label %663
    i32 15, label %757
    i32 16, label %846
    i32 17, label %935
    i32 18, label %1024
    i32 19, label %1113
    i32 20, label %1219
    i32 21, label %1312
    i32 22, label %1405
    i32 23, label %1498
    i32 24, label %1591
    i32 25, label %1679
    i32 26, label %1772
    i32 27, label %1865
    i32 28, label %1979
    i32 29, label %2112
    i32 30, label %2229
    i32 31, label %2319
    i32 32, label %2412
    i32 33, label %2583
    i32 34, label %2679
    i32 35, label %2768
    i32 36, label %3081
    i32 37, label %3186
    i32 38, label %3381
    i32 39, label %3486
    i32 40, label %4047
    i32 41, label %4152
    i32 42, label %4918
    i32 43, label %5007
    i32 44, label %5096
    i32 45, label %5185
    i32 46, label %5274
    i32 47, label %5365
    i32 48, label %5458
    i32 49, label %5551
    i32 50, label %5644
  ]

; <label>:220:                                    ; preds = %144
  %221 = load %struct.DState*, %struct.DState** %2, align 8
  %222 = getelementptr inbounds %struct.DState, %struct.DState* %221, i32 0, i32 1
  store i32 10, i32* %222, align 8
  br label %223

; <label>:223:                                    ; preds = %302, %220
  %224 = load %struct.DState*, %struct.DState** %2, align 8
  %225 = getelementptr inbounds %struct.DState, %struct.DState* %224, i32 0, i32 8
  %226 = load i32, i32* %225, align 4
  %227 = icmp sge i32 %226, 8
  br i1 %227, label %228, label %244

; <label>:228:                                    ; preds = %223
  %229 = load %struct.DState*, %struct.DState** %2, align 8
  %230 = getelementptr inbounds %struct.DState, %struct.DState* %229, i32 0, i32 7
  %231 = load i32, i32* %230, align 8
  %232 = load %struct.DState*, %struct.DState** %2, align 8
  %233 = getelementptr inbounds %struct.DState, %struct.DState* %232, i32 0, i32 8
  %234 = load i32, i32* %233, align 4
  %235 = sub nsw i32 %234, 8
  %236 = lshr i32 %231, %235
  %237 = and i32 %236, 255
  store i32 %237, i32* %32, align 4
  %238 = load %struct.DState*, %struct.DState** %2, align 8
  %239 = getelementptr inbounds %struct.DState, %struct.DState* %238, i32 0, i32 8
  %240 = load i32, i32* %239, align 4
  %241 = sub nsw i32 %240, 8
  store i32 %241, i32* %239, align 4
  %242 = load i32, i32* %32, align 4
  %243 = trunc i32 %242 to i8
  store i8 %243, i8* %3, align 1
  br label %303

; <label>:244:                                    ; preds = %223
  %245 = load %struct.DState*, %struct.DState** %2, align 8
  %246 = getelementptr inbounds %struct.DState, %struct.DState* %245, i32 0, i32 0
  %247 = load %struct.bz_stream*, %struct.bz_stream** %246, align 8
  %248 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %247, i32 0, i32 1
  %249 = load i32, i32* %248, align 8
  %250 = icmp eq i32 %249, 0
  br i1 %250, label %251, label %252

; <label>:251:                                    ; preds = %244
  store i32 0, i32* %4, align 4
  br label %5741

; <label>:252:                                    ; preds = %244
  %253 = load %struct.DState*, %struct.DState** %2, align 8
  %254 = getelementptr inbounds %struct.DState, %struct.DState* %253, i32 0, i32 7
  %255 = load i32, i32* %254, align 8
  %256 = shl i32 %255, 8
  %257 = load %struct.DState*, %struct.DState** %2, align 8
  %258 = getelementptr inbounds %struct.DState, %struct.DState* %257, i32 0, i32 0
  %259 = load %struct.bz_stream*, %struct.bz_stream** %258, align 8
  %260 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %259, i32 0, i32 0
  %261 = load i8*, i8** %260, align 8
  %262 = load i8, i8* %261, align 1
  %263 = zext i8 %262 to i32
  %264 = or i32 %256, %263
  %265 = load %struct.DState*, %struct.DState** %2, align 8
  %266 = getelementptr inbounds %struct.DState, %struct.DState* %265, i32 0, i32 7
  store i32 %264, i32* %266, align 8
  %267 = load %struct.DState*, %struct.DState** %2, align 8
  %268 = getelementptr inbounds %struct.DState, %struct.DState* %267, i32 0, i32 8
  %269 = load i32, i32* %268, align 4
  %270 = add nsw i32 %269, 8
  store i32 %270, i32* %268, align 4
  %271 = load %struct.DState*, %struct.DState** %2, align 8
  %272 = getelementptr inbounds %struct.DState, %struct.DState* %271, i32 0, i32 0
  %273 = load %struct.bz_stream*, %struct.bz_stream** %272, align 8
  %274 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %273, i32 0, i32 0
  %275 = load i8*, i8** %274, align 8
  %276 = getelementptr inbounds i8, i8* %275, i32 1
  store i8* %276, i8** %274, align 8
  %277 = load %struct.DState*, %struct.DState** %2, align 8
  %278 = getelementptr inbounds %struct.DState, %struct.DState* %277, i32 0, i32 0
  %279 = load %struct.bz_stream*, %struct.bz_stream** %278, align 8
  %280 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %279, i32 0, i32 1
  %281 = load i32, i32* %280, align 8
  %282 = add i32 %281, -1
  store i32 %282, i32* %280, align 8
  %283 = load %struct.DState*, %struct.DState** %2, align 8
  %284 = getelementptr inbounds %struct.DState, %struct.DState* %283, i32 0, i32 0
  %285 = load %struct.bz_stream*, %struct.bz_stream** %284, align 8
  %286 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %285, i32 0, i32 2
  %287 = load i32, i32* %286, align 4
  %288 = add i32 %287, 1
  store i32 %288, i32* %286, align 4
  %289 = load %struct.DState*, %struct.DState** %2, align 8
  %290 = getelementptr inbounds %struct.DState, %struct.DState* %289, i32 0, i32 0
  %291 = load %struct.bz_stream*, %struct.bz_stream** %290, align 8
  %292 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %291, i32 0, i32 2
  %293 = load i32, i32* %292, align 4
  %294 = icmp eq i32 %293, 0
  br i1 %294, label %295, label %302

; <label>:295:                                    ; preds = %252
  %296 = load %struct.DState*, %struct.DState** %2, align 8
  %297 = getelementptr inbounds %struct.DState, %struct.DState* %296, i32 0, i32 0
  %298 = load %struct.bz_stream*, %struct.bz_stream** %297, align 8
  %299 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %298, i32 0, i32 3
  %300 = load i32, i32* %299, align 8
  %301 = add i32 %300, 1
  store i32 %301, i32* %299, align 8
  br label %302

; <label>:302:                                    ; preds = %295, %252
  br label %223

; <label>:303:                                    ; preds = %228
  %304 = load i8, i8* %3, align 1
  %305 = zext i8 %304 to i32
  %306 = icmp ne i32 %305, 66
  br i1 %306, label %307, label %308

; <label>:307:                                    ; preds = %303
  store i32 -5, i32* %4, align 4
  br label %5741

; <label>:308:                                    ; preds = %303
  br label %309

; <label>:309:                                    ; preds = %308, %144
  %310 = load %struct.DState*, %struct.DState** %2, align 8
  %311 = getelementptr inbounds %struct.DState, %struct.DState* %310, i32 0, i32 1
  store i32 11, i32* %311, align 8
  br label %312

; <label>:312:                                    ; preds = %391, %309
  %313 = load %struct.DState*, %struct.DState** %2, align 8
  %314 = getelementptr inbounds %struct.DState, %struct.DState* %313, i32 0, i32 8
  %315 = load i32, i32* %314, align 4
  %316 = icmp sge i32 %315, 8
  br i1 %316, label %317, label %333

; <label>:317:                                    ; preds = %312
  %318 = load %struct.DState*, %struct.DState** %2, align 8
  %319 = getelementptr inbounds %struct.DState, %struct.DState* %318, i32 0, i32 7
  %320 = load i32, i32* %319, align 8
  %321 = load %struct.DState*, %struct.DState** %2, align 8
  %322 = getelementptr inbounds %struct.DState, %struct.DState* %321, i32 0, i32 8
  %323 = load i32, i32* %322, align 4
  %324 = sub nsw i32 %323, 8
  %325 = lshr i32 %320, %324
  %326 = and i32 %325, 255
  store i32 %326, i32* %33, align 4
  %327 = load %struct.DState*, %struct.DState** %2, align 8
  %328 = getelementptr inbounds %struct.DState, %struct.DState* %327, i32 0, i32 8
  %329 = load i32, i32* %328, align 4
  %330 = sub nsw i32 %329, 8
  store i32 %330, i32* %328, align 4
  %331 = load i32, i32* %33, align 4
  %332 = trunc i32 %331 to i8
  store i8 %332, i8* %3, align 1
  br label %392

; <label>:333:                                    ; preds = %312
  %334 = load %struct.DState*, %struct.DState** %2, align 8
  %335 = getelementptr inbounds %struct.DState, %struct.DState* %334, i32 0, i32 0
  %336 = load %struct.bz_stream*, %struct.bz_stream** %335, align 8
  %337 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %336, i32 0, i32 1
  %338 = load i32, i32* %337, align 8
  %339 = icmp eq i32 %338, 0
  br i1 %339, label %340, label %341

; <label>:340:                                    ; preds = %333
  store i32 0, i32* %4, align 4
  br label %5741

; <label>:341:                                    ; preds = %333
  %342 = load %struct.DState*, %struct.DState** %2, align 8
  %343 = getelementptr inbounds %struct.DState, %struct.DState* %342, i32 0, i32 7
  %344 = load i32, i32* %343, align 8
  %345 = shl i32 %344, 8
  %346 = load %struct.DState*, %struct.DState** %2, align 8
  %347 = getelementptr inbounds %struct.DState, %struct.DState* %346, i32 0, i32 0
  %348 = load %struct.bz_stream*, %struct.bz_stream** %347, align 8
  %349 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %348, i32 0, i32 0
  %350 = load i8*, i8** %349, align 8
  %351 = load i8, i8* %350, align 1
  %352 = zext i8 %351 to i32
  %353 = or i32 %345, %352
  %354 = load %struct.DState*, %struct.DState** %2, align 8
  %355 = getelementptr inbounds %struct.DState, %struct.DState* %354, i32 0, i32 7
  store i32 %353, i32* %355, align 8
  %356 = load %struct.DState*, %struct.DState** %2, align 8
  %357 = getelementptr inbounds %struct.DState, %struct.DState* %356, i32 0, i32 8
  %358 = load i32, i32* %357, align 4
  %359 = add nsw i32 %358, 8
  store i32 %359, i32* %357, align 4
  %360 = load %struct.DState*, %struct.DState** %2, align 8
  %361 = getelementptr inbounds %struct.DState, %struct.DState* %360, i32 0, i32 0
  %362 = load %struct.bz_stream*, %struct.bz_stream** %361, align 8
  %363 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %362, i32 0, i32 0
  %364 = load i8*, i8** %363, align 8
  %365 = getelementptr inbounds i8, i8* %364, i32 1
  store i8* %365, i8** %363, align 8
  %366 = load %struct.DState*, %struct.DState** %2, align 8
  %367 = getelementptr inbounds %struct.DState, %struct.DState* %366, i32 0, i32 0
  %368 = load %struct.bz_stream*, %struct.bz_stream** %367, align 8
  %369 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %368, i32 0, i32 1
  %370 = load i32, i32* %369, align 8
  %371 = add i32 %370, -1
  store i32 %371, i32* %369, align 8
  %372 = load %struct.DState*, %struct.DState** %2, align 8
  %373 = getelementptr inbounds %struct.DState, %struct.DState* %372, i32 0, i32 0
  %374 = load %struct.bz_stream*, %struct.bz_stream** %373, align 8
  %375 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %374, i32 0, i32 2
  %376 = load i32, i32* %375, align 4
  %377 = add i32 %376, 1
  store i32 %377, i32* %375, align 4
  %378 = load %struct.DState*, %struct.DState** %2, align 8
  %379 = getelementptr inbounds %struct.DState, %struct.DState* %378, i32 0, i32 0
  %380 = load %struct.bz_stream*, %struct.bz_stream** %379, align 8
  %381 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %380, i32 0, i32 2
  %382 = load i32, i32* %381, align 4
  %383 = icmp eq i32 %382, 0
  br i1 %383, label %384, label %391

; <label>:384:                                    ; preds = %341
  %385 = load %struct.DState*, %struct.DState** %2, align 8
  %386 = getelementptr inbounds %struct.DState, %struct.DState* %385, i32 0, i32 0
  %387 = load %struct.bz_stream*, %struct.bz_stream** %386, align 8
  %388 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %387, i32 0, i32 3
  %389 = load i32, i32* %388, align 8
  %390 = add i32 %389, 1
  store i32 %390, i32* %388, align 8
  br label %391

; <label>:391:                                    ; preds = %384, %341
  br label %312

; <label>:392:                                    ; preds = %317
  %393 = load i8, i8* %3, align 1
  %394 = zext i8 %393 to i32
  %395 = icmp ne i32 %394, 90
  br i1 %395, label %396, label %397

; <label>:396:                                    ; preds = %392
  store i32 -5, i32* %4, align 4
  br label %5741

; <label>:397:                                    ; preds = %392
  br label %398

; <label>:398:                                    ; preds = %397, %144
  %399 = load %struct.DState*, %struct.DState** %2, align 8
  %400 = getelementptr inbounds %struct.DState, %struct.DState* %399, i32 0, i32 1
  store i32 12, i32* %400, align 8
  br label %401

; <label>:401:                                    ; preds = %480, %398
  %402 = load %struct.DState*, %struct.DState** %2, align 8
  %403 = getelementptr inbounds %struct.DState, %struct.DState* %402, i32 0, i32 8
  %404 = load i32, i32* %403, align 4
  %405 = icmp sge i32 %404, 8
  br i1 %405, label %406, label %422

; <label>:406:                                    ; preds = %401
  %407 = load %struct.DState*, %struct.DState** %2, align 8
  %408 = getelementptr inbounds %struct.DState, %struct.DState* %407, i32 0, i32 7
  %409 = load i32, i32* %408, align 8
  %410 = load %struct.DState*, %struct.DState** %2, align 8
  %411 = getelementptr inbounds %struct.DState, %struct.DState* %410, i32 0, i32 8
  %412 = load i32, i32* %411, align 4
  %413 = sub nsw i32 %412, 8
  %414 = lshr i32 %409, %413
  %415 = and i32 %414, 255
  store i32 %415, i32* %34, align 4
  %416 = load %struct.DState*, %struct.DState** %2, align 8
  %417 = getelementptr inbounds %struct.DState, %struct.DState* %416, i32 0, i32 8
  %418 = load i32, i32* %417, align 4
  %419 = sub nsw i32 %418, 8
  store i32 %419, i32* %417, align 4
  %420 = load i32, i32* %34, align 4
  %421 = trunc i32 %420 to i8
  store i8 %421, i8* %3, align 1
  br label %481

; <label>:422:                                    ; preds = %401
  %423 = load %struct.DState*, %struct.DState** %2, align 8
  %424 = getelementptr inbounds %struct.DState, %struct.DState* %423, i32 0, i32 0
  %425 = load %struct.bz_stream*, %struct.bz_stream** %424, align 8
  %426 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %425, i32 0, i32 1
  %427 = load i32, i32* %426, align 8
  %428 = icmp eq i32 %427, 0
  br i1 %428, label %429, label %430

; <label>:429:                                    ; preds = %422
  store i32 0, i32* %4, align 4
  br label %5741

; <label>:430:                                    ; preds = %422
  %431 = load %struct.DState*, %struct.DState** %2, align 8
  %432 = getelementptr inbounds %struct.DState, %struct.DState* %431, i32 0, i32 7
  %433 = load i32, i32* %432, align 8
  %434 = shl i32 %433, 8
  %435 = load %struct.DState*, %struct.DState** %2, align 8
  %436 = getelementptr inbounds %struct.DState, %struct.DState* %435, i32 0, i32 0
  %437 = load %struct.bz_stream*, %struct.bz_stream** %436, align 8
  %438 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %437, i32 0, i32 0
  %439 = load i8*, i8** %438, align 8
  %440 = load i8, i8* %439, align 1
  %441 = zext i8 %440 to i32
  %442 = or i32 %434, %441
  %443 = load %struct.DState*, %struct.DState** %2, align 8
  %444 = getelementptr inbounds %struct.DState, %struct.DState* %443, i32 0, i32 7
  store i32 %442, i32* %444, align 8
  %445 = load %struct.DState*, %struct.DState** %2, align 8
  %446 = getelementptr inbounds %struct.DState, %struct.DState* %445, i32 0, i32 8
  %447 = load i32, i32* %446, align 4
  %448 = add nsw i32 %447, 8
  store i32 %448, i32* %446, align 4
  %449 = load %struct.DState*, %struct.DState** %2, align 8
  %450 = getelementptr inbounds %struct.DState, %struct.DState* %449, i32 0, i32 0
  %451 = load %struct.bz_stream*, %struct.bz_stream** %450, align 8
  %452 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %451, i32 0, i32 0
  %453 = load i8*, i8** %452, align 8
  %454 = getelementptr inbounds i8, i8* %453, i32 1
  store i8* %454, i8** %452, align 8
  %455 = load %struct.DState*, %struct.DState** %2, align 8
  %456 = getelementptr inbounds %struct.DState, %struct.DState* %455, i32 0, i32 0
  %457 = load %struct.bz_stream*, %struct.bz_stream** %456, align 8
  %458 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %457, i32 0, i32 1
  %459 = load i32, i32* %458, align 8
  %460 = add i32 %459, -1
  store i32 %460, i32* %458, align 8
  %461 = load %struct.DState*, %struct.DState** %2, align 8
  %462 = getelementptr inbounds %struct.DState, %struct.DState* %461, i32 0, i32 0
  %463 = load %struct.bz_stream*, %struct.bz_stream** %462, align 8
  %464 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %463, i32 0, i32 2
  %465 = load i32, i32* %464, align 4
  %466 = add i32 %465, 1
  store i32 %466, i32* %464, align 4
  %467 = load %struct.DState*, %struct.DState** %2, align 8
  %468 = getelementptr inbounds %struct.DState, %struct.DState* %467, i32 0, i32 0
  %469 = load %struct.bz_stream*, %struct.bz_stream** %468, align 8
  %470 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %469, i32 0, i32 2
  %471 = load i32, i32* %470, align 4
  %472 = icmp eq i32 %471, 0
  br i1 %472, label %473, label %480

; <label>:473:                                    ; preds = %430
  %474 = load %struct.DState*, %struct.DState** %2, align 8
  %475 = getelementptr inbounds %struct.DState, %struct.DState* %474, i32 0, i32 0
  %476 = load %struct.bz_stream*, %struct.bz_stream** %475, align 8
  %477 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %476, i32 0, i32 3
  %478 = load i32, i32* %477, align 8
  %479 = add i32 %478, 1
  store i32 %479, i32* %477, align 8
  br label %480

; <label>:480:                                    ; preds = %473, %430
  br label %401

; <label>:481:                                    ; preds = %406
  %482 = load i8, i8* %3, align 1
  %483 = zext i8 %482 to i32
  %484 = icmp ne i32 %483, 104
  br i1 %484, label %485, label %486

; <label>:485:                                    ; preds = %481
  store i32 -5, i32* %4, align 4
  br label %5741

; <label>:486:                                    ; preds = %481
  br label %487

; <label>:487:                                    ; preds = %486, %144
  %488 = load %struct.DState*, %struct.DState** %2, align 8
  %489 = getelementptr inbounds %struct.DState, %struct.DState* %488, i32 0, i32 1
  store i32 13, i32* %489, align 8
  br label %490

; <label>:490:                                    ; preds = %570, %487
  %491 = load %struct.DState*, %struct.DState** %2, align 8
  %492 = getelementptr inbounds %struct.DState, %struct.DState* %491, i32 0, i32 8
  %493 = load i32, i32* %492, align 4
  %494 = icmp sge i32 %493, 8
  br i1 %494, label %495, label %512

; <label>:495:                                    ; preds = %490
  %496 = load %struct.DState*, %struct.DState** %2, align 8
  %497 = getelementptr inbounds %struct.DState, %struct.DState* %496, i32 0, i32 7
  %498 = load i32, i32* %497, align 8
  %499 = load %struct.DState*, %struct.DState** %2, align 8
  %500 = getelementptr inbounds %struct.DState, %struct.DState* %499, i32 0, i32 8
  %501 = load i32, i32* %500, align 4
  %502 = sub nsw i32 %501, 8
  %503 = lshr i32 %498, %502
  %504 = and i32 %503, 255
  store i32 %504, i32* %35, align 4
  %505 = load %struct.DState*, %struct.DState** %2, align 8
  %506 = getelementptr inbounds %struct.DState, %struct.DState* %505, i32 0, i32 8
  %507 = load i32, i32* %506, align 4
  %508 = sub nsw i32 %507, 8
  store i32 %508, i32* %506, align 4
  %509 = load i32, i32* %35, align 4
  %510 = load %struct.DState*, %struct.DState** %2, align 8
  %511 = getelementptr inbounds %struct.DState, %struct.DState* %510, i32 0, i32 9
  store i32 %509, i32* %511, align 8
  br label %571

; <label>:512:                                    ; preds = %490
  %513 = load %struct.DState*, %struct.DState** %2, align 8
  %514 = getelementptr inbounds %struct.DState, %struct.DState* %513, i32 0, i32 0
  %515 = load %struct.bz_stream*, %struct.bz_stream** %514, align 8
  %516 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %515, i32 0, i32 1
  %517 = load i32, i32* %516, align 8
  %518 = icmp eq i32 %517, 0
  br i1 %518, label %519, label %520

; <label>:519:                                    ; preds = %512
  store i32 0, i32* %4, align 4
  br label %5741

; <label>:520:                                    ; preds = %512
  %521 = load %struct.DState*, %struct.DState** %2, align 8
  %522 = getelementptr inbounds %struct.DState, %struct.DState* %521, i32 0, i32 7
  %523 = load i32, i32* %522, align 8
  %524 = shl i32 %523, 8
  %525 = load %struct.DState*, %struct.DState** %2, align 8
  %526 = getelementptr inbounds %struct.DState, %struct.DState* %525, i32 0, i32 0
  %527 = load %struct.bz_stream*, %struct.bz_stream** %526, align 8
  %528 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %527, i32 0, i32 0
  %529 = load i8*, i8** %528, align 8
  %530 = load i8, i8* %529, align 1
  %531 = zext i8 %530 to i32
  %532 = or i32 %524, %531
  %533 = load %struct.DState*, %struct.DState** %2, align 8
  %534 = getelementptr inbounds %struct.DState, %struct.DState* %533, i32 0, i32 7
  store i32 %532, i32* %534, align 8
  %535 = load %struct.DState*, %struct.DState** %2, align 8
  %536 = getelementptr inbounds %struct.DState, %struct.DState* %535, i32 0, i32 8
  %537 = load i32, i32* %536, align 4
  %538 = add nsw i32 %537, 8
  store i32 %538, i32* %536, align 4
  %539 = load %struct.DState*, %struct.DState** %2, align 8
  %540 = getelementptr inbounds %struct.DState, %struct.DState* %539, i32 0, i32 0
  %541 = load %struct.bz_stream*, %struct.bz_stream** %540, align 8
  %542 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %541, i32 0, i32 0
  %543 = load i8*, i8** %542, align 8
  %544 = getelementptr inbounds i8, i8* %543, i32 1
  store i8* %544, i8** %542, align 8
  %545 = load %struct.DState*, %struct.DState** %2, align 8
  %546 = getelementptr inbounds %struct.DState, %struct.DState* %545, i32 0, i32 0
  %547 = load %struct.bz_stream*, %struct.bz_stream** %546, align 8
  %548 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %547, i32 0, i32 1
  %549 = load i32, i32* %548, align 8
  %550 = add i32 %549, -1
  store i32 %550, i32* %548, align 8
  %551 = load %struct.DState*, %struct.DState** %2, align 8
  %552 = getelementptr inbounds %struct.DState, %struct.DState* %551, i32 0, i32 0
  %553 = load %struct.bz_stream*, %struct.bz_stream** %552, align 8
  %554 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %553, i32 0, i32 2
  %555 = load i32, i32* %554, align 4
  %556 = add i32 %555, 1
  store i32 %556, i32* %554, align 4
  %557 = load %struct.DState*, %struct.DState** %2, align 8
  %558 = getelementptr inbounds %struct.DState, %struct.DState* %557, i32 0, i32 0
  %559 = load %struct.bz_stream*, %struct.bz_stream** %558, align 8
  %560 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %559, i32 0, i32 2
  %561 = load i32, i32* %560, align 4
  %562 = icmp eq i32 %561, 0
  br i1 %562, label %563, label %570

; <label>:563:                                    ; preds = %520
  %564 = load %struct.DState*, %struct.DState** %2, align 8
  %565 = getelementptr inbounds %struct.DState, %struct.DState* %564, i32 0, i32 0
  %566 = load %struct.bz_stream*, %struct.bz_stream** %565, align 8
  %567 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %566, i32 0, i32 3
  %568 = load i32, i32* %567, align 8
  %569 = add i32 %568, 1
  store i32 %569, i32* %567, align 8
  br label %570

; <label>:570:                                    ; preds = %563, %520
  br label %490

; <label>:571:                                    ; preds = %495
  %572 = load %struct.DState*, %struct.DState** %2, align 8
  %573 = getelementptr inbounds %struct.DState, %struct.DState* %572, i32 0, i32 9
  %574 = load i32, i32* %573, align 8
  %575 = icmp slt i32 %574, 49
  br i1 %575, label %581, label %576

; <label>:576:                                    ; preds = %571
  %577 = load %struct.DState*, %struct.DState** %2, align 8
  %578 = getelementptr inbounds %struct.DState, %struct.DState* %577, i32 0, i32 9
  %579 = load i32, i32* %578, align 8
  %580 = icmp sgt i32 %579, 57
  br i1 %580, label %581, label %582

; <label>:581:                                    ; preds = %576, %571
  store i32 -5, i32* %4, align 4
  br label %5741

; <label>:582:                                    ; preds = %576
  %583 = load %struct.DState*, %struct.DState** %2, align 8
  %584 = getelementptr inbounds %struct.DState, %struct.DState* %583, i32 0, i32 9
  %585 = load i32, i32* %584, align 8
  %586 = sub nsw i32 %585, 48
  store i32 %586, i32* %584, align 8
  %587 = load %struct.DState*, %struct.DState** %2, align 8
  %588 = getelementptr inbounds %struct.DState, %struct.DState* %587, i32 0, i32 10
  %589 = load i8, i8* %588, align 4
  %590 = icmp ne i8 %589, 0
  br i1 %590, label %591, label %638

; <label>:591:                                    ; preds = %582
  %592 = load %struct.bz_stream*, %struct.bz_stream** %7, align 8
  %593 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %592, i32 0, i32 9
  %594 = load i8* (i8*, i32, i32)*, i8* (i8*, i32, i32)** %593, align 8
  %595 = load %struct.bz_stream*, %struct.bz_stream** %7, align 8
  %596 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %595, i32 0, i32 11
  %597 = load i8*, i8** %596, align 8
  %598 = load %struct.DState*, %struct.DState** %2, align 8
  %599 = getelementptr inbounds %struct.DState, %struct.DState* %598, i32 0, i32 9
  %600 = load i32, i32* %599, align 8
  %601 = mul nsw i32 %600, 100000
  %602 = sext i32 %601 to i64
  %603 = mul i64 %602, 2
  %604 = trunc i64 %603 to i32
  %605 = call i8* %594(i8* %597, i32 %604, i32 1)
  %606 = bitcast i8* %605 to i16*
  %607 = load %struct.DState*, %struct.DState** %2, align 8
  %608 = getelementptr inbounds %struct.DState, %struct.DState* %607, i32 0, i32 21
  store i16* %606, i16** %608, align 8
  %609 = load %struct.bz_stream*, %struct.bz_stream** %7, align 8
  %610 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %609, i32 0, i32 9
  %611 = load i8* (i8*, i32, i32)*, i8* (i8*, i32, i32)** %610, align 8
  %612 = load %struct.bz_stream*, %struct.bz_stream** %7, align 8
  %613 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %612, i32 0, i32 11
  %614 = load i8*, i8** %613, align 8
  %615 = load %struct.DState*, %struct.DState** %2, align 8
  %616 = getelementptr inbounds %struct.DState, %struct.DState* %615, i32 0, i32 9
  %617 = load i32, i32* %616, align 8
  %618 = mul nsw i32 %617, 100000
  %619 = add nsw i32 1, %618
  %620 = ashr i32 %619, 1
  %621 = sext i32 %620 to i64
  %622 = mul i64 %621, 1
  %623 = trunc i64 %622 to i32
  %624 = call i8* %611(i8* %614, i32 %623, i32 1)
  %625 = load %struct.DState*, %struct.DState** %2, align 8
  %626 = getelementptr inbounds %struct.DState, %struct.DState* %625, i32 0, i32 22
  store i8* %624, i8** %626, align 8
  %627 = load %struct.DState*, %struct.DState** %2, align 8
  %628 = getelementptr inbounds %struct.DState, %struct.DState* %627, i32 0, i32 21
  %629 = load i16*, i16** %628, align 8
  %630 = icmp eq i16* %629, null
  br i1 %630, label %636, label %631

; <label>:631:                                    ; preds = %591
  %632 = load %struct.DState*, %struct.DState** %2, align 8
  %633 = getelementptr inbounds %struct.DState, %struct.DState* %632, i32 0, i32 22
  %634 = load i8*, i8** %633, align 8
  %635 = icmp eq i8* %634, null
  br i1 %635, label %636, label %637

; <label>:636:                                    ; preds = %631, %591
  store i32 -3, i32* %4, align 4
  br label %5741

; <label>:637:                                    ; preds = %631
  br label %662

; <label>:638:                                    ; preds = %582
  %639 = load %struct.bz_stream*, %struct.bz_stream** %7, align 8
  %640 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %639, i32 0, i32 9
  %641 = load i8* (i8*, i32, i32)*, i8* (i8*, i32, i32)** %640, align 8
  %642 = load %struct.bz_stream*, %struct.bz_stream** %7, align 8
  %643 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %642, i32 0, i32 11
  %644 = load i8*, i8** %643, align 8
  %645 = load %struct.DState*, %struct.DState** %2, align 8
  %646 = getelementptr inbounds %struct.DState, %struct.DState* %645, i32 0, i32 9
  %647 = load i32, i32* %646, align 8
  %648 = mul nsw i32 %647, 100000
  %649 = sext i32 %648 to i64
  %650 = mul i64 %649, 4
  %651 = trunc i64 %650 to i32
  %652 = call i8* %641(i8* %644, i32 %651, i32 1)
  %653 = bitcast i8* %652 to i32*
  %654 = load %struct.DState*, %struct.DState** %2, align 8
  %655 = getelementptr inbounds %struct.DState, %struct.DState* %654, i32 0, i32 20
  store i32* %653, i32** %655, align 8
  %656 = load %struct.DState*, %struct.DState** %2, align 8
  %657 = getelementptr inbounds %struct.DState, %struct.DState* %656, i32 0, i32 20
  %658 = load i32*, i32** %657, align 8
  %659 = icmp eq i32* %658, null
  br i1 %659, label %660, label %661

; <label>:660:                                    ; preds = %638
  store i32 -3, i32* %4, align 4
  br label %5741

; <label>:661:                                    ; preds = %638
  br label %662

; <label>:662:                                    ; preds = %661, %637
  br label %663

; <label>:663:                                    ; preds = %662, %144
  %664 = load %struct.DState*, %struct.DState** %2, align 8
  %665 = getelementptr inbounds %struct.DState, %struct.DState* %664, i32 0, i32 1
  store i32 14, i32* %665, align 8
  br label %666

; <label>:666:                                    ; preds = %745, %663
  %667 = load %struct.DState*, %struct.DState** %2, align 8
  %668 = getelementptr inbounds %struct.DState, %struct.DState* %667, i32 0, i32 8
  %669 = load i32, i32* %668, align 4
  %670 = icmp sge i32 %669, 8
  br i1 %670, label %671, label %687

; <label>:671:                                    ; preds = %666
  %672 = load %struct.DState*, %struct.DState** %2, align 8
  %673 = getelementptr inbounds %struct.DState, %struct.DState* %672, i32 0, i32 7
  %674 = load i32, i32* %673, align 8
  %675 = load %struct.DState*, %struct.DState** %2, align 8
  %676 = getelementptr inbounds %struct.DState, %struct.DState* %675, i32 0, i32 8
  %677 = load i32, i32* %676, align 4
  %678 = sub nsw i32 %677, 8
  %679 = lshr i32 %674, %678
  %680 = and i32 %679, 255
  store i32 %680, i32* %36, align 4
  %681 = load %struct.DState*, %struct.DState** %2, align 8
  %682 = getelementptr inbounds %struct.DState, %struct.DState* %681, i32 0, i32 8
  %683 = load i32, i32* %682, align 4
  %684 = sub nsw i32 %683, 8
  store i32 %684, i32* %682, align 4
  %685 = load i32, i32* %36, align 4
  %686 = trunc i32 %685 to i8
  store i8 %686, i8* %3, align 1
  br label %746

; <label>:687:                                    ; preds = %666
  %688 = load %struct.DState*, %struct.DState** %2, align 8
  %689 = getelementptr inbounds %struct.DState, %struct.DState* %688, i32 0, i32 0
  %690 = load %struct.bz_stream*, %struct.bz_stream** %689, align 8
  %691 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %690, i32 0, i32 1
  %692 = load i32, i32* %691, align 8
  %693 = icmp eq i32 %692, 0
  br i1 %693, label %694, label %695

; <label>:694:                                    ; preds = %687
  store i32 0, i32* %4, align 4
  br label %5741

; <label>:695:                                    ; preds = %687
  %696 = load %struct.DState*, %struct.DState** %2, align 8
  %697 = getelementptr inbounds %struct.DState, %struct.DState* %696, i32 0, i32 7
  %698 = load i32, i32* %697, align 8
  %699 = shl i32 %698, 8
  %700 = load %struct.DState*, %struct.DState** %2, align 8
  %701 = getelementptr inbounds %struct.DState, %struct.DState* %700, i32 0, i32 0
  %702 = load %struct.bz_stream*, %struct.bz_stream** %701, align 8
  %703 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %702, i32 0, i32 0
  %704 = load i8*, i8** %703, align 8
  %705 = load i8, i8* %704, align 1
  %706 = zext i8 %705 to i32
  %707 = or i32 %699, %706
  %708 = load %struct.DState*, %struct.DState** %2, align 8
  %709 = getelementptr inbounds %struct.DState, %struct.DState* %708, i32 0, i32 7
  store i32 %707, i32* %709, align 8
  %710 = load %struct.DState*, %struct.DState** %2, align 8
  %711 = getelementptr inbounds %struct.DState, %struct.DState* %710, i32 0, i32 8
  %712 = load i32, i32* %711, align 4
  %713 = add nsw i32 %712, 8
  store i32 %713, i32* %711, align 4
  %714 = load %struct.DState*, %struct.DState** %2, align 8
  %715 = getelementptr inbounds %struct.DState, %struct.DState* %714, i32 0, i32 0
  %716 = load %struct.bz_stream*, %struct.bz_stream** %715, align 8
  %717 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %716, i32 0, i32 0
  %718 = load i8*, i8** %717, align 8
  %719 = getelementptr inbounds i8, i8* %718, i32 1
  store i8* %719, i8** %717, align 8
  %720 = load %struct.DState*, %struct.DState** %2, align 8
  %721 = getelementptr inbounds %struct.DState, %struct.DState* %720, i32 0, i32 0
  %722 = load %struct.bz_stream*, %struct.bz_stream** %721, align 8
  %723 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %722, i32 0, i32 1
  %724 = load i32, i32* %723, align 8
  %725 = add i32 %724, -1
  store i32 %725, i32* %723, align 8
  %726 = load %struct.DState*, %struct.DState** %2, align 8
  %727 = getelementptr inbounds %struct.DState, %struct.DState* %726, i32 0, i32 0
  %728 = load %struct.bz_stream*, %struct.bz_stream** %727, align 8
  %729 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %728, i32 0, i32 2
  %730 = load i32, i32* %729, align 4
  %731 = add i32 %730, 1
  store i32 %731, i32* %729, align 4
  %732 = load %struct.DState*, %struct.DState** %2, align 8
  %733 = getelementptr inbounds %struct.DState, %struct.DState* %732, i32 0, i32 0
  %734 = load %struct.bz_stream*, %struct.bz_stream** %733, align 8
  %735 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %734, i32 0, i32 2
  %736 = load i32, i32* %735, align 4
  %737 = icmp eq i32 %736, 0
  br i1 %737, label %738, label %745

; <label>:738:                                    ; preds = %695
  %739 = load %struct.DState*, %struct.DState** %2, align 8
  %740 = getelementptr inbounds %struct.DState, %struct.DState* %739, i32 0, i32 0
  %741 = load %struct.bz_stream*, %struct.bz_stream** %740, align 8
  %742 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %741, i32 0, i32 3
  %743 = load i32, i32* %742, align 8
  %744 = add i32 %743, 1
  store i32 %744, i32* %742, align 8
  br label %745

; <label>:745:                                    ; preds = %738, %695
  br label %666

; <label>:746:                                    ; preds = %671
  %747 = load i8, i8* %3, align 1
  %748 = zext i8 %747 to i32
  %749 = icmp eq i32 %748, 23
  br i1 %749, label %750, label %751

; <label>:750:                                    ; preds = %746
  br label %4917

; <label>:751:                                    ; preds = %746
  %752 = load i8, i8* %3, align 1
  %753 = zext i8 %752 to i32
  %754 = icmp ne i32 %753, 49
  br i1 %754, label %755, label %756

; <label>:755:                                    ; preds = %751
  store i32 -4, i32* %4, align 4
  br label %5741

; <label>:756:                                    ; preds = %751
  br label %757

; <label>:757:                                    ; preds = %756, %144
  %758 = load %struct.DState*, %struct.DState** %2, align 8
  %759 = getelementptr inbounds %struct.DState, %struct.DState* %758, i32 0, i32 1
  store i32 15, i32* %759, align 8
  br label %760

; <label>:760:                                    ; preds = %839, %757
  %761 = load %struct.DState*, %struct.DState** %2, align 8
  %762 = getelementptr inbounds %struct.DState, %struct.DState* %761, i32 0, i32 8
  %763 = load i32, i32* %762, align 4
  %764 = icmp sge i32 %763, 8
  br i1 %764, label %765, label %781

; <label>:765:                                    ; preds = %760
  %766 = load %struct.DState*, %struct.DState** %2, align 8
  %767 = getelementptr inbounds %struct.DState, %struct.DState* %766, i32 0, i32 7
  %768 = load i32, i32* %767, align 8
  %769 = load %struct.DState*, %struct.DState** %2, align 8
  %770 = getelementptr inbounds %struct.DState, %struct.DState* %769, i32 0, i32 8
  %771 = load i32, i32* %770, align 4
  %772 = sub nsw i32 %771, 8
  %773 = lshr i32 %768, %772
  %774 = and i32 %773, 255
  store i32 %774, i32* %37, align 4
  %775 = load %struct.DState*, %struct.DState** %2, align 8
  %776 = getelementptr inbounds %struct.DState, %struct.DState* %775, i32 0, i32 8
  %777 = load i32, i32* %776, align 4
  %778 = sub nsw i32 %777, 8
  store i32 %778, i32* %776, align 4
  %779 = load i32, i32* %37, align 4
  %780 = trunc i32 %779 to i8
  store i8 %780, i8* %3, align 1
  br label %840

; <label>:781:                                    ; preds = %760
  %782 = load %struct.DState*, %struct.DState** %2, align 8
  %783 = getelementptr inbounds %struct.DState, %struct.DState* %782, i32 0, i32 0
  %784 = load %struct.bz_stream*, %struct.bz_stream** %783, align 8
  %785 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %784, i32 0, i32 1
  %786 = load i32, i32* %785, align 8
  %787 = icmp eq i32 %786, 0
  br i1 %787, label %788, label %789

; <label>:788:                                    ; preds = %781
  store i32 0, i32* %4, align 4
  br label %5741

; <label>:789:                                    ; preds = %781
  %790 = load %struct.DState*, %struct.DState** %2, align 8
  %791 = getelementptr inbounds %struct.DState, %struct.DState* %790, i32 0, i32 7
  %792 = load i32, i32* %791, align 8
  %793 = shl i32 %792, 8
  %794 = load %struct.DState*, %struct.DState** %2, align 8
  %795 = getelementptr inbounds %struct.DState, %struct.DState* %794, i32 0, i32 0
  %796 = load %struct.bz_stream*, %struct.bz_stream** %795, align 8
  %797 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %796, i32 0, i32 0
  %798 = load i8*, i8** %797, align 8
  %799 = load i8, i8* %798, align 1
  %800 = zext i8 %799 to i32
  %801 = or i32 %793, %800
  %802 = load %struct.DState*, %struct.DState** %2, align 8
  %803 = getelementptr inbounds %struct.DState, %struct.DState* %802, i32 0, i32 7
  store i32 %801, i32* %803, align 8
  %804 = load %struct.DState*, %struct.DState** %2, align 8
  %805 = getelementptr inbounds %struct.DState, %struct.DState* %804, i32 0, i32 8
  %806 = load i32, i32* %805, align 4
  %807 = add nsw i32 %806, 8
  store i32 %807, i32* %805, align 4
  %808 = load %struct.DState*, %struct.DState** %2, align 8
  %809 = getelementptr inbounds %struct.DState, %struct.DState* %808, i32 0, i32 0
  %810 = load %struct.bz_stream*, %struct.bz_stream** %809, align 8
  %811 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %810, i32 0, i32 0
  %812 = load i8*, i8** %811, align 8
  %813 = getelementptr inbounds i8, i8* %812, i32 1
  store i8* %813, i8** %811, align 8
  %814 = load %struct.DState*, %struct.DState** %2, align 8
  %815 = getelementptr inbounds %struct.DState, %struct.DState* %814, i32 0, i32 0
  %816 = load %struct.bz_stream*, %struct.bz_stream** %815, align 8
  %817 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %816, i32 0, i32 1
  %818 = load i32, i32* %817, align 8
  %819 = add i32 %818, -1
  store i32 %819, i32* %817, align 8
  %820 = load %struct.DState*, %struct.DState** %2, align 8
  %821 = getelementptr inbounds %struct.DState, %struct.DState* %820, i32 0, i32 0
  %822 = load %struct.bz_stream*, %struct.bz_stream** %821, align 8
  %823 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %822, i32 0, i32 2
  %824 = load i32, i32* %823, align 4
  %825 = add i32 %824, 1
  store i32 %825, i32* %823, align 4
  %826 = load %struct.DState*, %struct.DState** %2, align 8
  %827 = getelementptr inbounds %struct.DState, %struct.DState* %826, i32 0, i32 0
  %828 = load %struct.bz_stream*, %struct.bz_stream** %827, align 8
  %829 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %828, i32 0, i32 2
  %830 = load i32, i32* %829, align 4
  %831 = icmp eq i32 %830, 0
  br i1 %831, label %832, label %839

; <label>:832:                                    ; preds = %789
  %833 = load %struct.DState*, %struct.DState** %2, align 8
  %834 = getelementptr inbounds %struct.DState, %struct.DState* %833, i32 0, i32 0
  %835 = load %struct.bz_stream*, %struct.bz_stream** %834, align 8
  %836 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %835, i32 0, i32 3
  %837 = load i32, i32* %836, align 8
  %838 = add i32 %837, 1
  store i32 %838, i32* %836, align 8
  br label %839

; <label>:839:                                    ; preds = %832, %789
  br label %760

; <label>:840:                                    ; preds = %765
  %841 = load i8, i8* %3, align 1
  %842 = zext i8 %841 to i32
  %843 = icmp ne i32 %842, 65
  br i1 %843, label %844, label %845

; <label>:844:                                    ; preds = %840
  store i32 -4, i32* %4, align 4
  br label %5741

; <label>:845:                                    ; preds = %840
  br label %846

; <label>:846:                                    ; preds = %845, %144
  %847 = load %struct.DState*, %struct.DState** %2, align 8
  %848 = getelementptr inbounds %struct.DState, %struct.DState* %847, i32 0, i32 1
  store i32 16, i32* %848, align 8
  br label %849

; <label>:849:                                    ; preds = %928, %846
  %850 = load %struct.DState*, %struct.DState** %2, align 8
  %851 = getelementptr inbounds %struct.DState, %struct.DState* %850, i32 0, i32 8
  %852 = load i32, i32* %851, align 4
  %853 = icmp sge i32 %852, 8
  br i1 %853, label %854, label %870

; <label>:854:                                    ; preds = %849
  %855 = load %struct.DState*, %struct.DState** %2, align 8
  %856 = getelementptr inbounds %struct.DState, %struct.DState* %855, i32 0, i32 7
  %857 = load i32, i32* %856, align 8
  %858 = load %struct.DState*, %struct.DState** %2, align 8
  %859 = getelementptr inbounds %struct.DState, %struct.DState* %858, i32 0, i32 8
  %860 = load i32, i32* %859, align 4
  %861 = sub nsw i32 %860, 8
  %862 = lshr i32 %857, %861
  %863 = and i32 %862, 255
  store i32 %863, i32* %38, align 4
  %864 = load %struct.DState*, %struct.DState** %2, align 8
  %865 = getelementptr inbounds %struct.DState, %struct.DState* %864, i32 0, i32 8
  %866 = load i32, i32* %865, align 4
  %867 = sub nsw i32 %866, 8
  store i32 %867, i32* %865, align 4
  %868 = load i32, i32* %38, align 4
  %869 = trunc i32 %868 to i8
  store i8 %869, i8* %3, align 1
  br label %929

; <label>:870:                                    ; preds = %849
  %871 = load %struct.DState*, %struct.DState** %2, align 8
  %872 = getelementptr inbounds %struct.DState, %struct.DState* %871, i32 0, i32 0
  %873 = load %struct.bz_stream*, %struct.bz_stream** %872, align 8
  %874 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %873, i32 0, i32 1
  %875 = load i32, i32* %874, align 8
  %876 = icmp eq i32 %875, 0
  br i1 %876, label %877, label %878

; <label>:877:                                    ; preds = %870
  store i32 0, i32* %4, align 4
  br label %5741

; <label>:878:                                    ; preds = %870
  %879 = load %struct.DState*, %struct.DState** %2, align 8
  %880 = getelementptr inbounds %struct.DState, %struct.DState* %879, i32 0, i32 7
  %881 = load i32, i32* %880, align 8
  %882 = shl i32 %881, 8
  %883 = load %struct.DState*, %struct.DState** %2, align 8
  %884 = getelementptr inbounds %struct.DState, %struct.DState* %883, i32 0, i32 0
  %885 = load %struct.bz_stream*, %struct.bz_stream** %884, align 8
  %886 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %885, i32 0, i32 0
  %887 = load i8*, i8** %886, align 8
  %888 = load i8, i8* %887, align 1
  %889 = zext i8 %888 to i32
  %890 = or i32 %882, %889
  %891 = load %struct.DState*, %struct.DState** %2, align 8
  %892 = getelementptr inbounds %struct.DState, %struct.DState* %891, i32 0, i32 7
  store i32 %890, i32* %892, align 8
  %893 = load %struct.DState*, %struct.DState** %2, align 8
  %894 = getelementptr inbounds %struct.DState, %struct.DState* %893, i32 0, i32 8
  %895 = load i32, i32* %894, align 4
  %896 = add nsw i32 %895, 8
  store i32 %896, i32* %894, align 4
  %897 = load %struct.DState*, %struct.DState** %2, align 8
  %898 = getelementptr inbounds %struct.DState, %struct.DState* %897, i32 0, i32 0
  %899 = load %struct.bz_stream*, %struct.bz_stream** %898, align 8
  %900 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %899, i32 0, i32 0
  %901 = load i8*, i8** %900, align 8
  %902 = getelementptr inbounds i8, i8* %901, i32 1
  store i8* %902, i8** %900, align 8
  %903 = load %struct.DState*, %struct.DState** %2, align 8
  %904 = getelementptr inbounds %struct.DState, %struct.DState* %903, i32 0, i32 0
  %905 = load %struct.bz_stream*, %struct.bz_stream** %904, align 8
  %906 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %905, i32 0, i32 1
  %907 = load i32, i32* %906, align 8
  %908 = add i32 %907, -1
  store i32 %908, i32* %906, align 8
  %909 = load %struct.DState*, %struct.DState** %2, align 8
  %910 = getelementptr inbounds %struct.DState, %struct.DState* %909, i32 0, i32 0
  %911 = load %struct.bz_stream*, %struct.bz_stream** %910, align 8
  %912 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %911, i32 0, i32 2
  %913 = load i32, i32* %912, align 4
  %914 = add i32 %913, 1
  store i32 %914, i32* %912, align 4
  %915 = load %struct.DState*, %struct.DState** %2, align 8
  %916 = getelementptr inbounds %struct.DState, %struct.DState* %915, i32 0, i32 0
  %917 = load %struct.bz_stream*, %struct.bz_stream** %916, align 8
  %918 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %917, i32 0, i32 2
  %919 = load i32, i32* %918, align 4
  %920 = icmp eq i32 %919, 0
  br i1 %920, label %921, label %928

; <label>:921:                                    ; preds = %878
  %922 = load %struct.DState*, %struct.DState** %2, align 8
  %923 = getelementptr inbounds %struct.DState, %struct.DState* %922, i32 0, i32 0
  %924 = load %struct.bz_stream*, %struct.bz_stream** %923, align 8
  %925 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %924, i32 0, i32 3
  %926 = load i32, i32* %925, align 8
  %927 = add i32 %926, 1
  store i32 %927, i32* %925, align 8
  br label %928

; <label>:928:                                    ; preds = %921, %878
  br label %849

; <label>:929:                                    ; preds = %854
  %930 = load i8, i8* %3, align 1
  %931 = zext i8 %930 to i32
  %932 = icmp ne i32 %931, 89
  br i1 %932, label %933, label %934

; <label>:933:                                    ; preds = %929
  store i32 -4, i32* %4, align 4
  br label %5741

; <label>:934:                                    ; preds = %929
  br label %935

; <label>:935:                                    ; preds = %934, %144
  %936 = load %struct.DState*, %struct.DState** %2, align 8
  %937 = getelementptr inbounds %struct.DState, %struct.DState* %936, i32 0, i32 1
  store i32 17, i32* %937, align 8
  br label %938

; <label>:938:                                    ; preds = %1017, %935
  %939 = load %struct.DState*, %struct.DState** %2, align 8
  %940 = getelementptr inbounds %struct.DState, %struct.DState* %939, i32 0, i32 8
  %941 = load i32, i32* %940, align 4
  %942 = icmp sge i32 %941, 8
  br i1 %942, label %943, label %959

; <label>:943:                                    ; preds = %938
  %944 = load %struct.DState*, %struct.DState** %2, align 8
  %945 = getelementptr inbounds %struct.DState, %struct.DState* %944, i32 0, i32 7
  %946 = load i32, i32* %945, align 8
  %947 = load %struct.DState*, %struct.DState** %2, align 8
  %948 = getelementptr inbounds %struct.DState, %struct.DState* %947, i32 0, i32 8
  %949 = load i32, i32* %948, align 4
  %950 = sub nsw i32 %949, 8
  %951 = lshr i32 %946, %950
  %952 = and i32 %951, 255
  store i32 %952, i32* %39, align 4
  %953 = load %struct.DState*, %struct.DState** %2, align 8
  %954 = getelementptr inbounds %struct.DState, %struct.DState* %953, i32 0, i32 8
  %955 = load i32, i32* %954, align 4
  %956 = sub nsw i32 %955, 8
  store i32 %956, i32* %954, align 4
  %957 = load i32, i32* %39, align 4
  %958 = trunc i32 %957 to i8
  store i8 %958, i8* %3, align 1
  br label %1018

; <label>:959:                                    ; preds = %938
  %960 = load %struct.DState*, %struct.DState** %2, align 8
  %961 = getelementptr inbounds %struct.DState, %struct.DState* %960, i32 0, i32 0
  %962 = load %struct.bz_stream*, %struct.bz_stream** %961, align 8
  %963 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %962, i32 0, i32 1
  %964 = load i32, i32* %963, align 8
  %965 = icmp eq i32 %964, 0
  br i1 %965, label %966, label %967

; <label>:966:                                    ; preds = %959
  store i32 0, i32* %4, align 4
  br label %5741

; <label>:967:                                    ; preds = %959
  %968 = load %struct.DState*, %struct.DState** %2, align 8
  %969 = getelementptr inbounds %struct.DState, %struct.DState* %968, i32 0, i32 7
  %970 = load i32, i32* %969, align 8
  %971 = shl i32 %970, 8
  %972 = load %struct.DState*, %struct.DState** %2, align 8
  %973 = getelementptr inbounds %struct.DState, %struct.DState* %972, i32 0, i32 0
  %974 = load %struct.bz_stream*, %struct.bz_stream** %973, align 8
  %975 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %974, i32 0, i32 0
  %976 = load i8*, i8** %975, align 8
  %977 = load i8, i8* %976, align 1
  %978 = zext i8 %977 to i32
  %979 = or i32 %971, %978
  %980 = load %struct.DState*, %struct.DState** %2, align 8
  %981 = getelementptr inbounds %struct.DState, %struct.DState* %980, i32 0, i32 7
  store i32 %979, i32* %981, align 8
  %982 = load %struct.DState*, %struct.DState** %2, align 8
  %983 = getelementptr inbounds %struct.DState, %struct.DState* %982, i32 0, i32 8
  %984 = load i32, i32* %983, align 4
  %985 = add nsw i32 %984, 8
  store i32 %985, i32* %983, align 4
  %986 = load %struct.DState*, %struct.DState** %2, align 8
  %987 = getelementptr inbounds %struct.DState, %struct.DState* %986, i32 0, i32 0
  %988 = load %struct.bz_stream*, %struct.bz_stream** %987, align 8
  %989 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %988, i32 0, i32 0
  %990 = load i8*, i8** %989, align 8
  %991 = getelementptr inbounds i8, i8* %990, i32 1
  store i8* %991, i8** %989, align 8
  %992 = load %struct.DState*, %struct.DState** %2, align 8
  %993 = getelementptr inbounds %struct.DState, %struct.DState* %992, i32 0, i32 0
  %994 = load %struct.bz_stream*, %struct.bz_stream** %993, align 8
  %995 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %994, i32 0, i32 1
  %996 = load i32, i32* %995, align 8
  %997 = add i32 %996, -1
  store i32 %997, i32* %995, align 8
  %998 = load %struct.DState*, %struct.DState** %2, align 8
  %999 = getelementptr inbounds %struct.DState, %struct.DState* %998, i32 0, i32 0
  %1000 = load %struct.bz_stream*, %struct.bz_stream** %999, align 8
  %1001 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1000, i32 0, i32 2
  %1002 = load i32, i32* %1001, align 4
  %1003 = add i32 %1002, 1
  store i32 %1003, i32* %1001, align 4
  %1004 = load %struct.DState*, %struct.DState** %2, align 8
  %1005 = getelementptr inbounds %struct.DState, %struct.DState* %1004, i32 0, i32 0
  %1006 = load %struct.bz_stream*, %struct.bz_stream** %1005, align 8
  %1007 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1006, i32 0, i32 2
  %1008 = load i32, i32* %1007, align 4
  %1009 = icmp eq i32 %1008, 0
  br i1 %1009, label %1010, label %1017

; <label>:1010:                                   ; preds = %967
  %1011 = load %struct.DState*, %struct.DState** %2, align 8
  %1012 = getelementptr inbounds %struct.DState, %struct.DState* %1011, i32 0, i32 0
  %1013 = load %struct.bz_stream*, %struct.bz_stream** %1012, align 8
  %1014 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1013, i32 0, i32 3
  %1015 = load i32, i32* %1014, align 8
  %1016 = add i32 %1015, 1
  store i32 %1016, i32* %1014, align 8
  br label %1017

; <label>:1017:                                   ; preds = %1010, %967
  br label %938

; <label>:1018:                                   ; preds = %943
  %1019 = load i8, i8* %3, align 1
  %1020 = zext i8 %1019 to i32
  %1021 = icmp ne i32 %1020, 38
  br i1 %1021, label %1022, label %1023

; <label>:1022:                                   ; preds = %1018
  store i32 -4, i32* %4, align 4
  br label %5741

; <label>:1023:                                   ; preds = %1018
  br label %1024

; <label>:1024:                                   ; preds = %1023, %144
  %1025 = load %struct.DState*, %struct.DState** %2, align 8
  %1026 = getelementptr inbounds %struct.DState, %struct.DState* %1025, i32 0, i32 1
  store i32 18, i32* %1026, align 8
  br label %1027

; <label>:1027:                                   ; preds = %1106, %1024
  %1028 = load %struct.DState*, %struct.DState** %2, align 8
  %1029 = getelementptr inbounds %struct.DState, %struct.DState* %1028, i32 0, i32 8
  %1030 = load i32, i32* %1029, align 4
  %1031 = icmp sge i32 %1030, 8
  br i1 %1031, label %1032, label %1048

; <label>:1032:                                   ; preds = %1027
  %1033 = load %struct.DState*, %struct.DState** %2, align 8
  %1034 = getelementptr inbounds %struct.DState, %struct.DState* %1033, i32 0, i32 7
  %1035 = load i32, i32* %1034, align 8
  %1036 = load %struct.DState*, %struct.DState** %2, align 8
  %1037 = getelementptr inbounds %struct.DState, %struct.DState* %1036, i32 0, i32 8
  %1038 = load i32, i32* %1037, align 4
  %1039 = sub nsw i32 %1038, 8
  %1040 = lshr i32 %1035, %1039
  %1041 = and i32 %1040, 255
  store i32 %1041, i32* %40, align 4
  %1042 = load %struct.DState*, %struct.DState** %2, align 8
  %1043 = getelementptr inbounds %struct.DState, %struct.DState* %1042, i32 0, i32 8
  %1044 = load i32, i32* %1043, align 4
  %1045 = sub nsw i32 %1044, 8
  store i32 %1045, i32* %1043, align 4
  %1046 = load i32, i32* %40, align 4
  %1047 = trunc i32 %1046 to i8
  store i8 %1047, i8* %3, align 1
  br label %1107

; <label>:1048:                                   ; preds = %1027
  %1049 = load %struct.DState*, %struct.DState** %2, align 8
  %1050 = getelementptr inbounds %struct.DState, %struct.DState* %1049, i32 0, i32 0
  %1051 = load %struct.bz_stream*, %struct.bz_stream** %1050, align 8
  %1052 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1051, i32 0, i32 1
  %1053 = load i32, i32* %1052, align 8
  %1054 = icmp eq i32 %1053, 0
  br i1 %1054, label %1055, label %1056

; <label>:1055:                                   ; preds = %1048
  store i32 0, i32* %4, align 4
  br label %5741

; <label>:1056:                                   ; preds = %1048
  %1057 = load %struct.DState*, %struct.DState** %2, align 8
  %1058 = getelementptr inbounds %struct.DState, %struct.DState* %1057, i32 0, i32 7
  %1059 = load i32, i32* %1058, align 8
  %1060 = shl i32 %1059, 8
  %1061 = load %struct.DState*, %struct.DState** %2, align 8
  %1062 = getelementptr inbounds %struct.DState, %struct.DState* %1061, i32 0, i32 0
  %1063 = load %struct.bz_stream*, %struct.bz_stream** %1062, align 8
  %1064 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1063, i32 0, i32 0
  %1065 = load i8*, i8** %1064, align 8
  %1066 = load i8, i8* %1065, align 1
  %1067 = zext i8 %1066 to i32
  %1068 = or i32 %1060, %1067
  %1069 = load %struct.DState*, %struct.DState** %2, align 8
  %1070 = getelementptr inbounds %struct.DState, %struct.DState* %1069, i32 0, i32 7
  store i32 %1068, i32* %1070, align 8
  %1071 = load %struct.DState*, %struct.DState** %2, align 8
  %1072 = getelementptr inbounds %struct.DState, %struct.DState* %1071, i32 0, i32 8
  %1073 = load i32, i32* %1072, align 4
  %1074 = add nsw i32 %1073, 8
  store i32 %1074, i32* %1072, align 4
  %1075 = load %struct.DState*, %struct.DState** %2, align 8
  %1076 = getelementptr inbounds %struct.DState, %struct.DState* %1075, i32 0, i32 0
  %1077 = load %struct.bz_stream*, %struct.bz_stream** %1076, align 8
  %1078 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1077, i32 0, i32 0
  %1079 = load i8*, i8** %1078, align 8
  %1080 = getelementptr inbounds i8, i8* %1079, i32 1
  store i8* %1080, i8** %1078, align 8
  %1081 = load %struct.DState*, %struct.DState** %2, align 8
  %1082 = getelementptr inbounds %struct.DState, %struct.DState* %1081, i32 0, i32 0
  %1083 = load %struct.bz_stream*, %struct.bz_stream** %1082, align 8
  %1084 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1083, i32 0, i32 1
  %1085 = load i32, i32* %1084, align 8
  %1086 = add i32 %1085, -1
  store i32 %1086, i32* %1084, align 8
  %1087 = load %struct.DState*, %struct.DState** %2, align 8
  %1088 = getelementptr inbounds %struct.DState, %struct.DState* %1087, i32 0, i32 0
  %1089 = load %struct.bz_stream*, %struct.bz_stream** %1088, align 8
  %1090 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1089, i32 0, i32 2
  %1091 = load i32, i32* %1090, align 4
  %1092 = add i32 %1091, 1
  store i32 %1092, i32* %1090, align 4
  %1093 = load %struct.DState*, %struct.DState** %2, align 8
  %1094 = getelementptr inbounds %struct.DState, %struct.DState* %1093, i32 0, i32 0
  %1095 = load %struct.bz_stream*, %struct.bz_stream** %1094, align 8
  %1096 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1095, i32 0, i32 2
  %1097 = load i32, i32* %1096, align 4
  %1098 = icmp eq i32 %1097, 0
  br i1 %1098, label %1099, label %1106

; <label>:1099:                                   ; preds = %1056
  %1100 = load %struct.DState*, %struct.DState** %2, align 8
  %1101 = getelementptr inbounds %struct.DState, %struct.DState* %1100, i32 0, i32 0
  %1102 = load %struct.bz_stream*, %struct.bz_stream** %1101, align 8
  %1103 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1102, i32 0, i32 3
  %1104 = load i32, i32* %1103, align 8
  %1105 = add i32 %1104, 1
  store i32 %1105, i32* %1103, align 8
  br label %1106

; <label>:1106:                                   ; preds = %1099, %1056
  br label %1027

; <label>:1107:                                   ; preds = %1032
  %1108 = load i8, i8* %3, align 1
  %1109 = zext i8 %1108 to i32
  %1110 = icmp ne i32 %1109, 83
  br i1 %1110, label %1111, label %1112

; <label>:1111:                                   ; preds = %1107
  store i32 -4, i32* %4, align 4
  br label %5741

; <label>:1112:                                   ; preds = %1107
  br label %1113

; <label>:1113:                                   ; preds = %1112, %144
  %1114 = load %struct.DState*, %struct.DState** %2, align 8
  %1115 = getelementptr inbounds %struct.DState, %struct.DState* %1114, i32 0, i32 1
  store i32 19, i32* %1115, align 8
  br label %1116

; <label>:1116:                                   ; preds = %1195, %1113
  %1117 = load %struct.DState*, %struct.DState** %2, align 8
  %1118 = getelementptr inbounds %struct.DState, %struct.DState* %1117, i32 0, i32 8
  %1119 = load i32, i32* %1118, align 4
  %1120 = icmp sge i32 %1119, 8
  br i1 %1120, label %1121, label %1137

; <label>:1121:                                   ; preds = %1116
  %1122 = load %struct.DState*, %struct.DState** %2, align 8
  %1123 = getelementptr inbounds %struct.DState, %struct.DState* %1122, i32 0, i32 7
  %1124 = load i32, i32* %1123, align 8
  %1125 = load %struct.DState*, %struct.DState** %2, align 8
  %1126 = getelementptr inbounds %struct.DState, %struct.DState* %1125, i32 0, i32 8
  %1127 = load i32, i32* %1126, align 4
  %1128 = sub nsw i32 %1127, 8
  %1129 = lshr i32 %1124, %1128
  %1130 = and i32 %1129, 255
  store i32 %1130, i32* %41, align 4
  %1131 = load %struct.DState*, %struct.DState** %2, align 8
  %1132 = getelementptr inbounds %struct.DState, %struct.DState* %1131, i32 0, i32 8
  %1133 = load i32, i32* %1132, align 4
  %1134 = sub nsw i32 %1133, 8
  store i32 %1134, i32* %1132, align 4
  %1135 = load i32, i32* %41, align 4
  %1136 = trunc i32 %1135 to i8
  store i8 %1136, i8* %3, align 1
  br label %1196

; <label>:1137:                                   ; preds = %1116
  %1138 = load %struct.DState*, %struct.DState** %2, align 8
  %1139 = getelementptr inbounds %struct.DState, %struct.DState* %1138, i32 0, i32 0
  %1140 = load %struct.bz_stream*, %struct.bz_stream** %1139, align 8
  %1141 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1140, i32 0, i32 1
  %1142 = load i32, i32* %1141, align 8
  %1143 = icmp eq i32 %1142, 0
  br i1 %1143, label %1144, label %1145

; <label>:1144:                                   ; preds = %1137
  store i32 0, i32* %4, align 4
  br label %5741

; <label>:1145:                                   ; preds = %1137
  %1146 = load %struct.DState*, %struct.DState** %2, align 8
  %1147 = getelementptr inbounds %struct.DState, %struct.DState* %1146, i32 0, i32 7
  %1148 = load i32, i32* %1147, align 8
  %1149 = shl i32 %1148, 8
  %1150 = load %struct.DState*, %struct.DState** %2, align 8
  %1151 = getelementptr inbounds %struct.DState, %struct.DState* %1150, i32 0, i32 0
  %1152 = load %struct.bz_stream*, %struct.bz_stream** %1151, align 8
  %1153 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1152, i32 0, i32 0
  %1154 = load i8*, i8** %1153, align 8
  %1155 = load i8, i8* %1154, align 1
  %1156 = zext i8 %1155 to i32
  %1157 = or i32 %1149, %1156
  %1158 = load %struct.DState*, %struct.DState** %2, align 8
  %1159 = getelementptr inbounds %struct.DState, %struct.DState* %1158, i32 0, i32 7
  store i32 %1157, i32* %1159, align 8
  %1160 = load %struct.DState*, %struct.DState** %2, align 8
  %1161 = getelementptr inbounds %struct.DState, %struct.DState* %1160, i32 0, i32 8
  %1162 = load i32, i32* %1161, align 4
  %1163 = add nsw i32 %1162, 8
  store i32 %1163, i32* %1161, align 4
  %1164 = load %struct.DState*, %struct.DState** %2, align 8
  %1165 = getelementptr inbounds %struct.DState, %struct.DState* %1164, i32 0, i32 0
  %1166 = load %struct.bz_stream*, %struct.bz_stream** %1165, align 8
  %1167 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1166, i32 0, i32 0
  %1168 = load i8*, i8** %1167, align 8
  %1169 = getelementptr inbounds i8, i8* %1168, i32 1
  store i8* %1169, i8** %1167, align 8
  %1170 = load %struct.DState*, %struct.DState** %2, align 8
  %1171 = getelementptr inbounds %struct.DState, %struct.DState* %1170, i32 0, i32 0
  %1172 = load %struct.bz_stream*, %struct.bz_stream** %1171, align 8
  %1173 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1172, i32 0, i32 1
  %1174 = load i32, i32* %1173, align 8
  %1175 = add i32 %1174, -1
  store i32 %1175, i32* %1173, align 8
  %1176 = load %struct.DState*, %struct.DState** %2, align 8
  %1177 = getelementptr inbounds %struct.DState, %struct.DState* %1176, i32 0, i32 0
  %1178 = load %struct.bz_stream*, %struct.bz_stream** %1177, align 8
  %1179 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1178, i32 0, i32 2
  %1180 = load i32, i32* %1179, align 4
  %1181 = add i32 %1180, 1
  store i32 %1181, i32* %1179, align 4
  %1182 = load %struct.DState*, %struct.DState** %2, align 8
  %1183 = getelementptr inbounds %struct.DState, %struct.DState* %1182, i32 0, i32 0
  %1184 = load %struct.bz_stream*, %struct.bz_stream** %1183, align 8
  %1185 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1184, i32 0, i32 2
  %1186 = load i32, i32* %1185, align 4
  %1187 = icmp eq i32 %1186, 0
  br i1 %1187, label %1188, label %1195

; <label>:1188:                                   ; preds = %1145
  %1189 = load %struct.DState*, %struct.DState** %2, align 8
  %1190 = getelementptr inbounds %struct.DState, %struct.DState* %1189, i32 0, i32 0
  %1191 = load %struct.bz_stream*, %struct.bz_stream** %1190, align 8
  %1192 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1191, i32 0, i32 3
  %1193 = load i32, i32* %1192, align 8
  %1194 = add i32 %1193, 1
  store i32 %1194, i32* %1192, align 8
  br label %1195

; <label>:1195:                                   ; preds = %1188, %1145
  br label %1116

; <label>:1196:                                   ; preds = %1121
  %1197 = load i8, i8* %3, align 1
  %1198 = zext i8 %1197 to i32
  %1199 = icmp ne i32 %1198, 89
  br i1 %1199, label %1200, label %1201

; <label>:1200:                                   ; preds = %1196
  store i32 -4, i32* %4, align 4
  br label %5741

; <label>:1201:                                   ; preds = %1196
  %1202 = load %struct.DState*, %struct.DState** %2, align 8
  %1203 = getelementptr inbounds %struct.DState, %struct.DState* %1202, i32 0, i32 11
  %1204 = load i32, i32* %1203, align 8
  %1205 = add nsw i32 %1204, 1
  store i32 %1205, i32* %1203, align 8
  %1206 = load %struct.DState*, %struct.DState** %2, align 8
  %1207 = getelementptr inbounds %struct.DState, %struct.DState* %1206, i32 0, i32 12
  %1208 = load i32, i32* %1207, align 4
  %1209 = icmp sge i32 %1208, 2
  br i1 %1209, label %1210, label %1216

; <label>:1210:                                   ; preds = %1201
  %1211 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1212 = load %struct.DState*, %struct.DState** %2, align 8
  %1213 = getelementptr inbounds %struct.DState, %struct.DState* %1212, i32 0, i32 11
  %1214 = load i32, i32* %1213, align 8
  %1215 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1211, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str, i32 0, i32 0), i32 %1214)
  br label %1216

; <label>:1216:                                   ; preds = %1210, %1201
  %1217 = load %struct.DState*, %struct.DState** %2, align 8
  %1218 = getelementptr inbounds %struct.DState, %struct.DState* %1217, i32 0, i32 23
  store i32 0, i32* %1218, align 8
  br label %1219

; <label>:1219:                                   ; preds = %1216, %144
  %1220 = load %struct.DState*, %struct.DState** %2, align 8
  %1221 = getelementptr inbounds %struct.DState, %struct.DState* %1220, i32 0, i32 1
  store i32 20, i32* %1221, align 8
  br label %1222

; <label>:1222:                                   ; preds = %1301, %1219
  %1223 = load %struct.DState*, %struct.DState** %2, align 8
  %1224 = getelementptr inbounds %struct.DState, %struct.DState* %1223, i32 0, i32 8
  %1225 = load i32, i32* %1224, align 4
  %1226 = icmp sge i32 %1225, 8
  br i1 %1226, label %1227, label %1243

; <label>:1227:                                   ; preds = %1222
  %1228 = load %struct.DState*, %struct.DState** %2, align 8
  %1229 = getelementptr inbounds %struct.DState, %struct.DState* %1228, i32 0, i32 7
  %1230 = load i32, i32* %1229, align 8
  %1231 = load %struct.DState*, %struct.DState** %2, align 8
  %1232 = getelementptr inbounds %struct.DState, %struct.DState* %1231, i32 0, i32 8
  %1233 = load i32, i32* %1232, align 4
  %1234 = sub nsw i32 %1233, 8
  %1235 = lshr i32 %1230, %1234
  %1236 = and i32 %1235, 255
  store i32 %1236, i32* %42, align 4
  %1237 = load %struct.DState*, %struct.DState** %2, align 8
  %1238 = getelementptr inbounds %struct.DState, %struct.DState* %1237, i32 0, i32 8
  %1239 = load i32, i32* %1238, align 4
  %1240 = sub nsw i32 %1239, 8
  store i32 %1240, i32* %1238, align 4
  %1241 = load i32, i32* %42, align 4
  %1242 = trunc i32 %1241 to i8
  store i8 %1242, i8* %3, align 1
  br label %1302

; <label>:1243:                                   ; preds = %1222
  %1244 = load %struct.DState*, %struct.DState** %2, align 8
  %1245 = getelementptr inbounds %struct.DState, %struct.DState* %1244, i32 0, i32 0
  %1246 = load %struct.bz_stream*, %struct.bz_stream** %1245, align 8
  %1247 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1246, i32 0, i32 1
  %1248 = load i32, i32* %1247, align 8
  %1249 = icmp eq i32 %1248, 0
  br i1 %1249, label %1250, label %1251

; <label>:1250:                                   ; preds = %1243
  store i32 0, i32* %4, align 4
  br label %5741

; <label>:1251:                                   ; preds = %1243
  %1252 = load %struct.DState*, %struct.DState** %2, align 8
  %1253 = getelementptr inbounds %struct.DState, %struct.DState* %1252, i32 0, i32 7
  %1254 = load i32, i32* %1253, align 8
  %1255 = shl i32 %1254, 8
  %1256 = load %struct.DState*, %struct.DState** %2, align 8
  %1257 = getelementptr inbounds %struct.DState, %struct.DState* %1256, i32 0, i32 0
  %1258 = load %struct.bz_stream*, %struct.bz_stream** %1257, align 8
  %1259 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1258, i32 0, i32 0
  %1260 = load i8*, i8** %1259, align 8
  %1261 = load i8, i8* %1260, align 1
  %1262 = zext i8 %1261 to i32
  %1263 = or i32 %1255, %1262
  %1264 = load %struct.DState*, %struct.DState** %2, align 8
  %1265 = getelementptr inbounds %struct.DState, %struct.DState* %1264, i32 0, i32 7
  store i32 %1263, i32* %1265, align 8
  %1266 = load %struct.DState*, %struct.DState** %2, align 8
  %1267 = getelementptr inbounds %struct.DState, %struct.DState* %1266, i32 0, i32 8
  %1268 = load i32, i32* %1267, align 4
  %1269 = add nsw i32 %1268, 8
  store i32 %1269, i32* %1267, align 4
  %1270 = load %struct.DState*, %struct.DState** %2, align 8
  %1271 = getelementptr inbounds %struct.DState, %struct.DState* %1270, i32 0, i32 0
  %1272 = load %struct.bz_stream*, %struct.bz_stream** %1271, align 8
  %1273 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1272, i32 0, i32 0
  %1274 = load i8*, i8** %1273, align 8
  %1275 = getelementptr inbounds i8, i8* %1274, i32 1
  store i8* %1275, i8** %1273, align 8
  %1276 = load %struct.DState*, %struct.DState** %2, align 8
  %1277 = getelementptr inbounds %struct.DState, %struct.DState* %1276, i32 0, i32 0
  %1278 = load %struct.bz_stream*, %struct.bz_stream** %1277, align 8
  %1279 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1278, i32 0, i32 1
  %1280 = load i32, i32* %1279, align 8
  %1281 = add i32 %1280, -1
  store i32 %1281, i32* %1279, align 8
  %1282 = load %struct.DState*, %struct.DState** %2, align 8
  %1283 = getelementptr inbounds %struct.DState, %struct.DState* %1282, i32 0, i32 0
  %1284 = load %struct.bz_stream*, %struct.bz_stream** %1283, align 8
  %1285 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1284, i32 0, i32 2
  %1286 = load i32, i32* %1285, align 4
  %1287 = add i32 %1286, 1
  store i32 %1287, i32* %1285, align 4
  %1288 = load %struct.DState*, %struct.DState** %2, align 8
  %1289 = getelementptr inbounds %struct.DState, %struct.DState* %1288, i32 0, i32 0
  %1290 = load %struct.bz_stream*, %struct.bz_stream** %1289, align 8
  %1291 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1290, i32 0, i32 2
  %1292 = load i32, i32* %1291, align 4
  %1293 = icmp eq i32 %1292, 0
  br i1 %1293, label %1294, label %1301

; <label>:1294:                                   ; preds = %1251
  %1295 = load %struct.DState*, %struct.DState** %2, align 8
  %1296 = getelementptr inbounds %struct.DState, %struct.DState* %1295, i32 0, i32 0
  %1297 = load %struct.bz_stream*, %struct.bz_stream** %1296, align 8
  %1298 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1297, i32 0, i32 3
  %1299 = load i32, i32* %1298, align 8
  %1300 = add i32 %1299, 1
  store i32 %1300, i32* %1298, align 8
  br label %1301

; <label>:1301:                                   ; preds = %1294, %1251
  br label %1222

; <label>:1302:                                   ; preds = %1227
  %1303 = load %struct.DState*, %struct.DState** %2, align 8
  %1304 = getelementptr inbounds %struct.DState, %struct.DState* %1303, i32 0, i32 23
  %1305 = load i32, i32* %1304, align 8
  %1306 = shl i32 %1305, 8
  %1307 = load i8, i8* %3, align 1
  %1308 = zext i8 %1307 to i32
  %1309 = or i32 %1306, %1308
  %1310 = load %struct.DState*, %struct.DState** %2, align 8
  %1311 = getelementptr inbounds %struct.DState, %struct.DState* %1310, i32 0, i32 23
  store i32 %1309, i32* %1311, align 8
  br label %1312

; <label>:1312:                                   ; preds = %1302, %144
  %1313 = load %struct.DState*, %struct.DState** %2, align 8
  %1314 = getelementptr inbounds %struct.DState, %struct.DState* %1313, i32 0, i32 1
  store i32 21, i32* %1314, align 8
  br label %1315

; <label>:1315:                                   ; preds = %1394, %1312
  %1316 = load %struct.DState*, %struct.DState** %2, align 8
  %1317 = getelementptr inbounds %struct.DState, %struct.DState* %1316, i32 0, i32 8
  %1318 = load i32, i32* %1317, align 4
  %1319 = icmp sge i32 %1318, 8
  br i1 %1319, label %1320, label %1336

; <label>:1320:                                   ; preds = %1315
  %1321 = load %struct.DState*, %struct.DState** %2, align 8
  %1322 = getelementptr inbounds %struct.DState, %struct.DState* %1321, i32 0, i32 7
  %1323 = load i32, i32* %1322, align 8
  %1324 = load %struct.DState*, %struct.DState** %2, align 8
  %1325 = getelementptr inbounds %struct.DState, %struct.DState* %1324, i32 0, i32 8
  %1326 = load i32, i32* %1325, align 4
  %1327 = sub nsw i32 %1326, 8
  %1328 = lshr i32 %1323, %1327
  %1329 = and i32 %1328, 255
  store i32 %1329, i32* %43, align 4
  %1330 = load %struct.DState*, %struct.DState** %2, align 8
  %1331 = getelementptr inbounds %struct.DState, %struct.DState* %1330, i32 0, i32 8
  %1332 = load i32, i32* %1331, align 4
  %1333 = sub nsw i32 %1332, 8
  store i32 %1333, i32* %1331, align 4
  %1334 = load i32, i32* %43, align 4
  %1335 = trunc i32 %1334 to i8
  store i8 %1335, i8* %3, align 1
  br label %1395

; <label>:1336:                                   ; preds = %1315
  %1337 = load %struct.DState*, %struct.DState** %2, align 8
  %1338 = getelementptr inbounds %struct.DState, %struct.DState* %1337, i32 0, i32 0
  %1339 = load %struct.bz_stream*, %struct.bz_stream** %1338, align 8
  %1340 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1339, i32 0, i32 1
  %1341 = load i32, i32* %1340, align 8
  %1342 = icmp eq i32 %1341, 0
  br i1 %1342, label %1343, label %1344

; <label>:1343:                                   ; preds = %1336
  store i32 0, i32* %4, align 4
  br label %5741

; <label>:1344:                                   ; preds = %1336
  %1345 = load %struct.DState*, %struct.DState** %2, align 8
  %1346 = getelementptr inbounds %struct.DState, %struct.DState* %1345, i32 0, i32 7
  %1347 = load i32, i32* %1346, align 8
  %1348 = shl i32 %1347, 8
  %1349 = load %struct.DState*, %struct.DState** %2, align 8
  %1350 = getelementptr inbounds %struct.DState, %struct.DState* %1349, i32 0, i32 0
  %1351 = load %struct.bz_stream*, %struct.bz_stream** %1350, align 8
  %1352 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1351, i32 0, i32 0
  %1353 = load i8*, i8** %1352, align 8
  %1354 = load i8, i8* %1353, align 1
  %1355 = zext i8 %1354 to i32
  %1356 = or i32 %1348, %1355
  %1357 = load %struct.DState*, %struct.DState** %2, align 8
  %1358 = getelementptr inbounds %struct.DState, %struct.DState* %1357, i32 0, i32 7
  store i32 %1356, i32* %1358, align 8
  %1359 = load %struct.DState*, %struct.DState** %2, align 8
  %1360 = getelementptr inbounds %struct.DState, %struct.DState* %1359, i32 0, i32 8
  %1361 = load i32, i32* %1360, align 4
  %1362 = add nsw i32 %1361, 8
  store i32 %1362, i32* %1360, align 4
  %1363 = load %struct.DState*, %struct.DState** %2, align 8
  %1364 = getelementptr inbounds %struct.DState, %struct.DState* %1363, i32 0, i32 0
  %1365 = load %struct.bz_stream*, %struct.bz_stream** %1364, align 8
  %1366 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1365, i32 0, i32 0
  %1367 = load i8*, i8** %1366, align 8
  %1368 = getelementptr inbounds i8, i8* %1367, i32 1
  store i8* %1368, i8** %1366, align 8
  %1369 = load %struct.DState*, %struct.DState** %2, align 8
  %1370 = getelementptr inbounds %struct.DState, %struct.DState* %1369, i32 0, i32 0
  %1371 = load %struct.bz_stream*, %struct.bz_stream** %1370, align 8
  %1372 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1371, i32 0, i32 1
  %1373 = load i32, i32* %1372, align 8
  %1374 = add i32 %1373, -1
  store i32 %1374, i32* %1372, align 8
  %1375 = load %struct.DState*, %struct.DState** %2, align 8
  %1376 = getelementptr inbounds %struct.DState, %struct.DState* %1375, i32 0, i32 0
  %1377 = load %struct.bz_stream*, %struct.bz_stream** %1376, align 8
  %1378 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1377, i32 0, i32 2
  %1379 = load i32, i32* %1378, align 4
  %1380 = add i32 %1379, 1
  store i32 %1380, i32* %1378, align 4
  %1381 = load %struct.DState*, %struct.DState** %2, align 8
  %1382 = getelementptr inbounds %struct.DState, %struct.DState* %1381, i32 0, i32 0
  %1383 = load %struct.bz_stream*, %struct.bz_stream** %1382, align 8
  %1384 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1383, i32 0, i32 2
  %1385 = load i32, i32* %1384, align 4
  %1386 = icmp eq i32 %1385, 0
  br i1 %1386, label %1387, label %1394

; <label>:1387:                                   ; preds = %1344
  %1388 = load %struct.DState*, %struct.DState** %2, align 8
  %1389 = getelementptr inbounds %struct.DState, %struct.DState* %1388, i32 0, i32 0
  %1390 = load %struct.bz_stream*, %struct.bz_stream** %1389, align 8
  %1391 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1390, i32 0, i32 3
  %1392 = load i32, i32* %1391, align 8
  %1393 = add i32 %1392, 1
  store i32 %1393, i32* %1391, align 8
  br label %1394

; <label>:1394:                                   ; preds = %1387, %1344
  br label %1315

; <label>:1395:                                   ; preds = %1320
  %1396 = load %struct.DState*, %struct.DState** %2, align 8
  %1397 = getelementptr inbounds %struct.DState, %struct.DState* %1396, i32 0, i32 23
  %1398 = load i32, i32* %1397, align 8
  %1399 = shl i32 %1398, 8
  %1400 = load i8, i8* %3, align 1
  %1401 = zext i8 %1400 to i32
  %1402 = or i32 %1399, %1401
  %1403 = load %struct.DState*, %struct.DState** %2, align 8
  %1404 = getelementptr inbounds %struct.DState, %struct.DState* %1403, i32 0, i32 23
  store i32 %1402, i32* %1404, align 8
  br label %1405

; <label>:1405:                                   ; preds = %1395, %144
  %1406 = load %struct.DState*, %struct.DState** %2, align 8
  %1407 = getelementptr inbounds %struct.DState, %struct.DState* %1406, i32 0, i32 1
  store i32 22, i32* %1407, align 8
  br label %1408

; <label>:1408:                                   ; preds = %1487, %1405
  %1409 = load %struct.DState*, %struct.DState** %2, align 8
  %1410 = getelementptr inbounds %struct.DState, %struct.DState* %1409, i32 0, i32 8
  %1411 = load i32, i32* %1410, align 4
  %1412 = icmp sge i32 %1411, 8
  br i1 %1412, label %1413, label %1429

; <label>:1413:                                   ; preds = %1408
  %1414 = load %struct.DState*, %struct.DState** %2, align 8
  %1415 = getelementptr inbounds %struct.DState, %struct.DState* %1414, i32 0, i32 7
  %1416 = load i32, i32* %1415, align 8
  %1417 = load %struct.DState*, %struct.DState** %2, align 8
  %1418 = getelementptr inbounds %struct.DState, %struct.DState* %1417, i32 0, i32 8
  %1419 = load i32, i32* %1418, align 4
  %1420 = sub nsw i32 %1419, 8
  %1421 = lshr i32 %1416, %1420
  %1422 = and i32 %1421, 255
  store i32 %1422, i32* %44, align 4
  %1423 = load %struct.DState*, %struct.DState** %2, align 8
  %1424 = getelementptr inbounds %struct.DState, %struct.DState* %1423, i32 0, i32 8
  %1425 = load i32, i32* %1424, align 4
  %1426 = sub nsw i32 %1425, 8
  store i32 %1426, i32* %1424, align 4
  %1427 = load i32, i32* %44, align 4
  %1428 = trunc i32 %1427 to i8
  store i8 %1428, i8* %3, align 1
  br label %1488

; <label>:1429:                                   ; preds = %1408
  %1430 = load %struct.DState*, %struct.DState** %2, align 8
  %1431 = getelementptr inbounds %struct.DState, %struct.DState* %1430, i32 0, i32 0
  %1432 = load %struct.bz_stream*, %struct.bz_stream** %1431, align 8
  %1433 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1432, i32 0, i32 1
  %1434 = load i32, i32* %1433, align 8
  %1435 = icmp eq i32 %1434, 0
  br i1 %1435, label %1436, label %1437

; <label>:1436:                                   ; preds = %1429
  store i32 0, i32* %4, align 4
  br label %5741

; <label>:1437:                                   ; preds = %1429
  %1438 = load %struct.DState*, %struct.DState** %2, align 8
  %1439 = getelementptr inbounds %struct.DState, %struct.DState* %1438, i32 0, i32 7
  %1440 = load i32, i32* %1439, align 8
  %1441 = shl i32 %1440, 8
  %1442 = load %struct.DState*, %struct.DState** %2, align 8
  %1443 = getelementptr inbounds %struct.DState, %struct.DState* %1442, i32 0, i32 0
  %1444 = load %struct.bz_stream*, %struct.bz_stream** %1443, align 8
  %1445 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1444, i32 0, i32 0
  %1446 = load i8*, i8** %1445, align 8
  %1447 = load i8, i8* %1446, align 1
  %1448 = zext i8 %1447 to i32
  %1449 = or i32 %1441, %1448
  %1450 = load %struct.DState*, %struct.DState** %2, align 8
  %1451 = getelementptr inbounds %struct.DState, %struct.DState* %1450, i32 0, i32 7
  store i32 %1449, i32* %1451, align 8
  %1452 = load %struct.DState*, %struct.DState** %2, align 8
  %1453 = getelementptr inbounds %struct.DState, %struct.DState* %1452, i32 0, i32 8
  %1454 = load i32, i32* %1453, align 4
  %1455 = add nsw i32 %1454, 8
  store i32 %1455, i32* %1453, align 4
  %1456 = load %struct.DState*, %struct.DState** %2, align 8
  %1457 = getelementptr inbounds %struct.DState, %struct.DState* %1456, i32 0, i32 0
  %1458 = load %struct.bz_stream*, %struct.bz_stream** %1457, align 8
  %1459 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1458, i32 0, i32 0
  %1460 = load i8*, i8** %1459, align 8
  %1461 = getelementptr inbounds i8, i8* %1460, i32 1
  store i8* %1461, i8** %1459, align 8
  %1462 = load %struct.DState*, %struct.DState** %2, align 8
  %1463 = getelementptr inbounds %struct.DState, %struct.DState* %1462, i32 0, i32 0
  %1464 = load %struct.bz_stream*, %struct.bz_stream** %1463, align 8
  %1465 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1464, i32 0, i32 1
  %1466 = load i32, i32* %1465, align 8
  %1467 = add i32 %1466, -1
  store i32 %1467, i32* %1465, align 8
  %1468 = load %struct.DState*, %struct.DState** %2, align 8
  %1469 = getelementptr inbounds %struct.DState, %struct.DState* %1468, i32 0, i32 0
  %1470 = load %struct.bz_stream*, %struct.bz_stream** %1469, align 8
  %1471 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1470, i32 0, i32 2
  %1472 = load i32, i32* %1471, align 4
  %1473 = add i32 %1472, 1
  store i32 %1473, i32* %1471, align 4
  %1474 = load %struct.DState*, %struct.DState** %2, align 8
  %1475 = getelementptr inbounds %struct.DState, %struct.DState* %1474, i32 0, i32 0
  %1476 = load %struct.bz_stream*, %struct.bz_stream** %1475, align 8
  %1477 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1476, i32 0, i32 2
  %1478 = load i32, i32* %1477, align 4
  %1479 = icmp eq i32 %1478, 0
  br i1 %1479, label %1480, label %1487

; <label>:1480:                                   ; preds = %1437
  %1481 = load %struct.DState*, %struct.DState** %2, align 8
  %1482 = getelementptr inbounds %struct.DState, %struct.DState* %1481, i32 0, i32 0
  %1483 = load %struct.bz_stream*, %struct.bz_stream** %1482, align 8
  %1484 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1483, i32 0, i32 3
  %1485 = load i32, i32* %1484, align 8
  %1486 = add i32 %1485, 1
  store i32 %1486, i32* %1484, align 8
  br label %1487

; <label>:1487:                                   ; preds = %1480, %1437
  br label %1408

; <label>:1488:                                   ; preds = %1413
  %1489 = load %struct.DState*, %struct.DState** %2, align 8
  %1490 = getelementptr inbounds %struct.DState, %struct.DState* %1489, i32 0, i32 23
  %1491 = load i32, i32* %1490, align 8
  %1492 = shl i32 %1491, 8
  %1493 = load i8, i8* %3, align 1
  %1494 = zext i8 %1493 to i32
  %1495 = or i32 %1492, %1494
  %1496 = load %struct.DState*, %struct.DState** %2, align 8
  %1497 = getelementptr inbounds %struct.DState, %struct.DState* %1496, i32 0, i32 23
  store i32 %1495, i32* %1497, align 8
  br label %1498

; <label>:1498:                                   ; preds = %1488, %144
  %1499 = load %struct.DState*, %struct.DState** %2, align 8
  %1500 = getelementptr inbounds %struct.DState, %struct.DState* %1499, i32 0, i32 1
  store i32 23, i32* %1500, align 8
  br label %1501

; <label>:1501:                                   ; preds = %1580, %1498
  %1502 = load %struct.DState*, %struct.DState** %2, align 8
  %1503 = getelementptr inbounds %struct.DState, %struct.DState* %1502, i32 0, i32 8
  %1504 = load i32, i32* %1503, align 4
  %1505 = icmp sge i32 %1504, 8
  br i1 %1505, label %1506, label %1522

; <label>:1506:                                   ; preds = %1501
  %1507 = load %struct.DState*, %struct.DState** %2, align 8
  %1508 = getelementptr inbounds %struct.DState, %struct.DState* %1507, i32 0, i32 7
  %1509 = load i32, i32* %1508, align 8
  %1510 = load %struct.DState*, %struct.DState** %2, align 8
  %1511 = getelementptr inbounds %struct.DState, %struct.DState* %1510, i32 0, i32 8
  %1512 = load i32, i32* %1511, align 4
  %1513 = sub nsw i32 %1512, 8
  %1514 = lshr i32 %1509, %1513
  %1515 = and i32 %1514, 255
  store i32 %1515, i32* %45, align 4
  %1516 = load %struct.DState*, %struct.DState** %2, align 8
  %1517 = getelementptr inbounds %struct.DState, %struct.DState* %1516, i32 0, i32 8
  %1518 = load i32, i32* %1517, align 4
  %1519 = sub nsw i32 %1518, 8
  store i32 %1519, i32* %1517, align 4
  %1520 = load i32, i32* %45, align 4
  %1521 = trunc i32 %1520 to i8
  store i8 %1521, i8* %3, align 1
  br label %1581

; <label>:1522:                                   ; preds = %1501
  %1523 = load %struct.DState*, %struct.DState** %2, align 8
  %1524 = getelementptr inbounds %struct.DState, %struct.DState* %1523, i32 0, i32 0
  %1525 = load %struct.bz_stream*, %struct.bz_stream** %1524, align 8
  %1526 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1525, i32 0, i32 1
  %1527 = load i32, i32* %1526, align 8
  %1528 = icmp eq i32 %1527, 0
  br i1 %1528, label %1529, label %1530

; <label>:1529:                                   ; preds = %1522
  store i32 0, i32* %4, align 4
  br label %5741

; <label>:1530:                                   ; preds = %1522
  %1531 = load %struct.DState*, %struct.DState** %2, align 8
  %1532 = getelementptr inbounds %struct.DState, %struct.DState* %1531, i32 0, i32 7
  %1533 = load i32, i32* %1532, align 8
  %1534 = shl i32 %1533, 8
  %1535 = load %struct.DState*, %struct.DState** %2, align 8
  %1536 = getelementptr inbounds %struct.DState, %struct.DState* %1535, i32 0, i32 0
  %1537 = load %struct.bz_stream*, %struct.bz_stream** %1536, align 8
  %1538 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1537, i32 0, i32 0
  %1539 = load i8*, i8** %1538, align 8
  %1540 = load i8, i8* %1539, align 1
  %1541 = zext i8 %1540 to i32
  %1542 = or i32 %1534, %1541
  %1543 = load %struct.DState*, %struct.DState** %2, align 8
  %1544 = getelementptr inbounds %struct.DState, %struct.DState* %1543, i32 0, i32 7
  store i32 %1542, i32* %1544, align 8
  %1545 = load %struct.DState*, %struct.DState** %2, align 8
  %1546 = getelementptr inbounds %struct.DState, %struct.DState* %1545, i32 0, i32 8
  %1547 = load i32, i32* %1546, align 4
  %1548 = add nsw i32 %1547, 8
  store i32 %1548, i32* %1546, align 4
  %1549 = load %struct.DState*, %struct.DState** %2, align 8
  %1550 = getelementptr inbounds %struct.DState, %struct.DState* %1549, i32 0, i32 0
  %1551 = load %struct.bz_stream*, %struct.bz_stream** %1550, align 8
  %1552 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1551, i32 0, i32 0
  %1553 = load i8*, i8** %1552, align 8
  %1554 = getelementptr inbounds i8, i8* %1553, i32 1
  store i8* %1554, i8** %1552, align 8
  %1555 = load %struct.DState*, %struct.DState** %2, align 8
  %1556 = getelementptr inbounds %struct.DState, %struct.DState* %1555, i32 0, i32 0
  %1557 = load %struct.bz_stream*, %struct.bz_stream** %1556, align 8
  %1558 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1557, i32 0, i32 1
  %1559 = load i32, i32* %1558, align 8
  %1560 = add i32 %1559, -1
  store i32 %1560, i32* %1558, align 8
  %1561 = load %struct.DState*, %struct.DState** %2, align 8
  %1562 = getelementptr inbounds %struct.DState, %struct.DState* %1561, i32 0, i32 0
  %1563 = load %struct.bz_stream*, %struct.bz_stream** %1562, align 8
  %1564 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1563, i32 0, i32 2
  %1565 = load i32, i32* %1564, align 4
  %1566 = add i32 %1565, 1
  store i32 %1566, i32* %1564, align 4
  %1567 = load %struct.DState*, %struct.DState** %2, align 8
  %1568 = getelementptr inbounds %struct.DState, %struct.DState* %1567, i32 0, i32 0
  %1569 = load %struct.bz_stream*, %struct.bz_stream** %1568, align 8
  %1570 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1569, i32 0, i32 2
  %1571 = load i32, i32* %1570, align 4
  %1572 = icmp eq i32 %1571, 0
  br i1 %1572, label %1573, label %1580

; <label>:1573:                                   ; preds = %1530
  %1574 = load %struct.DState*, %struct.DState** %2, align 8
  %1575 = getelementptr inbounds %struct.DState, %struct.DState* %1574, i32 0, i32 0
  %1576 = load %struct.bz_stream*, %struct.bz_stream** %1575, align 8
  %1577 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1576, i32 0, i32 3
  %1578 = load i32, i32* %1577, align 8
  %1579 = add i32 %1578, 1
  store i32 %1579, i32* %1577, align 8
  br label %1580

; <label>:1580:                                   ; preds = %1573, %1530
  br label %1501

; <label>:1581:                                   ; preds = %1506
  %1582 = load %struct.DState*, %struct.DState** %2, align 8
  %1583 = getelementptr inbounds %struct.DState, %struct.DState* %1582, i32 0, i32 23
  %1584 = load i32, i32* %1583, align 8
  %1585 = shl i32 %1584, 8
  %1586 = load i8, i8* %3, align 1
  %1587 = zext i8 %1586 to i32
  %1588 = or i32 %1585, %1587
  %1589 = load %struct.DState*, %struct.DState** %2, align 8
  %1590 = getelementptr inbounds %struct.DState, %struct.DState* %1589, i32 0, i32 23
  store i32 %1588, i32* %1590, align 8
  br label %1591

; <label>:1591:                                   ; preds = %1581, %144
  %1592 = load %struct.DState*, %struct.DState** %2, align 8
  %1593 = getelementptr inbounds %struct.DState, %struct.DState* %1592, i32 0, i32 1
  store i32 24, i32* %1593, align 8
  br label %1594

; <label>:1594:                                   ; preds = %1675, %1591
  %1595 = load %struct.DState*, %struct.DState** %2, align 8
  %1596 = getelementptr inbounds %struct.DState, %struct.DState* %1595, i32 0, i32 8
  %1597 = load i32, i32* %1596, align 4
  %1598 = icmp sge i32 %1597, 1
  br i1 %1598, label %1599, label %1617

; <label>:1599:                                   ; preds = %1594
  %1600 = load %struct.DState*, %struct.DState** %2, align 8
  %1601 = getelementptr inbounds %struct.DState, %struct.DState* %1600, i32 0, i32 7
  %1602 = load i32, i32* %1601, align 8
  %1603 = load %struct.DState*, %struct.DState** %2, align 8
  %1604 = getelementptr inbounds %struct.DState, %struct.DState* %1603, i32 0, i32 8
  %1605 = load i32, i32* %1604, align 4
  %1606 = sub nsw i32 %1605, 1
  %1607 = lshr i32 %1602, %1606
  %1608 = and i32 %1607, 1
  store i32 %1608, i32* %46, align 4
  %1609 = load %struct.DState*, %struct.DState** %2, align 8
  %1610 = getelementptr inbounds %struct.DState, %struct.DState* %1609, i32 0, i32 8
  %1611 = load i32, i32* %1610, align 4
  %1612 = sub nsw i32 %1611, 1
  store i32 %1612, i32* %1610, align 4
  %1613 = load i32, i32* %46, align 4
  %1614 = trunc i32 %1613 to i8
  %1615 = load %struct.DState*, %struct.DState** %2, align 8
  %1616 = getelementptr inbounds %struct.DState, %struct.DState* %1615, i32 0, i32 4
  store i8 %1614, i8* %1616, align 4
  br label %1676

; <label>:1617:                                   ; preds = %1594
  %1618 = load %struct.DState*, %struct.DState** %2, align 8
  %1619 = getelementptr inbounds %struct.DState, %struct.DState* %1618, i32 0, i32 0
  %1620 = load %struct.bz_stream*, %struct.bz_stream** %1619, align 8
  %1621 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1620, i32 0, i32 1
  %1622 = load i32, i32* %1621, align 8
  %1623 = icmp eq i32 %1622, 0
  br i1 %1623, label %1624, label %1625

; <label>:1624:                                   ; preds = %1617
  store i32 0, i32* %4, align 4
  br label %5741

; <label>:1625:                                   ; preds = %1617
  %1626 = load %struct.DState*, %struct.DState** %2, align 8
  %1627 = getelementptr inbounds %struct.DState, %struct.DState* %1626, i32 0, i32 7
  %1628 = load i32, i32* %1627, align 8
  %1629 = shl i32 %1628, 8
  %1630 = load %struct.DState*, %struct.DState** %2, align 8
  %1631 = getelementptr inbounds %struct.DState, %struct.DState* %1630, i32 0, i32 0
  %1632 = load %struct.bz_stream*, %struct.bz_stream** %1631, align 8
  %1633 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1632, i32 0, i32 0
  %1634 = load i8*, i8** %1633, align 8
  %1635 = load i8, i8* %1634, align 1
  %1636 = zext i8 %1635 to i32
  %1637 = or i32 %1629, %1636
  %1638 = load %struct.DState*, %struct.DState** %2, align 8
  %1639 = getelementptr inbounds %struct.DState, %struct.DState* %1638, i32 0, i32 7
  store i32 %1637, i32* %1639, align 8
  %1640 = load %struct.DState*, %struct.DState** %2, align 8
  %1641 = getelementptr inbounds %struct.DState, %struct.DState* %1640, i32 0, i32 8
  %1642 = load i32, i32* %1641, align 4
  %1643 = add nsw i32 %1642, 8
  store i32 %1643, i32* %1641, align 4
  %1644 = load %struct.DState*, %struct.DState** %2, align 8
  %1645 = getelementptr inbounds %struct.DState, %struct.DState* %1644, i32 0, i32 0
  %1646 = load %struct.bz_stream*, %struct.bz_stream** %1645, align 8
  %1647 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1646, i32 0, i32 0
  %1648 = load i8*, i8** %1647, align 8
  %1649 = getelementptr inbounds i8, i8* %1648, i32 1
  store i8* %1649, i8** %1647, align 8
  %1650 = load %struct.DState*, %struct.DState** %2, align 8
  %1651 = getelementptr inbounds %struct.DState, %struct.DState* %1650, i32 0, i32 0
  %1652 = load %struct.bz_stream*, %struct.bz_stream** %1651, align 8
  %1653 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1652, i32 0, i32 1
  %1654 = load i32, i32* %1653, align 8
  %1655 = add i32 %1654, -1
  store i32 %1655, i32* %1653, align 8
  %1656 = load %struct.DState*, %struct.DState** %2, align 8
  %1657 = getelementptr inbounds %struct.DState, %struct.DState* %1656, i32 0, i32 0
  %1658 = load %struct.bz_stream*, %struct.bz_stream** %1657, align 8
  %1659 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1658, i32 0, i32 2
  %1660 = load i32, i32* %1659, align 4
  %1661 = add i32 %1660, 1
  store i32 %1661, i32* %1659, align 4
  %1662 = load %struct.DState*, %struct.DState** %2, align 8
  %1663 = getelementptr inbounds %struct.DState, %struct.DState* %1662, i32 0, i32 0
  %1664 = load %struct.bz_stream*, %struct.bz_stream** %1663, align 8
  %1665 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1664, i32 0, i32 2
  %1666 = load i32, i32* %1665, align 4
  %1667 = icmp eq i32 %1666, 0
  br i1 %1667, label %1668, label %1675

; <label>:1668:                                   ; preds = %1625
  %1669 = load %struct.DState*, %struct.DState** %2, align 8
  %1670 = getelementptr inbounds %struct.DState, %struct.DState* %1669, i32 0, i32 0
  %1671 = load %struct.bz_stream*, %struct.bz_stream** %1670, align 8
  %1672 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1671, i32 0, i32 3
  %1673 = load i32, i32* %1672, align 8
  %1674 = add i32 %1673, 1
  store i32 %1674, i32* %1672, align 8
  br label %1675

; <label>:1675:                                   ; preds = %1668, %1625
  br label %1594

; <label>:1676:                                   ; preds = %1599
  %1677 = load %struct.DState*, %struct.DState** %2, align 8
  %1678 = getelementptr inbounds %struct.DState, %struct.DState* %1677, i32 0, i32 13
  store i32 0, i32* %1678, align 8
  br label %1679

; <label>:1679:                                   ; preds = %1676, %144
  %1680 = load %struct.DState*, %struct.DState** %2, align 8
  %1681 = getelementptr inbounds %struct.DState, %struct.DState* %1680, i32 0, i32 1
  store i32 25, i32* %1681, align 8
  br label %1682

; <label>:1682:                                   ; preds = %1761, %1679
  %1683 = load %struct.DState*, %struct.DState** %2, align 8
  %1684 = getelementptr inbounds %struct.DState, %struct.DState* %1683, i32 0, i32 8
  %1685 = load i32, i32* %1684, align 4
  %1686 = icmp sge i32 %1685, 8
  br i1 %1686, label %1687, label %1703

; <label>:1687:                                   ; preds = %1682
  %1688 = load %struct.DState*, %struct.DState** %2, align 8
  %1689 = getelementptr inbounds %struct.DState, %struct.DState* %1688, i32 0, i32 7
  %1690 = load i32, i32* %1689, align 8
  %1691 = load %struct.DState*, %struct.DState** %2, align 8
  %1692 = getelementptr inbounds %struct.DState, %struct.DState* %1691, i32 0, i32 8
  %1693 = load i32, i32* %1692, align 4
  %1694 = sub nsw i32 %1693, 8
  %1695 = lshr i32 %1690, %1694
  %1696 = and i32 %1695, 255
  store i32 %1696, i32* %47, align 4
  %1697 = load %struct.DState*, %struct.DState** %2, align 8
  %1698 = getelementptr inbounds %struct.DState, %struct.DState* %1697, i32 0, i32 8
  %1699 = load i32, i32* %1698, align 4
  %1700 = sub nsw i32 %1699, 8
  store i32 %1700, i32* %1698, align 4
  %1701 = load i32, i32* %47, align 4
  %1702 = trunc i32 %1701 to i8
  store i8 %1702, i8* %3, align 1
  br label %1762

; <label>:1703:                                   ; preds = %1682
  %1704 = load %struct.DState*, %struct.DState** %2, align 8
  %1705 = getelementptr inbounds %struct.DState, %struct.DState* %1704, i32 0, i32 0
  %1706 = load %struct.bz_stream*, %struct.bz_stream** %1705, align 8
  %1707 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1706, i32 0, i32 1
  %1708 = load i32, i32* %1707, align 8
  %1709 = icmp eq i32 %1708, 0
  br i1 %1709, label %1710, label %1711

; <label>:1710:                                   ; preds = %1703
  store i32 0, i32* %4, align 4
  br label %5741

; <label>:1711:                                   ; preds = %1703
  %1712 = load %struct.DState*, %struct.DState** %2, align 8
  %1713 = getelementptr inbounds %struct.DState, %struct.DState* %1712, i32 0, i32 7
  %1714 = load i32, i32* %1713, align 8
  %1715 = shl i32 %1714, 8
  %1716 = load %struct.DState*, %struct.DState** %2, align 8
  %1717 = getelementptr inbounds %struct.DState, %struct.DState* %1716, i32 0, i32 0
  %1718 = load %struct.bz_stream*, %struct.bz_stream** %1717, align 8
  %1719 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1718, i32 0, i32 0
  %1720 = load i8*, i8** %1719, align 8
  %1721 = load i8, i8* %1720, align 1
  %1722 = zext i8 %1721 to i32
  %1723 = or i32 %1715, %1722
  %1724 = load %struct.DState*, %struct.DState** %2, align 8
  %1725 = getelementptr inbounds %struct.DState, %struct.DState* %1724, i32 0, i32 7
  store i32 %1723, i32* %1725, align 8
  %1726 = load %struct.DState*, %struct.DState** %2, align 8
  %1727 = getelementptr inbounds %struct.DState, %struct.DState* %1726, i32 0, i32 8
  %1728 = load i32, i32* %1727, align 4
  %1729 = add nsw i32 %1728, 8
  store i32 %1729, i32* %1727, align 4
  %1730 = load %struct.DState*, %struct.DState** %2, align 8
  %1731 = getelementptr inbounds %struct.DState, %struct.DState* %1730, i32 0, i32 0
  %1732 = load %struct.bz_stream*, %struct.bz_stream** %1731, align 8
  %1733 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1732, i32 0, i32 0
  %1734 = load i8*, i8** %1733, align 8
  %1735 = getelementptr inbounds i8, i8* %1734, i32 1
  store i8* %1735, i8** %1733, align 8
  %1736 = load %struct.DState*, %struct.DState** %2, align 8
  %1737 = getelementptr inbounds %struct.DState, %struct.DState* %1736, i32 0, i32 0
  %1738 = load %struct.bz_stream*, %struct.bz_stream** %1737, align 8
  %1739 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1738, i32 0, i32 1
  %1740 = load i32, i32* %1739, align 8
  %1741 = add i32 %1740, -1
  store i32 %1741, i32* %1739, align 8
  %1742 = load %struct.DState*, %struct.DState** %2, align 8
  %1743 = getelementptr inbounds %struct.DState, %struct.DState* %1742, i32 0, i32 0
  %1744 = load %struct.bz_stream*, %struct.bz_stream** %1743, align 8
  %1745 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1744, i32 0, i32 2
  %1746 = load i32, i32* %1745, align 4
  %1747 = add i32 %1746, 1
  store i32 %1747, i32* %1745, align 4
  %1748 = load %struct.DState*, %struct.DState** %2, align 8
  %1749 = getelementptr inbounds %struct.DState, %struct.DState* %1748, i32 0, i32 0
  %1750 = load %struct.bz_stream*, %struct.bz_stream** %1749, align 8
  %1751 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1750, i32 0, i32 2
  %1752 = load i32, i32* %1751, align 4
  %1753 = icmp eq i32 %1752, 0
  br i1 %1753, label %1754, label %1761

; <label>:1754:                                   ; preds = %1711
  %1755 = load %struct.DState*, %struct.DState** %2, align 8
  %1756 = getelementptr inbounds %struct.DState, %struct.DState* %1755, i32 0, i32 0
  %1757 = load %struct.bz_stream*, %struct.bz_stream** %1756, align 8
  %1758 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1757, i32 0, i32 3
  %1759 = load i32, i32* %1758, align 8
  %1760 = add i32 %1759, 1
  store i32 %1760, i32* %1758, align 8
  br label %1761

; <label>:1761:                                   ; preds = %1754, %1711
  br label %1682

; <label>:1762:                                   ; preds = %1687
  %1763 = load %struct.DState*, %struct.DState** %2, align 8
  %1764 = getelementptr inbounds %struct.DState, %struct.DState* %1763, i32 0, i32 13
  %1765 = load i32, i32* %1764, align 8
  %1766 = shl i32 %1765, 8
  %1767 = load i8, i8* %3, align 1
  %1768 = zext i8 %1767 to i32
  %1769 = or i32 %1766, %1768
  %1770 = load %struct.DState*, %struct.DState** %2, align 8
  %1771 = getelementptr inbounds %struct.DState, %struct.DState* %1770, i32 0, i32 13
  store i32 %1769, i32* %1771, align 8
  br label %1772

; <label>:1772:                                   ; preds = %1762, %144
  %1773 = load %struct.DState*, %struct.DState** %2, align 8
  %1774 = getelementptr inbounds %struct.DState, %struct.DState* %1773, i32 0, i32 1
  store i32 26, i32* %1774, align 8
  br label %1775

; <label>:1775:                                   ; preds = %1854, %1772
  %1776 = load %struct.DState*, %struct.DState** %2, align 8
  %1777 = getelementptr inbounds %struct.DState, %struct.DState* %1776, i32 0, i32 8
  %1778 = load i32, i32* %1777, align 4
  %1779 = icmp sge i32 %1778, 8
  br i1 %1779, label %1780, label %1796

; <label>:1780:                                   ; preds = %1775
  %1781 = load %struct.DState*, %struct.DState** %2, align 8
  %1782 = getelementptr inbounds %struct.DState, %struct.DState* %1781, i32 0, i32 7
  %1783 = load i32, i32* %1782, align 8
  %1784 = load %struct.DState*, %struct.DState** %2, align 8
  %1785 = getelementptr inbounds %struct.DState, %struct.DState* %1784, i32 0, i32 8
  %1786 = load i32, i32* %1785, align 4
  %1787 = sub nsw i32 %1786, 8
  %1788 = lshr i32 %1783, %1787
  %1789 = and i32 %1788, 255
  store i32 %1789, i32* %48, align 4
  %1790 = load %struct.DState*, %struct.DState** %2, align 8
  %1791 = getelementptr inbounds %struct.DState, %struct.DState* %1790, i32 0, i32 8
  %1792 = load i32, i32* %1791, align 4
  %1793 = sub nsw i32 %1792, 8
  store i32 %1793, i32* %1791, align 4
  %1794 = load i32, i32* %48, align 4
  %1795 = trunc i32 %1794 to i8
  store i8 %1795, i8* %3, align 1
  br label %1855

; <label>:1796:                                   ; preds = %1775
  %1797 = load %struct.DState*, %struct.DState** %2, align 8
  %1798 = getelementptr inbounds %struct.DState, %struct.DState* %1797, i32 0, i32 0
  %1799 = load %struct.bz_stream*, %struct.bz_stream** %1798, align 8
  %1800 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1799, i32 0, i32 1
  %1801 = load i32, i32* %1800, align 8
  %1802 = icmp eq i32 %1801, 0
  br i1 %1802, label %1803, label %1804

; <label>:1803:                                   ; preds = %1796
  store i32 0, i32* %4, align 4
  br label %5741

; <label>:1804:                                   ; preds = %1796
  %1805 = load %struct.DState*, %struct.DState** %2, align 8
  %1806 = getelementptr inbounds %struct.DState, %struct.DState* %1805, i32 0, i32 7
  %1807 = load i32, i32* %1806, align 8
  %1808 = shl i32 %1807, 8
  %1809 = load %struct.DState*, %struct.DState** %2, align 8
  %1810 = getelementptr inbounds %struct.DState, %struct.DState* %1809, i32 0, i32 0
  %1811 = load %struct.bz_stream*, %struct.bz_stream** %1810, align 8
  %1812 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1811, i32 0, i32 0
  %1813 = load i8*, i8** %1812, align 8
  %1814 = load i8, i8* %1813, align 1
  %1815 = zext i8 %1814 to i32
  %1816 = or i32 %1808, %1815
  %1817 = load %struct.DState*, %struct.DState** %2, align 8
  %1818 = getelementptr inbounds %struct.DState, %struct.DState* %1817, i32 0, i32 7
  store i32 %1816, i32* %1818, align 8
  %1819 = load %struct.DState*, %struct.DState** %2, align 8
  %1820 = getelementptr inbounds %struct.DState, %struct.DState* %1819, i32 0, i32 8
  %1821 = load i32, i32* %1820, align 4
  %1822 = add nsw i32 %1821, 8
  store i32 %1822, i32* %1820, align 4
  %1823 = load %struct.DState*, %struct.DState** %2, align 8
  %1824 = getelementptr inbounds %struct.DState, %struct.DState* %1823, i32 0, i32 0
  %1825 = load %struct.bz_stream*, %struct.bz_stream** %1824, align 8
  %1826 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1825, i32 0, i32 0
  %1827 = load i8*, i8** %1826, align 8
  %1828 = getelementptr inbounds i8, i8* %1827, i32 1
  store i8* %1828, i8** %1826, align 8
  %1829 = load %struct.DState*, %struct.DState** %2, align 8
  %1830 = getelementptr inbounds %struct.DState, %struct.DState* %1829, i32 0, i32 0
  %1831 = load %struct.bz_stream*, %struct.bz_stream** %1830, align 8
  %1832 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1831, i32 0, i32 1
  %1833 = load i32, i32* %1832, align 8
  %1834 = add i32 %1833, -1
  store i32 %1834, i32* %1832, align 8
  %1835 = load %struct.DState*, %struct.DState** %2, align 8
  %1836 = getelementptr inbounds %struct.DState, %struct.DState* %1835, i32 0, i32 0
  %1837 = load %struct.bz_stream*, %struct.bz_stream** %1836, align 8
  %1838 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1837, i32 0, i32 2
  %1839 = load i32, i32* %1838, align 4
  %1840 = add i32 %1839, 1
  store i32 %1840, i32* %1838, align 4
  %1841 = load %struct.DState*, %struct.DState** %2, align 8
  %1842 = getelementptr inbounds %struct.DState, %struct.DState* %1841, i32 0, i32 0
  %1843 = load %struct.bz_stream*, %struct.bz_stream** %1842, align 8
  %1844 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1843, i32 0, i32 2
  %1845 = load i32, i32* %1844, align 4
  %1846 = icmp eq i32 %1845, 0
  br i1 %1846, label %1847, label %1854

; <label>:1847:                                   ; preds = %1804
  %1848 = load %struct.DState*, %struct.DState** %2, align 8
  %1849 = getelementptr inbounds %struct.DState, %struct.DState* %1848, i32 0, i32 0
  %1850 = load %struct.bz_stream*, %struct.bz_stream** %1849, align 8
  %1851 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1850, i32 0, i32 3
  %1852 = load i32, i32* %1851, align 8
  %1853 = add i32 %1852, 1
  store i32 %1853, i32* %1851, align 8
  br label %1854

; <label>:1854:                                   ; preds = %1847, %1804
  br label %1775

; <label>:1855:                                   ; preds = %1780
  %1856 = load %struct.DState*, %struct.DState** %2, align 8
  %1857 = getelementptr inbounds %struct.DState, %struct.DState* %1856, i32 0, i32 13
  %1858 = load i32, i32* %1857, align 8
  %1859 = shl i32 %1858, 8
  %1860 = load i8, i8* %3, align 1
  %1861 = zext i8 %1860 to i32
  %1862 = or i32 %1859, %1861
  %1863 = load %struct.DState*, %struct.DState** %2, align 8
  %1864 = getelementptr inbounds %struct.DState, %struct.DState* %1863, i32 0, i32 13
  store i32 %1862, i32* %1864, align 8
  br label %1865

; <label>:1865:                                   ; preds = %1855, %144
  %1866 = load %struct.DState*, %struct.DState** %2, align 8
  %1867 = getelementptr inbounds %struct.DState, %struct.DState* %1866, i32 0, i32 1
  store i32 27, i32* %1867, align 8
  br label %1868

; <label>:1868:                                   ; preds = %1947, %1865
  %1869 = load %struct.DState*, %struct.DState** %2, align 8
  %1870 = getelementptr inbounds %struct.DState, %struct.DState* %1869, i32 0, i32 8
  %1871 = load i32, i32* %1870, align 4
  %1872 = icmp sge i32 %1871, 8
  br i1 %1872, label %1873, label %1889

; <label>:1873:                                   ; preds = %1868
  %1874 = load %struct.DState*, %struct.DState** %2, align 8
  %1875 = getelementptr inbounds %struct.DState, %struct.DState* %1874, i32 0, i32 7
  %1876 = load i32, i32* %1875, align 8
  %1877 = load %struct.DState*, %struct.DState** %2, align 8
  %1878 = getelementptr inbounds %struct.DState, %struct.DState* %1877, i32 0, i32 8
  %1879 = load i32, i32* %1878, align 4
  %1880 = sub nsw i32 %1879, 8
  %1881 = lshr i32 %1876, %1880
  %1882 = and i32 %1881, 255
  store i32 %1882, i32* %49, align 4
  %1883 = load %struct.DState*, %struct.DState** %2, align 8
  %1884 = getelementptr inbounds %struct.DState, %struct.DState* %1883, i32 0, i32 8
  %1885 = load i32, i32* %1884, align 4
  %1886 = sub nsw i32 %1885, 8
  store i32 %1886, i32* %1884, align 4
  %1887 = load i32, i32* %49, align 4
  %1888 = trunc i32 %1887 to i8
  store i8 %1888, i8* %3, align 1
  br label %1948

; <label>:1889:                                   ; preds = %1868
  %1890 = load %struct.DState*, %struct.DState** %2, align 8
  %1891 = getelementptr inbounds %struct.DState, %struct.DState* %1890, i32 0, i32 0
  %1892 = load %struct.bz_stream*, %struct.bz_stream** %1891, align 8
  %1893 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1892, i32 0, i32 1
  %1894 = load i32, i32* %1893, align 8
  %1895 = icmp eq i32 %1894, 0
  br i1 %1895, label %1896, label %1897

; <label>:1896:                                   ; preds = %1889
  store i32 0, i32* %4, align 4
  br label %5741

; <label>:1897:                                   ; preds = %1889
  %1898 = load %struct.DState*, %struct.DState** %2, align 8
  %1899 = getelementptr inbounds %struct.DState, %struct.DState* %1898, i32 0, i32 7
  %1900 = load i32, i32* %1899, align 8
  %1901 = shl i32 %1900, 8
  %1902 = load %struct.DState*, %struct.DState** %2, align 8
  %1903 = getelementptr inbounds %struct.DState, %struct.DState* %1902, i32 0, i32 0
  %1904 = load %struct.bz_stream*, %struct.bz_stream** %1903, align 8
  %1905 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1904, i32 0, i32 0
  %1906 = load i8*, i8** %1905, align 8
  %1907 = load i8, i8* %1906, align 1
  %1908 = zext i8 %1907 to i32
  %1909 = or i32 %1901, %1908
  %1910 = load %struct.DState*, %struct.DState** %2, align 8
  %1911 = getelementptr inbounds %struct.DState, %struct.DState* %1910, i32 0, i32 7
  store i32 %1909, i32* %1911, align 8
  %1912 = load %struct.DState*, %struct.DState** %2, align 8
  %1913 = getelementptr inbounds %struct.DState, %struct.DState* %1912, i32 0, i32 8
  %1914 = load i32, i32* %1913, align 4
  %1915 = add nsw i32 %1914, 8
  store i32 %1915, i32* %1913, align 4
  %1916 = load %struct.DState*, %struct.DState** %2, align 8
  %1917 = getelementptr inbounds %struct.DState, %struct.DState* %1916, i32 0, i32 0
  %1918 = load %struct.bz_stream*, %struct.bz_stream** %1917, align 8
  %1919 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1918, i32 0, i32 0
  %1920 = load i8*, i8** %1919, align 8
  %1921 = getelementptr inbounds i8, i8* %1920, i32 1
  store i8* %1921, i8** %1919, align 8
  %1922 = load %struct.DState*, %struct.DState** %2, align 8
  %1923 = getelementptr inbounds %struct.DState, %struct.DState* %1922, i32 0, i32 0
  %1924 = load %struct.bz_stream*, %struct.bz_stream** %1923, align 8
  %1925 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1924, i32 0, i32 1
  %1926 = load i32, i32* %1925, align 8
  %1927 = add i32 %1926, -1
  store i32 %1927, i32* %1925, align 8
  %1928 = load %struct.DState*, %struct.DState** %2, align 8
  %1929 = getelementptr inbounds %struct.DState, %struct.DState* %1928, i32 0, i32 0
  %1930 = load %struct.bz_stream*, %struct.bz_stream** %1929, align 8
  %1931 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1930, i32 0, i32 2
  %1932 = load i32, i32* %1931, align 4
  %1933 = add i32 %1932, 1
  store i32 %1933, i32* %1931, align 4
  %1934 = load %struct.DState*, %struct.DState** %2, align 8
  %1935 = getelementptr inbounds %struct.DState, %struct.DState* %1934, i32 0, i32 0
  %1936 = load %struct.bz_stream*, %struct.bz_stream** %1935, align 8
  %1937 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1936, i32 0, i32 2
  %1938 = load i32, i32* %1937, align 4
  %1939 = icmp eq i32 %1938, 0
  br i1 %1939, label %1940, label %1947

; <label>:1940:                                   ; preds = %1897
  %1941 = load %struct.DState*, %struct.DState** %2, align 8
  %1942 = getelementptr inbounds %struct.DState, %struct.DState* %1941, i32 0, i32 0
  %1943 = load %struct.bz_stream*, %struct.bz_stream** %1942, align 8
  %1944 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1943, i32 0, i32 3
  %1945 = load i32, i32* %1944, align 8
  %1946 = add i32 %1945, 1
  store i32 %1946, i32* %1944, align 8
  br label %1947

; <label>:1947:                                   ; preds = %1940, %1897
  br label %1868

; <label>:1948:                                   ; preds = %1873
  %1949 = load %struct.DState*, %struct.DState** %2, align 8
  %1950 = getelementptr inbounds %struct.DState, %struct.DState* %1949, i32 0, i32 13
  %1951 = load i32, i32* %1950, align 8
  %1952 = shl i32 %1951, 8
  %1953 = load i8, i8* %3, align 1
  %1954 = zext i8 %1953 to i32
  %1955 = or i32 %1952, %1954
  %1956 = load %struct.DState*, %struct.DState** %2, align 8
  %1957 = getelementptr inbounds %struct.DState, %struct.DState* %1956, i32 0, i32 13
  store i32 %1955, i32* %1957, align 8
  %1958 = load %struct.DState*, %struct.DState** %2, align 8
  %1959 = getelementptr inbounds %struct.DState, %struct.DState* %1958, i32 0, i32 13
  %1960 = load i32, i32* %1959, align 8
  %1961 = icmp slt i32 %1960, 0
  br i1 %1961, label %1962, label %1963

; <label>:1962:                                   ; preds = %1948
  store i32 -4, i32* %4, align 4
  br label %5741

; <label>:1963:                                   ; preds = %1948
  %1964 = load %struct.DState*, %struct.DState** %2, align 8
  %1965 = getelementptr inbounds %struct.DState, %struct.DState* %1964, i32 0, i32 13
  %1966 = load i32, i32* %1965, align 8
  %1967 = load %struct.DState*, %struct.DState** %2, align 8
  %1968 = getelementptr inbounds %struct.DState, %struct.DState* %1967, i32 0, i32 9
  %1969 = load i32, i32* %1968, align 8
  %1970 = mul nsw i32 100000, %1969
  %1971 = add nsw i32 10, %1970
  %1972 = icmp sgt i32 %1966, %1971
  br i1 %1972, label %1973, label %1974

; <label>:1973:                                   ; preds = %1963
  store i32 -4, i32* %4, align 4
  br label %5741

; <label>:1974:                                   ; preds = %1963
  store i32 0, i32* %8, align 4
  br label %1975

; <label>:1975:                                   ; preds = %2079, %1974
  %1976 = load i32, i32* %8, align 4
  %1977 = icmp slt i32 %1976, 16
  br i1 %1977, label %1978, label %2082

; <label>:1978:                                   ; preds = %1975
  br label %1979

; <label>:1979:                                   ; preds = %1978, %144
  %1980 = load %struct.DState*, %struct.DState** %2, align 8
  %1981 = getelementptr inbounds %struct.DState, %struct.DState* %1980, i32 0, i32 1
  store i32 28, i32* %1981, align 8
  br label %1982

; <label>:1982:                                   ; preds = %2061, %1979
  %1983 = load %struct.DState*, %struct.DState** %2, align 8
  %1984 = getelementptr inbounds %struct.DState, %struct.DState* %1983, i32 0, i32 8
  %1985 = load i32, i32* %1984, align 4
  %1986 = icmp sge i32 %1985, 1
  br i1 %1986, label %1987, label %2003

; <label>:1987:                                   ; preds = %1982
  %1988 = load %struct.DState*, %struct.DState** %2, align 8
  %1989 = getelementptr inbounds %struct.DState, %struct.DState* %1988, i32 0, i32 7
  %1990 = load i32, i32* %1989, align 8
  %1991 = load %struct.DState*, %struct.DState** %2, align 8
  %1992 = getelementptr inbounds %struct.DState, %struct.DState* %1991, i32 0, i32 8
  %1993 = load i32, i32* %1992, align 4
  %1994 = sub nsw i32 %1993, 1
  %1995 = lshr i32 %1990, %1994
  %1996 = and i32 %1995, 1
  store i32 %1996, i32* %50, align 4
  %1997 = load %struct.DState*, %struct.DState** %2, align 8
  %1998 = getelementptr inbounds %struct.DState, %struct.DState* %1997, i32 0, i32 8
  %1999 = load i32, i32* %1998, align 4
  %2000 = sub nsw i32 %1999, 1
  store i32 %2000, i32* %1998, align 4
  %2001 = load i32, i32* %50, align 4
  %2002 = trunc i32 %2001 to i8
  store i8 %2002, i8* %3, align 1
  br label %2062

; <label>:2003:                                   ; preds = %1982
  %2004 = load %struct.DState*, %struct.DState** %2, align 8
  %2005 = getelementptr inbounds %struct.DState, %struct.DState* %2004, i32 0, i32 0
  %2006 = load %struct.bz_stream*, %struct.bz_stream** %2005, align 8
  %2007 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2006, i32 0, i32 1
  %2008 = load i32, i32* %2007, align 8
  %2009 = icmp eq i32 %2008, 0
  br i1 %2009, label %2010, label %2011

; <label>:2010:                                   ; preds = %2003
  store i32 0, i32* %4, align 4
  br label %5741

; <label>:2011:                                   ; preds = %2003
  %2012 = load %struct.DState*, %struct.DState** %2, align 8
  %2013 = getelementptr inbounds %struct.DState, %struct.DState* %2012, i32 0, i32 7
  %2014 = load i32, i32* %2013, align 8
  %2015 = shl i32 %2014, 8
  %2016 = load %struct.DState*, %struct.DState** %2, align 8
  %2017 = getelementptr inbounds %struct.DState, %struct.DState* %2016, i32 0, i32 0
  %2018 = load %struct.bz_stream*, %struct.bz_stream** %2017, align 8
  %2019 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2018, i32 0, i32 0
  %2020 = load i8*, i8** %2019, align 8
  %2021 = load i8, i8* %2020, align 1
  %2022 = zext i8 %2021 to i32
  %2023 = or i32 %2015, %2022
  %2024 = load %struct.DState*, %struct.DState** %2, align 8
  %2025 = getelementptr inbounds %struct.DState, %struct.DState* %2024, i32 0, i32 7
  store i32 %2023, i32* %2025, align 8
  %2026 = load %struct.DState*, %struct.DState** %2, align 8
  %2027 = getelementptr inbounds %struct.DState, %struct.DState* %2026, i32 0, i32 8
  %2028 = load i32, i32* %2027, align 4
  %2029 = add nsw i32 %2028, 8
  store i32 %2029, i32* %2027, align 4
  %2030 = load %struct.DState*, %struct.DState** %2, align 8
  %2031 = getelementptr inbounds %struct.DState, %struct.DState* %2030, i32 0, i32 0
  %2032 = load %struct.bz_stream*, %struct.bz_stream** %2031, align 8
  %2033 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2032, i32 0, i32 0
  %2034 = load i8*, i8** %2033, align 8
  %2035 = getelementptr inbounds i8, i8* %2034, i32 1
  store i8* %2035, i8** %2033, align 8
  %2036 = load %struct.DState*, %struct.DState** %2, align 8
  %2037 = getelementptr inbounds %struct.DState, %struct.DState* %2036, i32 0, i32 0
  %2038 = load %struct.bz_stream*, %struct.bz_stream** %2037, align 8
  %2039 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2038, i32 0, i32 1
  %2040 = load i32, i32* %2039, align 8
  %2041 = add i32 %2040, -1
  store i32 %2041, i32* %2039, align 8
  %2042 = load %struct.DState*, %struct.DState** %2, align 8
  %2043 = getelementptr inbounds %struct.DState, %struct.DState* %2042, i32 0, i32 0
  %2044 = load %struct.bz_stream*, %struct.bz_stream** %2043, align 8
  %2045 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2044, i32 0, i32 2
  %2046 = load i32, i32* %2045, align 4
  %2047 = add i32 %2046, 1
  store i32 %2047, i32* %2045, align 4
  %2048 = load %struct.DState*, %struct.DState** %2, align 8
  %2049 = getelementptr inbounds %struct.DState, %struct.DState* %2048, i32 0, i32 0
  %2050 = load %struct.bz_stream*, %struct.bz_stream** %2049, align 8
  %2051 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2050, i32 0, i32 2
  %2052 = load i32, i32* %2051, align 4
  %2053 = icmp eq i32 %2052, 0
  br i1 %2053, label %2054, label %2061

; <label>:2054:                                   ; preds = %2011
  %2055 = load %struct.DState*, %struct.DState** %2, align 8
  %2056 = getelementptr inbounds %struct.DState, %struct.DState* %2055, i32 0, i32 0
  %2057 = load %struct.bz_stream*, %struct.bz_stream** %2056, align 8
  %2058 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2057, i32 0, i32 3
  %2059 = load i32, i32* %2058, align 8
  %2060 = add i32 %2059, 1
  store i32 %2060, i32* %2058, align 8
  br label %2061

; <label>:2061:                                   ; preds = %2054, %2011
  br label %1982

; <label>:2062:                                   ; preds = %1987
  %2063 = load i8, i8* %3, align 1
  %2064 = zext i8 %2063 to i32
  %2065 = icmp eq i32 %2064, 1
  br i1 %2065, label %2066, label %2072

; <label>:2066:                                   ; preds = %2062
  %2067 = load %struct.DState*, %struct.DState** %2, align 8
  %2068 = getelementptr inbounds %struct.DState, %struct.DState* %2067, i32 0, i32 29
  %2069 = load i32, i32* %8, align 4
  %2070 = sext i32 %2069 to i64
  %2071 = getelementptr inbounds [16 x i8], [16 x i8]* %2068, i64 0, i64 %2070
  store i8 1, i8* %2071, align 1
  br label %2078

; <label>:2072:                                   ; preds = %2062
  %2073 = load %struct.DState*, %struct.DState** %2, align 8
  %2074 = getelementptr inbounds %struct.DState, %struct.DState* %2073, i32 0, i32 29
  %2075 = load i32, i32* %8, align 4
  %2076 = sext i32 %2075 to i64
  %2077 = getelementptr inbounds [16 x i8], [16 x i8]* %2074, i64 0, i64 %2076
  store i8 0, i8* %2077, align 1
  br label %2078

; <label>:2078:                                   ; preds = %2072, %2066
  br label %2079

; <label>:2079:                                   ; preds = %2078
  %2080 = load i32, i32* %8, align 4
  %2081 = add nsw i32 %2080, 1
  store i32 %2081, i32* %8, align 4
  br label %1975

; <label>:2082:                                   ; preds = %1975
  store i32 0, i32* %8, align 4
  br label %2083

; <label>:2083:                                   ; preds = %2092, %2082
  %2084 = load i32, i32* %8, align 4
  %2085 = icmp slt i32 %2084, 256
  br i1 %2085, label %2086, label %2095

; <label>:2086:                                   ; preds = %2083
  %2087 = load %struct.DState*, %struct.DState** %2, align 8
  %2088 = getelementptr inbounds %struct.DState, %struct.DState* %2087, i32 0, i32 28
  %2089 = load i32, i32* %8, align 4
  %2090 = sext i32 %2089 to i64
  %2091 = getelementptr inbounds [256 x i8], [256 x i8]* %2088, i64 0, i64 %2090
  store i8 0, i8* %2091, align 1
  br label %2092

; <label>:2092:                                   ; preds = %2086
  %2093 = load i32, i32* %8, align 4
  %2094 = add nsw i32 %2093, 1
  store i32 %2094, i32* %8, align 4
  br label %2083

; <label>:2095:                                   ; preds = %2083
  store i32 0, i32* %8, align 4
  br label %2096

; <label>:2096:                                   ; preds = %2214, %2095
  %2097 = load i32, i32* %8, align 4
  %2098 = icmp slt i32 %2097, 16
  br i1 %2098, label %2099, label %2217

; <label>:2099:                                   ; preds = %2096
  %2100 = load %struct.DState*, %struct.DState** %2, align 8
  %2101 = getelementptr inbounds %struct.DState, %struct.DState* %2100, i32 0, i32 29
  %2102 = load i32, i32* %8, align 4
  %2103 = sext i32 %2102 to i64
  %2104 = getelementptr inbounds [16 x i8], [16 x i8]* %2101, i64 0, i64 %2103
  %2105 = load i8, i8* %2104, align 1
  %2106 = icmp ne i8 %2105, 0
  br i1 %2106, label %2107, label %2213

; <label>:2107:                                   ; preds = %2099
  store i32 0, i32* %9, align 4
  br label %2108

; <label>:2108:                                   ; preds = %2209, %2107
  %2109 = load i32, i32* %9, align 4
  %2110 = icmp slt i32 %2109, 16
  br i1 %2110, label %2111, label %2212

; <label>:2111:                                   ; preds = %2108
  br label %2112

; <label>:2112:                                   ; preds = %2111, %144
  %2113 = load %struct.DState*, %struct.DState** %2, align 8
  %2114 = getelementptr inbounds %struct.DState, %struct.DState* %2113, i32 0, i32 1
  store i32 29, i32* %2114, align 8
  br label %2115

; <label>:2115:                                   ; preds = %2194, %2112
  %2116 = load %struct.DState*, %struct.DState** %2, align 8
  %2117 = getelementptr inbounds %struct.DState, %struct.DState* %2116, i32 0, i32 8
  %2118 = load i32, i32* %2117, align 4
  %2119 = icmp sge i32 %2118, 1
  br i1 %2119, label %2120, label %2136

; <label>:2120:                                   ; preds = %2115
  %2121 = load %struct.DState*, %struct.DState** %2, align 8
  %2122 = getelementptr inbounds %struct.DState, %struct.DState* %2121, i32 0, i32 7
  %2123 = load i32, i32* %2122, align 8
  %2124 = load %struct.DState*, %struct.DState** %2, align 8
  %2125 = getelementptr inbounds %struct.DState, %struct.DState* %2124, i32 0, i32 8
  %2126 = load i32, i32* %2125, align 4
  %2127 = sub nsw i32 %2126, 1
  %2128 = lshr i32 %2123, %2127
  %2129 = and i32 %2128, 1
  store i32 %2129, i32* %51, align 4
  %2130 = load %struct.DState*, %struct.DState** %2, align 8
  %2131 = getelementptr inbounds %struct.DState, %struct.DState* %2130, i32 0, i32 8
  %2132 = load i32, i32* %2131, align 4
  %2133 = sub nsw i32 %2132, 1
  store i32 %2133, i32* %2131, align 4
  %2134 = load i32, i32* %51, align 4
  %2135 = trunc i32 %2134 to i8
  store i8 %2135, i8* %3, align 1
  br label %2195

; <label>:2136:                                   ; preds = %2115
  %2137 = load %struct.DState*, %struct.DState** %2, align 8
  %2138 = getelementptr inbounds %struct.DState, %struct.DState* %2137, i32 0, i32 0
  %2139 = load %struct.bz_stream*, %struct.bz_stream** %2138, align 8
  %2140 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2139, i32 0, i32 1
  %2141 = load i32, i32* %2140, align 8
  %2142 = icmp eq i32 %2141, 0
  br i1 %2142, label %2143, label %2144

; <label>:2143:                                   ; preds = %2136
  store i32 0, i32* %4, align 4
  br label %5741

; <label>:2144:                                   ; preds = %2136
  %2145 = load %struct.DState*, %struct.DState** %2, align 8
  %2146 = getelementptr inbounds %struct.DState, %struct.DState* %2145, i32 0, i32 7
  %2147 = load i32, i32* %2146, align 8
  %2148 = shl i32 %2147, 8
  %2149 = load %struct.DState*, %struct.DState** %2, align 8
  %2150 = getelementptr inbounds %struct.DState, %struct.DState* %2149, i32 0, i32 0
  %2151 = load %struct.bz_stream*, %struct.bz_stream** %2150, align 8
  %2152 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2151, i32 0, i32 0
  %2153 = load i8*, i8** %2152, align 8
  %2154 = load i8, i8* %2153, align 1
  %2155 = zext i8 %2154 to i32
  %2156 = or i32 %2148, %2155
  %2157 = load %struct.DState*, %struct.DState** %2, align 8
  %2158 = getelementptr inbounds %struct.DState, %struct.DState* %2157, i32 0, i32 7
  store i32 %2156, i32* %2158, align 8
  %2159 = load %struct.DState*, %struct.DState** %2, align 8
  %2160 = getelementptr inbounds %struct.DState, %struct.DState* %2159, i32 0, i32 8
  %2161 = load i32, i32* %2160, align 4
  %2162 = add nsw i32 %2161, 8
  store i32 %2162, i32* %2160, align 4
  %2163 = load %struct.DState*, %struct.DState** %2, align 8
  %2164 = getelementptr inbounds %struct.DState, %struct.DState* %2163, i32 0, i32 0
  %2165 = load %struct.bz_stream*, %struct.bz_stream** %2164, align 8
  %2166 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2165, i32 0, i32 0
  %2167 = load i8*, i8** %2166, align 8
  %2168 = getelementptr inbounds i8, i8* %2167, i32 1
  store i8* %2168, i8** %2166, align 8
  %2169 = load %struct.DState*, %struct.DState** %2, align 8
  %2170 = getelementptr inbounds %struct.DState, %struct.DState* %2169, i32 0, i32 0
  %2171 = load %struct.bz_stream*, %struct.bz_stream** %2170, align 8
  %2172 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2171, i32 0, i32 1
  %2173 = load i32, i32* %2172, align 8
  %2174 = add i32 %2173, -1
  store i32 %2174, i32* %2172, align 8
  %2175 = load %struct.DState*, %struct.DState** %2, align 8
  %2176 = getelementptr inbounds %struct.DState, %struct.DState* %2175, i32 0, i32 0
  %2177 = load %struct.bz_stream*, %struct.bz_stream** %2176, align 8
  %2178 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2177, i32 0, i32 2
  %2179 = load i32, i32* %2178, align 4
  %2180 = add i32 %2179, 1
  store i32 %2180, i32* %2178, align 4
  %2181 = load %struct.DState*, %struct.DState** %2, align 8
  %2182 = getelementptr inbounds %struct.DState, %struct.DState* %2181, i32 0, i32 0
  %2183 = load %struct.bz_stream*, %struct.bz_stream** %2182, align 8
  %2184 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2183, i32 0, i32 2
  %2185 = load i32, i32* %2184, align 4
  %2186 = icmp eq i32 %2185, 0
  br i1 %2186, label %2187, label %2194

; <label>:2187:                                   ; preds = %2144
  %2188 = load %struct.DState*, %struct.DState** %2, align 8
  %2189 = getelementptr inbounds %struct.DState, %struct.DState* %2188, i32 0, i32 0
  %2190 = load %struct.bz_stream*, %struct.bz_stream** %2189, align 8
  %2191 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2190, i32 0, i32 3
  %2192 = load i32, i32* %2191, align 8
  %2193 = add i32 %2192, 1
  store i32 %2193, i32* %2191, align 8
  br label %2194

; <label>:2194:                                   ; preds = %2187, %2144
  br label %2115

; <label>:2195:                                   ; preds = %2120
  %2196 = load i8, i8* %3, align 1
  %2197 = zext i8 %2196 to i32
  %2198 = icmp eq i32 %2197, 1
  br i1 %2198, label %2199, label %2208

; <label>:2199:                                   ; preds = %2195
  %2200 = load %struct.DState*, %struct.DState** %2, align 8
  %2201 = getelementptr inbounds %struct.DState, %struct.DState* %2200, i32 0, i32 28
  %2202 = load i32, i32* %8, align 4
  %2203 = mul nsw i32 %2202, 16
  %2204 = load i32, i32* %9, align 4
  %2205 = add nsw i32 %2203, %2204
  %2206 = sext i32 %2205 to i64
  %2207 = getelementptr inbounds [256 x i8], [256 x i8]* %2201, i64 0, i64 %2206
  store i8 1, i8* %2207, align 1
  br label %2208

; <label>:2208:                                   ; preds = %2199, %2195
  br label %2209

; <label>:2209:                                   ; preds = %2208
  %2210 = load i32, i32* %9, align 4
  %2211 = add nsw i32 %2210, 1
  store i32 %2211, i32* %9, align 4
  br label %2108

; <label>:2212:                                   ; preds = %2108
  br label %2213

; <label>:2213:                                   ; preds = %2212, %2099
  br label %2214

; <label>:2214:                                   ; preds = %2213
  %2215 = load i32, i32* %8, align 4
  %2216 = add nsw i32 %2215, 1
  store i32 %2216, i32* %8, align 4
  br label %2096

; <label>:2217:                                   ; preds = %2096
  %2218 = load %struct.DState*, %struct.DState** %2, align 8
  call void @makeMaps_d(%struct.DState* %2218)
  %2219 = load %struct.DState*, %struct.DState** %2, align 8
  %2220 = getelementptr inbounds %struct.DState, %struct.DState* %2219, i32 0, i32 27
  %2221 = load i32, i32* %2220, align 8
  %2222 = icmp eq i32 %2221, 0
  br i1 %2222, label %2223, label %2224

; <label>:2223:                                   ; preds = %2217
  store i32 -4, i32* %4, align 4
  br label %5741

; <label>:2224:                                   ; preds = %2217
  %2225 = load %struct.DState*, %struct.DState** %2, align 8
  %2226 = getelementptr inbounds %struct.DState, %struct.DState* %2225, i32 0, i32 27
  %2227 = load i32, i32* %2226, align 8
  %2228 = add nsw i32 %2227, 2
  store i32 %2228, i32* %11, align 4
  br label %2229

; <label>:2229:                                   ; preds = %2224, %144
  %2230 = load %struct.DState*, %struct.DState** %2, align 8
  %2231 = getelementptr inbounds %struct.DState, %struct.DState* %2230, i32 0, i32 1
  store i32 30, i32* %2231, align 8
  br label %2232

; <label>:2232:                                   ; preds = %2310, %2229
  %2233 = load %struct.DState*, %struct.DState** %2, align 8
  %2234 = getelementptr inbounds %struct.DState, %struct.DState* %2233, i32 0, i32 8
  %2235 = load i32, i32* %2234, align 4
  %2236 = icmp sge i32 %2235, 3
  br i1 %2236, label %2237, label %2252

; <label>:2237:                                   ; preds = %2232
  %2238 = load %struct.DState*, %struct.DState** %2, align 8
  %2239 = getelementptr inbounds %struct.DState, %struct.DState* %2238, i32 0, i32 7
  %2240 = load i32, i32* %2239, align 8
  %2241 = load %struct.DState*, %struct.DState** %2, align 8
  %2242 = getelementptr inbounds %struct.DState, %struct.DState* %2241, i32 0, i32 8
  %2243 = load i32, i32* %2242, align 4
  %2244 = sub nsw i32 %2243, 3
  %2245 = lshr i32 %2240, %2244
  %2246 = and i32 %2245, 7
  store i32 %2246, i32* %52, align 4
  %2247 = load %struct.DState*, %struct.DState** %2, align 8
  %2248 = getelementptr inbounds %struct.DState, %struct.DState* %2247, i32 0, i32 8
  %2249 = load i32, i32* %2248, align 4
  %2250 = sub nsw i32 %2249, 3
  store i32 %2250, i32* %2248, align 4
  %2251 = load i32, i32* %52, align 4
  store i32 %2251, i32* %12, align 4
  br label %2311

; <label>:2252:                                   ; preds = %2232
  %2253 = load %struct.DState*, %struct.DState** %2, align 8
  %2254 = getelementptr inbounds %struct.DState, %struct.DState* %2253, i32 0, i32 0
  %2255 = load %struct.bz_stream*, %struct.bz_stream** %2254, align 8
  %2256 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2255, i32 0, i32 1
  %2257 = load i32, i32* %2256, align 8
  %2258 = icmp eq i32 %2257, 0
  br i1 %2258, label %2259, label %2260

; <label>:2259:                                   ; preds = %2252
  store i32 0, i32* %4, align 4
  br label %5741

; <label>:2260:                                   ; preds = %2252
  %2261 = load %struct.DState*, %struct.DState** %2, align 8
  %2262 = getelementptr inbounds %struct.DState, %struct.DState* %2261, i32 0, i32 7
  %2263 = load i32, i32* %2262, align 8
  %2264 = shl i32 %2263, 8
  %2265 = load %struct.DState*, %struct.DState** %2, align 8
  %2266 = getelementptr inbounds %struct.DState, %struct.DState* %2265, i32 0, i32 0
  %2267 = load %struct.bz_stream*, %struct.bz_stream** %2266, align 8
  %2268 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2267, i32 0, i32 0
  %2269 = load i8*, i8** %2268, align 8
  %2270 = load i8, i8* %2269, align 1
  %2271 = zext i8 %2270 to i32
  %2272 = or i32 %2264, %2271
  %2273 = load %struct.DState*, %struct.DState** %2, align 8
  %2274 = getelementptr inbounds %struct.DState, %struct.DState* %2273, i32 0, i32 7
  store i32 %2272, i32* %2274, align 8
  %2275 = load %struct.DState*, %struct.DState** %2, align 8
  %2276 = getelementptr inbounds %struct.DState, %struct.DState* %2275, i32 0, i32 8
  %2277 = load i32, i32* %2276, align 4
  %2278 = add nsw i32 %2277, 8
  store i32 %2278, i32* %2276, align 4
  %2279 = load %struct.DState*, %struct.DState** %2, align 8
  %2280 = getelementptr inbounds %struct.DState, %struct.DState* %2279, i32 0, i32 0
  %2281 = load %struct.bz_stream*, %struct.bz_stream** %2280, align 8
  %2282 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2281, i32 0, i32 0
  %2283 = load i8*, i8** %2282, align 8
  %2284 = getelementptr inbounds i8, i8* %2283, i32 1
  store i8* %2284, i8** %2282, align 8
  %2285 = load %struct.DState*, %struct.DState** %2, align 8
  %2286 = getelementptr inbounds %struct.DState, %struct.DState* %2285, i32 0, i32 0
  %2287 = load %struct.bz_stream*, %struct.bz_stream** %2286, align 8
  %2288 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2287, i32 0, i32 1
  %2289 = load i32, i32* %2288, align 8
  %2290 = add i32 %2289, -1
  store i32 %2290, i32* %2288, align 8
  %2291 = load %struct.DState*, %struct.DState** %2, align 8
  %2292 = getelementptr inbounds %struct.DState, %struct.DState* %2291, i32 0, i32 0
  %2293 = load %struct.bz_stream*, %struct.bz_stream** %2292, align 8
  %2294 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2293, i32 0, i32 2
  %2295 = load i32, i32* %2294, align 4
  %2296 = add i32 %2295, 1
  store i32 %2296, i32* %2294, align 4
  %2297 = load %struct.DState*, %struct.DState** %2, align 8
  %2298 = getelementptr inbounds %struct.DState, %struct.DState* %2297, i32 0, i32 0
  %2299 = load %struct.bz_stream*, %struct.bz_stream** %2298, align 8
  %2300 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2299, i32 0, i32 2
  %2301 = load i32, i32* %2300, align 4
  %2302 = icmp eq i32 %2301, 0
  br i1 %2302, label %2303, label %2310

; <label>:2303:                                   ; preds = %2260
  %2304 = load %struct.DState*, %struct.DState** %2, align 8
  %2305 = getelementptr inbounds %struct.DState, %struct.DState* %2304, i32 0, i32 0
  %2306 = load %struct.bz_stream*, %struct.bz_stream** %2305, align 8
  %2307 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2306, i32 0, i32 3
  %2308 = load i32, i32* %2307, align 8
  %2309 = add i32 %2308, 1
  store i32 %2309, i32* %2307, align 8
  br label %2310

; <label>:2310:                                   ; preds = %2303, %2260
  br label %2232

; <label>:2311:                                   ; preds = %2237
  %2312 = load i32, i32* %12, align 4
  %2313 = icmp slt i32 %2312, 2
  br i1 %2313, label %2317, label %2314

; <label>:2314:                                   ; preds = %2311
  %2315 = load i32, i32* %12, align 4
  %2316 = icmp sgt i32 %2315, 6
  br i1 %2316, label %2317, label %2318

; <label>:2317:                                   ; preds = %2314, %2311
  store i32 -4, i32* %4, align 4
  br label %5741

; <label>:2318:                                   ; preds = %2314
  br label %2319

; <label>:2319:                                   ; preds = %2318, %144
  %2320 = load %struct.DState*, %struct.DState** %2, align 8
  %2321 = getelementptr inbounds %struct.DState, %struct.DState* %2320, i32 0, i32 1
  store i32 31, i32* %2321, align 8
  br label %2322

; <label>:2322:                                   ; preds = %2400, %2319
  %2323 = load %struct.DState*, %struct.DState** %2, align 8
  %2324 = getelementptr inbounds %struct.DState, %struct.DState* %2323, i32 0, i32 8
  %2325 = load i32, i32* %2324, align 4
  %2326 = icmp sge i32 %2325, 15
  br i1 %2326, label %2327, label %2342

; <label>:2327:                                   ; preds = %2322
  %2328 = load %struct.DState*, %struct.DState** %2, align 8
  %2329 = getelementptr inbounds %struct.DState, %struct.DState* %2328, i32 0, i32 7
  %2330 = load i32, i32* %2329, align 8
  %2331 = load %struct.DState*, %struct.DState** %2, align 8
  %2332 = getelementptr inbounds %struct.DState, %struct.DState* %2331, i32 0, i32 8
  %2333 = load i32, i32* %2332, align 4
  %2334 = sub nsw i32 %2333, 15
  %2335 = lshr i32 %2330, %2334
  %2336 = and i32 %2335, 32767
  store i32 %2336, i32* %53, align 4
  %2337 = load %struct.DState*, %struct.DState** %2, align 8
  %2338 = getelementptr inbounds %struct.DState, %struct.DState* %2337, i32 0, i32 8
  %2339 = load i32, i32* %2338, align 4
  %2340 = sub nsw i32 %2339, 15
  store i32 %2340, i32* %2338, align 4
  %2341 = load i32, i32* %53, align 4
  store i32 %2341, i32* %13, align 4
  br label %2401

; <label>:2342:                                   ; preds = %2322
  %2343 = load %struct.DState*, %struct.DState** %2, align 8
  %2344 = getelementptr inbounds %struct.DState, %struct.DState* %2343, i32 0, i32 0
  %2345 = load %struct.bz_stream*, %struct.bz_stream** %2344, align 8
  %2346 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2345, i32 0, i32 1
  %2347 = load i32, i32* %2346, align 8
  %2348 = icmp eq i32 %2347, 0
  br i1 %2348, label %2349, label %2350

; <label>:2349:                                   ; preds = %2342
  store i32 0, i32* %4, align 4
  br label %5741

; <label>:2350:                                   ; preds = %2342
  %2351 = load %struct.DState*, %struct.DState** %2, align 8
  %2352 = getelementptr inbounds %struct.DState, %struct.DState* %2351, i32 0, i32 7
  %2353 = load i32, i32* %2352, align 8
  %2354 = shl i32 %2353, 8
  %2355 = load %struct.DState*, %struct.DState** %2, align 8
  %2356 = getelementptr inbounds %struct.DState, %struct.DState* %2355, i32 0, i32 0
  %2357 = load %struct.bz_stream*, %struct.bz_stream** %2356, align 8
  %2358 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2357, i32 0, i32 0
  %2359 = load i8*, i8** %2358, align 8
  %2360 = load i8, i8* %2359, align 1
  %2361 = zext i8 %2360 to i32
  %2362 = or i32 %2354, %2361
  %2363 = load %struct.DState*, %struct.DState** %2, align 8
  %2364 = getelementptr inbounds %struct.DState, %struct.DState* %2363, i32 0, i32 7
  store i32 %2362, i32* %2364, align 8
  %2365 = load %struct.DState*, %struct.DState** %2, align 8
  %2366 = getelementptr inbounds %struct.DState, %struct.DState* %2365, i32 0, i32 8
  %2367 = load i32, i32* %2366, align 4
  %2368 = add nsw i32 %2367, 8
  store i32 %2368, i32* %2366, align 4
  %2369 = load %struct.DState*, %struct.DState** %2, align 8
  %2370 = getelementptr inbounds %struct.DState, %struct.DState* %2369, i32 0, i32 0
  %2371 = load %struct.bz_stream*, %struct.bz_stream** %2370, align 8
  %2372 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2371, i32 0, i32 0
  %2373 = load i8*, i8** %2372, align 8
  %2374 = getelementptr inbounds i8, i8* %2373, i32 1
  store i8* %2374, i8** %2372, align 8
  %2375 = load %struct.DState*, %struct.DState** %2, align 8
  %2376 = getelementptr inbounds %struct.DState, %struct.DState* %2375, i32 0, i32 0
  %2377 = load %struct.bz_stream*, %struct.bz_stream** %2376, align 8
  %2378 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2377, i32 0, i32 1
  %2379 = load i32, i32* %2378, align 8
  %2380 = add i32 %2379, -1
  store i32 %2380, i32* %2378, align 8
  %2381 = load %struct.DState*, %struct.DState** %2, align 8
  %2382 = getelementptr inbounds %struct.DState, %struct.DState* %2381, i32 0, i32 0
  %2383 = load %struct.bz_stream*, %struct.bz_stream** %2382, align 8
  %2384 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2383, i32 0, i32 2
  %2385 = load i32, i32* %2384, align 4
  %2386 = add i32 %2385, 1
  store i32 %2386, i32* %2384, align 4
  %2387 = load %struct.DState*, %struct.DState** %2, align 8
  %2388 = getelementptr inbounds %struct.DState, %struct.DState* %2387, i32 0, i32 0
  %2389 = load %struct.bz_stream*, %struct.bz_stream** %2388, align 8
  %2390 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2389, i32 0, i32 2
  %2391 = load i32, i32* %2390, align 4
  %2392 = icmp eq i32 %2391, 0
  br i1 %2392, label %2393, label %2400

; <label>:2393:                                   ; preds = %2350
  %2394 = load %struct.DState*, %struct.DState** %2, align 8
  %2395 = getelementptr inbounds %struct.DState, %struct.DState* %2394, i32 0, i32 0
  %2396 = load %struct.bz_stream*, %struct.bz_stream** %2395, align 8
  %2397 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2396, i32 0, i32 3
  %2398 = load i32, i32* %2397, align 8
  %2399 = add i32 %2398, 1
  store i32 %2399, i32* %2397, align 8
  br label %2400

; <label>:2400:                                   ; preds = %2393, %2350
  br label %2322

; <label>:2401:                                   ; preds = %2327
  %2402 = load i32, i32* %13, align 4
  %2403 = icmp slt i32 %2402, 1
  br i1 %2403, label %2404, label %2405

; <label>:2404:                                   ; preds = %2401
  store i32 -4, i32* %4, align 4
  br label %5741

; <label>:2405:                                   ; preds = %2401
  store i32 0, i32* %8, align 4
  br label %2406

; <label>:2406:                                   ; preds = %2516, %2405
  %2407 = load i32, i32* %8, align 4
  %2408 = load i32, i32* %13, align 4
  %2409 = icmp slt i32 %2407, %2408
  br i1 %2409, label %2410, label %2519

; <label>:2410:                                   ; preds = %2406
  store i32 0, i32* %9, align 4
  br label %2411

; <label>:2411:                                   ; preds = %2507, %2410
  br label %2412

; <label>:2412:                                   ; preds = %2411, %144
  %2413 = load %struct.DState*, %struct.DState** %2, align 8
  %2414 = getelementptr inbounds %struct.DState, %struct.DState* %2413, i32 0, i32 1
  store i32 32, i32* %2414, align 8
  br label %2415

; <label>:2415:                                   ; preds = %2494, %2412
  %2416 = load %struct.DState*, %struct.DState** %2, align 8
  %2417 = getelementptr inbounds %struct.DState, %struct.DState* %2416, i32 0, i32 8
  %2418 = load i32, i32* %2417, align 4
  %2419 = icmp sge i32 %2418, 1
  br i1 %2419, label %2420, label %2436

; <label>:2420:                                   ; preds = %2415
  %2421 = load %struct.DState*, %struct.DState** %2, align 8
  %2422 = getelementptr inbounds %struct.DState, %struct.DState* %2421, i32 0, i32 7
  %2423 = load i32, i32* %2422, align 8
  %2424 = load %struct.DState*, %struct.DState** %2, align 8
  %2425 = getelementptr inbounds %struct.DState, %struct.DState* %2424, i32 0, i32 8
  %2426 = load i32, i32* %2425, align 4
  %2427 = sub nsw i32 %2426, 1
  %2428 = lshr i32 %2423, %2427
  %2429 = and i32 %2428, 1
  store i32 %2429, i32* %54, align 4
  %2430 = load %struct.DState*, %struct.DState** %2, align 8
  %2431 = getelementptr inbounds %struct.DState, %struct.DState* %2430, i32 0, i32 8
  %2432 = load i32, i32* %2431, align 4
  %2433 = sub nsw i32 %2432, 1
  store i32 %2433, i32* %2431, align 4
  %2434 = load i32, i32* %54, align 4
  %2435 = trunc i32 %2434 to i8
  store i8 %2435, i8* %3, align 1
  br label %2495

; <label>:2436:                                   ; preds = %2415
  %2437 = load %struct.DState*, %struct.DState** %2, align 8
  %2438 = getelementptr inbounds %struct.DState, %struct.DState* %2437, i32 0, i32 0
  %2439 = load %struct.bz_stream*, %struct.bz_stream** %2438, align 8
  %2440 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2439, i32 0, i32 1
  %2441 = load i32, i32* %2440, align 8
  %2442 = icmp eq i32 %2441, 0
  br i1 %2442, label %2443, label %2444

; <label>:2443:                                   ; preds = %2436
  store i32 0, i32* %4, align 4
  br label %5741

; <label>:2444:                                   ; preds = %2436
  %2445 = load %struct.DState*, %struct.DState** %2, align 8
  %2446 = getelementptr inbounds %struct.DState, %struct.DState* %2445, i32 0, i32 7
  %2447 = load i32, i32* %2446, align 8
  %2448 = shl i32 %2447, 8
  %2449 = load %struct.DState*, %struct.DState** %2, align 8
  %2450 = getelementptr inbounds %struct.DState, %struct.DState* %2449, i32 0, i32 0
  %2451 = load %struct.bz_stream*, %struct.bz_stream** %2450, align 8
  %2452 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2451, i32 0, i32 0
  %2453 = load i8*, i8** %2452, align 8
  %2454 = load i8, i8* %2453, align 1
  %2455 = zext i8 %2454 to i32
  %2456 = or i32 %2448, %2455
  %2457 = load %struct.DState*, %struct.DState** %2, align 8
  %2458 = getelementptr inbounds %struct.DState, %struct.DState* %2457, i32 0, i32 7
  store i32 %2456, i32* %2458, align 8
  %2459 = load %struct.DState*, %struct.DState** %2, align 8
  %2460 = getelementptr inbounds %struct.DState, %struct.DState* %2459, i32 0, i32 8
  %2461 = load i32, i32* %2460, align 4
  %2462 = add nsw i32 %2461, 8
  store i32 %2462, i32* %2460, align 4
  %2463 = load %struct.DState*, %struct.DState** %2, align 8
  %2464 = getelementptr inbounds %struct.DState, %struct.DState* %2463, i32 0, i32 0
  %2465 = load %struct.bz_stream*, %struct.bz_stream** %2464, align 8
  %2466 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2465, i32 0, i32 0
  %2467 = load i8*, i8** %2466, align 8
  %2468 = getelementptr inbounds i8, i8* %2467, i32 1
  store i8* %2468, i8** %2466, align 8
  %2469 = load %struct.DState*, %struct.DState** %2, align 8
  %2470 = getelementptr inbounds %struct.DState, %struct.DState* %2469, i32 0, i32 0
  %2471 = load %struct.bz_stream*, %struct.bz_stream** %2470, align 8
  %2472 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2471, i32 0, i32 1
  %2473 = load i32, i32* %2472, align 8
  %2474 = add i32 %2473, -1
  store i32 %2474, i32* %2472, align 8
  %2475 = load %struct.DState*, %struct.DState** %2, align 8
  %2476 = getelementptr inbounds %struct.DState, %struct.DState* %2475, i32 0, i32 0
  %2477 = load %struct.bz_stream*, %struct.bz_stream** %2476, align 8
  %2478 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2477, i32 0, i32 2
  %2479 = load i32, i32* %2478, align 4
  %2480 = add i32 %2479, 1
  store i32 %2480, i32* %2478, align 4
  %2481 = load %struct.DState*, %struct.DState** %2, align 8
  %2482 = getelementptr inbounds %struct.DState, %struct.DState* %2481, i32 0, i32 0
  %2483 = load %struct.bz_stream*, %struct.bz_stream** %2482, align 8
  %2484 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2483, i32 0, i32 2
  %2485 = load i32, i32* %2484, align 4
  %2486 = icmp eq i32 %2485, 0
  br i1 %2486, label %2487, label %2494

; <label>:2487:                                   ; preds = %2444
  %2488 = load %struct.DState*, %struct.DState** %2, align 8
  %2489 = getelementptr inbounds %struct.DState, %struct.DState* %2488, i32 0, i32 0
  %2490 = load %struct.bz_stream*, %struct.bz_stream** %2489, align 8
  %2491 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2490, i32 0, i32 3
  %2492 = load i32, i32* %2491, align 8
  %2493 = add i32 %2492, 1
  store i32 %2493, i32* %2491, align 8
  br label %2494

; <label>:2494:                                   ; preds = %2487, %2444
  br label %2415

; <label>:2495:                                   ; preds = %2420
  %2496 = load i8, i8* %3, align 1
  %2497 = zext i8 %2496 to i32
  %2498 = icmp eq i32 %2497, 0
  br i1 %2498, label %2499, label %2500

; <label>:2499:                                   ; preds = %2495
  br label %2508

; <label>:2500:                                   ; preds = %2495
  %2501 = load i32, i32* %9, align 4
  %2502 = add nsw i32 %2501, 1
  store i32 %2502, i32* %9, align 4
  %2503 = load i32, i32* %9, align 4
  %2504 = load i32, i32* %12, align 4
  %2505 = icmp sge i32 %2503, %2504
  br i1 %2505, label %2506, label %2507

; <label>:2506:                                   ; preds = %2500
  store i32 -4, i32* %4, align 4
  br label %5741

; <label>:2507:                                   ; preds = %2500
  br label %2411

; <label>:2508:                                   ; preds = %2499
  %2509 = load i32, i32* %9, align 4
  %2510 = trunc i32 %2509 to i8
  %2511 = load %struct.DState*, %struct.DState** %2, align 8
  %2512 = getelementptr inbounds %struct.DState, %struct.DState* %2511, i32 0, i32 34
  %2513 = load i32, i32* %8, align 4
  %2514 = sext i32 %2513 to i64
  %2515 = getelementptr inbounds [18002 x i8], [18002 x i8]* %2512, i64 0, i64 %2514
  store i8 %2510, i8* %2515, align 1
  br label %2516

; <label>:2516:                                   ; preds = %2508
  %2517 = load i32, i32* %8, align 4
  %2518 = add nsw i32 %2517, 1
  store i32 %2518, i32* %8, align 4
  br label %2406

; <label>:2519:                                   ; preds = %2406
  store i8 0, i8* %57, align 1
  br label %2520

; <label>:2520:                                   ; preds = %2530, %2519
  %2521 = load i8, i8* %57, align 1
  %2522 = zext i8 %2521 to i32
  %2523 = load i32, i32* %12, align 4
  %2524 = icmp slt i32 %2522, %2523
  br i1 %2524, label %2525, label %2533

; <label>:2525:                                   ; preds = %2520
  %2526 = load i8, i8* %57, align 1
  %2527 = load i8, i8* %57, align 1
  %2528 = zext i8 %2527 to i64
  %2529 = getelementptr inbounds [6 x i8], [6 x i8]* %55, i64 0, i64 %2528
  store i8 %2526, i8* %2529, align 1
  br label %2530

; <label>:2530:                                   ; preds = %2525
  %2531 = load i8, i8* %57, align 1
  %2532 = add i8 %2531, 1
  store i8 %2532, i8* %57, align 1
  br label %2520

; <label>:2533:                                   ; preds = %2520
  store i32 0, i32* %8, align 4
  br label %2534

; <label>:2534:                                   ; preds = %2574, %2533
  %2535 = load i32, i32* %8, align 4
  %2536 = load i32, i32* %13, align 4
  %2537 = icmp slt i32 %2535, %2536
  br i1 %2537, label %2538, label %2577

; <label>:2538:                                   ; preds = %2534
  %2539 = load %struct.DState*, %struct.DState** %2, align 8
  %2540 = getelementptr inbounds %struct.DState, %struct.DState* %2539, i32 0, i32 34
  %2541 = load i32, i32* %8, align 4
  %2542 = sext i32 %2541 to i64
  %2543 = getelementptr inbounds [18002 x i8], [18002 x i8]* %2540, i64 0, i64 %2542
  %2544 = load i8, i8* %2543, align 1
  store i8 %2544, i8* %57, align 1
  %2545 = load i8, i8* %57, align 1
  %2546 = zext i8 %2545 to i64
  %2547 = getelementptr inbounds [6 x i8], [6 x i8]* %55, i64 0, i64 %2546
  %2548 = load i8, i8* %2547, align 1
  store i8 %2548, i8* %56, align 1
  br label %2549

; <label>:2549:                                   ; preds = %2553, %2538
  %2550 = load i8, i8* %57, align 1
  %2551 = zext i8 %2550 to i32
  %2552 = icmp sgt i32 %2551, 0
  br i1 %2552, label %2553, label %2565

; <label>:2553:                                   ; preds = %2549
  %2554 = load i8, i8* %57, align 1
  %2555 = zext i8 %2554 to i32
  %2556 = sub nsw i32 %2555, 1
  %2557 = sext i32 %2556 to i64
  %2558 = getelementptr inbounds [6 x i8], [6 x i8]* %55, i64 0, i64 %2557
  %2559 = load i8, i8* %2558, align 1
  %2560 = load i8, i8* %57, align 1
  %2561 = zext i8 %2560 to i64
  %2562 = getelementptr inbounds [6 x i8], [6 x i8]* %55, i64 0, i64 %2561
  store i8 %2559, i8* %2562, align 1
  %2563 = load i8, i8* %57, align 1
  %2564 = add i8 %2563, -1
  store i8 %2564, i8* %57, align 1
  br label %2549

; <label>:2565:                                   ; preds = %2549
  %2566 = load i8, i8* %56, align 1
  %2567 = getelementptr inbounds [6 x i8], [6 x i8]* %55, i64 0, i64 0
  store i8 %2566, i8* %2567, align 1
  %2568 = load i8, i8* %56, align 1
  %2569 = load %struct.DState*, %struct.DState** %2, align 8
  %2570 = getelementptr inbounds %struct.DState, %struct.DState* %2569, i32 0, i32 33
  %2571 = load i32, i32* %8, align 4
  %2572 = sext i32 %2571 to i64
  %2573 = getelementptr inbounds [18002 x i8], [18002 x i8]* %2570, i64 0, i64 %2572
  store i8 %2568, i8* %2573, align 1
  br label %2574

; <label>:2574:                                   ; preds = %2565
  %2575 = load i32, i32* %8, align 4
  %2576 = add nsw i32 %2575, 1
  store i32 %2576, i32* %8, align 4
  br label %2534

; <label>:2577:                                   ; preds = %2534
  store i32 0, i32* %10, align 4
  br label %2578

; <label>:2578:                                   ; preds = %2877, %2577
  %2579 = load i32, i32* %10, align 4
  %2580 = load i32, i32* %12, align 4
  %2581 = icmp slt i32 %2579, %2580
  br i1 %2581, label %2582, label %2880

; <label>:2582:                                   ; preds = %2578
  br label %2583

; <label>:2583:                                   ; preds = %2582, %144
  %2584 = load %struct.DState*, %struct.DState** %2, align 8
  %2585 = getelementptr inbounds %struct.DState, %struct.DState* %2584, i32 0, i32 1
  store i32 33, i32* %2585, align 8
  br label %2586

; <label>:2586:                                   ; preds = %2664, %2583
  %2587 = load %struct.DState*, %struct.DState** %2, align 8
  %2588 = getelementptr inbounds %struct.DState, %struct.DState* %2587, i32 0, i32 8
  %2589 = load i32, i32* %2588, align 4
  %2590 = icmp sge i32 %2589, 5
  br i1 %2590, label %2591, label %2606

; <label>:2591:                                   ; preds = %2586
  %2592 = load %struct.DState*, %struct.DState** %2, align 8
  %2593 = getelementptr inbounds %struct.DState, %struct.DState* %2592, i32 0, i32 7
  %2594 = load i32, i32* %2593, align 8
  %2595 = load %struct.DState*, %struct.DState** %2, align 8
  %2596 = getelementptr inbounds %struct.DState, %struct.DState* %2595, i32 0, i32 8
  %2597 = load i32, i32* %2596, align 4
  %2598 = sub nsw i32 %2597, 5
  %2599 = lshr i32 %2594, %2598
  %2600 = and i32 %2599, 31
  store i32 %2600, i32* %58, align 4
  %2601 = load %struct.DState*, %struct.DState** %2, align 8
  %2602 = getelementptr inbounds %struct.DState, %struct.DState* %2601, i32 0, i32 8
  %2603 = load i32, i32* %2602, align 4
  %2604 = sub nsw i32 %2603, 5
  store i32 %2604, i32* %2602, align 4
  %2605 = load i32, i32* %58, align 4
  store i32 %2605, i32* %22, align 4
  br label %2665

; <label>:2606:                                   ; preds = %2586
  %2607 = load %struct.DState*, %struct.DState** %2, align 8
  %2608 = getelementptr inbounds %struct.DState, %struct.DState* %2607, i32 0, i32 0
  %2609 = load %struct.bz_stream*, %struct.bz_stream** %2608, align 8
  %2610 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2609, i32 0, i32 1
  %2611 = load i32, i32* %2610, align 8
  %2612 = icmp eq i32 %2611, 0
  br i1 %2612, label %2613, label %2614

; <label>:2613:                                   ; preds = %2606
  store i32 0, i32* %4, align 4
  br label %5741

; <label>:2614:                                   ; preds = %2606
  %2615 = load %struct.DState*, %struct.DState** %2, align 8
  %2616 = getelementptr inbounds %struct.DState, %struct.DState* %2615, i32 0, i32 7
  %2617 = load i32, i32* %2616, align 8
  %2618 = shl i32 %2617, 8
  %2619 = load %struct.DState*, %struct.DState** %2, align 8
  %2620 = getelementptr inbounds %struct.DState, %struct.DState* %2619, i32 0, i32 0
  %2621 = load %struct.bz_stream*, %struct.bz_stream** %2620, align 8
  %2622 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2621, i32 0, i32 0
  %2623 = load i8*, i8** %2622, align 8
  %2624 = load i8, i8* %2623, align 1
  %2625 = zext i8 %2624 to i32
  %2626 = or i32 %2618, %2625
  %2627 = load %struct.DState*, %struct.DState** %2, align 8
  %2628 = getelementptr inbounds %struct.DState, %struct.DState* %2627, i32 0, i32 7
  store i32 %2626, i32* %2628, align 8
  %2629 = load %struct.DState*, %struct.DState** %2, align 8
  %2630 = getelementptr inbounds %struct.DState, %struct.DState* %2629, i32 0, i32 8
  %2631 = load i32, i32* %2630, align 4
  %2632 = add nsw i32 %2631, 8
  store i32 %2632, i32* %2630, align 4
  %2633 = load %struct.DState*, %struct.DState** %2, align 8
  %2634 = getelementptr inbounds %struct.DState, %struct.DState* %2633, i32 0, i32 0
  %2635 = load %struct.bz_stream*, %struct.bz_stream** %2634, align 8
  %2636 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2635, i32 0, i32 0
  %2637 = load i8*, i8** %2636, align 8
  %2638 = getelementptr inbounds i8, i8* %2637, i32 1
  store i8* %2638, i8** %2636, align 8
  %2639 = load %struct.DState*, %struct.DState** %2, align 8
  %2640 = getelementptr inbounds %struct.DState, %struct.DState* %2639, i32 0, i32 0
  %2641 = load %struct.bz_stream*, %struct.bz_stream** %2640, align 8
  %2642 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2641, i32 0, i32 1
  %2643 = load i32, i32* %2642, align 8
  %2644 = add i32 %2643, -1
  store i32 %2644, i32* %2642, align 8
  %2645 = load %struct.DState*, %struct.DState** %2, align 8
  %2646 = getelementptr inbounds %struct.DState, %struct.DState* %2645, i32 0, i32 0
  %2647 = load %struct.bz_stream*, %struct.bz_stream** %2646, align 8
  %2648 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2647, i32 0, i32 2
  %2649 = load i32, i32* %2648, align 4
  %2650 = add i32 %2649, 1
  store i32 %2650, i32* %2648, align 4
  %2651 = load %struct.DState*, %struct.DState** %2, align 8
  %2652 = getelementptr inbounds %struct.DState, %struct.DState* %2651, i32 0, i32 0
  %2653 = load %struct.bz_stream*, %struct.bz_stream** %2652, align 8
  %2654 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2653, i32 0, i32 2
  %2655 = load i32, i32* %2654, align 4
  %2656 = icmp eq i32 %2655, 0
  br i1 %2656, label %2657, label %2664

; <label>:2657:                                   ; preds = %2614
  %2658 = load %struct.DState*, %struct.DState** %2, align 8
  %2659 = getelementptr inbounds %struct.DState, %struct.DState* %2658, i32 0, i32 0
  %2660 = load %struct.bz_stream*, %struct.bz_stream** %2659, align 8
  %2661 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2660, i32 0, i32 3
  %2662 = load i32, i32* %2661, align 8
  %2663 = add i32 %2662, 1
  store i32 %2663, i32* %2661, align 8
  br label %2664

; <label>:2664:                                   ; preds = %2657, %2614
  br label %2586

; <label>:2665:                                   ; preds = %2591
  store i32 0, i32* %8, align 4
  br label %2666

; <label>:2666:                                   ; preds = %2873, %2665
  %2667 = load i32, i32* %8, align 4
  %2668 = load i32, i32* %11, align 4
  %2669 = icmp slt i32 %2667, %2668
  br i1 %2669, label %2670, label %2876

; <label>:2670:                                   ; preds = %2666
  br label %2671

; <label>:2671:                                   ; preds = %2861, %2670
  %2672 = load i32, i32* %22, align 4
  %2673 = icmp slt i32 %2672, 1
  br i1 %2673, label %2677, label %2674

; <label>:2674:                                   ; preds = %2671
  %2675 = load i32, i32* %22, align 4
  %2676 = icmp sgt i32 %2675, 20
  br i1 %2676, label %2677, label %2678

; <label>:2677:                                   ; preds = %2674, %2671
  store i32 -4, i32* %4, align 4
  br label %5741

; <label>:2678:                                   ; preds = %2674
  br label %2679

; <label>:2679:                                   ; preds = %2678, %144
  %2680 = load %struct.DState*, %struct.DState** %2, align 8
  %2681 = getelementptr inbounds %struct.DState, %struct.DState* %2680, i32 0, i32 1
  store i32 34, i32* %2681, align 8
  br label %2682

; <label>:2682:                                   ; preds = %2761, %2679
  %2683 = load %struct.DState*, %struct.DState** %2, align 8
  %2684 = getelementptr inbounds %struct.DState, %struct.DState* %2683, i32 0, i32 8
  %2685 = load i32, i32* %2684, align 4
  %2686 = icmp sge i32 %2685, 1
  br i1 %2686, label %2687, label %2703

; <label>:2687:                                   ; preds = %2682
  %2688 = load %struct.DState*, %struct.DState** %2, align 8
  %2689 = getelementptr inbounds %struct.DState, %struct.DState* %2688, i32 0, i32 7
  %2690 = load i32, i32* %2689, align 8
  %2691 = load %struct.DState*, %struct.DState** %2, align 8
  %2692 = getelementptr inbounds %struct.DState, %struct.DState* %2691, i32 0, i32 8
  %2693 = load i32, i32* %2692, align 4
  %2694 = sub nsw i32 %2693, 1
  %2695 = lshr i32 %2690, %2694
  %2696 = and i32 %2695, 1
  store i32 %2696, i32* %59, align 4
  %2697 = load %struct.DState*, %struct.DState** %2, align 8
  %2698 = getelementptr inbounds %struct.DState, %struct.DState* %2697, i32 0, i32 8
  %2699 = load i32, i32* %2698, align 4
  %2700 = sub nsw i32 %2699, 1
  store i32 %2700, i32* %2698, align 4
  %2701 = load i32, i32* %59, align 4
  %2702 = trunc i32 %2701 to i8
  store i8 %2702, i8* %3, align 1
  br label %2762

; <label>:2703:                                   ; preds = %2682
  %2704 = load %struct.DState*, %struct.DState** %2, align 8
  %2705 = getelementptr inbounds %struct.DState, %struct.DState* %2704, i32 0, i32 0
  %2706 = load %struct.bz_stream*, %struct.bz_stream** %2705, align 8
  %2707 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2706, i32 0, i32 1
  %2708 = load i32, i32* %2707, align 8
  %2709 = icmp eq i32 %2708, 0
  br i1 %2709, label %2710, label %2711

; <label>:2710:                                   ; preds = %2703
  store i32 0, i32* %4, align 4
  br label %5741

; <label>:2711:                                   ; preds = %2703
  %2712 = load %struct.DState*, %struct.DState** %2, align 8
  %2713 = getelementptr inbounds %struct.DState, %struct.DState* %2712, i32 0, i32 7
  %2714 = load i32, i32* %2713, align 8
  %2715 = shl i32 %2714, 8
  %2716 = load %struct.DState*, %struct.DState** %2, align 8
  %2717 = getelementptr inbounds %struct.DState, %struct.DState* %2716, i32 0, i32 0
  %2718 = load %struct.bz_stream*, %struct.bz_stream** %2717, align 8
  %2719 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2718, i32 0, i32 0
  %2720 = load i8*, i8** %2719, align 8
  %2721 = load i8, i8* %2720, align 1
  %2722 = zext i8 %2721 to i32
  %2723 = or i32 %2715, %2722
  %2724 = load %struct.DState*, %struct.DState** %2, align 8
  %2725 = getelementptr inbounds %struct.DState, %struct.DState* %2724, i32 0, i32 7
  store i32 %2723, i32* %2725, align 8
  %2726 = load %struct.DState*, %struct.DState** %2, align 8
  %2727 = getelementptr inbounds %struct.DState, %struct.DState* %2726, i32 0, i32 8
  %2728 = load i32, i32* %2727, align 4
  %2729 = add nsw i32 %2728, 8
  store i32 %2729, i32* %2727, align 4
  %2730 = load %struct.DState*, %struct.DState** %2, align 8
  %2731 = getelementptr inbounds %struct.DState, %struct.DState* %2730, i32 0, i32 0
  %2732 = load %struct.bz_stream*, %struct.bz_stream** %2731, align 8
  %2733 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2732, i32 0, i32 0
  %2734 = load i8*, i8** %2733, align 8
  %2735 = getelementptr inbounds i8, i8* %2734, i32 1
  store i8* %2735, i8** %2733, align 8
  %2736 = load %struct.DState*, %struct.DState** %2, align 8
  %2737 = getelementptr inbounds %struct.DState, %struct.DState* %2736, i32 0, i32 0
  %2738 = load %struct.bz_stream*, %struct.bz_stream** %2737, align 8
  %2739 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2738, i32 0, i32 1
  %2740 = load i32, i32* %2739, align 8
  %2741 = add i32 %2740, -1
  store i32 %2741, i32* %2739, align 8
  %2742 = load %struct.DState*, %struct.DState** %2, align 8
  %2743 = getelementptr inbounds %struct.DState, %struct.DState* %2742, i32 0, i32 0
  %2744 = load %struct.bz_stream*, %struct.bz_stream** %2743, align 8
  %2745 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2744, i32 0, i32 2
  %2746 = load i32, i32* %2745, align 4
  %2747 = add i32 %2746, 1
  store i32 %2747, i32* %2745, align 4
  %2748 = load %struct.DState*, %struct.DState** %2, align 8
  %2749 = getelementptr inbounds %struct.DState, %struct.DState* %2748, i32 0, i32 0
  %2750 = load %struct.bz_stream*, %struct.bz_stream** %2749, align 8
  %2751 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2750, i32 0, i32 2
  %2752 = load i32, i32* %2751, align 4
  %2753 = icmp eq i32 %2752, 0
  br i1 %2753, label %2754, label %2761

; <label>:2754:                                   ; preds = %2711
  %2755 = load %struct.DState*, %struct.DState** %2, align 8
  %2756 = getelementptr inbounds %struct.DState, %struct.DState* %2755, i32 0, i32 0
  %2757 = load %struct.bz_stream*, %struct.bz_stream** %2756, align 8
  %2758 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2757, i32 0, i32 3
  %2759 = load i32, i32* %2758, align 8
  %2760 = add i32 %2759, 1
  store i32 %2760, i32* %2758, align 8
  br label %2761

; <label>:2761:                                   ; preds = %2754, %2711
  br label %2682

; <label>:2762:                                   ; preds = %2687
  %2763 = load i8, i8* %3, align 1
  %2764 = zext i8 %2763 to i32
  %2765 = icmp eq i32 %2764, 0
  br i1 %2765, label %2766, label %2767

; <label>:2766:                                   ; preds = %2762
  br label %2862

; <label>:2767:                                   ; preds = %2762
  br label %2768

; <label>:2768:                                   ; preds = %2767, %144
  %2769 = load %struct.DState*, %struct.DState** %2, align 8
  %2770 = getelementptr inbounds %struct.DState, %struct.DState* %2769, i32 0, i32 1
  store i32 35, i32* %2770, align 8
  br label %2771

; <label>:2771:                                   ; preds = %2850, %2768
  %2772 = load %struct.DState*, %struct.DState** %2, align 8
  %2773 = getelementptr inbounds %struct.DState, %struct.DState* %2772, i32 0, i32 8
  %2774 = load i32, i32* %2773, align 4
  %2775 = icmp sge i32 %2774, 1
  br i1 %2775, label %2776, label %2792

; <label>:2776:                                   ; preds = %2771
  %2777 = load %struct.DState*, %struct.DState** %2, align 8
  %2778 = getelementptr inbounds %struct.DState, %struct.DState* %2777, i32 0, i32 7
  %2779 = load i32, i32* %2778, align 8
  %2780 = load %struct.DState*, %struct.DState** %2, align 8
  %2781 = getelementptr inbounds %struct.DState, %struct.DState* %2780, i32 0, i32 8
  %2782 = load i32, i32* %2781, align 4
  %2783 = sub nsw i32 %2782, 1
  %2784 = lshr i32 %2779, %2783
  %2785 = and i32 %2784, 1
  store i32 %2785, i32* %60, align 4
  %2786 = load %struct.DState*, %struct.DState** %2, align 8
  %2787 = getelementptr inbounds %struct.DState, %struct.DState* %2786, i32 0, i32 8
  %2788 = load i32, i32* %2787, align 4
  %2789 = sub nsw i32 %2788, 1
  store i32 %2789, i32* %2787, align 4
  %2790 = load i32, i32* %60, align 4
  %2791 = trunc i32 %2790 to i8
  store i8 %2791, i8* %3, align 1
  br label %2851

; <label>:2792:                                   ; preds = %2771
  %2793 = load %struct.DState*, %struct.DState** %2, align 8
  %2794 = getelementptr inbounds %struct.DState, %struct.DState* %2793, i32 0, i32 0
  %2795 = load %struct.bz_stream*, %struct.bz_stream** %2794, align 8
  %2796 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2795, i32 0, i32 1
  %2797 = load i32, i32* %2796, align 8
  %2798 = icmp eq i32 %2797, 0
  br i1 %2798, label %2799, label %2800

; <label>:2799:                                   ; preds = %2792
  store i32 0, i32* %4, align 4
  br label %5741

; <label>:2800:                                   ; preds = %2792
  %2801 = load %struct.DState*, %struct.DState** %2, align 8
  %2802 = getelementptr inbounds %struct.DState, %struct.DState* %2801, i32 0, i32 7
  %2803 = load i32, i32* %2802, align 8
  %2804 = shl i32 %2803, 8
  %2805 = load %struct.DState*, %struct.DState** %2, align 8
  %2806 = getelementptr inbounds %struct.DState, %struct.DState* %2805, i32 0, i32 0
  %2807 = load %struct.bz_stream*, %struct.bz_stream** %2806, align 8
  %2808 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2807, i32 0, i32 0
  %2809 = load i8*, i8** %2808, align 8
  %2810 = load i8, i8* %2809, align 1
  %2811 = zext i8 %2810 to i32
  %2812 = or i32 %2804, %2811
  %2813 = load %struct.DState*, %struct.DState** %2, align 8
  %2814 = getelementptr inbounds %struct.DState, %struct.DState* %2813, i32 0, i32 7
  store i32 %2812, i32* %2814, align 8
  %2815 = load %struct.DState*, %struct.DState** %2, align 8
  %2816 = getelementptr inbounds %struct.DState, %struct.DState* %2815, i32 0, i32 8
  %2817 = load i32, i32* %2816, align 4
  %2818 = add nsw i32 %2817, 8
  store i32 %2818, i32* %2816, align 4
  %2819 = load %struct.DState*, %struct.DState** %2, align 8
  %2820 = getelementptr inbounds %struct.DState, %struct.DState* %2819, i32 0, i32 0
  %2821 = load %struct.bz_stream*, %struct.bz_stream** %2820, align 8
  %2822 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2821, i32 0, i32 0
  %2823 = load i8*, i8** %2822, align 8
  %2824 = getelementptr inbounds i8, i8* %2823, i32 1
  store i8* %2824, i8** %2822, align 8
  %2825 = load %struct.DState*, %struct.DState** %2, align 8
  %2826 = getelementptr inbounds %struct.DState, %struct.DState* %2825, i32 0, i32 0
  %2827 = load %struct.bz_stream*, %struct.bz_stream** %2826, align 8
  %2828 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2827, i32 0, i32 1
  %2829 = load i32, i32* %2828, align 8
  %2830 = add i32 %2829, -1
  store i32 %2830, i32* %2828, align 8
  %2831 = load %struct.DState*, %struct.DState** %2, align 8
  %2832 = getelementptr inbounds %struct.DState, %struct.DState* %2831, i32 0, i32 0
  %2833 = load %struct.bz_stream*, %struct.bz_stream** %2832, align 8
  %2834 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2833, i32 0, i32 2
  %2835 = load i32, i32* %2834, align 4
  %2836 = add i32 %2835, 1
  store i32 %2836, i32* %2834, align 4
  %2837 = load %struct.DState*, %struct.DState** %2, align 8
  %2838 = getelementptr inbounds %struct.DState, %struct.DState* %2837, i32 0, i32 0
  %2839 = load %struct.bz_stream*, %struct.bz_stream** %2838, align 8
  %2840 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2839, i32 0, i32 2
  %2841 = load i32, i32* %2840, align 4
  %2842 = icmp eq i32 %2841, 0
  br i1 %2842, label %2843, label %2850

; <label>:2843:                                   ; preds = %2800
  %2844 = load %struct.DState*, %struct.DState** %2, align 8
  %2845 = getelementptr inbounds %struct.DState, %struct.DState* %2844, i32 0, i32 0
  %2846 = load %struct.bz_stream*, %struct.bz_stream** %2845, align 8
  %2847 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2846, i32 0, i32 3
  %2848 = load i32, i32* %2847, align 8
  %2849 = add i32 %2848, 1
  store i32 %2849, i32* %2847, align 8
  br label %2850

; <label>:2850:                                   ; preds = %2843, %2800
  br label %2771

; <label>:2851:                                   ; preds = %2776
  %2852 = load i8, i8* %3, align 1
  %2853 = zext i8 %2852 to i32
  %2854 = icmp eq i32 %2853, 0
  br i1 %2854, label %2855, label %2858

; <label>:2855:                                   ; preds = %2851
  %2856 = load i32, i32* %22, align 4
  %2857 = add nsw i32 %2856, 1
  store i32 %2857, i32* %22, align 4
  br label %2861

; <label>:2858:                                   ; preds = %2851
  %2859 = load i32, i32* %22, align 4
  %2860 = add nsw i32 %2859, -1
  store i32 %2860, i32* %22, align 4
  br label %2861

; <label>:2861:                                   ; preds = %2858, %2855
  br label %2671

; <label>:2862:                                   ; preds = %2766
  %2863 = load i32, i32* %22, align 4
  %2864 = trunc i32 %2863 to i8
  %2865 = load %struct.DState*, %struct.DState** %2, align 8
  %2866 = getelementptr inbounds %struct.DState, %struct.DState* %2865, i32 0, i32 35
  %2867 = load i32, i32* %10, align 4
  %2868 = sext i32 %2867 to i64
  %2869 = getelementptr inbounds [6 x [258 x i8]], [6 x [258 x i8]]* %2866, i64 0, i64 %2868
  %2870 = load i32, i32* %8, align 4
  %2871 = sext i32 %2870 to i64
  %2872 = getelementptr inbounds [258 x i8], [258 x i8]* %2869, i64 0, i64 %2871
  store i8 %2864, i8* %2872, align 1
  br label %2873

; <label>:2873:                                   ; preds = %2862
  %2874 = load i32, i32* %8, align 4
  %2875 = add nsw i32 %2874, 1
  store i32 %2875, i32* %8, align 4
  br label %2666

; <label>:2876:                                   ; preds = %2666
  br label %2877

; <label>:2877:                                   ; preds = %2876
  %2878 = load i32, i32* %10, align 4
  %2879 = add nsw i32 %2878, 1
  store i32 %2879, i32* %10, align 4
  br label %2578

; <label>:2880:                                   ; preds = %2578
  store i32 0, i32* %10, align 4
  br label %2881

; <label>:2881:                                   ; preds = %2976, %2880
  %2882 = load i32, i32* %10, align 4
  %2883 = load i32, i32* %12, align 4
  %2884 = icmp slt i32 %2882, %2883
  br i1 %2884, label %2885, label %2979

; <label>:2885:                                   ; preds = %2881
  store i32 32, i32* %5, align 4
  store i32 0, i32* %6, align 4
  store i32 0, i32* %8, align 4
  br label %2886

; <label>:2886:                                   ; preds = %2939, %2885
  %2887 = load i32, i32* %8, align 4
  %2888 = load i32, i32* %11, align 4
  %2889 = icmp slt i32 %2887, %2888
  br i1 %2889, label %2890, label %2942

; <label>:2890:                                   ; preds = %2886
  %2891 = load %struct.DState*, %struct.DState** %2, align 8
  %2892 = getelementptr inbounds %struct.DState, %struct.DState* %2891, i32 0, i32 35
  %2893 = load i32, i32* %10, align 4
  %2894 = sext i32 %2893 to i64
  %2895 = getelementptr inbounds [6 x [258 x i8]], [6 x [258 x i8]]* %2892, i64 0, i64 %2894
  %2896 = load i32, i32* %8, align 4
  %2897 = sext i32 %2896 to i64
  %2898 = getelementptr inbounds [258 x i8], [258 x i8]* %2895, i64 0, i64 %2897
  %2899 = load i8, i8* %2898, align 1
  %2900 = zext i8 %2899 to i32
  %2901 = load i32, i32* %6, align 4
  %2902 = icmp sgt i32 %2900, %2901
  br i1 %2902, label %2903, label %2914

; <label>:2903:                                   ; preds = %2890
  %2904 = load %struct.DState*, %struct.DState** %2, align 8
  %2905 = getelementptr inbounds %struct.DState, %struct.DState* %2904, i32 0, i32 35
  %2906 = load i32, i32* %10, align 4
  %2907 = sext i32 %2906 to i64
  %2908 = getelementptr inbounds [6 x [258 x i8]], [6 x [258 x i8]]* %2905, i64 0, i64 %2907
  %2909 = load i32, i32* %8, align 4
  %2910 = sext i32 %2909 to i64
  %2911 = getelementptr inbounds [258 x i8], [258 x i8]* %2908, i64 0, i64 %2910
  %2912 = load i8, i8* %2911, align 1
  %2913 = zext i8 %2912 to i32
  store i32 %2913, i32* %6, align 4
  br label %2914

; <label>:2914:                                   ; preds = %2903, %2890
  %2915 = load %struct.DState*, %struct.DState** %2, align 8
  %2916 = getelementptr inbounds %struct.DState, %struct.DState* %2915, i32 0, i32 35
  %2917 = load i32, i32* %10, align 4
  %2918 = sext i32 %2917 to i64
  %2919 = getelementptr inbounds [6 x [258 x i8]], [6 x [258 x i8]]* %2916, i64 0, i64 %2918
  %2920 = load i32, i32* %8, align 4
  %2921 = sext i32 %2920 to i64
  %2922 = getelementptr inbounds [258 x i8], [258 x i8]* %2919, i64 0, i64 %2921
  %2923 = load i8, i8* %2922, align 1
  %2924 = zext i8 %2923 to i32
  %2925 = load i32, i32* %5, align 4
  %2926 = icmp slt i32 %2924, %2925
  br i1 %2926, label %2927, label %2938

; <label>:2927:                                   ; preds = %2914
  %2928 = load %struct.DState*, %struct.DState** %2, align 8
  %2929 = getelementptr inbounds %struct.DState, %struct.DState* %2928, i32 0, i32 35
  %2930 = load i32, i32* %10, align 4
  %2931 = sext i32 %2930 to i64
  %2932 = getelementptr inbounds [6 x [258 x i8]], [6 x [258 x i8]]* %2929, i64 0, i64 %2931
  %2933 = load i32, i32* %8, align 4
  %2934 = sext i32 %2933 to i64
  %2935 = getelementptr inbounds [258 x i8], [258 x i8]* %2932, i64 0, i64 %2934
  %2936 = load i8, i8* %2935, align 1
  %2937 = zext i8 %2936 to i32
  store i32 %2937, i32* %5, align 4
  br label %2938

; <label>:2938:                                   ; preds = %2927, %2914
  br label %2939

; <label>:2939:                                   ; preds = %2938
  %2940 = load i32, i32* %8, align 4
  %2941 = add nsw i32 %2940, 1
  store i32 %2941, i32* %8, align 4
  br label %2886

; <label>:2942:                                   ; preds = %2886
  %2943 = load %struct.DState*, %struct.DState** %2, align 8
  %2944 = getelementptr inbounds %struct.DState, %struct.DState* %2943, i32 0, i32 36
  %2945 = load i32, i32* %10, align 4
  %2946 = sext i32 %2945 to i64
  %2947 = getelementptr inbounds [6 x [258 x i32]], [6 x [258 x i32]]* %2944, i64 0, i64 %2946
  %2948 = getelementptr inbounds [258 x i32], [258 x i32]* %2947, i64 0, i64 0
  %2949 = load %struct.DState*, %struct.DState** %2, align 8
  %2950 = getelementptr inbounds %struct.DState, %struct.DState* %2949, i32 0, i32 37
  %2951 = load i32, i32* %10, align 4
  %2952 = sext i32 %2951 to i64
  %2953 = getelementptr inbounds [6 x [258 x i32]], [6 x [258 x i32]]* %2950, i64 0, i64 %2952
  %2954 = getelementptr inbounds [258 x i32], [258 x i32]* %2953, i64 0, i64 0
  %2955 = load %struct.DState*, %struct.DState** %2, align 8
  %2956 = getelementptr inbounds %struct.DState, %struct.DState* %2955, i32 0, i32 38
  %2957 = load i32, i32* %10, align 4
  %2958 = sext i32 %2957 to i64
  %2959 = getelementptr inbounds [6 x [258 x i32]], [6 x [258 x i32]]* %2956, i64 0, i64 %2958
  %2960 = getelementptr inbounds [258 x i32], [258 x i32]* %2959, i64 0, i64 0
  %2961 = load %struct.DState*, %struct.DState** %2, align 8
  %2962 = getelementptr inbounds %struct.DState, %struct.DState* %2961, i32 0, i32 35
  %2963 = load i32, i32* %10, align 4
  %2964 = sext i32 %2963 to i64
  %2965 = getelementptr inbounds [6 x [258 x i8]], [6 x [258 x i8]]* %2962, i64 0, i64 %2964
  %2966 = getelementptr inbounds [258 x i8], [258 x i8]* %2965, i64 0, i64 0
  %2967 = load i32, i32* %5, align 4
  %2968 = load i32, i32* %6, align 4
  %2969 = load i32, i32* %11, align 4
  call void @BZ2_hbCreateDecodeTables(i32* %2948, i32* %2954, i32* %2960, i8* %2966, i32 %2967, i32 %2968, i32 %2969)
  %2970 = load i32, i32* %5, align 4
  %2971 = load %struct.DState*, %struct.DState** %2, align 8
  %2972 = getelementptr inbounds %struct.DState, %struct.DState* %2971, i32 0, i32 39
  %2973 = load i32, i32* %10, align 4
  %2974 = sext i32 %2973 to i64
  %2975 = getelementptr inbounds [6 x i32], [6 x i32]* %2972, i64 0, i64 %2974
  store i32 %2970, i32* %2975, align 4
  br label %2976

; <label>:2976:                                   ; preds = %2942
  %2977 = load i32, i32* %10, align 4
  %2978 = add nsw i32 %2977, 1
  store i32 %2978, i32* %10, align 4
  br label %2881

; <label>:2979:                                   ; preds = %2881
  %2980 = load %struct.DState*, %struct.DState** %2, align 8
  %2981 = getelementptr inbounds %struct.DState, %struct.DState* %2980, i32 0, i32 27
  %2982 = load i32, i32* %2981, align 8
  %2983 = add nsw i32 %2982, 1
  store i32 %2983, i32* %14, align 4
  %2984 = load %struct.DState*, %struct.DState** %2, align 8
  %2985 = getelementptr inbounds %struct.DState, %struct.DState* %2984, i32 0, i32 9
  %2986 = load i32, i32* %2985, align 8
  %2987 = mul nsw i32 100000, %2986
  store i32 %2987, i32* %18, align 4
  store i32 -1, i32* %15, align 4
  store i32 0, i32* %16, align 4
  store i32 0, i32* %8, align 4
  br label %2988

; <label>:2988:                                   ; preds = %2997, %2979
  %2989 = load i32, i32* %8, align 4
  %2990 = icmp sle i32 %2989, 255
  br i1 %2990, label %2991, label %3000

; <label>:2991:                                   ; preds = %2988
  %2992 = load %struct.DState*, %struct.DState** %2, align 8
  %2993 = getelementptr inbounds %struct.DState, %struct.DState* %2992, i32 0, i32 16
  %2994 = load i32, i32* %8, align 4
  %2995 = sext i32 %2994 to i64
  %2996 = getelementptr inbounds [256 x i32], [256 x i32]* %2993, i64 0, i64 %2995
  store i32 0, i32* %2996, align 4
  br label %2997

; <label>:2997:                                   ; preds = %2991
  %2998 = load i32, i32* %8, align 4
  %2999 = add nsw i32 %2998, 1
  store i32 %2999, i32* %8, align 4
  br label %2988

; <label>:3000:                                   ; preds = %2988
  store i32 4095, i32* %63, align 4
  store i32 15, i32* %61, align 4
  br label %3001

; <label>:3001:                                   ; preds = %3032, %3000
  %3002 = load i32, i32* %61, align 4
  %3003 = icmp sge i32 %3002, 0
  br i1 %3003, label %3004, label %3035

; <label>:3004:                                   ; preds = %3001
  store i32 15, i32* %62, align 4
  br label %3005

; <label>:3005:                                   ; preds = %3021, %3004
  %3006 = load i32, i32* %62, align 4
  %3007 = icmp sge i32 %3006, 0
  br i1 %3007, label %3008, label %3024

; <label>:3008:                                   ; preds = %3005
  %3009 = load i32, i32* %61, align 4
  %3010 = mul nsw i32 %3009, 16
  %3011 = load i32, i32* %62, align 4
  %3012 = add nsw i32 %3010, %3011
  %3013 = trunc i32 %3012 to i8
  %3014 = load %struct.DState*, %struct.DState** %2, align 8
  %3015 = getelementptr inbounds %struct.DState, %struct.DState* %3014, i32 0, i32 31
  %3016 = load i32, i32* %63, align 4
  %3017 = sext i32 %3016 to i64
  %3018 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3015, i64 0, i64 %3017
  store i8 %3013, i8* %3018, align 1
  %3019 = load i32, i32* %63, align 4
  %3020 = add nsw i32 %3019, -1
  store i32 %3020, i32* %63, align 4
  br label %3021

; <label>:3021:                                   ; preds = %3008
  %3022 = load i32, i32* %62, align 4
  %3023 = add nsw i32 %3022, -1
  store i32 %3023, i32* %62, align 4
  br label %3005

; <label>:3024:                                   ; preds = %3005
  %3025 = load i32, i32* %63, align 4
  %3026 = add nsw i32 %3025, 1
  %3027 = load %struct.DState*, %struct.DState** %2, align 8
  %3028 = getelementptr inbounds %struct.DState, %struct.DState* %3027, i32 0, i32 32
  %3029 = load i32, i32* %61, align 4
  %3030 = sext i32 %3029 to i64
  %3031 = getelementptr inbounds [16 x i32], [16 x i32]* %3028, i64 0, i64 %3030
  store i32 %3026, i32* %3031, align 4
  br label %3032

; <label>:3032:                                   ; preds = %3024
  %3033 = load i32, i32* %61, align 4
  %3034 = add nsw i32 %3033, -1
  store i32 %3034, i32* %61, align 4
  br label %3001

; <label>:3035:                                   ; preds = %3001
  store i32 0, i32* %19, align 4
  %3036 = load i32, i32* %16, align 4
  %3037 = icmp eq i32 %3036, 0
  br i1 %3037, label %3038, label %3077

; <label>:3038:                                   ; preds = %3035
  %3039 = load i32, i32* %15, align 4
  %3040 = add nsw i32 %3039, 1
  store i32 %3040, i32* %15, align 4
  %3041 = load i32, i32* %15, align 4
  %3042 = load i32, i32* %13, align 4
  %3043 = icmp sge i32 %3041, %3042
  br i1 %3043, label %3044, label %3045

; <label>:3044:                                   ; preds = %3038
  store i32 -4, i32* %4, align 4
  br label %5741

; <label>:3045:                                   ; preds = %3038
  store i32 50, i32* %16, align 4
  %3046 = load %struct.DState*, %struct.DState** %2, align 8
  %3047 = getelementptr inbounds %struct.DState, %struct.DState* %3046, i32 0, i32 33
  %3048 = load i32, i32* %15, align 4
  %3049 = sext i32 %3048 to i64
  %3050 = getelementptr inbounds [18002 x i8], [18002 x i8]* %3047, i64 0, i64 %3049
  %3051 = load i8, i8* %3050, align 1
  %3052 = zext i8 %3051 to i32
  store i32 %3052, i32* %27, align 4
  %3053 = load %struct.DState*, %struct.DState** %2, align 8
  %3054 = getelementptr inbounds %struct.DState, %struct.DState* %3053, i32 0, i32 39
  %3055 = load i32, i32* %27, align 4
  %3056 = sext i32 %3055 to i64
  %3057 = getelementptr inbounds [6 x i32], [6 x i32]* %3054, i64 0, i64 %3056
  %3058 = load i32, i32* %3057, align 4
  store i32 %3058, i32* %28, align 4
  %3059 = load %struct.DState*, %struct.DState** %2, align 8
  %3060 = getelementptr inbounds %struct.DState, %struct.DState* %3059, i32 0, i32 36
  %3061 = load i32, i32* %27, align 4
  %3062 = sext i32 %3061 to i64
  %3063 = getelementptr inbounds [6 x [258 x i32]], [6 x [258 x i32]]* %3060, i64 0, i64 %3062
  %3064 = getelementptr inbounds [258 x i32], [258 x i32]* %3063, i64 0, i64 0
  store i32* %3064, i32** %29, align 8
  %3065 = load %struct.DState*, %struct.DState** %2, align 8
  %3066 = getelementptr inbounds %struct.DState, %struct.DState* %3065, i32 0, i32 38
  %3067 = load i32, i32* %27, align 4
  %3068 = sext i32 %3067 to i64
  %3069 = getelementptr inbounds [6 x [258 x i32]], [6 x [258 x i32]]* %3066, i64 0, i64 %3068
  %3070 = getelementptr inbounds [258 x i32], [258 x i32]* %3069, i64 0, i64 0
  store i32* %3070, i32** %31, align 8
  %3071 = load %struct.DState*, %struct.DState** %2, align 8
  %3072 = getelementptr inbounds %struct.DState, %struct.DState* %3071, i32 0, i32 37
  %3073 = load i32, i32* %27, align 4
  %3074 = sext i32 %3073 to i64
  %3075 = getelementptr inbounds [6 x [258 x i32]], [6 x [258 x i32]]* %3072, i64 0, i64 %3074
  %3076 = getelementptr inbounds [258 x i32], [258 x i32]* %3075, i64 0, i64 0
  store i32* %3076, i32** %30, align 8
  br label %3077

; <label>:3077:                                   ; preds = %3045, %3035
  %3078 = load i32, i32* %16, align 4
  %3079 = add nsw i32 %3078, -1
  store i32 %3079, i32* %16, align 4
  %3080 = load i32, i32* %28, align 4
  store i32 %3080, i32* %24, align 4
  br label %3081

; <label>:3081:                                   ; preds = %3077, %144
  %3082 = load %struct.DState*, %struct.DState** %2, align 8
  %3083 = getelementptr inbounds %struct.DState, %struct.DState* %3082, i32 0, i32 1
  store i32 36, i32* %3083, align 8
  br label %3084

; <label>:3084:                                   ; preds = %3168, %3081
  %3085 = load %struct.DState*, %struct.DState** %2, align 8
  %3086 = getelementptr inbounds %struct.DState, %struct.DState* %3085, i32 0, i32 8
  %3087 = load i32, i32* %3086, align 4
  %3088 = load i32, i32* %24, align 4
  %3089 = icmp sge i32 %3087, %3088
  br i1 %3089, label %3090, label %3110

; <label>:3090:                                   ; preds = %3084
  %3091 = load %struct.DState*, %struct.DState** %2, align 8
  %3092 = getelementptr inbounds %struct.DState, %struct.DState* %3091, i32 0, i32 7
  %3093 = load i32, i32* %3092, align 8
  %3094 = load %struct.DState*, %struct.DState** %2, align 8
  %3095 = getelementptr inbounds %struct.DState, %struct.DState* %3094, i32 0, i32 8
  %3096 = load i32, i32* %3095, align 4
  %3097 = load i32, i32* %24, align 4
  %3098 = sub nsw i32 %3096, %3097
  %3099 = lshr i32 %3093, %3098
  %3100 = load i32, i32* %24, align 4
  %3101 = shl i32 1, %3100
  %3102 = sub nsw i32 %3101, 1
  %3103 = and i32 %3099, %3102
  store i32 %3103, i32* %64, align 4
  %3104 = load i32, i32* %24, align 4
  %3105 = load %struct.DState*, %struct.DState** %2, align 8
  %3106 = getelementptr inbounds %struct.DState, %struct.DState* %3105, i32 0, i32 8
  %3107 = load i32, i32* %3106, align 4
  %3108 = sub nsw i32 %3107, %3104
  store i32 %3108, i32* %3106, align 4
  %3109 = load i32, i32* %64, align 4
  store i32 %3109, i32* %25, align 4
  br label %3169

; <label>:3110:                                   ; preds = %3084
  %3111 = load %struct.DState*, %struct.DState** %2, align 8
  %3112 = getelementptr inbounds %struct.DState, %struct.DState* %3111, i32 0, i32 0
  %3113 = load %struct.bz_stream*, %struct.bz_stream** %3112, align 8
  %3114 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3113, i32 0, i32 1
  %3115 = load i32, i32* %3114, align 8
  %3116 = icmp eq i32 %3115, 0
  br i1 %3116, label %3117, label %3118

; <label>:3117:                                   ; preds = %3110
  store i32 0, i32* %4, align 4
  br label %5741

; <label>:3118:                                   ; preds = %3110
  %3119 = load %struct.DState*, %struct.DState** %2, align 8
  %3120 = getelementptr inbounds %struct.DState, %struct.DState* %3119, i32 0, i32 7
  %3121 = load i32, i32* %3120, align 8
  %3122 = shl i32 %3121, 8
  %3123 = load %struct.DState*, %struct.DState** %2, align 8
  %3124 = getelementptr inbounds %struct.DState, %struct.DState* %3123, i32 0, i32 0
  %3125 = load %struct.bz_stream*, %struct.bz_stream** %3124, align 8
  %3126 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3125, i32 0, i32 0
  %3127 = load i8*, i8** %3126, align 8
  %3128 = load i8, i8* %3127, align 1
  %3129 = zext i8 %3128 to i32
  %3130 = or i32 %3122, %3129
  %3131 = load %struct.DState*, %struct.DState** %2, align 8
  %3132 = getelementptr inbounds %struct.DState, %struct.DState* %3131, i32 0, i32 7
  store i32 %3130, i32* %3132, align 8
  %3133 = load %struct.DState*, %struct.DState** %2, align 8
  %3134 = getelementptr inbounds %struct.DState, %struct.DState* %3133, i32 0, i32 8
  %3135 = load i32, i32* %3134, align 4
  %3136 = add nsw i32 %3135, 8
  store i32 %3136, i32* %3134, align 4
  %3137 = load %struct.DState*, %struct.DState** %2, align 8
  %3138 = getelementptr inbounds %struct.DState, %struct.DState* %3137, i32 0, i32 0
  %3139 = load %struct.bz_stream*, %struct.bz_stream** %3138, align 8
  %3140 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3139, i32 0, i32 0
  %3141 = load i8*, i8** %3140, align 8
  %3142 = getelementptr inbounds i8, i8* %3141, i32 1
  store i8* %3142, i8** %3140, align 8
  %3143 = load %struct.DState*, %struct.DState** %2, align 8
  %3144 = getelementptr inbounds %struct.DState, %struct.DState* %3143, i32 0, i32 0
  %3145 = load %struct.bz_stream*, %struct.bz_stream** %3144, align 8
  %3146 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3145, i32 0, i32 1
  %3147 = load i32, i32* %3146, align 8
  %3148 = add i32 %3147, -1
  store i32 %3148, i32* %3146, align 8
  %3149 = load %struct.DState*, %struct.DState** %2, align 8
  %3150 = getelementptr inbounds %struct.DState, %struct.DState* %3149, i32 0, i32 0
  %3151 = load %struct.bz_stream*, %struct.bz_stream** %3150, align 8
  %3152 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3151, i32 0, i32 2
  %3153 = load i32, i32* %3152, align 4
  %3154 = add i32 %3153, 1
  store i32 %3154, i32* %3152, align 4
  %3155 = load %struct.DState*, %struct.DState** %2, align 8
  %3156 = getelementptr inbounds %struct.DState, %struct.DState* %3155, i32 0, i32 0
  %3157 = load %struct.bz_stream*, %struct.bz_stream** %3156, align 8
  %3158 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3157, i32 0, i32 2
  %3159 = load i32, i32* %3158, align 4
  %3160 = icmp eq i32 %3159, 0
  br i1 %3160, label %3161, label %3168

; <label>:3161:                                   ; preds = %3118
  %3162 = load %struct.DState*, %struct.DState** %2, align 8
  %3163 = getelementptr inbounds %struct.DState, %struct.DState* %3162, i32 0, i32 0
  %3164 = load %struct.bz_stream*, %struct.bz_stream** %3163, align 8
  %3165 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3164, i32 0, i32 3
  %3166 = load i32, i32* %3165, align 8
  %3167 = add i32 %3166, 1
  store i32 %3167, i32* %3165, align 8
  br label %3168

; <label>:3168:                                   ; preds = %3161, %3118
  br label %3084

; <label>:3169:                                   ; preds = %3090
  br label %3170

; <label>:3170:                                   ; preds = %3268, %3169
  %3171 = load i32, i32* %24, align 4
  %3172 = icmp sgt i32 %3171, 20
  br i1 %3172, label %3173, label %3174

; <label>:3173:                                   ; preds = %3170
  store i32 -4, i32* %4, align 4
  br label %5741

; <label>:3174:                                   ; preds = %3170
  %3175 = load i32, i32* %25, align 4
  %3176 = load i32*, i32** %29, align 8
  %3177 = load i32, i32* %24, align 4
  %3178 = sext i32 %3177 to i64
  %3179 = getelementptr inbounds i32, i32* %3176, i64 %3178
  %3180 = load i32, i32* %3179, align 4
  %3181 = icmp sle i32 %3175, %3180
  br i1 %3181, label %3182, label %3183

; <label>:3182:                                   ; preds = %3174
  br label %3273

; <label>:3183:                                   ; preds = %3174
  %3184 = load i32, i32* %24, align 4
  %3185 = add nsw i32 %3184, 1
  store i32 %3185, i32* %24, align 4
  br label %3186

; <label>:3186:                                   ; preds = %3183, %144
  %3187 = load %struct.DState*, %struct.DState** %2, align 8
  %3188 = getelementptr inbounds %struct.DState, %struct.DState* %3187, i32 0, i32 1
  store i32 37, i32* %3188, align 8
  br label %3189

; <label>:3189:                                   ; preds = %3267, %3186
  %3190 = load %struct.DState*, %struct.DState** %2, align 8
  %3191 = getelementptr inbounds %struct.DState, %struct.DState* %3190, i32 0, i32 8
  %3192 = load i32, i32* %3191, align 4
  %3193 = icmp sge i32 %3192, 1
  br i1 %3193, label %3194, label %3209

; <label>:3194:                                   ; preds = %3189
  %3195 = load %struct.DState*, %struct.DState** %2, align 8
  %3196 = getelementptr inbounds %struct.DState, %struct.DState* %3195, i32 0, i32 7
  %3197 = load i32, i32* %3196, align 8
  %3198 = load %struct.DState*, %struct.DState** %2, align 8
  %3199 = getelementptr inbounds %struct.DState, %struct.DState* %3198, i32 0, i32 8
  %3200 = load i32, i32* %3199, align 4
  %3201 = sub nsw i32 %3200, 1
  %3202 = lshr i32 %3197, %3201
  %3203 = and i32 %3202, 1
  store i32 %3203, i32* %65, align 4
  %3204 = load %struct.DState*, %struct.DState** %2, align 8
  %3205 = getelementptr inbounds %struct.DState, %struct.DState* %3204, i32 0, i32 8
  %3206 = load i32, i32* %3205, align 4
  %3207 = sub nsw i32 %3206, 1
  store i32 %3207, i32* %3205, align 4
  %3208 = load i32, i32* %65, align 4
  store i32 %3208, i32* %26, align 4
  br label %3268

; <label>:3209:                                   ; preds = %3189
  %3210 = load %struct.DState*, %struct.DState** %2, align 8
  %3211 = getelementptr inbounds %struct.DState, %struct.DState* %3210, i32 0, i32 0
  %3212 = load %struct.bz_stream*, %struct.bz_stream** %3211, align 8
  %3213 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3212, i32 0, i32 1
  %3214 = load i32, i32* %3213, align 8
  %3215 = icmp eq i32 %3214, 0
  br i1 %3215, label %3216, label %3217

; <label>:3216:                                   ; preds = %3209
  store i32 0, i32* %4, align 4
  br label %5741

; <label>:3217:                                   ; preds = %3209
  %3218 = load %struct.DState*, %struct.DState** %2, align 8
  %3219 = getelementptr inbounds %struct.DState, %struct.DState* %3218, i32 0, i32 7
  %3220 = load i32, i32* %3219, align 8
  %3221 = shl i32 %3220, 8
  %3222 = load %struct.DState*, %struct.DState** %2, align 8
  %3223 = getelementptr inbounds %struct.DState, %struct.DState* %3222, i32 0, i32 0
  %3224 = load %struct.bz_stream*, %struct.bz_stream** %3223, align 8
  %3225 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3224, i32 0, i32 0
  %3226 = load i8*, i8** %3225, align 8
  %3227 = load i8, i8* %3226, align 1
  %3228 = zext i8 %3227 to i32
  %3229 = or i32 %3221, %3228
  %3230 = load %struct.DState*, %struct.DState** %2, align 8
  %3231 = getelementptr inbounds %struct.DState, %struct.DState* %3230, i32 0, i32 7
  store i32 %3229, i32* %3231, align 8
  %3232 = load %struct.DState*, %struct.DState** %2, align 8
  %3233 = getelementptr inbounds %struct.DState, %struct.DState* %3232, i32 0, i32 8
  %3234 = load i32, i32* %3233, align 4
  %3235 = add nsw i32 %3234, 8
  store i32 %3235, i32* %3233, align 4
  %3236 = load %struct.DState*, %struct.DState** %2, align 8
  %3237 = getelementptr inbounds %struct.DState, %struct.DState* %3236, i32 0, i32 0
  %3238 = load %struct.bz_stream*, %struct.bz_stream** %3237, align 8
  %3239 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3238, i32 0, i32 0
  %3240 = load i8*, i8** %3239, align 8
  %3241 = getelementptr inbounds i8, i8* %3240, i32 1
  store i8* %3241, i8** %3239, align 8
  %3242 = load %struct.DState*, %struct.DState** %2, align 8
  %3243 = getelementptr inbounds %struct.DState, %struct.DState* %3242, i32 0, i32 0
  %3244 = load %struct.bz_stream*, %struct.bz_stream** %3243, align 8
  %3245 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3244, i32 0, i32 1
  %3246 = load i32, i32* %3245, align 8
  %3247 = add i32 %3246, -1
  store i32 %3247, i32* %3245, align 8
  %3248 = load %struct.DState*, %struct.DState** %2, align 8
  %3249 = getelementptr inbounds %struct.DState, %struct.DState* %3248, i32 0, i32 0
  %3250 = load %struct.bz_stream*, %struct.bz_stream** %3249, align 8
  %3251 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3250, i32 0, i32 2
  %3252 = load i32, i32* %3251, align 4
  %3253 = add i32 %3252, 1
  store i32 %3253, i32* %3251, align 4
  %3254 = load %struct.DState*, %struct.DState** %2, align 8
  %3255 = getelementptr inbounds %struct.DState, %struct.DState* %3254, i32 0, i32 0
  %3256 = load %struct.bz_stream*, %struct.bz_stream** %3255, align 8
  %3257 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3256, i32 0, i32 2
  %3258 = load i32, i32* %3257, align 4
  %3259 = icmp eq i32 %3258, 0
  br i1 %3259, label %3260, label %3267

; <label>:3260:                                   ; preds = %3217
  %3261 = load %struct.DState*, %struct.DState** %2, align 8
  %3262 = getelementptr inbounds %struct.DState, %struct.DState* %3261, i32 0, i32 0
  %3263 = load %struct.bz_stream*, %struct.bz_stream** %3262, align 8
  %3264 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3263, i32 0, i32 3
  %3265 = load i32, i32* %3264, align 8
  %3266 = add i32 %3265, 1
  store i32 %3266, i32* %3264, align 8
  br label %3267

; <label>:3267:                                   ; preds = %3260, %3217
  br label %3189

; <label>:3268:                                   ; preds = %3194
  %3269 = load i32, i32* %25, align 4
  %3270 = shl i32 %3269, 1
  %3271 = load i32, i32* %26, align 4
  %3272 = or i32 %3270, %3271
  store i32 %3272, i32* %25, align 4
  br label %3170

; <label>:3273:                                   ; preds = %3182
  %3274 = load i32, i32* %25, align 4
  %3275 = load i32*, i32** %30, align 8
  %3276 = load i32, i32* %24, align 4
  %3277 = sext i32 %3276 to i64
  %3278 = getelementptr inbounds i32, i32* %3275, i64 %3277
  %3279 = load i32, i32* %3278, align 4
  %3280 = sub nsw i32 %3274, %3279
  %3281 = icmp slt i32 %3280, 0
  br i1 %3281, label %3291, label %3282

; <label>:3282:                                   ; preds = %3273
  %3283 = load i32, i32* %25, align 4
  %3284 = load i32*, i32** %30, align 8
  %3285 = load i32, i32* %24, align 4
  %3286 = sext i32 %3285 to i64
  %3287 = getelementptr inbounds i32, i32* %3284, i64 %3286
  %3288 = load i32, i32* %3287, align 4
  %3289 = sub nsw i32 %3283, %3288
  %3290 = icmp sge i32 %3289, 258
  br i1 %3290, label %3291, label %3292

; <label>:3291:                                   ; preds = %3282, %3273
  store i32 -4, i32* %4, align 4
  br label %5741

; <label>:3292:                                   ; preds = %3282
  %3293 = load i32*, i32** %31, align 8
  %3294 = load i32, i32* %25, align 4
  %3295 = load i32*, i32** %30, align 8
  %3296 = load i32, i32* %24, align 4
  %3297 = sext i32 %3296 to i64
  %3298 = getelementptr inbounds i32, i32* %3295, i64 %3297
  %3299 = load i32, i32* %3298, align 4
  %3300 = sub nsw i32 %3294, %3299
  %3301 = sext i32 %3300 to i64
  %3302 = getelementptr inbounds i32, i32* %3293, i64 %3301
  %3303 = load i32, i32* %3302, align 4
  store i32 %3303, i32* %17, align 4
  br label %3304

; <label>:3304:                                   ; preds = %4258, %3687, %3292
  %3305 = load i32, i32* %17, align 4
  %3306 = load i32, i32* %14, align 4
  %3307 = icmp eq i32 %3305, %3306
  br i1 %3307, label %3308, label %3309

; <label>:3308:                                   ; preds = %3304
  br label %4270

; <label>:3309:                                   ; preds = %3304
  %3310 = load i32, i32* %17, align 4
  %3311 = icmp eq i32 %3310, 0
  br i1 %3311, label %3315, label %3312

; <label>:3312:                                   ; preds = %3309
  %3313 = load i32, i32* %17, align 4
  %3314 = icmp eq i32 %3313, 1
  br i1 %3314, label %3315, label %3688

; <label>:3315:                                   ; preds = %3312, %3309
  store i32 -1, i32* %20, align 4
  store i32 1, i32* %21, align 4
  br label %3316

; <label>:3316:                                   ; preds = %3610, %3315
  %3317 = load i32, i32* %17, align 4
  %3318 = icmp eq i32 %3317, 0
  br i1 %3318, label %3319, label %3324

; <label>:3319:                                   ; preds = %3316
  %3320 = load i32, i32* %20, align 4
  %3321 = load i32, i32* %21, align 4
  %3322 = mul nsw i32 1, %3321
  %3323 = add nsw i32 %3320, %3322
  store i32 %3323, i32* %20, align 4
  br label %3333

; <label>:3324:                                   ; preds = %3316
  %3325 = load i32, i32* %17, align 4
  %3326 = icmp eq i32 %3325, 1
  br i1 %3326, label %3327, label %3332

; <label>:3327:                                   ; preds = %3324
  %3328 = load i32, i32* %20, align 4
  %3329 = load i32, i32* %21, align 4
  %3330 = mul nsw i32 2, %3329
  %3331 = add nsw i32 %3328, %3330
  store i32 %3331, i32* %20, align 4
  br label %3332

; <label>:3332:                                   ; preds = %3327, %3324
  br label %3333

; <label>:3333:                                   ; preds = %3332, %3319
  %3334 = load i32, i32* %21, align 4
  %3335 = mul nsw i32 %3334, 2
  store i32 %3335, i32* %21, align 4
  %3336 = load i32, i32* %16, align 4
  %3337 = icmp eq i32 %3336, 0
  br i1 %3337, label %3338, label %3377

; <label>:3338:                                   ; preds = %3333
  %3339 = load i32, i32* %15, align 4
  %3340 = add nsw i32 %3339, 1
  store i32 %3340, i32* %15, align 4
  %3341 = load i32, i32* %15, align 4
  %3342 = load i32, i32* %13, align 4
  %3343 = icmp sge i32 %3341, %3342
  br i1 %3343, label %3344, label %3345

; <label>:3344:                                   ; preds = %3338
  store i32 -4, i32* %4, align 4
  br label %5741

; <label>:3345:                                   ; preds = %3338
  store i32 50, i32* %16, align 4
  %3346 = load %struct.DState*, %struct.DState** %2, align 8
  %3347 = getelementptr inbounds %struct.DState, %struct.DState* %3346, i32 0, i32 33
  %3348 = load i32, i32* %15, align 4
  %3349 = sext i32 %3348 to i64
  %3350 = getelementptr inbounds [18002 x i8], [18002 x i8]* %3347, i64 0, i64 %3349
  %3351 = load i8, i8* %3350, align 1
  %3352 = zext i8 %3351 to i32
  store i32 %3352, i32* %27, align 4
  %3353 = load %struct.DState*, %struct.DState** %2, align 8
  %3354 = getelementptr inbounds %struct.DState, %struct.DState* %3353, i32 0, i32 39
  %3355 = load i32, i32* %27, align 4
  %3356 = sext i32 %3355 to i64
  %3357 = getelementptr inbounds [6 x i32], [6 x i32]* %3354, i64 0, i64 %3356
  %3358 = load i32, i32* %3357, align 4
  store i32 %3358, i32* %28, align 4
  %3359 = load %struct.DState*, %struct.DState** %2, align 8
  %3360 = getelementptr inbounds %struct.DState, %struct.DState* %3359, i32 0, i32 36
  %3361 = load i32, i32* %27, align 4
  %3362 = sext i32 %3361 to i64
  %3363 = getelementptr inbounds [6 x [258 x i32]], [6 x [258 x i32]]* %3360, i64 0, i64 %3362
  %3364 = getelementptr inbounds [258 x i32], [258 x i32]* %3363, i64 0, i64 0
  store i32* %3364, i32** %29, align 8
  %3365 = load %struct.DState*, %struct.DState** %2, align 8
  %3366 = getelementptr inbounds %struct.DState, %struct.DState* %3365, i32 0, i32 38
  %3367 = load i32, i32* %27, align 4
  %3368 = sext i32 %3367 to i64
  %3369 = getelementptr inbounds [6 x [258 x i32]], [6 x [258 x i32]]* %3366, i64 0, i64 %3368
  %3370 = getelementptr inbounds [258 x i32], [258 x i32]* %3369, i64 0, i64 0
  store i32* %3370, i32** %31, align 8
  %3371 = load %struct.DState*, %struct.DState** %2, align 8
  %3372 = getelementptr inbounds %struct.DState, %struct.DState* %3371, i32 0, i32 37
  %3373 = load i32, i32* %27, align 4
  %3374 = sext i32 %3373 to i64
  %3375 = getelementptr inbounds [6 x [258 x i32]], [6 x [258 x i32]]* %3372, i64 0, i64 %3374
  %3376 = getelementptr inbounds [258 x i32], [258 x i32]* %3375, i64 0, i64 0
  store i32* %3376, i32** %30, align 8
  br label %3377

; <label>:3377:                                   ; preds = %3345, %3333
  %3378 = load i32, i32* %16, align 4
  %3379 = add nsw i32 %3378, -1
  store i32 %3379, i32* %16, align 4
  %3380 = load i32, i32* %28, align 4
  store i32 %3380, i32* %24, align 4
  br label %3381

; <label>:3381:                                   ; preds = %3377, %144
  %3382 = load %struct.DState*, %struct.DState** %2, align 8
  %3383 = getelementptr inbounds %struct.DState, %struct.DState* %3382, i32 0, i32 1
  store i32 38, i32* %3383, align 8
  br label %3384

; <label>:3384:                                   ; preds = %3468, %3381
  %3385 = load %struct.DState*, %struct.DState** %2, align 8
  %3386 = getelementptr inbounds %struct.DState, %struct.DState* %3385, i32 0, i32 8
  %3387 = load i32, i32* %3386, align 4
  %3388 = load i32, i32* %24, align 4
  %3389 = icmp sge i32 %3387, %3388
  br i1 %3389, label %3390, label %3410

; <label>:3390:                                   ; preds = %3384
  %3391 = load %struct.DState*, %struct.DState** %2, align 8
  %3392 = getelementptr inbounds %struct.DState, %struct.DState* %3391, i32 0, i32 7
  %3393 = load i32, i32* %3392, align 8
  %3394 = load %struct.DState*, %struct.DState** %2, align 8
  %3395 = getelementptr inbounds %struct.DState, %struct.DState* %3394, i32 0, i32 8
  %3396 = load i32, i32* %3395, align 4
  %3397 = load i32, i32* %24, align 4
  %3398 = sub nsw i32 %3396, %3397
  %3399 = lshr i32 %3393, %3398
  %3400 = load i32, i32* %24, align 4
  %3401 = shl i32 1, %3400
  %3402 = sub nsw i32 %3401, 1
  %3403 = and i32 %3399, %3402
  store i32 %3403, i32* %66, align 4
  %3404 = load i32, i32* %24, align 4
  %3405 = load %struct.DState*, %struct.DState** %2, align 8
  %3406 = getelementptr inbounds %struct.DState, %struct.DState* %3405, i32 0, i32 8
  %3407 = load i32, i32* %3406, align 4
  %3408 = sub nsw i32 %3407, %3404
  store i32 %3408, i32* %3406, align 4
  %3409 = load i32, i32* %66, align 4
  store i32 %3409, i32* %25, align 4
  br label %3469

; <label>:3410:                                   ; preds = %3384
  %3411 = load %struct.DState*, %struct.DState** %2, align 8
  %3412 = getelementptr inbounds %struct.DState, %struct.DState* %3411, i32 0, i32 0
  %3413 = load %struct.bz_stream*, %struct.bz_stream** %3412, align 8
  %3414 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3413, i32 0, i32 1
  %3415 = load i32, i32* %3414, align 8
  %3416 = icmp eq i32 %3415, 0
  br i1 %3416, label %3417, label %3418

; <label>:3417:                                   ; preds = %3410
  store i32 0, i32* %4, align 4
  br label %5741

; <label>:3418:                                   ; preds = %3410
  %3419 = load %struct.DState*, %struct.DState** %2, align 8
  %3420 = getelementptr inbounds %struct.DState, %struct.DState* %3419, i32 0, i32 7
  %3421 = load i32, i32* %3420, align 8
  %3422 = shl i32 %3421, 8
  %3423 = load %struct.DState*, %struct.DState** %2, align 8
  %3424 = getelementptr inbounds %struct.DState, %struct.DState* %3423, i32 0, i32 0
  %3425 = load %struct.bz_stream*, %struct.bz_stream** %3424, align 8
  %3426 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3425, i32 0, i32 0
  %3427 = load i8*, i8** %3426, align 8
  %3428 = load i8, i8* %3427, align 1
  %3429 = zext i8 %3428 to i32
  %3430 = or i32 %3422, %3429
  %3431 = load %struct.DState*, %struct.DState** %2, align 8
  %3432 = getelementptr inbounds %struct.DState, %struct.DState* %3431, i32 0, i32 7
  store i32 %3430, i32* %3432, align 8
  %3433 = load %struct.DState*, %struct.DState** %2, align 8
  %3434 = getelementptr inbounds %struct.DState, %struct.DState* %3433, i32 0, i32 8
  %3435 = load i32, i32* %3434, align 4
  %3436 = add nsw i32 %3435, 8
  store i32 %3436, i32* %3434, align 4
  %3437 = load %struct.DState*, %struct.DState** %2, align 8
  %3438 = getelementptr inbounds %struct.DState, %struct.DState* %3437, i32 0, i32 0
  %3439 = load %struct.bz_stream*, %struct.bz_stream** %3438, align 8
  %3440 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3439, i32 0, i32 0
  %3441 = load i8*, i8** %3440, align 8
  %3442 = getelementptr inbounds i8, i8* %3441, i32 1
  store i8* %3442, i8** %3440, align 8
  %3443 = load %struct.DState*, %struct.DState** %2, align 8
  %3444 = getelementptr inbounds %struct.DState, %struct.DState* %3443, i32 0, i32 0
  %3445 = load %struct.bz_stream*, %struct.bz_stream** %3444, align 8
  %3446 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3445, i32 0, i32 1
  %3447 = load i32, i32* %3446, align 8
  %3448 = add i32 %3447, -1
  store i32 %3448, i32* %3446, align 8
  %3449 = load %struct.DState*, %struct.DState** %2, align 8
  %3450 = getelementptr inbounds %struct.DState, %struct.DState* %3449, i32 0, i32 0
  %3451 = load %struct.bz_stream*, %struct.bz_stream** %3450, align 8
  %3452 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3451, i32 0, i32 2
  %3453 = load i32, i32* %3452, align 4
  %3454 = add i32 %3453, 1
  store i32 %3454, i32* %3452, align 4
  %3455 = load %struct.DState*, %struct.DState** %2, align 8
  %3456 = getelementptr inbounds %struct.DState, %struct.DState* %3455, i32 0, i32 0
  %3457 = load %struct.bz_stream*, %struct.bz_stream** %3456, align 8
  %3458 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3457, i32 0, i32 2
  %3459 = load i32, i32* %3458, align 4
  %3460 = icmp eq i32 %3459, 0
  br i1 %3460, label %3461, label %3468

; <label>:3461:                                   ; preds = %3418
  %3462 = load %struct.DState*, %struct.DState** %2, align 8
  %3463 = getelementptr inbounds %struct.DState, %struct.DState* %3462, i32 0, i32 0
  %3464 = load %struct.bz_stream*, %struct.bz_stream** %3463, align 8
  %3465 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3464, i32 0, i32 3
  %3466 = load i32, i32* %3465, align 8
  %3467 = add i32 %3466, 1
  store i32 %3467, i32* %3465, align 8
  br label %3468

; <label>:3468:                                   ; preds = %3461, %3418
  br label %3384

; <label>:3469:                                   ; preds = %3390
  br label %3470

; <label>:3470:                                   ; preds = %3568, %3469
  %3471 = load i32, i32* %24, align 4
  %3472 = icmp sgt i32 %3471, 20
  br i1 %3472, label %3473, label %3474

; <label>:3473:                                   ; preds = %3470
  store i32 -4, i32* %4, align 4
  br label %5741

; <label>:3474:                                   ; preds = %3470
  %3475 = load i32, i32* %25, align 4
  %3476 = load i32*, i32** %29, align 8
  %3477 = load i32, i32* %24, align 4
  %3478 = sext i32 %3477 to i64
  %3479 = getelementptr inbounds i32, i32* %3476, i64 %3478
  %3480 = load i32, i32* %3479, align 4
  %3481 = icmp sle i32 %3475, %3480
  br i1 %3481, label %3482, label %3483

; <label>:3482:                                   ; preds = %3474
  br label %3573

; <label>:3483:                                   ; preds = %3474
  %3484 = load i32, i32* %24, align 4
  %3485 = add nsw i32 %3484, 1
  store i32 %3485, i32* %24, align 4
  br label %3486

; <label>:3486:                                   ; preds = %3483, %144
  %3487 = load %struct.DState*, %struct.DState** %2, align 8
  %3488 = getelementptr inbounds %struct.DState, %struct.DState* %3487, i32 0, i32 1
  store i32 39, i32* %3488, align 8
  br label %3489

; <label>:3489:                                   ; preds = %3567, %3486
  %3490 = load %struct.DState*, %struct.DState** %2, align 8
  %3491 = getelementptr inbounds %struct.DState, %struct.DState* %3490, i32 0, i32 8
  %3492 = load i32, i32* %3491, align 4
  %3493 = icmp sge i32 %3492, 1
  br i1 %3493, label %3494, label %3509

; <label>:3494:                                   ; preds = %3489
  %3495 = load %struct.DState*, %struct.DState** %2, align 8
  %3496 = getelementptr inbounds %struct.DState, %struct.DState* %3495, i32 0, i32 7
  %3497 = load i32, i32* %3496, align 8
  %3498 = load %struct.DState*, %struct.DState** %2, align 8
  %3499 = getelementptr inbounds %struct.DState, %struct.DState* %3498, i32 0, i32 8
  %3500 = load i32, i32* %3499, align 4
  %3501 = sub nsw i32 %3500, 1
  %3502 = lshr i32 %3497, %3501
  %3503 = and i32 %3502, 1
  store i32 %3503, i32* %67, align 4
  %3504 = load %struct.DState*, %struct.DState** %2, align 8
  %3505 = getelementptr inbounds %struct.DState, %struct.DState* %3504, i32 0, i32 8
  %3506 = load i32, i32* %3505, align 4
  %3507 = sub nsw i32 %3506, 1
  store i32 %3507, i32* %3505, align 4
  %3508 = load i32, i32* %67, align 4
  store i32 %3508, i32* %26, align 4
  br label %3568

; <label>:3509:                                   ; preds = %3489
  %3510 = load %struct.DState*, %struct.DState** %2, align 8
  %3511 = getelementptr inbounds %struct.DState, %struct.DState* %3510, i32 0, i32 0
  %3512 = load %struct.bz_stream*, %struct.bz_stream** %3511, align 8
  %3513 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3512, i32 0, i32 1
  %3514 = load i32, i32* %3513, align 8
  %3515 = icmp eq i32 %3514, 0
  br i1 %3515, label %3516, label %3517

; <label>:3516:                                   ; preds = %3509
  store i32 0, i32* %4, align 4
  br label %5741

; <label>:3517:                                   ; preds = %3509
  %3518 = load %struct.DState*, %struct.DState** %2, align 8
  %3519 = getelementptr inbounds %struct.DState, %struct.DState* %3518, i32 0, i32 7
  %3520 = load i32, i32* %3519, align 8
  %3521 = shl i32 %3520, 8
  %3522 = load %struct.DState*, %struct.DState** %2, align 8
  %3523 = getelementptr inbounds %struct.DState, %struct.DState* %3522, i32 0, i32 0
  %3524 = load %struct.bz_stream*, %struct.bz_stream** %3523, align 8
  %3525 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3524, i32 0, i32 0
  %3526 = load i8*, i8** %3525, align 8
  %3527 = load i8, i8* %3526, align 1
  %3528 = zext i8 %3527 to i32
  %3529 = or i32 %3521, %3528
  %3530 = load %struct.DState*, %struct.DState** %2, align 8
  %3531 = getelementptr inbounds %struct.DState, %struct.DState* %3530, i32 0, i32 7
  store i32 %3529, i32* %3531, align 8
  %3532 = load %struct.DState*, %struct.DState** %2, align 8
  %3533 = getelementptr inbounds %struct.DState, %struct.DState* %3532, i32 0, i32 8
  %3534 = load i32, i32* %3533, align 4
  %3535 = add nsw i32 %3534, 8
  store i32 %3535, i32* %3533, align 4
  %3536 = load %struct.DState*, %struct.DState** %2, align 8
  %3537 = getelementptr inbounds %struct.DState, %struct.DState* %3536, i32 0, i32 0
  %3538 = load %struct.bz_stream*, %struct.bz_stream** %3537, align 8
  %3539 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3538, i32 0, i32 0
  %3540 = load i8*, i8** %3539, align 8
  %3541 = getelementptr inbounds i8, i8* %3540, i32 1
  store i8* %3541, i8** %3539, align 8
  %3542 = load %struct.DState*, %struct.DState** %2, align 8
  %3543 = getelementptr inbounds %struct.DState, %struct.DState* %3542, i32 0, i32 0
  %3544 = load %struct.bz_stream*, %struct.bz_stream** %3543, align 8
  %3545 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3544, i32 0, i32 1
  %3546 = load i32, i32* %3545, align 8
  %3547 = add i32 %3546, -1
  store i32 %3547, i32* %3545, align 8
  %3548 = load %struct.DState*, %struct.DState** %2, align 8
  %3549 = getelementptr inbounds %struct.DState, %struct.DState* %3548, i32 0, i32 0
  %3550 = load %struct.bz_stream*, %struct.bz_stream** %3549, align 8
  %3551 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3550, i32 0, i32 2
  %3552 = load i32, i32* %3551, align 4
  %3553 = add i32 %3552, 1
  store i32 %3553, i32* %3551, align 4
  %3554 = load %struct.DState*, %struct.DState** %2, align 8
  %3555 = getelementptr inbounds %struct.DState, %struct.DState* %3554, i32 0, i32 0
  %3556 = load %struct.bz_stream*, %struct.bz_stream** %3555, align 8
  %3557 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3556, i32 0, i32 2
  %3558 = load i32, i32* %3557, align 4
  %3559 = icmp eq i32 %3558, 0
  br i1 %3559, label %3560, label %3567

; <label>:3560:                                   ; preds = %3517
  %3561 = load %struct.DState*, %struct.DState** %2, align 8
  %3562 = getelementptr inbounds %struct.DState, %struct.DState* %3561, i32 0, i32 0
  %3563 = load %struct.bz_stream*, %struct.bz_stream** %3562, align 8
  %3564 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3563, i32 0, i32 3
  %3565 = load i32, i32* %3564, align 8
  %3566 = add i32 %3565, 1
  store i32 %3566, i32* %3564, align 8
  br label %3567

; <label>:3567:                                   ; preds = %3560, %3517
  br label %3489

; <label>:3568:                                   ; preds = %3494
  %3569 = load i32, i32* %25, align 4
  %3570 = shl i32 %3569, 1
  %3571 = load i32, i32* %26, align 4
  %3572 = or i32 %3570, %3571
  store i32 %3572, i32* %25, align 4
  br label %3470

; <label>:3573:                                   ; preds = %3482
  %3574 = load i32, i32* %25, align 4
  %3575 = load i32*, i32** %30, align 8
  %3576 = load i32, i32* %24, align 4
  %3577 = sext i32 %3576 to i64
  %3578 = getelementptr inbounds i32, i32* %3575, i64 %3577
  %3579 = load i32, i32* %3578, align 4
  %3580 = sub nsw i32 %3574, %3579
  %3581 = icmp slt i32 %3580, 0
  br i1 %3581, label %3591, label %3582

; <label>:3582:                                   ; preds = %3573
  %3583 = load i32, i32* %25, align 4
  %3584 = load i32*, i32** %30, align 8
  %3585 = load i32, i32* %24, align 4
  %3586 = sext i32 %3585 to i64
  %3587 = getelementptr inbounds i32, i32* %3584, i64 %3586
  %3588 = load i32, i32* %3587, align 4
  %3589 = sub nsw i32 %3583, %3588
  %3590 = icmp sge i32 %3589, 258
  br i1 %3590, label %3591, label %3592

; <label>:3591:                                   ; preds = %3582, %3573
  store i32 -4, i32* %4, align 4
  br label %5741

; <label>:3592:                                   ; preds = %3582
  %3593 = load i32*, i32** %31, align 8
  %3594 = load i32, i32* %25, align 4
  %3595 = load i32*, i32** %30, align 8
  %3596 = load i32, i32* %24, align 4
  %3597 = sext i32 %3596 to i64
  %3598 = getelementptr inbounds i32, i32* %3595, i64 %3597
  %3599 = load i32, i32* %3598, align 4
  %3600 = sub nsw i32 %3594, %3599
  %3601 = sext i32 %3600 to i64
  %3602 = getelementptr inbounds i32, i32* %3593, i64 %3601
  %3603 = load i32, i32* %3602, align 4
  store i32 %3603, i32* %17, align 4
  br label %3604

; <label>:3604:                                   ; preds = %3592
  %3605 = load i32, i32* %17, align 4
  %3606 = icmp eq i32 %3605, 0
  br i1 %3606, label %3610, label %3607

; <label>:3607:                                   ; preds = %3604
  %3608 = load i32, i32* %17, align 4
  %3609 = icmp eq i32 %3608, 1
  br label %3610

; <label>:3610:                                   ; preds = %3607, %3604
  %3611 = phi i1 [ true, %3604 ], [ %3609, %3607 ]
  br i1 %3611, label %3316, label %3612

; <label>:3612:                                   ; preds = %3610
  %3613 = load i32, i32* %20, align 4
  %3614 = add nsw i32 %3613, 1
  store i32 %3614, i32* %20, align 4
  %3615 = load %struct.DState*, %struct.DState** %2, align 8
  %3616 = getelementptr inbounds %struct.DState, %struct.DState* %3615, i32 0, i32 30
  %3617 = load %struct.DState*, %struct.DState** %2, align 8
  %3618 = getelementptr inbounds %struct.DState, %struct.DState* %3617, i32 0, i32 31
  %3619 = load %struct.DState*, %struct.DState** %2, align 8
  %3620 = getelementptr inbounds %struct.DState, %struct.DState* %3619, i32 0, i32 32
  %3621 = getelementptr inbounds [16 x i32], [16 x i32]* %3620, i64 0, i64 0
  %3622 = load i32, i32* %3621, align 4
  %3623 = sext i32 %3622 to i64
  %3624 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3618, i64 0, i64 %3623
  %3625 = load i8, i8* %3624, align 1
  %3626 = zext i8 %3625 to i64
  %3627 = getelementptr inbounds [256 x i8], [256 x i8]* %3616, i64 0, i64 %3626
  %3628 = load i8, i8* %3627, align 1
  store i8 %3628, i8* %3, align 1
  %3629 = load i32, i32* %20, align 4
  %3630 = load %struct.DState*, %struct.DState** %2, align 8
  %3631 = getelementptr inbounds %struct.DState, %struct.DState* %3630, i32 0, i32 16
  %3632 = load i8, i8* %3, align 1
  %3633 = zext i8 %3632 to i64
  %3634 = getelementptr inbounds [256 x i32], [256 x i32]* %3631, i64 0, i64 %3633
  %3635 = load i32, i32* %3634, align 4
  %3636 = add nsw i32 %3635, %3629
  store i32 %3636, i32* %3634, align 4
  %3637 = load %struct.DState*, %struct.DState** %2, align 8
  %3638 = getelementptr inbounds %struct.DState, %struct.DState* %3637, i32 0, i32 10
  %3639 = load i8, i8* %3638, align 4
  %3640 = icmp ne i8 %3639, 0
  br i1 %3640, label %3641, label %3664

; <label>:3641:                                   ; preds = %3612
  br label %3642

; <label>:3642:                                   ; preds = %3650, %3641
  %3643 = load i32, i32* %20, align 4
  %3644 = icmp sgt i32 %3643, 0
  br i1 %3644, label %3645, label %3663

; <label>:3645:                                   ; preds = %3642
  %3646 = load i32, i32* %19, align 4
  %3647 = load i32, i32* %18, align 4
  %3648 = icmp sge i32 %3646, %3647
  br i1 %3648, label %3649, label %3650

; <label>:3649:                                   ; preds = %3645
  store i32 -4, i32* %4, align 4
  br label %5741

; <label>:3650:                                   ; preds = %3645
  %3651 = load i8, i8* %3, align 1
  %3652 = zext i8 %3651 to i16
  %3653 = load %struct.DState*, %struct.DState** %2, align 8
  %3654 = getelementptr inbounds %struct.DState, %struct.DState* %3653, i32 0, i32 21
  %3655 = load i16*, i16** %3654, align 8
  %3656 = load i32, i32* %19, align 4
  %3657 = sext i32 %3656 to i64
  %3658 = getelementptr inbounds i16, i16* %3655, i64 %3657
  store i16 %3652, i16* %3658, align 2
  %3659 = load i32, i32* %19, align 4
  %3660 = add nsw i32 %3659, 1
  store i32 %3660, i32* %19, align 4
  %3661 = load i32, i32* %20, align 4
  %3662 = add nsw i32 %3661, -1
  store i32 %3662, i32* %20, align 4
  br label %3642

; <label>:3663:                                   ; preds = %3642
  br label %3687

; <label>:3664:                                   ; preds = %3612
  br label %3665

; <label>:3665:                                   ; preds = %3673, %3664
  %3666 = load i32, i32* %20, align 4
  %3667 = icmp sgt i32 %3666, 0
  br i1 %3667, label %3668, label %3686

; <label>:3668:                                   ; preds = %3665
  %3669 = load i32, i32* %19, align 4
  %3670 = load i32, i32* %18, align 4
  %3671 = icmp sge i32 %3669, %3670
  br i1 %3671, label %3672, label %3673

; <label>:3672:                                   ; preds = %3668
  store i32 -4, i32* %4, align 4
  br label %5741

; <label>:3673:                                   ; preds = %3668
  %3674 = load i8, i8* %3, align 1
  %3675 = zext i8 %3674 to i32
  %3676 = load %struct.DState*, %struct.DState** %2, align 8
  %3677 = getelementptr inbounds %struct.DState, %struct.DState* %3676, i32 0, i32 20
  %3678 = load i32*, i32** %3677, align 8
  %3679 = load i32, i32* %19, align 4
  %3680 = sext i32 %3679 to i64
  %3681 = getelementptr inbounds i32, i32* %3678, i64 %3680
  store i32 %3675, i32* %3681, align 4
  %3682 = load i32, i32* %19, align 4
  %3683 = add nsw i32 %3682, 1
  store i32 %3683, i32* %19, align 4
  %3684 = load i32, i32* %20, align 4
  %3685 = add nsw i32 %3684, -1
  store i32 %3685, i32* %20, align 4
  br label %3665

; <label>:3686:                                   ; preds = %3665
  br label %3687

; <label>:3687:                                   ; preds = %3686, %3663
  br label %3304

; <label>:3688:                                   ; preds = %3312
  %3689 = load i32, i32* %19, align 4
  %3690 = load i32, i32* %18, align 4
  %3691 = icmp sge i32 %3689, %3690
  br i1 %3691, label %3692, label %3693

; <label>:3692:                                   ; preds = %3688
  store i32 -4, i32* %4, align 4
  br label %5741

; <label>:3693:                                   ; preds = %3688
  %3694 = load i32, i32* %17, align 4
  %3695 = sub nsw i32 %3694, 1
  store i32 %3695, i32* %74, align 4
  %3696 = load i32, i32* %74, align 4
  %3697 = icmp ult i32 %3696, 16
  br i1 %3697, label %3698, label %3801

; <label>:3698:                                   ; preds = %3693
  %3699 = load %struct.DState*, %struct.DState** %2, align 8
  %3700 = getelementptr inbounds %struct.DState, %struct.DState* %3699, i32 0, i32 32
  %3701 = getelementptr inbounds [16 x i32], [16 x i32]* %3700, i64 0, i64 0
  %3702 = load i32, i32* %3701, align 4
  store i32 %3702, i32* %71, align 4
  %3703 = load %struct.DState*, %struct.DState** %2, align 8
  %3704 = getelementptr inbounds %struct.DState, %struct.DState* %3703, i32 0, i32 31
  %3705 = load i32, i32* %71, align 4
  %3706 = load i32, i32* %74, align 4
  %3707 = add i32 %3705, %3706
  %3708 = zext i32 %3707 to i64
  %3709 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3704, i64 0, i64 %3708
  %3710 = load i8, i8* %3709, align 1
  store i8 %3710, i8* %3, align 1
  br label %3711

; <label>:3711:                                   ; preds = %3714, %3698
  %3712 = load i32, i32* %74, align 4
  %3713 = icmp ugt i32 %3712, 3
  br i1 %3713, label %3714, label %3771

; <label>:3714:                                   ; preds = %3711
  %3715 = load i32, i32* %71, align 4
  %3716 = load i32, i32* %74, align 4
  %3717 = add i32 %3715, %3716
  store i32 %3717, i32* %75, align 4
  %3718 = load %struct.DState*, %struct.DState** %2, align 8
  %3719 = getelementptr inbounds %struct.DState, %struct.DState* %3718, i32 0, i32 31
  %3720 = load i32, i32* %75, align 4
  %3721 = sub nsw i32 %3720, 1
  %3722 = sext i32 %3721 to i64
  %3723 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3719, i64 0, i64 %3722
  %3724 = load i8, i8* %3723, align 1
  %3725 = load %struct.DState*, %struct.DState** %2, align 8
  %3726 = getelementptr inbounds %struct.DState, %struct.DState* %3725, i32 0, i32 31
  %3727 = load i32, i32* %75, align 4
  %3728 = sext i32 %3727 to i64
  %3729 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3726, i64 0, i64 %3728
  store i8 %3724, i8* %3729, align 1
  %3730 = load %struct.DState*, %struct.DState** %2, align 8
  %3731 = getelementptr inbounds %struct.DState, %struct.DState* %3730, i32 0, i32 31
  %3732 = load i32, i32* %75, align 4
  %3733 = sub nsw i32 %3732, 2
  %3734 = sext i32 %3733 to i64
  %3735 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3731, i64 0, i64 %3734
  %3736 = load i8, i8* %3735, align 1
  %3737 = load %struct.DState*, %struct.DState** %2, align 8
  %3738 = getelementptr inbounds %struct.DState, %struct.DState* %3737, i32 0, i32 31
  %3739 = load i32, i32* %75, align 4
  %3740 = sub nsw i32 %3739, 1
  %3741 = sext i32 %3740 to i64
  %3742 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3738, i64 0, i64 %3741
  store i8 %3736, i8* %3742, align 1
  %3743 = load %struct.DState*, %struct.DState** %2, align 8
  %3744 = getelementptr inbounds %struct.DState, %struct.DState* %3743, i32 0, i32 31
  %3745 = load i32, i32* %75, align 4
  %3746 = sub nsw i32 %3745, 3
  %3747 = sext i32 %3746 to i64
  %3748 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3744, i64 0, i64 %3747
  %3749 = load i8, i8* %3748, align 1
  %3750 = load %struct.DState*, %struct.DState** %2, align 8
  %3751 = getelementptr inbounds %struct.DState, %struct.DState* %3750, i32 0, i32 31
  %3752 = load i32, i32* %75, align 4
  %3753 = sub nsw i32 %3752, 2
  %3754 = sext i32 %3753 to i64
  %3755 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3751, i64 0, i64 %3754
  store i8 %3749, i8* %3755, align 1
  %3756 = load %struct.DState*, %struct.DState** %2, align 8
  %3757 = getelementptr inbounds %struct.DState, %struct.DState* %3756, i32 0, i32 31
  %3758 = load i32, i32* %75, align 4
  %3759 = sub nsw i32 %3758, 4
  %3760 = sext i32 %3759 to i64
  %3761 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3757, i64 0, i64 %3760
  %3762 = load i8, i8* %3761, align 1
  %3763 = load %struct.DState*, %struct.DState** %2, align 8
  %3764 = getelementptr inbounds %struct.DState, %struct.DState* %3763, i32 0, i32 31
  %3765 = load i32, i32* %75, align 4
  %3766 = sub nsw i32 %3765, 3
  %3767 = sext i32 %3766 to i64
  %3768 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3764, i64 0, i64 %3767
  store i8 %3762, i8* %3768, align 1
  %3769 = load i32, i32* %74, align 4
  %3770 = sub i32 %3769, 4
  store i32 %3770, i32* %74, align 4
  br label %3711

; <label>:3771:                                   ; preds = %3711
  br label %3772

; <label>:3772:                                   ; preds = %3775, %3771
  %3773 = load i32, i32* %74, align 4
  %3774 = icmp ugt i32 %3773, 0
  br i1 %3774, label %3775, label %3794

; <label>:3775:                                   ; preds = %3772
  %3776 = load %struct.DState*, %struct.DState** %2, align 8
  %3777 = getelementptr inbounds %struct.DState, %struct.DState* %3776, i32 0, i32 31
  %3778 = load i32, i32* %71, align 4
  %3779 = load i32, i32* %74, align 4
  %3780 = add i32 %3778, %3779
  %3781 = sub i32 %3780, 1
  %3782 = zext i32 %3781 to i64
  %3783 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3777, i64 0, i64 %3782
  %3784 = load i8, i8* %3783, align 1
  %3785 = load %struct.DState*, %struct.DState** %2, align 8
  %3786 = getelementptr inbounds %struct.DState, %struct.DState* %3785, i32 0, i32 31
  %3787 = load i32, i32* %71, align 4
  %3788 = load i32, i32* %74, align 4
  %3789 = add i32 %3787, %3788
  %3790 = zext i32 %3789 to i64
  %3791 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3786, i64 0, i64 %3790
  store i8 %3784, i8* %3791, align 1
  %3792 = load i32, i32* %74, align 4
  %3793 = add i32 %3792, -1
  store i32 %3793, i32* %74, align 4
  br label %3772

; <label>:3794:                                   ; preds = %3772
  %3795 = load i8, i8* %3, align 1
  %3796 = load %struct.DState*, %struct.DState** %2, align 8
  %3797 = getelementptr inbounds %struct.DState, %struct.DState* %3796, i32 0, i32 31
  %3798 = load i32, i32* %71, align 4
  %3799 = sext i32 %3798 to i64
  %3800 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3797, i64 0, i64 %3799
  store i8 %3795, i8* %3800, align 1
  br label %3954

; <label>:3801:                                   ; preds = %3693
  %3802 = load i32, i32* %74, align 4
  %3803 = udiv i32 %3802, 16
  store i32 %3803, i32* %72, align 4
  %3804 = load i32, i32* %74, align 4
  %3805 = urem i32 %3804, 16
  store i32 %3805, i32* %73, align 4
  %3806 = load %struct.DState*, %struct.DState** %2, align 8
  %3807 = getelementptr inbounds %struct.DState, %struct.DState* %3806, i32 0, i32 32
  %3808 = load i32, i32* %72, align 4
  %3809 = sext i32 %3808 to i64
  %3810 = getelementptr inbounds [16 x i32], [16 x i32]* %3807, i64 0, i64 %3809
  %3811 = load i32, i32* %3810, align 4
  %3812 = load i32, i32* %73, align 4
  %3813 = add nsw i32 %3811, %3812
  store i32 %3813, i32* %71, align 4
  %3814 = load %struct.DState*, %struct.DState** %2, align 8
  %3815 = getelementptr inbounds %struct.DState, %struct.DState* %3814, i32 0, i32 31
  %3816 = load i32, i32* %71, align 4
  %3817 = sext i32 %3816 to i64
  %3818 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3815, i64 0, i64 %3817
  %3819 = load i8, i8* %3818, align 1
  store i8 %3819, i8* %3, align 1
  br label %3820

; <label>:3820:                                   ; preds = %3829, %3801
  %3821 = load i32, i32* %71, align 4
  %3822 = load %struct.DState*, %struct.DState** %2, align 8
  %3823 = getelementptr inbounds %struct.DState, %struct.DState* %3822, i32 0, i32 32
  %3824 = load i32, i32* %72, align 4
  %3825 = sext i32 %3824 to i64
  %3826 = getelementptr inbounds [16 x i32], [16 x i32]* %3823, i64 0, i64 %3825
  %3827 = load i32, i32* %3826, align 4
  %3828 = icmp sgt i32 %3821, %3827
  br i1 %3828, label %3829, label %3844

; <label>:3829:                                   ; preds = %3820
  %3830 = load %struct.DState*, %struct.DState** %2, align 8
  %3831 = getelementptr inbounds %struct.DState, %struct.DState* %3830, i32 0, i32 31
  %3832 = load i32, i32* %71, align 4
  %3833 = sub nsw i32 %3832, 1
  %3834 = sext i32 %3833 to i64
  %3835 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3831, i64 0, i64 %3834
  %3836 = load i8, i8* %3835, align 1
  %3837 = load %struct.DState*, %struct.DState** %2, align 8
  %3838 = getelementptr inbounds %struct.DState, %struct.DState* %3837, i32 0, i32 31
  %3839 = load i32, i32* %71, align 4
  %3840 = sext i32 %3839 to i64
  %3841 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3838, i64 0, i64 %3840
  store i8 %3836, i8* %3841, align 1
  %3842 = load i32, i32* %71, align 4
  %3843 = add nsw i32 %3842, -1
  store i32 %3843, i32* %71, align 4
  br label %3820

; <label>:3844:                                   ; preds = %3820
  %3845 = load %struct.DState*, %struct.DState** %2, align 8
  %3846 = getelementptr inbounds %struct.DState, %struct.DState* %3845, i32 0, i32 32
  %3847 = load i32, i32* %72, align 4
  %3848 = sext i32 %3847 to i64
  %3849 = getelementptr inbounds [16 x i32], [16 x i32]* %3846, i64 0, i64 %3848
  %3850 = load i32, i32* %3849, align 4
  %3851 = add nsw i32 %3850, 1
  store i32 %3851, i32* %3849, align 4
  br label %3852

; <label>:3852:                                   ; preds = %3855, %3844
  %3853 = load i32, i32* %72, align 4
  %3854 = icmp sgt i32 %3853, 0
  br i1 %3854, label %3855, label %3889

; <label>:3855:                                   ; preds = %3852
  %3856 = load %struct.DState*, %struct.DState** %2, align 8
  %3857 = getelementptr inbounds %struct.DState, %struct.DState* %3856, i32 0, i32 32
  %3858 = load i32, i32* %72, align 4
  %3859 = sext i32 %3858 to i64
  %3860 = getelementptr inbounds [16 x i32], [16 x i32]* %3857, i64 0, i64 %3859
  %3861 = load i32, i32* %3860, align 4
  %3862 = add nsw i32 %3861, -1
  store i32 %3862, i32* %3860, align 4
  %3863 = load %struct.DState*, %struct.DState** %2, align 8
  %3864 = getelementptr inbounds %struct.DState, %struct.DState* %3863, i32 0, i32 31
  %3865 = load %struct.DState*, %struct.DState** %2, align 8
  %3866 = getelementptr inbounds %struct.DState, %struct.DState* %3865, i32 0, i32 32
  %3867 = load i32, i32* %72, align 4
  %3868 = sub nsw i32 %3867, 1
  %3869 = sext i32 %3868 to i64
  %3870 = getelementptr inbounds [16 x i32], [16 x i32]* %3866, i64 0, i64 %3869
  %3871 = load i32, i32* %3870, align 4
  %3872 = add nsw i32 %3871, 16
  %3873 = sub nsw i32 %3872, 1
  %3874 = sext i32 %3873 to i64
  %3875 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3864, i64 0, i64 %3874
  %3876 = load i8, i8* %3875, align 1
  %3877 = load %struct.DState*, %struct.DState** %2, align 8
  %3878 = getelementptr inbounds %struct.DState, %struct.DState* %3877, i32 0, i32 31
  %3879 = load %struct.DState*, %struct.DState** %2, align 8
  %3880 = getelementptr inbounds %struct.DState, %struct.DState* %3879, i32 0, i32 32
  %3881 = load i32, i32* %72, align 4
  %3882 = sext i32 %3881 to i64
  %3883 = getelementptr inbounds [16 x i32], [16 x i32]* %3880, i64 0, i64 %3882
  %3884 = load i32, i32* %3883, align 4
  %3885 = sext i32 %3884 to i64
  %3886 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3878, i64 0, i64 %3885
  store i8 %3876, i8* %3886, align 1
  %3887 = load i32, i32* %72, align 4
  %3888 = add nsw i32 %3887, -1
  store i32 %3888, i32* %72, align 4
  br label %3852

; <label>:3889:                                   ; preds = %3852
  %3890 = load %struct.DState*, %struct.DState** %2, align 8
  %3891 = getelementptr inbounds %struct.DState, %struct.DState* %3890, i32 0, i32 32
  %3892 = getelementptr inbounds [16 x i32], [16 x i32]* %3891, i64 0, i64 0
  %3893 = load i32, i32* %3892, align 4
  %3894 = add nsw i32 %3893, -1
  store i32 %3894, i32* %3892, align 4
  %3895 = load i8, i8* %3, align 1
  %3896 = load %struct.DState*, %struct.DState** %2, align 8
  %3897 = getelementptr inbounds %struct.DState, %struct.DState* %3896, i32 0, i32 31
  %3898 = load %struct.DState*, %struct.DState** %2, align 8
  %3899 = getelementptr inbounds %struct.DState, %struct.DState* %3898, i32 0, i32 32
  %3900 = getelementptr inbounds [16 x i32], [16 x i32]* %3899, i64 0, i64 0
  %3901 = load i32, i32* %3900, align 4
  %3902 = sext i32 %3901 to i64
  %3903 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3897, i64 0, i64 %3902
  store i8 %3895, i8* %3903, align 1
  %3904 = load %struct.DState*, %struct.DState** %2, align 8
  %3905 = getelementptr inbounds %struct.DState, %struct.DState* %3904, i32 0, i32 32
  %3906 = getelementptr inbounds [16 x i32], [16 x i32]* %3905, i64 0, i64 0
  %3907 = load i32, i32* %3906, align 4
  %3908 = icmp eq i32 %3907, 0
  br i1 %3908, label %3909, label %3953

; <label>:3909:                                   ; preds = %3889
  store i32 4095, i32* %70, align 4
  store i32 15, i32* %68, align 4
  br label %3910

; <label>:3910:                                   ; preds = %3949, %3909
  %3911 = load i32, i32* %68, align 4
  %3912 = icmp sge i32 %3911, 0
  br i1 %3912, label %3913, label %3952

; <label>:3913:                                   ; preds = %3910
  store i32 15, i32* %69, align 4
  br label %3914

; <label>:3914:                                   ; preds = %3938, %3913
  %3915 = load i32, i32* %69, align 4
  %3916 = icmp sge i32 %3915, 0
  br i1 %3916, label %3917, label %3941

; <label>:3917:                                   ; preds = %3914
  %3918 = load %struct.DState*, %struct.DState** %2, align 8
  %3919 = getelementptr inbounds %struct.DState, %struct.DState* %3918, i32 0, i32 31
  %3920 = load %struct.DState*, %struct.DState** %2, align 8
  %3921 = getelementptr inbounds %struct.DState, %struct.DState* %3920, i32 0, i32 32
  %3922 = load i32, i32* %68, align 4
  %3923 = sext i32 %3922 to i64
  %3924 = getelementptr inbounds [16 x i32], [16 x i32]* %3921, i64 0, i64 %3923
  %3925 = load i32, i32* %3924, align 4
  %3926 = load i32, i32* %69, align 4
  %3927 = add nsw i32 %3925, %3926
  %3928 = sext i32 %3927 to i64
  %3929 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3919, i64 0, i64 %3928
  %3930 = load i8, i8* %3929, align 1
  %3931 = load %struct.DState*, %struct.DState** %2, align 8
  %3932 = getelementptr inbounds %struct.DState, %struct.DState* %3931, i32 0, i32 31
  %3933 = load i32, i32* %70, align 4
  %3934 = sext i32 %3933 to i64
  %3935 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3932, i64 0, i64 %3934
  store i8 %3930, i8* %3935, align 1
  %3936 = load i32, i32* %70, align 4
  %3937 = add nsw i32 %3936, -1
  store i32 %3937, i32* %70, align 4
  br label %3938

; <label>:3938:                                   ; preds = %3917
  %3939 = load i32, i32* %69, align 4
  %3940 = add nsw i32 %3939, -1
  store i32 %3940, i32* %69, align 4
  br label %3914

; <label>:3941:                                   ; preds = %3914
  %3942 = load i32, i32* %70, align 4
  %3943 = add nsw i32 %3942, 1
  %3944 = load %struct.DState*, %struct.DState** %2, align 8
  %3945 = getelementptr inbounds %struct.DState, %struct.DState* %3944, i32 0, i32 32
  %3946 = load i32, i32* %68, align 4
  %3947 = sext i32 %3946 to i64
  %3948 = getelementptr inbounds [16 x i32], [16 x i32]* %3945, i64 0, i64 %3947
  store i32 %3943, i32* %3948, align 4
  br label %3949

; <label>:3949:                                   ; preds = %3941
  %3950 = load i32, i32* %68, align 4
  %3951 = add nsw i32 %3950, -1
  store i32 %3951, i32* %68, align 4
  br label %3910

; <label>:3952:                                   ; preds = %3910
  br label %3953

; <label>:3953:                                   ; preds = %3952, %3889
  br label %3954

; <label>:3954:                                   ; preds = %3953, %3794
  %3955 = load %struct.DState*, %struct.DState** %2, align 8
  %3956 = getelementptr inbounds %struct.DState, %struct.DState* %3955, i32 0, i32 16
  %3957 = load %struct.DState*, %struct.DState** %2, align 8
  %3958 = getelementptr inbounds %struct.DState, %struct.DState* %3957, i32 0, i32 30
  %3959 = load i8, i8* %3, align 1
  %3960 = zext i8 %3959 to i64
  %3961 = getelementptr inbounds [256 x i8], [256 x i8]* %3958, i64 0, i64 %3960
  %3962 = load i8, i8* %3961, align 1
  %3963 = zext i8 %3962 to i64
  %3964 = getelementptr inbounds [256 x i32], [256 x i32]* %3956, i64 0, i64 %3963
  %3965 = load i32, i32* %3964, align 4
  %3966 = add nsw i32 %3965, 1
  store i32 %3966, i32* %3964, align 4
  %3967 = load %struct.DState*, %struct.DState** %2, align 8
  %3968 = getelementptr inbounds %struct.DState, %struct.DState* %3967, i32 0, i32 10
  %3969 = load i8, i8* %3968, align 4
  %3970 = icmp ne i8 %3969, 0
  br i1 %3970, label %3971, label %3985

; <label>:3971:                                   ; preds = %3954
  %3972 = load %struct.DState*, %struct.DState** %2, align 8
  %3973 = getelementptr inbounds %struct.DState, %struct.DState* %3972, i32 0, i32 30
  %3974 = load i8, i8* %3, align 1
  %3975 = zext i8 %3974 to i64
  %3976 = getelementptr inbounds [256 x i8], [256 x i8]* %3973, i64 0, i64 %3975
  %3977 = load i8, i8* %3976, align 1
  %3978 = zext i8 %3977 to i16
  %3979 = load %struct.DState*, %struct.DState** %2, align 8
  %3980 = getelementptr inbounds %struct.DState, %struct.DState* %3979, i32 0, i32 21
  %3981 = load i16*, i16** %3980, align 8
  %3982 = load i32, i32* %19, align 4
  %3983 = sext i32 %3982 to i64
  %3984 = getelementptr inbounds i16, i16* %3981, i64 %3983
  store i16 %3978, i16* %3984, align 2
  br label %3999

; <label>:3985:                                   ; preds = %3954
  %3986 = load %struct.DState*, %struct.DState** %2, align 8
  %3987 = getelementptr inbounds %struct.DState, %struct.DState* %3986, i32 0, i32 30
  %3988 = load i8, i8* %3, align 1
  %3989 = zext i8 %3988 to i64
  %3990 = getelementptr inbounds [256 x i8], [256 x i8]* %3987, i64 0, i64 %3989
  %3991 = load i8, i8* %3990, align 1
  %3992 = zext i8 %3991 to i32
  %3993 = load %struct.DState*, %struct.DState** %2, align 8
  %3994 = getelementptr inbounds %struct.DState, %struct.DState* %3993, i32 0, i32 20
  %3995 = load i32*, i32** %3994, align 8
  %3996 = load i32, i32* %19, align 4
  %3997 = sext i32 %3996 to i64
  %3998 = getelementptr inbounds i32, i32* %3995, i64 %3997
  store i32 %3992, i32* %3998, align 4
  br label %3999

; <label>:3999:                                   ; preds = %3985, %3971
  %4000 = load i32, i32* %19, align 4
  %4001 = add nsw i32 %4000, 1
  store i32 %4001, i32* %19, align 4
  %4002 = load i32, i32* %16, align 4
  %4003 = icmp eq i32 %4002, 0
  br i1 %4003, label %4004, label %4043

; <label>:4004:                                   ; preds = %3999
  %4005 = load i32, i32* %15, align 4
  %4006 = add nsw i32 %4005, 1
  store i32 %4006, i32* %15, align 4
  %4007 = load i32, i32* %15, align 4
  %4008 = load i32, i32* %13, align 4
  %4009 = icmp sge i32 %4007, %4008
  br i1 %4009, label %4010, label %4011

; <label>:4010:                                   ; preds = %4004
  store i32 -4, i32* %4, align 4
  br label %5741

; <label>:4011:                                   ; preds = %4004
  store i32 50, i32* %16, align 4
  %4012 = load %struct.DState*, %struct.DState** %2, align 8
  %4013 = getelementptr inbounds %struct.DState, %struct.DState* %4012, i32 0, i32 33
  %4014 = load i32, i32* %15, align 4
  %4015 = sext i32 %4014 to i64
  %4016 = getelementptr inbounds [18002 x i8], [18002 x i8]* %4013, i64 0, i64 %4015
  %4017 = load i8, i8* %4016, align 1
  %4018 = zext i8 %4017 to i32
  store i32 %4018, i32* %27, align 4
  %4019 = load %struct.DState*, %struct.DState** %2, align 8
  %4020 = getelementptr inbounds %struct.DState, %struct.DState* %4019, i32 0, i32 39
  %4021 = load i32, i32* %27, align 4
  %4022 = sext i32 %4021 to i64
  %4023 = getelementptr inbounds [6 x i32], [6 x i32]* %4020, i64 0, i64 %4022
  %4024 = load i32, i32* %4023, align 4
  store i32 %4024, i32* %28, align 4
  %4025 = load %struct.DState*, %struct.DState** %2, align 8
  %4026 = getelementptr inbounds %struct.DState, %struct.DState* %4025, i32 0, i32 36
  %4027 = load i32, i32* %27, align 4
  %4028 = sext i32 %4027 to i64
  %4029 = getelementptr inbounds [6 x [258 x i32]], [6 x [258 x i32]]* %4026, i64 0, i64 %4028
  %4030 = getelementptr inbounds [258 x i32], [258 x i32]* %4029, i64 0, i64 0
  store i32* %4030, i32** %29, align 8
  %4031 = load %struct.DState*, %struct.DState** %2, align 8
  %4032 = getelementptr inbounds %struct.DState, %struct.DState* %4031, i32 0, i32 38
  %4033 = load i32, i32* %27, align 4
  %4034 = sext i32 %4033 to i64
  %4035 = getelementptr inbounds [6 x [258 x i32]], [6 x [258 x i32]]* %4032, i64 0, i64 %4034
  %4036 = getelementptr inbounds [258 x i32], [258 x i32]* %4035, i64 0, i64 0
  store i32* %4036, i32** %31, align 8
  %4037 = load %struct.DState*, %struct.DState** %2, align 8
  %4038 = getelementptr inbounds %struct.DState, %struct.DState* %4037, i32 0, i32 37
  %4039 = load i32, i32* %27, align 4
  %4040 = sext i32 %4039 to i64
  %4041 = getelementptr inbounds [6 x [258 x i32]], [6 x [258 x i32]]* %4038, i64 0, i64 %4040
  %4042 = getelementptr inbounds [258 x i32], [258 x i32]* %4041, i64 0, i64 0
  store i32* %4042, i32** %30, align 8
  br label %4043

; <label>:4043:                                   ; preds = %4011, %3999
  %4044 = load i32, i32* %16, align 4
  %4045 = add nsw i32 %4044, -1
  store i32 %4045, i32* %16, align 4
  %4046 = load i32, i32* %28, align 4
  store i32 %4046, i32* %24, align 4
  br label %4047

; <label>:4047:                                   ; preds = %4043, %144
  %4048 = load %struct.DState*, %struct.DState** %2, align 8
  %4049 = getelementptr inbounds %struct.DState, %struct.DState* %4048, i32 0, i32 1
  store i32 40, i32* %4049, align 8
  br label %4050

; <label>:4050:                                   ; preds = %4134, %4047
  %4051 = load %struct.DState*, %struct.DState** %2, align 8
  %4052 = getelementptr inbounds %struct.DState, %struct.DState* %4051, i32 0, i32 8
  %4053 = load i32, i32* %4052, align 4
  %4054 = load i32, i32* %24, align 4
  %4055 = icmp sge i32 %4053, %4054
  br i1 %4055, label %4056, label %4076

; <label>:4056:                                   ; preds = %4050
  %4057 = load %struct.DState*, %struct.DState** %2, align 8
  %4058 = getelementptr inbounds %struct.DState, %struct.DState* %4057, i32 0, i32 7
  %4059 = load i32, i32* %4058, align 8
  %4060 = load %struct.DState*, %struct.DState** %2, align 8
  %4061 = getelementptr inbounds %struct.DState, %struct.DState* %4060, i32 0, i32 8
  %4062 = load i32, i32* %4061, align 4
  %4063 = load i32, i32* %24, align 4
  %4064 = sub nsw i32 %4062, %4063
  %4065 = lshr i32 %4059, %4064
  %4066 = load i32, i32* %24, align 4
  %4067 = shl i32 1, %4066
  %4068 = sub nsw i32 %4067, 1
  %4069 = and i32 %4065, %4068
  store i32 %4069, i32* %76, align 4
  %4070 = load i32, i32* %24, align 4
  %4071 = load %struct.DState*, %struct.DState** %2, align 8
  %4072 = getelementptr inbounds %struct.DState, %struct.DState* %4071, i32 0, i32 8
  %4073 = load i32, i32* %4072, align 4
  %4074 = sub nsw i32 %4073, %4070
  store i32 %4074, i32* %4072, align 4
  %4075 = load i32, i32* %76, align 4
  store i32 %4075, i32* %25, align 4
  br label %4135

; <label>:4076:                                   ; preds = %4050
  %4077 = load %struct.DState*, %struct.DState** %2, align 8
  %4078 = getelementptr inbounds %struct.DState, %struct.DState* %4077, i32 0, i32 0
  %4079 = load %struct.bz_stream*, %struct.bz_stream** %4078, align 8
  %4080 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %4079, i32 0, i32 1
  %4081 = load i32, i32* %4080, align 8
  %4082 = icmp eq i32 %4081, 0
  br i1 %4082, label %4083, label %4084

; <label>:4083:                                   ; preds = %4076
  store i32 0, i32* %4, align 4
  br label %5741

; <label>:4084:                                   ; preds = %4076
  %4085 = load %struct.DState*, %struct.DState** %2, align 8
  %4086 = getelementptr inbounds %struct.DState, %struct.DState* %4085, i32 0, i32 7
  %4087 = load i32, i32* %4086, align 8
  %4088 = shl i32 %4087, 8
  %4089 = load %struct.DState*, %struct.DState** %2, align 8
  %4090 = getelementptr inbounds %struct.DState, %struct.DState* %4089, i32 0, i32 0
  %4091 = load %struct.bz_stream*, %struct.bz_stream** %4090, align 8
  %4092 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %4091, i32 0, i32 0
  %4093 = load i8*, i8** %4092, align 8
  %4094 = load i8, i8* %4093, align 1
  %4095 = zext i8 %4094 to i32
  %4096 = or i32 %4088, %4095
  %4097 = load %struct.DState*, %struct.DState** %2, align 8
  %4098 = getelementptr inbounds %struct.DState, %struct.DState* %4097, i32 0, i32 7
  store i32 %4096, i32* %4098, align 8
  %4099 = load %struct.DState*, %struct.DState** %2, align 8
  %4100 = getelementptr inbounds %struct.DState, %struct.DState* %4099, i32 0, i32 8
  %4101 = load i32, i32* %4100, align 4
  %4102 = add nsw i32 %4101, 8
  store i32 %4102, i32* %4100, align 4
  %4103 = load %struct.DState*, %struct.DState** %2, align 8
  %4104 = getelementptr inbounds %struct.DState, %struct.DState* %4103, i32 0, i32 0
  %4105 = load %struct.bz_stream*, %struct.bz_stream** %4104, align 8
  %4106 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %4105, i32 0, i32 0
  %4107 = load i8*, i8** %4106, align 8
  %4108 = getelementptr inbounds i8, i8* %4107, i32 1
  store i8* %4108, i8** %4106, align 8
  %4109 = load %struct.DState*, %struct.DState** %2, align 8
  %4110 = getelementptr inbounds %struct.DState, %struct.DState* %4109, i32 0, i32 0
  %4111 = load %struct.bz_stream*, %struct.bz_stream** %4110, align 8
  %4112 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %4111, i32 0, i32 1
  %4113 = load i32, i32* %4112, align 8
  %4114 = add i32 %4113, -1
  store i32 %4114, i32* %4112, align 8
  %4115 = load %struct.DState*, %struct.DState** %2, align 8
  %4116 = getelementptr inbounds %struct.DState, %struct.DState* %4115, i32 0, i32 0
  %4117 = load %struct.bz_stream*, %struct.bz_stream** %4116, align 8
  %4118 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %4117, i32 0, i32 2
  %4119 = load i32, i32* %4118, align 4
  %4120 = add i32 %4119, 1
  store i32 %4120, i32* %4118, align 4
  %4121 = load %struct.DState*, %struct.DState** %2, align 8
  %4122 = getelementptr inbounds %struct.DState, %struct.DState* %4121, i32 0, i32 0
  %4123 = load %struct.bz_stream*, %struct.bz_stream** %4122, align 8
  %4124 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %4123, i32 0, i32 2
  %4125 = load i32, i32* %4124, align 4
  %4126 = icmp eq i32 %4125, 0
  br i1 %4126, label %4127, label %4134

; <label>:4127:                                   ; preds = %4084
  %4128 = load %struct.DState*, %struct.DState** %2, align 8
  %4129 = getelementptr inbounds %struct.DState, %struct.DState* %4128, i32 0, i32 0
  %4130 = load %struct.bz_stream*, %struct.bz_stream** %4129, align 8
  %4131 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %4130, i32 0, i32 3
  %4132 = load i32, i32* %4131, align 8
  %4133 = add i32 %4132, 1
  store i32 %4133, i32* %4131, align 8
  br label %4134

; <label>:4134:                                   ; preds = %4127, %4084
  br label %4050

; <label>:4135:                                   ; preds = %4056
  br label %4136

; <label>:4136:                                   ; preds = %4234, %4135
  %4137 = load i32, i32* %24, align 4
  %4138 = icmp sgt i32 %4137, 20
  br i1 %4138, label %4139, label %4140

; <label>:4139:                                   ; preds = %4136
  store i32 -4, i32* %4, align 4
  br label %5741

; <label>:4140:                                   ; preds = %4136
  %4141 = load i32, i32* %25, align 4
  %4142 = load i32*, i32** %29, align 8
  %4143 = load i32, i32* %24, align 4
  %4144 = sext i32 %4143 to i64
  %4145 = getelementptr inbounds i32, i32* %4142, i64 %4144
  %4146 = load i32, i32* %4145, align 4
  %4147 = icmp sle i32 %4141, %4146
  br i1 %4147, label %4148, label %4149

; <label>:4148:                                   ; preds = %4140
  br label %4239

; <label>:4149:                                   ; preds = %4140
  %4150 = load i32, i32* %24, align 4
  %4151 = add nsw i32 %4150, 1
  store i32 %4151, i32* %24, align 4
  br label %4152

; <label>:4152:                                   ; preds = %4149, %144
  %4153 = load %struct.DState*, %struct.DState** %2, align 8
  %4154 = getelementptr inbounds %struct.DState, %struct.DState* %4153, i32 0, i32 1
  store i32 41, i32* %4154, align 8
  br label %4155

; <label>:4155:                                   ; preds = %4233, %4152
  %4156 = load %struct.DState*, %struct.DState** %2, align 8
  %4157 = getelementptr inbounds %struct.DState, %struct.DState* %4156, i32 0, i32 8
  %4158 = load i32, i32* %4157, align 4
  %4159 = icmp sge i32 %4158, 1
  br i1 %4159, label %4160, label %4175

; <label>:4160:                                   ; preds = %4155
  %4161 = load %struct.DState*, %struct.DState** %2, align 8
  %4162 = getelementptr inbounds %struct.DState, %struct.DState* %4161, i32 0, i32 7
  %4163 = load i32, i32* %4162, align 8
  %4164 = load %struct.DState*, %struct.DState** %2, align 8
  %4165 = getelementptr inbounds %struct.DState, %struct.DState* %4164, i32 0, i32 8
  %4166 = load i32, i32* %4165, align 4
  %4167 = sub nsw i32 %4166, 1
  %4168 = lshr i32 %4163, %4167
  %4169 = and i32 %4168, 1
  store i32 %4169, i32* %77, align 4
  %4170 = load %struct.DState*, %struct.DState** %2, align 8
  %4171 = getelementptr inbounds %struct.DState, %struct.DState* %4170, i32 0, i32 8
  %4172 = load i32, i32* %4171, align 4
  %4173 = sub nsw i32 %4172, 1
  store i32 %4173, i32* %4171, align 4
  %4174 = load i32, i32* %77, align 4
  store i32 %4174, i32* %26, align 4
  br label %4234

; <label>:4175:                                   ; preds = %4155
  %4176 = load %struct.DState*, %struct.DState** %2, align 8
  %4177 = getelementptr inbounds %struct.DState, %struct.DState* %4176, i32 0, i32 0
  %4178 = load %struct.bz_stream*, %struct.bz_stream** %4177, align 8
  %4179 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %4178, i32 0, i32 1
  %4180 = load i32, i32* %4179, align 8
  %4181 = icmp eq i32 %4180, 0
  br i1 %4181, label %4182, label %4183

; <label>:4182:                                   ; preds = %4175
  store i32 0, i32* %4, align 4
  br label %5741

; <label>:4183:                                   ; preds = %4175
  %4184 = load %struct.DState*, %struct.DState** %2, align 8
  %4185 = getelementptr inbounds %struct.DState, %struct.DState* %4184, i32 0, i32 7
  %4186 = load i32, i32* %4185, align 8
  %4187 = shl i32 %4186, 8
  %4188 = load %struct.DState*, %struct.DState** %2, align 8
  %4189 = getelementptr inbounds %struct.DState, %struct.DState* %4188, i32 0, i32 0
  %4190 = load %struct.bz_stream*, %struct.bz_stream** %4189, align 8
  %4191 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %4190, i32 0, i32 0
  %4192 = load i8*, i8** %4191, align 8
  %4193 = load i8, i8* %4192, align 1
  %4194 = zext i8 %4193 to i32
  %4195 = or i32 %4187, %4194
  %4196 = load %struct.DState*, %struct.DState** %2, align 8
  %4197 = getelementptr inbounds %struct.DState, %struct.DState* %4196, i32 0, i32 7
  store i32 %4195, i32* %4197, align 8
  %4198 = load %struct.DState*, %struct.DState** %2, align 8
  %4199 = getelementptr inbounds %struct.DState, %struct.DState* %4198, i32 0, i32 8
  %4200 = load i32, i32* %4199, align 4
  %4201 = add nsw i32 %4200, 8
  store i32 %4201, i32* %4199, align 4
  %4202 = load %struct.DState*, %struct.DState** %2, align 8
  %4203 = getelementptr inbounds %struct.DState, %struct.DState* %4202, i32 0, i32 0
  %4204 = load %struct.bz_stream*, %struct.bz_stream** %4203, align 8
  %4205 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %4204, i32 0, i32 0
  %4206 = load i8*, i8** %4205, align 8
  %4207 = getelementptr inbounds i8, i8* %4206, i32 1
  store i8* %4207, i8** %4205, align 8
  %4208 = load %struct.DState*, %struct.DState** %2, align 8
  %4209 = getelementptr inbounds %struct.DState, %struct.DState* %4208, i32 0, i32 0
  %4210 = load %struct.bz_stream*, %struct.bz_stream** %4209, align 8
  %4211 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %4210, i32 0, i32 1
  %4212 = load i32, i32* %4211, align 8
  %4213 = add i32 %4212, -1
  store i32 %4213, i32* %4211, align 8
  %4214 = load %struct.DState*, %struct.DState** %2, align 8
  %4215 = getelementptr inbounds %struct.DState, %struct.DState* %4214, i32 0, i32 0
  %4216 = load %struct.bz_stream*, %struct.bz_stream** %4215, align 8
  %4217 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %4216, i32 0, i32 2
  %4218 = load i32, i32* %4217, align 4
  %4219 = add i32 %4218, 1
  store i32 %4219, i32* %4217, align 4
  %4220 = load %struct.DState*, %struct.DState** %2, align 8
  %4221 = getelementptr inbounds %struct.DState, %struct.DState* %4220, i32 0, i32 0
  %4222 = load %struct.bz_stream*, %struct.bz_stream** %4221, align 8
  %4223 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %4222, i32 0, i32 2
  %4224 = load i32, i32* %4223, align 4
  %4225 = icmp eq i32 %4224, 0
  br i1 %4225, label %4226, label %4233

; <label>:4226:                                   ; preds = %4183
  %4227 = load %struct.DState*, %struct.DState** %2, align 8
  %4228 = getelementptr inbounds %struct.DState, %struct.DState* %4227, i32 0, i32 0
  %4229 = load %struct.bz_stream*, %struct.bz_stream** %4228, align 8
  %4230 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %4229, i32 0, i32 3
  %4231 = load i32, i32* %4230, align 8
  %4232 = add i32 %4231, 1
  store i32 %4232, i32* %4230, align 8
  br label %4233

; <label>:4233:                                   ; preds = %4226, %4183
  br label %4155

; <label>:4234:                                   ; preds = %4160
  %4235 = load i32, i32* %25, align 4
  %4236 = shl i32 %4235, 1
  %4237 = load i32, i32* %26, align 4
  %4238 = or i32 %4236, %4237
  store i32 %4238, i32* %25, align 4
  br label %4136

; <label>:4239:                                   ; preds = %4148
  %4240 = load i32, i32* %25, align 4
  %4241 = load i32*, i32** %30, align 8
  %4242 = load i32, i32* %24, align 4
  %4243 = sext i32 %4242 to i64
  %4244 = getelementptr inbounds i32, i32* %4241, i64 %4243
  %4245 = load i32, i32* %4244, align 4
  %4246 = sub nsw i32 %4240, %4245
  %4247 = icmp slt i32 %4246, 0
  br i1 %4247, label %4257, label %4248

; <label>:4248:                                   ; preds = %4239
  %4249 = load i32, i32* %25, align 4
  %4250 = load i32*, i32** %30, align 8
  %4251 = load i32, i32* %24, align 4
  %4252 = sext i32 %4251 to i64
  %4253 = getelementptr inbounds i32, i32* %4250, i64 %4252
  %4254 = load i32, i32* %4253, align 4
  %4255 = sub nsw i32 %4249, %4254
  %4256 = icmp sge i32 %4255, 258
  br i1 %4256, label %4257, label %4258

; <label>:4257:                                   ; preds = %4248, %4239
  store i32 -4, i32* %4, align 4
  br label %5741

; <label>:4258:                                   ; preds = %4248
  %4259 = load i32*, i32** %31, align 8
  %4260 = load i32, i32* %25, align 4
  %4261 = load i32*, i32** %30, align 8
  %4262 = load i32, i32* %24, align 4
  %4263 = sext i32 %4262 to i64
  %4264 = getelementptr inbounds i32, i32* %4261, i64 %4263
  %4265 = load i32, i32* %4264, align 4
  %4266 = sub nsw i32 %4260, %4265
  %4267 = sext i32 %4266 to i64
  %4268 = getelementptr inbounds i32, i32* %4259, i64 %4267
  %4269 = load i32, i32* %4268, align 4
  store i32 %4269, i32* %17, align 4
  br label %3304

; <label>:4270:                                   ; preds = %3308
  %4271 = load %struct.DState*, %struct.DState** %2, align 8
  %4272 = getelementptr inbounds %struct.DState, %struct.DState* %4271, i32 0, i32 13
  %4273 = load i32, i32* %4272, align 8
  %4274 = icmp slt i32 %4273, 0
  br i1 %4274, label %4281, label %4275

; <label>:4275:                                   ; preds = %4270
  %4276 = load %struct.DState*, %struct.DState** %2, align 8
  %4277 = getelementptr inbounds %struct.DState, %struct.DState* %4276, i32 0, i32 13
  %4278 = load i32, i32* %4277, align 8
  %4279 = load i32, i32* %19, align 4
  %4280 = icmp sge i32 %4278, %4279
  br i1 %4280, label %4281, label %4282

; <label>:4281:                                   ; preds = %4275, %4270
  store i32 -4, i32* %4, align 4
  br label %5741

; <label>:4282:                                   ; preds = %4275
  %4283 = load %struct.DState*, %struct.DState** %2, align 8
  %4284 = getelementptr inbounds %struct.DState, %struct.DState* %4283, i32 0, i32 18
  %4285 = getelementptr inbounds [257 x i32], [257 x i32]* %4284, i64 0, i64 0
  store i32 0, i32* %4285, align 8
  store i32 1, i32* %8, align 4
  br label %4286

; <label>:4286:                                   ; preds = %4302, %4282
  %4287 = load i32, i32* %8, align 4
  %4288 = icmp sle i32 %4287, 256
  br i1 %4288, label %4289, label %4305

; <label>:4289:                                   ; preds = %4286
  %4290 = load %struct.DState*, %struct.DState** %2, align 8
  %4291 = getelementptr inbounds %struct.DState, %struct.DState* %4290, i32 0, i32 16
  %4292 = load i32, i32* %8, align 4
  %4293 = sub nsw i32 %4292, 1
  %4294 = sext i32 %4293 to i64
  %4295 = getelementptr inbounds [256 x i32], [256 x i32]* %4291, i64 0, i64 %4294
  %4296 = load i32, i32* %4295, align 4
  %4297 = load %struct.DState*, %struct.DState** %2, align 8
  %4298 = getelementptr inbounds %struct.DState, %struct.DState* %4297, i32 0, i32 18
  %4299 = load i32, i32* %8, align 4
  %4300 = sext i32 %4299 to i64
  %4301 = getelementptr inbounds [257 x i32], [257 x i32]* %4298, i64 0, i64 %4300
  store i32 %4296, i32* %4301, align 4
  br label %4302

; <label>:4302:                                   ; preds = %4289
  %4303 = load i32, i32* %8, align 4
  %4304 = add nsw i32 %4303, 1
  store i32 %4304, i32* %8, align 4
  br label %4286

; <label>:4305:                                   ; preds = %4286
  store i32 1, i32* %8, align 4
  br label %4306

; <label>:4306:                                   ; preds = %4324, %4305
  %4307 = load i32, i32* %8, align 4
  %4308 = icmp sle i32 %4307, 256
  br i1 %4308, label %4309, label %4327

; <label>:4309:                                   ; preds = %4306
  %4310 = load %struct.DState*, %struct.DState** %2, align 8
  %4311 = getelementptr inbounds %struct.DState, %struct.DState* %4310, i32 0, i32 18
  %4312 = load i32, i32* %8, align 4
  %4313 = sub nsw i32 %4312, 1
  %4314 = sext i32 %4313 to i64
  %4315 = getelementptr inbounds [257 x i32], [257 x i32]* %4311, i64 0, i64 %4314
  %4316 = load i32, i32* %4315, align 4
  %4317 = load %struct.DState*, %struct.DState** %2, align 8
  %4318 = getelementptr inbounds %struct.DState, %struct.DState* %4317, i32 0, i32 18
  %4319 = load i32, i32* %8, align 4
  %4320 = sext i32 %4319 to i64
  %4321 = getelementptr inbounds [257 x i32], [257 x i32]* %4318, i64 0, i64 %4320
  %4322 = load i32, i32* %4321, align 4
  %4323 = add nsw i32 %4322, %4316
  store i32 %4323, i32* %4321, align 4
  br label %4324

; <label>:4324:                                   ; preds = %4309
  %4325 = load i32, i32* %8, align 4
  %4326 = add nsw i32 %4325, 1
  store i32 %4326, i32* %8, align 4
  br label %4306

; <label>:4327:                                   ; preds = %4306
  store i32 0, i32* %8, align 4
  br label %4328

; <label>:4328:                                   ; preds = %4350, %4327
  %4329 = load i32, i32* %8, align 4
  %4330 = icmp sle i32 %4329, 256
  br i1 %4330, label %4331, label %4353

; <label>:4331:                                   ; preds = %4328
  %4332 = load %struct.DState*, %struct.DState** %2, align 8
  %4333 = getelementptr inbounds %struct.DState, %struct.DState* %4332, i32 0, i32 18
  %4334 = load i32, i32* %8, align 4
  %4335 = sext i32 %4334 to i64
  %4336 = getelementptr inbounds [257 x i32], [257 x i32]* %4333, i64 0, i64 %4335
  %4337 = load i32, i32* %4336, align 4
  %4338 = icmp slt i32 %4337, 0
  br i1 %4338, label %4348, label %4339

; <label>:4339:                                   ; preds = %4331
  %4340 = load %struct.DState*, %struct.DState** %2, align 8
  %4341 = getelementptr inbounds %struct.DState, %struct.DState* %4340, i32 0, i32 18
  %4342 = load i32, i32* %8, align 4
  %4343 = sext i32 %4342 to i64
  %4344 = getelementptr inbounds [257 x i32], [257 x i32]* %4341, i64 0, i64 %4343
  %4345 = load i32, i32* %4344, align 4
  %4346 = load i32, i32* %19, align 4
  %4347 = icmp sgt i32 %4345, %4346
  br i1 %4347, label %4348, label %4349

; <label>:4348:                                   ; preds = %4339, %4331
  store i32 -4, i32* %4, align 4
  br label %5741

; <label>:4349:                                   ; preds = %4339
  br label %4350

; <label>:4350:                                   ; preds = %4349
  %4351 = load i32, i32* %8, align 4
  %4352 = add nsw i32 %4351, 1
  store i32 %4352, i32* %8, align 4
  br label %4328

; <label>:4353:                                   ; preds = %4328
  %4354 = load %struct.DState*, %struct.DState** %2, align 8
  %4355 = getelementptr inbounds %struct.DState, %struct.DState* %4354, i32 0, i32 3
  store i32 0, i32* %4355, align 8
  %4356 = load %struct.DState*, %struct.DState** %2, align 8
  %4357 = getelementptr inbounds %struct.DState, %struct.DState* %4356, i32 0, i32 2
  store i8 0, i8* %4357, align 4
  %4358 = load %struct.DState*, %struct.DState** %2, align 8
  %4359 = getelementptr inbounds %struct.DState, %struct.DState* %4358, i32 0, i32 25
  store i32 -1, i32* %4359, align 8
  %4360 = load %struct.DState*, %struct.DState** %2, align 8
  %4361 = getelementptr inbounds %struct.DState, %struct.DState* %4360, i32 0, i32 1
  store i32 2, i32* %4361, align 8
  %4362 = load %struct.DState*, %struct.DState** %2, align 8
  %4363 = getelementptr inbounds %struct.DState, %struct.DState* %4362, i32 0, i32 12
  %4364 = load i32, i32* %4363, align 4
  %4365 = icmp sge i32 %4364, 2
  br i1 %4365, label %4366, label %4369

; <label>:4366:                                   ; preds = %4353
  %4367 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4368 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4367, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i32 0, i32 0))
  br label %4369

; <label>:4369:                                   ; preds = %4366, %4353
  %4370 = load %struct.DState*, %struct.DState** %2, align 8
  %4371 = getelementptr inbounds %struct.DState, %struct.DState* %4370, i32 0, i32 10
  %4372 = load i8, i8* %4371, align 4
  %4373 = icmp ne i8 %4372, 0
  br i1 %4373, label %4374, label %4757

; <label>:4374:                                   ; preds = %4369
  store i32 0, i32* %8, align 4
  br label %4375

; <label>:4375:                                   ; preds = %4390, %4374
  %4376 = load i32, i32* %8, align 4
  %4377 = icmp sle i32 %4376, 256
  br i1 %4377, label %4378, label %4393

; <label>:4378:                                   ; preds = %4375
  %4379 = load %struct.DState*, %struct.DState** %2, align 8
  %4380 = getelementptr inbounds %struct.DState, %struct.DState* %4379, i32 0, i32 18
  %4381 = load i32, i32* %8, align 4
  %4382 = sext i32 %4381 to i64
  %4383 = getelementptr inbounds [257 x i32], [257 x i32]* %4380, i64 0, i64 %4382
  %4384 = load i32, i32* %4383, align 4
  %4385 = load %struct.DState*, %struct.DState** %2, align 8
  %4386 = getelementptr inbounds %struct.DState, %struct.DState* %4385, i32 0, i32 19
  %4387 = load i32, i32* %8, align 4
  %4388 = sext i32 %4387 to i64
  %4389 = getelementptr inbounds [257 x i32], [257 x i32]* %4386, i64 0, i64 %4388
  store i32 %4384, i32* %4389, align 4
  br label %4390

; <label>:4390:                                   ; preds = %4378
  %4391 = load i32, i32* %8, align 4
  %4392 = add nsw i32 %4391, 1
  store i32 %4392, i32* %8, align 4
  br label %4375

; <label>:4393:                                   ; preds = %4375
  store i32 0, i32* %8, align 4
  br label %4394

; <label>:4394:                                   ; preds = %4487, %4393
  %4395 = load i32, i32* %8, align 4
  %4396 = load i32, i32* %19, align 4
  %4397 = icmp slt i32 %4395, %4396
  br i1 %4397, label %4398, label %4490

; <label>:4398:                                   ; preds = %4394
  %4399 = load %struct.DState*, %struct.DState** %2, align 8
  %4400 = getelementptr inbounds %struct.DState, %struct.DState* %4399, i32 0, i32 21
  %4401 = load i16*, i16** %4400, align 8
  %4402 = load i32, i32* %8, align 4
  %4403 = sext i32 %4402 to i64
  %4404 = getelementptr inbounds i16, i16* %4401, i64 %4403
  %4405 = load i16, i16* %4404, align 2
  %4406 = trunc i16 %4405 to i8
  store i8 %4406, i8* %3, align 1
  %4407 = load %struct.DState*, %struct.DState** %2, align 8
  %4408 = getelementptr inbounds %struct.DState, %struct.DState* %4407, i32 0, i32 19
  %4409 = load i8, i8* %3, align 1
  %4410 = zext i8 %4409 to i64
  %4411 = getelementptr inbounds [257 x i32], [257 x i32]* %4408, i64 0, i64 %4410
  %4412 = load i32, i32* %4411, align 4
  %4413 = and i32 %4412, 65535
  %4414 = trunc i32 %4413 to i16
  %4415 = load %struct.DState*, %struct.DState** %2, align 8
  %4416 = getelementptr inbounds %struct.DState, %struct.DState* %4415, i32 0, i32 21
  %4417 = load i16*, i16** %4416, align 8
  %4418 = load i32, i32* %8, align 4
  %4419 = sext i32 %4418 to i64
  %4420 = getelementptr inbounds i16, i16* %4417, i64 %4419
  store i16 %4414, i16* %4420, align 2
  %4421 = load i32, i32* %8, align 4
  %4422 = and i32 %4421, 1
  %4423 = icmp eq i32 %4422, 0
  br i1 %4423, label %4424, label %4451

; <label>:4424:                                   ; preds = %4398
  %4425 = load %struct.DState*, %struct.DState** %2, align 8
  %4426 = getelementptr inbounds %struct.DState, %struct.DState* %4425, i32 0, i32 22
  %4427 = load i8*, i8** %4426, align 8
  %4428 = load i32, i32* %8, align 4
  %4429 = ashr i32 %4428, 1
  %4430 = sext i32 %4429 to i64
  %4431 = getelementptr inbounds i8, i8* %4427, i64 %4430
  %4432 = load i8, i8* %4431, align 1
  %4433 = zext i8 %4432 to i32
  %4434 = and i32 %4433, 240
  %4435 = load %struct.DState*, %struct.DState** %2, align 8
  %4436 = getelementptr inbounds %struct.DState, %struct.DState* %4435, i32 0, i32 19
  %4437 = load i8, i8* %3, align 1
  %4438 = zext i8 %4437 to i64
  %4439 = getelementptr inbounds [257 x i32], [257 x i32]* %4436, i64 0, i64 %4438
  %4440 = load i32, i32* %4439, align 4
  %4441 = ashr i32 %4440, 16
  %4442 = or i32 %4434, %4441
  %4443 = trunc i32 %4442 to i8
  %4444 = load %struct.DState*, %struct.DState** %2, align 8
  %4445 = getelementptr inbounds %struct.DState, %struct.DState* %4444, i32 0, i32 22
  %4446 = load i8*, i8** %4445, align 8
  %4447 = load i32, i32* %8, align 4
  %4448 = ashr i32 %4447, 1
  %4449 = sext i32 %4448 to i64
  %4450 = getelementptr inbounds i8, i8* %4446, i64 %4449
  store i8 %4443, i8* %4450, align 1
  br label %4479

; <label>:4451:                                   ; preds = %4398
  %4452 = load %struct.DState*, %struct.DState** %2, align 8
  %4453 = getelementptr inbounds %struct.DState, %struct.DState* %4452, i32 0, i32 22
  %4454 = load i8*, i8** %4453, align 8
  %4455 = load i32, i32* %8, align 4
  %4456 = ashr i32 %4455, 1
  %4457 = sext i32 %4456 to i64
  %4458 = getelementptr inbounds i8, i8* %4454, i64 %4457
  %4459 = load i8, i8* %4458, align 1
  %4460 = zext i8 %4459 to i32
  %4461 = and i32 %4460, 15
  %4462 = load %struct.DState*, %struct.DState** %2, align 8
  %4463 = getelementptr inbounds %struct.DState, %struct.DState* %4462, i32 0, i32 19
  %4464 = load i8, i8* %3, align 1
  %4465 = zext i8 %4464 to i64
  %4466 = getelementptr inbounds [257 x i32], [257 x i32]* %4463, i64 0, i64 %4465
  %4467 = load i32, i32* %4466, align 4
  %4468 = ashr i32 %4467, 16
  %4469 = shl i32 %4468, 4
  %4470 = or i32 %4461, %4469
  %4471 = trunc i32 %4470 to i8
  %4472 = load %struct.DState*, %struct.DState** %2, align 8
  %4473 = getelementptr inbounds %struct.DState, %struct.DState* %4472, i32 0, i32 22
  %4474 = load i8*, i8** %4473, align 8
  %4475 = load i32, i32* %8, align 4
  %4476 = ashr i32 %4475, 1
  %4477 = sext i32 %4476 to i64
  %4478 = getelementptr inbounds i8, i8* %4474, i64 %4477
  store i8 %4471, i8* %4478, align 1
  br label %4479

; <label>:4479:                                   ; preds = %4451, %4424
  %4480 = load %struct.DState*, %struct.DState** %2, align 8
  %4481 = getelementptr inbounds %struct.DState, %struct.DState* %4480, i32 0, i32 19
  %4482 = load i8, i8* %3, align 1
  %4483 = zext i8 %4482 to i64
  %4484 = getelementptr inbounds [257 x i32], [257 x i32]* %4481, i64 0, i64 %4483
  %4485 = load i32, i32* %4484, align 4
  %4486 = add nsw i32 %4485, 1
  store i32 %4486, i32* %4484, align 4
  br label %4487

; <label>:4487:                                   ; preds = %4479
  %4488 = load i32, i32* %8, align 4
  %4489 = add nsw i32 %4488, 1
  store i32 %4489, i32* %8, align 4
  br label %4394

; <label>:4490:                                   ; preds = %4394
  %4491 = load %struct.DState*, %struct.DState** %2, align 8
  %4492 = getelementptr inbounds %struct.DState, %struct.DState* %4491, i32 0, i32 13
  %4493 = load i32, i32* %4492, align 8
  store i32 %4493, i32* %8, align 4
  %4494 = load %struct.DState*, %struct.DState** %2, align 8
  %4495 = getelementptr inbounds %struct.DState, %struct.DState* %4494, i32 0, i32 21
  %4496 = load i16*, i16** %4495, align 8
  %4497 = load i32, i32* %8, align 4
  %4498 = sext i32 %4497 to i64
  %4499 = getelementptr inbounds i16, i16* %4496, i64 %4498
  %4500 = load i16, i16* %4499, align 2
  %4501 = zext i16 %4500 to i32
  %4502 = load %struct.DState*, %struct.DState** %2, align 8
  %4503 = getelementptr inbounds %struct.DState, %struct.DState* %4502, i32 0, i32 22
  %4504 = load i8*, i8** %4503, align 8
  %4505 = load i32, i32* %8, align 4
  %4506 = ashr i32 %4505, 1
  %4507 = sext i32 %4506 to i64
  %4508 = getelementptr inbounds i8, i8* %4504, i64 %4507
  %4509 = load i8, i8* %4508, align 1
  %4510 = zext i8 %4509 to i32
  %4511 = load i32, i32* %8, align 4
  %4512 = shl i32 %4511, 2
  %4513 = and i32 %4512, 4
  %4514 = lshr i32 %4510, %4513
  %4515 = and i32 %4514, 15
  %4516 = shl i32 %4515, 16
  %4517 = or i32 %4501, %4516
  store i32 %4517, i32* %9, align 4
  br label %4518

; <label>:4518:                                   ; preds = %4603, %4490
  %4519 = load %struct.DState*, %struct.DState** %2, align 8
  %4520 = getelementptr inbounds %struct.DState, %struct.DState* %4519, i32 0, i32 21
  %4521 = load i16*, i16** %4520, align 8
  %4522 = load i32, i32* %9, align 4
  %4523 = sext i32 %4522 to i64
  %4524 = getelementptr inbounds i16, i16* %4521, i64 %4523
  %4525 = load i16, i16* %4524, align 2
  %4526 = zext i16 %4525 to i32
  %4527 = load %struct.DState*, %struct.DState** %2, align 8
  %4528 = getelementptr inbounds %struct.DState, %struct.DState* %4527, i32 0, i32 22
  %4529 = load i8*, i8** %4528, align 8
  %4530 = load i32, i32* %9, align 4
  %4531 = ashr i32 %4530, 1
  %4532 = sext i32 %4531 to i64
  %4533 = getelementptr inbounds i8, i8* %4529, i64 %4532
  %4534 = load i8, i8* %4533, align 1
  %4535 = zext i8 %4534 to i32
  %4536 = load i32, i32* %9, align 4
  %4537 = shl i32 %4536, 2
  %4538 = and i32 %4537, 4
  %4539 = lshr i32 %4535, %4538
  %4540 = and i32 %4539, 15
  %4541 = shl i32 %4540, 16
  %4542 = or i32 %4526, %4541
  store i32 %4542, i32* %78, align 4
  %4543 = load i32, i32* %8, align 4
  %4544 = and i32 %4543, 65535
  %4545 = trunc i32 %4544 to i16
  %4546 = load %struct.DState*, %struct.DState** %2, align 8
  %4547 = getelementptr inbounds %struct.DState, %struct.DState* %4546, i32 0, i32 21
  %4548 = load i16*, i16** %4547, align 8
  %4549 = load i32, i32* %9, align 4
  %4550 = sext i32 %4549 to i64
  %4551 = getelementptr inbounds i16, i16* %4548, i64 %4550
  store i16 %4545, i16* %4551, align 2
  %4552 = load i32, i32* %9, align 4
  %4553 = and i32 %4552, 1
  %4554 = icmp eq i32 %4553, 0
  br i1 %4554, label %4555, label %4577

; <label>:4555:                                   ; preds = %4518
  %4556 = load %struct.DState*, %struct.DState** %2, align 8
  %4557 = getelementptr inbounds %struct.DState, %struct.DState* %4556, i32 0, i32 22
  %4558 = load i8*, i8** %4557, align 8
  %4559 = load i32, i32* %9, align 4
  %4560 = ashr i32 %4559, 1
  %4561 = sext i32 %4560 to i64
  %4562 = getelementptr inbounds i8, i8* %4558, i64 %4561
  %4563 = load i8, i8* %4562, align 1
  %4564 = zext i8 %4563 to i32
  %4565 = and i32 %4564, 240
  %4566 = load i32, i32* %8, align 4
  %4567 = ashr i32 %4566, 16
  %4568 = or i32 %4565, %4567
  %4569 = trunc i32 %4568 to i8
  %4570 = load %struct.DState*, %struct.DState** %2, align 8
  %4571 = getelementptr inbounds %struct.DState, %struct.DState* %4570, i32 0, i32 22
  %4572 = load i8*, i8** %4571, align 8
  %4573 = load i32, i32* %9, align 4
  %4574 = ashr i32 %4573, 1
  %4575 = sext i32 %4574 to i64
  %4576 = getelementptr inbounds i8, i8* %4572, i64 %4575
  store i8 %4569, i8* %4576, align 1
  br label %4600

; <label>:4577:                                   ; preds = %4518
  %4578 = load %struct.DState*, %struct.DState** %2, align 8
  %4579 = getelementptr inbounds %struct.DState, %struct.DState* %4578, i32 0, i32 22
  %4580 = load i8*, i8** %4579, align 8
  %4581 = load i32, i32* %9, align 4
  %4582 = ashr i32 %4581, 1
  %4583 = sext i32 %4582 to i64
  %4584 = getelementptr inbounds i8, i8* %4580, i64 %4583
  %4585 = load i8, i8* %4584, align 1
  %4586 = zext i8 %4585 to i32
  %4587 = and i32 %4586, 15
  %4588 = load i32, i32* %8, align 4
  %4589 = ashr i32 %4588, 16
  %4590 = shl i32 %4589, 4
  %4591 = or i32 %4587, %4590
  %4592 = trunc i32 %4591 to i8
  %4593 = load %struct.DState*, %struct.DState** %2, align 8
  %4594 = getelementptr inbounds %struct.DState, %struct.DState* %4593, i32 0, i32 22
  %4595 = load i8*, i8** %4594, align 8
  %4596 = load i32, i32* %9, align 4
  %4597 = ashr i32 %4596, 1
  %4598 = sext i32 %4597 to i64
  %4599 = getelementptr inbounds i8, i8* %4595, i64 %4598
  store i8 %4592, i8* %4599, align 1
  br label %4600

; <label>:4600:                                   ; preds = %4577, %4555
  %4601 = load i32, i32* %9, align 4
  store i32 %4601, i32* %8, align 4
  %4602 = load i32, i32* %78, align 4
  store i32 %4602, i32* %9, align 4
  br label %4603

; <label>:4603:                                   ; preds = %4600
  %4604 = load i32, i32* %8, align 4
  %4605 = load %struct.DState*, %struct.DState** %2, align 8
  %4606 = getelementptr inbounds %struct.DState, %struct.DState* %4605, i32 0, i32 13
  %4607 = load i32, i32* %4606, align 8
  %4608 = icmp ne i32 %4604, %4607
  br i1 %4608, label %4518, label %4609

; <label>:4609:                                   ; preds = %4603
  %4610 = load %struct.DState*, %struct.DState** %2, align 8
  %4611 = getelementptr inbounds %struct.DState, %struct.DState* %4610, i32 0, i32 13
  %4612 = load i32, i32* %4611, align 8
  %4613 = load %struct.DState*, %struct.DState** %2, align 8
  %4614 = getelementptr inbounds %struct.DState, %struct.DState* %4613, i32 0, i32 14
  store i32 %4612, i32* %4614, align 4
  %4615 = load %struct.DState*, %struct.DState** %2, align 8
  %4616 = getelementptr inbounds %struct.DState, %struct.DState* %4615, i32 0, i32 17
  store i32 0, i32* %4616, align 4
  %4617 = load %struct.DState*, %struct.DState** %2, align 8
  %4618 = getelementptr inbounds %struct.DState, %struct.DState* %4617, i32 0, i32 4
  %4619 = load i8, i8* %4618, align 4
  %4620 = icmp ne i8 %4619, 0
  br i1 %4620, label %4621, label %4710

; <label>:4621:                                   ; preds = %4609
  %4622 = load %struct.DState*, %struct.DState** %2, align 8
  %4623 = getelementptr inbounds %struct.DState, %struct.DState* %4622, i32 0, i32 5
  store i32 0, i32* %4623, align 8
  %4624 = load %struct.DState*, %struct.DState** %2, align 8
  %4625 = getelementptr inbounds %struct.DState, %struct.DState* %4624, i32 0, i32 6
  store i32 0, i32* %4625, align 4
  %4626 = load %struct.DState*, %struct.DState** %2, align 8
  %4627 = getelementptr inbounds %struct.DState, %struct.DState* %4626, i32 0, i32 14
  %4628 = load i32, i32* %4627, align 4
  %4629 = load %struct.DState*, %struct.DState** %2, align 8
  %4630 = getelementptr inbounds %struct.DState, %struct.DState* %4629, i32 0, i32 18
  %4631 = getelementptr inbounds [257 x i32], [257 x i32]* %4630, i32 0, i32 0
  %4632 = call i32 @BZ2_indexIntoF(i32 %4628, i32* %4631)
  %4633 = load %struct.DState*, %struct.DState** %2, align 8
  %4634 = getelementptr inbounds %struct.DState, %struct.DState* %4633, i32 0, i32 15
  store i32 %4632, i32* %4634, align 8
  %4635 = load %struct.DState*, %struct.DState** %2, align 8
  %4636 = getelementptr inbounds %struct.DState, %struct.DState* %4635, i32 0, i32 21
  %4637 = load i16*, i16** %4636, align 8
  %4638 = load %struct.DState*, %struct.DState** %2, align 8
  %4639 = getelementptr inbounds %struct.DState, %struct.DState* %4638, i32 0, i32 14
  %4640 = load i32, i32* %4639, align 4
  %4641 = zext i32 %4640 to i64
  %4642 = getelementptr inbounds i16, i16* %4637, i64 %4641
  %4643 = load i16, i16* %4642, align 2
  %4644 = zext i16 %4643 to i32
  %4645 = load %struct.DState*, %struct.DState** %2, align 8
  %4646 = getelementptr inbounds %struct.DState, %struct.DState* %4645, i32 0, i32 22
  %4647 = load i8*, i8** %4646, align 8
  %4648 = load %struct.DState*, %struct.DState** %2, align 8
  %4649 = getelementptr inbounds %struct.DState, %struct.DState* %4648, i32 0, i32 14
  %4650 = load i32, i32* %4649, align 4
  %4651 = lshr i32 %4650, 1
  %4652 = zext i32 %4651 to i64
  %4653 = getelementptr inbounds i8, i8* %4647, i64 %4652
  %4654 = load i8, i8* %4653, align 1
  %4655 = zext i8 %4654 to i32
  %4656 = load %struct.DState*, %struct.DState** %2, align 8
  %4657 = getelementptr inbounds %struct.DState, %struct.DState* %4656, i32 0, i32 14
  %4658 = load i32, i32* %4657, align 4
  %4659 = shl i32 %4658, 2
  %4660 = and i32 %4659, 4
  %4661 = lshr i32 %4655, %4660
  %4662 = and i32 %4661, 15
  %4663 = shl i32 %4662, 16
  %4664 = or i32 %4644, %4663
  %4665 = load %struct.DState*, %struct.DState** %2, align 8
  %4666 = getelementptr inbounds %struct.DState, %struct.DState* %4665, i32 0, i32 14
  store i32 %4664, i32* %4666, align 4
  %4667 = load %struct.DState*, %struct.DState** %2, align 8
  %4668 = getelementptr inbounds %struct.DState, %struct.DState* %4667, i32 0, i32 17
  %4669 = load i32, i32* %4668, align 4
  %4670 = add nsw i32 %4669, 1
  store i32 %4670, i32* %4668, align 4
  %4671 = load %struct.DState*, %struct.DState** %2, align 8
  %4672 = getelementptr inbounds %struct.DState, %struct.DState* %4671, i32 0, i32 5
  %4673 = load i32, i32* %4672, align 8
  %4674 = icmp eq i32 %4673, 0
  br i1 %4674, label %4675, label %4696

; <label>:4675:                                   ; preds = %4621
  %4676 = load %struct.DState*, %struct.DState** %2, align 8
  %4677 = getelementptr inbounds %struct.DState, %struct.DState* %4676, i32 0, i32 6
  %4678 = load i32, i32* %4677, align 4
  %4679 = sext i32 %4678 to i64
  %4680 = getelementptr inbounds [512 x i32], [512 x i32]* @BZ2_rNums, i64 0, i64 %4679
  %4681 = load i32, i32* %4680, align 4
  %4682 = load %struct.DState*, %struct.DState** %2, align 8
  %4683 = getelementptr inbounds %struct.DState, %struct.DState* %4682, i32 0, i32 5
  store i32 %4681, i32* %4683, align 8
  %4684 = load %struct.DState*, %struct.DState** %2, align 8
  %4685 = getelementptr inbounds %struct.DState, %struct.DState* %4684, i32 0, i32 6
  %4686 = load i32, i32* %4685, align 4
  %4687 = add nsw i32 %4686, 1
  store i32 %4687, i32* %4685, align 4
  %4688 = load %struct.DState*, %struct.DState** %2, align 8
  %4689 = getelementptr inbounds %struct.DState, %struct.DState* %4688, i32 0, i32 6
  %4690 = load i32, i32* %4689, align 4
  %4691 = icmp eq i32 %4690, 512
  br i1 %4691, label %4692, label %4695

; <label>:4692:                                   ; preds = %4675
  %4693 = load %struct.DState*, %struct.DState** %2, align 8
  %4694 = getelementptr inbounds %struct.DState, %struct.DState* %4693, i32 0, i32 6
  store i32 0, i32* %4694, align 4
  br label %4695

; <label>:4695:                                   ; preds = %4692, %4675
  br label %4696

; <label>:4696:                                   ; preds = %4695, %4621
  %4697 = load %struct.DState*, %struct.DState** %2, align 8
  %4698 = getelementptr inbounds %struct.DState, %struct.DState* %4697, i32 0, i32 5
  %4699 = load i32, i32* %4698, align 8
  %4700 = add nsw i32 %4699, -1
  store i32 %4700, i32* %4698, align 8
  %4701 = load %struct.DState*, %struct.DState** %2, align 8
  %4702 = getelementptr inbounds %struct.DState, %struct.DState* %4701, i32 0, i32 5
  %4703 = load i32, i32* %4702, align 8
  %4704 = icmp eq i32 %4703, 1
  %4705 = select i1 %4704, i32 1, i32 0
  %4706 = load %struct.DState*, %struct.DState** %2, align 8
  %4707 = getelementptr inbounds %struct.DState, %struct.DState* %4706, i32 0, i32 15
  %4708 = load i32, i32* %4707, align 8
  %4709 = xor i32 %4708, %4705
  store i32 %4709, i32* %4707, align 8
  br label %4756

; <label>:4710:                                   ; preds = %4609
  %4711 = load %struct.DState*, %struct.DState** %2, align 8
  %4712 = getelementptr inbounds %struct.DState, %struct.DState* %4711, i32 0, i32 14
  %4713 = load i32, i32* %4712, align 4
  %4714 = load %struct.DState*, %struct.DState** %2, align 8
  %4715 = getelementptr inbounds %struct.DState, %struct.DState* %4714, i32 0, i32 18
  %4716 = getelementptr inbounds [257 x i32], [257 x i32]* %4715, i32 0, i32 0
  %4717 = call i32 @BZ2_indexIntoF(i32 %4713, i32* %4716)
  %4718 = load %struct.DState*, %struct.DState** %2, align 8
  %4719 = getelementptr inbounds %struct.DState, %struct.DState* %4718, i32 0, i32 15
  store i32 %4717, i32* %4719, align 8
  %4720 = load %struct.DState*, %struct.DState** %2, align 8
  %4721 = getelementptr inbounds %struct.DState, %struct.DState* %4720, i32 0, i32 21
  %4722 = load i16*, i16** %4721, align 8
  %4723 = load %struct.DState*, %struct.DState** %2, align 8
  %4724 = getelementptr inbounds %struct.DState, %struct.DState* %4723, i32 0, i32 14
  %4725 = load i32, i32* %4724, align 4
  %4726 = zext i32 %4725 to i64
  %4727 = getelementptr inbounds i16, i16* %4722, i64 %4726
  %4728 = load i16, i16* %4727, align 2
  %4729 = zext i16 %4728 to i32
  %4730 = load %struct.DState*, %struct.DState** %2, align 8
  %4731 = getelementptr inbounds %struct.DState, %struct.DState* %4730, i32 0, i32 22
  %4732 = load i8*, i8** %4731, align 8
  %4733 = load %struct.DState*, %struct.DState** %2, align 8
  %4734 = getelementptr inbounds %struct.DState, %struct.DState* %4733, i32 0, i32 14
  %4735 = load i32, i32* %4734, align 4
  %4736 = lshr i32 %4735, 1
  %4737 = zext i32 %4736 to i64
  %4738 = getelementptr inbounds i8, i8* %4732, i64 %4737
  %4739 = load i8, i8* %4738, align 1
  %4740 = zext i8 %4739 to i32
  %4741 = load %struct.DState*, %struct.DState** %2, align 8
  %4742 = getelementptr inbounds %struct.DState, %struct.DState* %4741, i32 0, i32 14
  %4743 = load i32, i32* %4742, align 4
  %4744 = shl i32 %4743, 2
  %4745 = and i32 %4744, 4
  %4746 = lshr i32 %4740, %4745
  %4747 = and i32 %4746, 15
  %4748 = shl i32 %4747, 16
  %4749 = or i32 %4729, %4748
  %4750 = load %struct.DState*, %struct.DState** %2, align 8
  %4751 = getelementptr inbounds %struct.DState, %struct.DState* %4750, i32 0, i32 14
  store i32 %4749, i32* %4751, align 4
  %4752 = load %struct.DState*, %struct.DState** %2, align 8
  %4753 = getelementptr inbounds %struct.DState, %struct.DState* %4752, i32 0, i32 17
  %4754 = load i32, i32* %4753, align 4
  %4755 = add nsw i32 %4754, 1
  store i32 %4755, i32* %4753, align 4
  br label %4756

; <label>:4756:                                   ; preds = %4710, %4696
  br label %4916

; <label>:4757:                                   ; preds = %4369
  store i32 0, i32* %8, align 4
  br label %4758

; <label>:4758:                                   ; preds = %4794, %4757
  %4759 = load i32, i32* %8, align 4
  %4760 = load i32, i32* %19, align 4
  %4761 = icmp slt i32 %4759, %4760
  br i1 %4761, label %4762, label %4797

; <label>:4762:                                   ; preds = %4758
  %4763 = load %struct.DState*, %struct.DState** %2, align 8
  %4764 = getelementptr inbounds %struct.DState, %struct.DState* %4763, i32 0, i32 20
  %4765 = load i32*, i32** %4764, align 8
  %4766 = load i32, i32* %8, align 4
  %4767 = sext i32 %4766 to i64
  %4768 = getelementptr inbounds i32, i32* %4765, i64 %4767
  %4769 = load i32, i32* %4768, align 4
  %4770 = and i32 %4769, 255
  %4771 = trunc i32 %4770 to i8
  store i8 %4771, i8* %3, align 1
  %4772 = load i32, i32* %8, align 4
  %4773 = shl i32 %4772, 8
  %4774 = load %struct.DState*, %struct.DState** %2, align 8
  %4775 = getelementptr inbounds %struct.DState, %struct.DState* %4774, i32 0, i32 20
  %4776 = load i32*, i32** %4775, align 8
  %4777 = load %struct.DState*, %struct.DState** %2, align 8
  %4778 = getelementptr inbounds %struct.DState, %struct.DState* %4777, i32 0, i32 18
  %4779 = load i8, i8* %3, align 1
  %4780 = zext i8 %4779 to i64
  %4781 = getelementptr inbounds [257 x i32], [257 x i32]* %4778, i64 0, i64 %4780
  %4782 = load i32, i32* %4781, align 4
  %4783 = sext i32 %4782 to i64
  %4784 = getelementptr inbounds i32, i32* %4776, i64 %4783
  %4785 = load i32, i32* %4784, align 4
  %4786 = or i32 %4785, %4773
  store i32 %4786, i32* %4784, align 4
  %4787 = load %struct.DState*, %struct.DState** %2, align 8
  %4788 = getelementptr inbounds %struct.DState, %struct.DState* %4787, i32 0, i32 18
  %4789 = load i8, i8* %3, align 1
  %4790 = zext i8 %4789 to i64
  %4791 = getelementptr inbounds [257 x i32], [257 x i32]* %4788, i64 0, i64 %4790
  %4792 = load i32, i32* %4791, align 4
  %4793 = add nsw i32 %4792, 1
  store i32 %4793, i32* %4791, align 4
  br label %4794

; <label>:4794:                                   ; preds = %4762
  %4795 = load i32, i32* %8, align 4
  %4796 = add nsw i32 %4795, 1
  store i32 %4796, i32* %8, align 4
  br label %4758

; <label>:4797:                                   ; preds = %4758
  %4798 = load %struct.DState*, %struct.DState** %2, align 8
  %4799 = getelementptr inbounds %struct.DState, %struct.DState* %4798, i32 0, i32 20
  %4800 = load i32*, i32** %4799, align 8
  %4801 = load %struct.DState*, %struct.DState** %2, align 8
  %4802 = getelementptr inbounds %struct.DState, %struct.DState* %4801, i32 0, i32 13
  %4803 = load i32, i32* %4802, align 8
  %4804 = sext i32 %4803 to i64
  %4805 = getelementptr inbounds i32, i32* %4800, i64 %4804
  %4806 = load i32, i32* %4805, align 4
  %4807 = lshr i32 %4806, 8
  %4808 = load %struct.DState*, %struct.DState** %2, align 8
  %4809 = getelementptr inbounds %struct.DState, %struct.DState* %4808, i32 0, i32 14
  store i32 %4807, i32* %4809, align 4
  %4810 = load %struct.DState*, %struct.DState** %2, align 8
  %4811 = getelementptr inbounds %struct.DState, %struct.DState* %4810, i32 0, i32 17
  store i32 0, i32* %4811, align 4
  %4812 = load %struct.DState*, %struct.DState** %2, align 8
  %4813 = getelementptr inbounds %struct.DState, %struct.DState* %4812, i32 0, i32 4
  %4814 = load i8, i8* %4813, align 4
  %4815 = icmp ne i8 %4814, 0
  br i1 %4815, label %4816, label %4887

; <label>:4816:                                   ; preds = %4797
  %4817 = load %struct.DState*, %struct.DState** %2, align 8
  %4818 = getelementptr inbounds %struct.DState, %struct.DState* %4817, i32 0, i32 5
  store i32 0, i32* %4818, align 8
  %4819 = load %struct.DState*, %struct.DState** %2, align 8
  %4820 = getelementptr inbounds %struct.DState, %struct.DState* %4819, i32 0, i32 6
  store i32 0, i32* %4820, align 4
  %4821 = load %struct.DState*, %struct.DState** %2, align 8
  %4822 = getelementptr inbounds %struct.DState, %struct.DState* %4821, i32 0, i32 20
  %4823 = load i32*, i32** %4822, align 8
  %4824 = load %struct.DState*, %struct.DState** %2, align 8
  %4825 = getelementptr inbounds %struct.DState, %struct.DState* %4824, i32 0, i32 14
  %4826 = load i32, i32* %4825, align 4
  %4827 = zext i32 %4826 to i64
  %4828 = getelementptr inbounds i32, i32* %4823, i64 %4827
  %4829 = load i32, i32* %4828, align 4
  %4830 = load %struct.DState*, %struct.DState** %2, align 8
  %4831 = getelementptr inbounds %struct.DState, %struct.DState* %4830, i32 0, i32 14
  store i32 %4829, i32* %4831, align 4
  %4832 = load %struct.DState*, %struct.DState** %2, align 8
  %4833 = getelementptr inbounds %struct.DState, %struct.DState* %4832, i32 0, i32 14
  %4834 = load i32, i32* %4833, align 4
  %4835 = and i32 %4834, 255
  %4836 = trunc i32 %4835 to i8
  %4837 = zext i8 %4836 to i32
  %4838 = load %struct.DState*, %struct.DState** %2, align 8
  %4839 = getelementptr inbounds %struct.DState, %struct.DState* %4838, i32 0, i32 15
  store i32 %4837, i32* %4839, align 8
  %4840 = load %struct.DState*, %struct.DState** %2, align 8
  %4841 = getelementptr inbounds %struct.DState, %struct.DState* %4840, i32 0, i32 14
  %4842 = load i32, i32* %4841, align 4
  %4843 = lshr i32 %4842, 8
  store i32 %4843, i32* %4841, align 4
  %4844 = load %struct.DState*, %struct.DState** %2, align 8
  %4845 = getelementptr inbounds %struct.DState, %struct.DState* %4844, i32 0, i32 17
  %4846 = load i32, i32* %4845, align 4
  %4847 = add nsw i32 %4846, 1
  store i32 %4847, i32* %4845, align 4
  %4848 = load %struct.DState*, %struct.DState** %2, align 8
  %4849 = getelementptr inbounds %struct.DState, %struct.DState* %4848, i32 0, i32 5
  %4850 = load i32, i32* %4849, align 8
  %4851 = icmp eq i32 %4850, 0
  br i1 %4851, label %4852, label %4873

; <label>:4852:                                   ; preds = %4816
  %4853 = load %struct.DState*, %struct.DState** %2, align 8
  %4854 = getelementptr inbounds %struct.DState, %struct.DState* %4853, i32 0, i32 6
  %4855 = load i32, i32* %4854, align 4
  %4856 = sext i32 %4855 to i64
  %4857 = getelementptr inbounds [512 x i32], [512 x i32]* @BZ2_rNums, i64 0, i64 %4856
  %4858 = load i32, i32* %4857, align 4
  %4859 = load %struct.DState*, %struct.DState** %2, align 8
  %4860 = getelementptr inbounds %struct.DState, %struct.DState* %4859, i32 0, i32 5
  store i32 %4858, i32* %4860, align 8
  %4861 = load %struct.DState*, %struct.DState** %2, align 8
  %4862 = getelementptr inbounds %struct.DState, %struct.DState* %4861, i32 0, i32 6
  %4863 = load i32, i32* %4862, align 4
  %4864 = add nsw i32 %4863, 1
  store i32 %4864, i32* %4862, align 4
  %4865 = load %struct.DState*, %struct.DState** %2, align 8
  %4866 = getelementptr inbounds %struct.DState, %struct.DState* %4865, i32 0, i32 6
  %4867 = load i32, i32* %4866, align 4
  %4868 = icmp eq i32 %4867, 512
  br i1 %4868, label %4869, label %4872

; <label>:4869:                                   ; preds = %4852
  %4870 = load %struct.DState*, %struct.DState** %2, align 8
  %4871 = getelementptr inbounds %struct.DState, %struct.DState* %4870, i32 0, i32 6
  store i32 0, i32* %4871, align 4
  br label %4872

; <label>:4872:                                   ; preds = %4869, %4852
  br label %4873

; <label>:4873:                                   ; preds = %4872, %4816
  %4874 = load %struct.DState*, %struct.DState** %2, align 8
  %4875 = getelementptr inbounds %struct.DState, %struct.DState* %4874, i32 0, i32 5
  %4876 = load i32, i32* %4875, align 8
  %4877 = add nsw i32 %4876, -1
  store i32 %4877, i32* %4875, align 8
  %4878 = load %struct.DState*, %struct.DState** %2, align 8
  %4879 = getelementptr inbounds %struct.DState, %struct.DState* %4878, i32 0, i32 5
  %4880 = load i32, i32* %4879, align 8
  %4881 = icmp eq i32 %4880, 1
  %4882 = select i1 %4881, i32 1, i32 0
  %4883 = load %struct.DState*, %struct.DState** %2, align 8
  %4884 = getelementptr inbounds %struct.DState, %struct.DState* %4883, i32 0, i32 15
  %4885 = load i32, i32* %4884, align 8
  %4886 = xor i32 %4885, %4882
  store i32 %4886, i32* %4884, align 8
  br label %4915

; <label>:4887:                                   ; preds = %4797
  %4888 = load %struct.DState*, %struct.DState** %2, align 8
  %4889 = getelementptr inbounds %struct.DState, %struct.DState* %4888, i32 0, i32 20
  %4890 = load i32*, i32** %4889, align 8
  %4891 = load %struct.DState*, %struct.DState** %2, align 8
  %4892 = getelementptr inbounds %struct.DState, %struct.DState* %4891, i32 0, i32 14
  %4893 = load i32, i32* %4892, align 4
  %4894 = zext i32 %4893 to i64
  %4895 = getelementptr inbounds i32, i32* %4890, i64 %4894
  %4896 = load i32, i32* %4895, align 4
  %4897 = load %struct.DState*, %struct.DState** %2, align 8
  %4898 = getelementptr inbounds %struct.DState, %struct.DState* %4897, i32 0, i32 14
  store i32 %4896, i32* %4898, align 4
  %4899 = load %struct.DState*, %struct.DState** %2, align 8
  %4900 = getelementptr inbounds %struct.DState, %struct.DState* %4899, i32 0, i32 14
  %4901 = load i32, i32* %4900, align 4
  %4902 = and i32 %4901, 255
  %4903 = trunc i32 %4902 to i8
  %4904 = zext i8 %4903 to i32
  %4905 = load %struct.DState*, %struct.DState** %2, align 8
  %4906 = getelementptr inbounds %struct.DState, %struct.DState* %4905, i32 0, i32 15
  store i32 %4904, i32* %4906, align 8
  %4907 = load %struct.DState*, %struct.DState** %2, align 8
  %4908 = getelementptr inbounds %struct.DState, %struct.DState* %4907, i32 0, i32 14
  %4909 = load i32, i32* %4908, align 4
  %4910 = lshr i32 %4909, 8
  store i32 %4910, i32* %4908, align 4
  %4911 = load %struct.DState*, %struct.DState** %2, align 8
  %4912 = getelementptr inbounds %struct.DState, %struct.DState* %4911, i32 0, i32 17
  %4913 = load i32, i32* %4912, align 4
  %4914 = add nsw i32 %4913, 1
  store i32 %4914, i32* %4912, align 4
  br label %4915

; <label>:4915:                                   ; preds = %4887, %4873
  br label %4916

; <label>:4916:                                   ; preds = %4915, %4756
  store i32 0, i32* %4, align 4
  br label %5741

; <label>:4917:                                   ; preds = %750
  br label %4918

; <label>:4918:                                   ; preds = %4917, %144
  %4919 = load %struct.DState*, %struct.DState** %2, align 8
  %4920 = getelementptr inbounds %struct.DState, %struct.DState* %4919, i32 0, i32 1
  store i32 42, i32* %4920, align 8
  br label %4921

; <label>:4921:                                   ; preds = %5000, %4918
  %4922 = load %struct.DState*, %struct.DState** %2, align 8
  %4923 = getelementptr inbounds %struct.DState, %struct.DState* %4922, i32 0, i32 8
  %4924 = load i32, i32* %4923, align 4
  %4925 = icmp sge i32 %4924, 8
  br i1 %4925, label %4926, label %4942

; <label>:4926:                                   ; preds = %4921
  %4927 = load %struct.DState*, %struct.DState** %2, align 8
  %4928 = getelementptr inbounds %struct.DState, %struct.DState* %4927, i32 0, i32 7
  %4929 = load i32, i32* %4928, align 8
  %4930 = load %struct.DState*, %struct.DState** %2, align 8
  %4931 = getelementptr inbounds %struct.DState, %struct.DState* %4930, i32 0, i32 8
  %4932 = load i32, i32* %4931, align 4
  %4933 = sub nsw i32 %4932, 8
  %4934 = lshr i32 %4929, %4933
  %4935 = and i32 %4934, 255
  store i32 %4935, i32* %79, align 4
  %4936 = load %struct.DState*, %struct.DState** %2, align 8
  %4937 = getelementptr inbounds %struct.DState, %struct.DState* %4936, i32 0, i32 8
  %4938 = load i32, i32* %4937, align 4
  %4939 = sub nsw i32 %4938, 8
  store i32 %4939, i32* %4937, align 4
  %4940 = load i32, i32* %79, align 4
  %4941 = trunc i32 %4940 to i8
  store i8 %4941, i8* %3, align 1
  br label %5001

; <label>:4942:                                   ; preds = %4921
  %4943 = load %struct.DState*, %struct.DState** %2, align 8
  %4944 = getelementptr inbounds %struct.DState, %struct.DState* %4943, i32 0, i32 0
  %4945 = load %struct.bz_stream*, %struct.bz_stream** %4944, align 8
  %4946 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %4945, i32 0, i32 1
  %4947 = load i32, i32* %4946, align 8
  %4948 = icmp eq i32 %4947, 0
  br i1 %4948, label %4949, label %4950

; <label>:4949:                                   ; preds = %4942
  store i32 0, i32* %4, align 4
  br label %5741

; <label>:4950:                                   ; preds = %4942
  %4951 = load %struct.DState*, %struct.DState** %2, align 8
  %4952 = getelementptr inbounds %struct.DState, %struct.DState* %4951, i32 0, i32 7
  %4953 = load i32, i32* %4952, align 8
  %4954 = shl i32 %4953, 8
  %4955 = load %struct.DState*, %struct.DState** %2, align 8
  %4956 = getelementptr inbounds %struct.DState, %struct.DState* %4955, i32 0, i32 0
  %4957 = load %struct.bz_stream*, %struct.bz_stream** %4956, align 8
  %4958 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %4957, i32 0, i32 0
  %4959 = load i8*, i8** %4958, align 8
  %4960 = load i8, i8* %4959, align 1
  %4961 = zext i8 %4960 to i32
  %4962 = or i32 %4954, %4961
  %4963 = load %struct.DState*, %struct.DState** %2, align 8
  %4964 = getelementptr inbounds %struct.DState, %struct.DState* %4963, i32 0, i32 7
  store i32 %4962, i32* %4964, align 8
  %4965 = load %struct.DState*, %struct.DState** %2, align 8
  %4966 = getelementptr inbounds %struct.DState, %struct.DState* %4965, i32 0, i32 8
  %4967 = load i32, i32* %4966, align 4
  %4968 = add nsw i32 %4967, 8
  store i32 %4968, i32* %4966, align 4
  %4969 = load %struct.DState*, %struct.DState** %2, align 8
  %4970 = getelementptr inbounds %struct.DState, %struct.DState* %4969, i32 0, i32 0
  %4971 = load %struct.bz_stream*, %struct.bz_stream** %4970, align 8
  %4972 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %4971, i32 0, i32 0
  %4973 = load i8*, i8** %4972, align 8
  %4974 = getelementptr inbounds i8, i8* %4973, i32 1
  store i8* %4974, i8** %4972, align 8
  %4975 = load %struct.DState*, %struct.DState** %2, align 8
  %4976 = getelementptr inbounds %struct.DState, %struct.DState* %4975, i32 0, i32 0
  %4977 = load %struct.bz_stream*, %struct.bz_stream** %4976, align 8
  %4978 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %4977, i32 0, i32 1
  %4979 = load i32, i32* %4978, align 8
  %4980 = add i32 %4979, -1
  store i32 %4980, i32* %4978, align 8
  %4981 = load %struct.DState*, %struct.DState** %2, align 8
  %4982 = getelementptr inbounds %struct.DState, %struct.DState* %4981, i32 0, i32 0
  %4983 = load %struct.bz_stream*, %struct.bz_stream** %4982, align 8
  %4984 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %4983, i32 0, i32 2
  %4985 = load i32, i32* %4984, align 4
  %4986 = add i32 %4985, 1
  store i32 %4986, i32* %4984, align 4
  %4987 = load %struct.DState*, %struct.DState** %2, align 8
  %4988 = getelementptr inbounds %struct.DState, %struct.DState* %4987, i32 0, i32 0
  %4989 = load %struct.bz_stream*, %struct.bz_stream** %4988, align 8
  %4990 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %4989, i32 0, i32 2
  %4991 = load i32, i32* %4990, align 4
  %4992 = icmp eq i32 %4991, 0
  br i1 %4992, label %4993, label %5000

; <label>:4993:                                   ; preds = %4950
  %4994 = load %struct.DState*, %struct.DState** %2, align 8
  %4995 = getelementptr inbounds %struct.DState, %struct.DState* %4994, i32 0, i32 0
  %4996 = load %struct.bz_stream*, %struct.bz_stream** %4995, align 8
  %4997 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %4996, i32 0, i32 3
  %4998 = load i32, i32* %4997, align 8
  %4999 = add i32 %4998, 1
  store i32 %4999, i32* %4997, align 8
  br label %5000

; <label>:5000:                                   ; preds = %4993, %4950
  br label %4921

; <label>:5001:                                   ; preds = %4926
  %5002 = load i8, i8* %3, align 1
  %5003 = zext i8 %5002 to i32
  %5004 = icmp ne i32 %5003, 114
  br i1 %5004, label %5005, label %5006

; <label>:5005:                                   ; preds = %5001
  store i32 -4, i32* %4, align 4
  br label %5741

; <label>:5006:                                   ; preds = %5001
  br label %5007

; <label>:5007:                                   ; preds = %5006, %144
  %5008 = load %struct.DState*, %struct.DState** %2, align 8
  %5009 = getelementptr inbounds %struct.DState, %struct.DState* %5008, i32 0, i32 1
  store i32 43, i32* %5009, align 8
  br label %5010

; <label>:5010:                                   ; preds = %5089, %5007
  %5011 = load %struct.DState*, %struct.DState** %2, align 8
  %5012 = getelementptr inbounds %struct.DState, %struct.DState* %5011, i32 0, i32 8
  %5013 = load i32, i32* %5012, align 4
  %5014 = icmp sge i32 %5013, 8
  br i1 %5014, label %5015, label %5031

; <label>:5015:                                   ; preds = %5010
  %5016 = load %struct.DState*, %struct.DState** %2, align 8
  %5017 = getelementptr inbounds %struct.DState, %struct.DState* %5016, i32 0, i32 7
  %5018 = load i32, i32* %5017, align 8
  %5019 = load %struct.DState*, %struct.DState** %2, align 8
  %5020 = getelementptr inbounds %struct.DState, %struct.DState* %5019, i32 0, i32 8
  %5021 = load i32, i32* %5020, align 4
  %5022 = sub nsw i32 %5021, 8
  %5023 = lshr i32 %5018, %5022
  %5024 = and i32 %5023, 255
  store i32 %5024, i32* %80, align 4
  %5025 = load %struct.DState*, %struct.DState** %2, align 8
  %5026 = getelementptr inbounds %struct.DState, %struct.DState* %5025, i32 0, i32 8
  %5027 = load i32, i32* %5026, align 4
  %5028 = sub nsw i32 %5027, 8
  store i32 %5028, i32* %5026, align 4
  %5029 = load i32, i32* %80, align 4
  %5030 = trunc i32 %5029 to i8
  store i8 %5030, i8* %3, align 1
  br label %5090

; <label>:5031:                                   ; preds = %5010
  %5032 = load %struct.DState*, %struct.DState** %2, align 8
  %5033 = getelementptr inbounds %struct.DState, %struct.DState* %5032, i32 0, i32 0
  %5034 = load %struct.bz_stream*, %struct.bz_stream** %5033, align 8
  %5035 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5034, i32 0, i32 1
  %5036 = load i32, i32* %5035, align 8
  %5037 = icmp eq i32 %5036, 0
  br i1 %5037, label %5038, label %5039

; <label>:5038:                                   ; preds = %5031
  store i32 0, i32* %4, align 4
  br label %5741

; <label>:5039:                                   ; preds = %5031
  %5040 = load %struct.DState*, %struct.DState** %2, align 8
  %5041 = getelementptr inbounds %struct.DState, %struct.DState* %5040, i32 0, i32 7
  %5042 = load i32, i32* %5041, align 8
  %5043 = shl i32 %5042, 8
  %5044 = load %struct.DState*, %struct.DState** %2, align 8
  %5045 = getelementptr inbounds %struct.DState, %struct.DState* %5044, i32 0, i32 0
  %5046 = load %struct.bz_stream*, %struct.bz_stream** %5045, align 8
  %5047 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5046, i32 0, i32 0
  %5048 = load i8*, i8** %5047, align 8
  %5049 = load i8, i8* %5048, align 1
  %5050 = zext i8 %5049 to i32
  %5051 = or i32 %5043, %5050
  %5052 = load %struct.DState*, %struct.DState** %2, align 8
  %5053 = getelementptr inbounds %struct.DState, %struct.DState* %5052, i32 0, i32 7
  store i32 %5051, i32* %5053, align 8
  %5054 = load %struct.DState*, %struct.DState** %2, align 8
  %5055 = getelementptr inbounds %struct.DState, %struct.DState* %5054, i32 0, i32 8
  %5056 = load i32, i32* %5055, align 4
  %5057 = add nsw i32 %5056, 8
  store i32 %5057, i32* %5055, align 4
  %5058 = load %struct.DState*, %struct.DState** %2, align 8
  %5059 = getelementptr inbounds %struct.DState, %struct.DState* %5058, i32 0, i32 0
  %5060 = load %struct.bz_stream*, %struct.bz_stream** %5059, align 8
  %5061 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5060, i32 0, i32 0
  %5062 = load i8*, i8** %5061, align 8
  %5063 = getelementptr inbounds i8, i8* %5062, i32 1
  store i8* %5063, i8** %5061, align 8
  %5064 = load %struct.DState*, %struct.DState** %2, align 8
  %5065 = getelementptr inbounds %struct.DState, %struct.DState* %5064, i32 0, i32 0
  %5066 = load %struct.bz_stream*, %struct.bz_stream** %5065, align 8
  %5067 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5066, i32 0, i32 1
  %5068 = load i32, i32* %5067, align 8
  %5069 = add i32 %5068, -1
  store i32 %5069, i32* %5067, align 8
  %5070 = load %struct.DState*, %struct.DState** %2, align 8
  %5071 = getelementptr inbounds %struct.DState, %struct.DState* %5070, i32 0, i32 0
  %5072 = load %struct.bz_stream*, %struct.bz_stream** %5071, align 8
  %5073 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5072, i32 0, i32 2
  %5074 = load i32, i32* %5073, align 4
  %5075 = add i32 %5074, 1
  store i32 %5075, i32* %5073, align 4
  %5076 = load %struct.DState*, %struct.DState** %2, align 8
  %5077 = getelementptr inbounds %struct.DState, %struct.DState* %5076, i32 0, i32 0
  %5078 = load %struct.bz_stream*, %struct.bz_stream** %5077, align 8
  %5079 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5078, i32 0, i32 2
  %5080 = load i32, i32* %5079, align 4
  %5081 = icmp eq i32 %5080, 0
  br i1 %5081, label %5082, label %5089

; <label>:5082:                                   ; preds = %5039
  %5083 = load %struct.DState*, %struct.DState** %2, align 8
  %5084 = getelementptr inbounds %struct.DState, %struct.DState* %5083, i32 0, i32 0
  %5085 = load %struct.bz_stream*, %struct.bz_stream** %5084, align 8
  %5086 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5085, i32 0, i32 3
  %5087 = load i32, i32* %5086, align 8
  %5088 = add i32 %5087, 1
  store i32 %5088, i32* %5086, align 8
  br label %5089

; <label>:5089:                                   ; preds = %5082, %5039
  br label %5010

; <label>:5090:                                   ; preds = %5015
  %5091 = load i8, i8* %3, align 1
  %5092 = zext i8 %5091 to i32
  %5093 = icmp ne i32 %5092, 69
  br i1 %5093, label %5094, label %5095

; <label>:5094:                                   ; preds = %5090
  store i32 -4, i32* %4, align 4
  br label %5741

; <label>:5095:                                   ; preds = %5090
  br label %5096

; <label>:5096:                                   ; preds = %5095, %144
  %5097 = load %struct.DState*, %struct.DState** %2, align 8
  %5098 = getelementptr inbounds %struct.DState, %struct.DState* %5097, i32 0, i32 1
  store i32 44, i32* %5098, align 8
  br label %5099

; <label>:5099:                                   ; preds = %5178, %5096
  %5100 = load %struct.DState*, %struct.DState** %2, align 8
  %5101 = getelementptr inbounds %struct.DState, %struct.DState* %5100, i32 0, i32 8
  %5102 = load i32, i32* %5101, align 4
  %5103 = icmp sge i32 %5102, 8
  br i1 %5103, label %5104, label %5120

; <label>:5104:                                   ; preds = %5099
  %5105 = load %struct.DState*, %struct.DState** %2, align 8
  %5106 = getelementptr inbounds %struct.DState, %struct.DState* %5105, i32 0, i32 7
  %5107 = load i32, i32* %5106, align 8
  %5108 = load %struct.DState*, %struct.DState** %2, align 8
  %5109 = getelementptr inbounds %struct.DState, %struct.DState* %5108, i32 0, i32 8
  %5110 = load i32, i32* %5109, align 4
  %5111 = sub nsw i32 %5110, 8
  %5112 = lshr i32 %5107, %5111
  %5113 = and i32 %5112, 255
  store i32 %5113, i32* %81, align 4
  %5114 = load %struct.DState*, %struct.DState** %2, align 8
  %5115 = getelementptr inbounds %struct.DState, %struct.DState* %5114, i32 0, i32 8
  %5116 = load i32, i32* %5115, align 4
  %5117 = sub nsw i32 %5116, 8
  store i32 %5117, i32* %5115, align 4
  %5118 = load i32, i32* %81, align 4
  %5119 = trunc i32 %5118 to i8
  store i8 %5119, i8* %3, align 1
  br label %5179

; <label>:5120:                                   ; preds = %5099
  %5121 = load %struct.DState*, %struct.DState** %2, align 8
  %5122 = getelementptr inbounds %struct.DState, %struct.DState* %5121, i32 0, i32 0
  %5123 = load %struct.bz_stream*, %struct.bz_stream** %5122, align 8
  %5124 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5123, i32 0, i32 1
  %5125 = load i32, i32* %5124, align 8
  %5126 = icmp eq i32 %5125, 0
  br i1 %5126, label %5127, label %5128

; <label>:5127:                                   ; preds = %5120
  store i32 0, i32* %4, align 4
  br label %5741

; <label>:5128:                                   ; preds = %5120
  %5129 = load %struct.DState*, %struct.DState** %2, align 8
  %5130 = getelementptr inbounds %struct.DState, %struct.DState* %5129, i32 0, i32 7
  %5131 = load i32, i32* %5130, align 8
  %5132 = shl i32 %5131, 8
  %5133 = load %struct.DState*, %struct.DState** %2, align 8
  %5134 = getelementptr inbounds %struct.DState, %struct.DState* %5133, i32 0, i32 0
  %5135 = load %struct.bz_stream*, %struct.bz_stream** %5134, align 8
  %5136 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5135, i32 0, i32 0
  %5137 = load i8*, i8** %5136, align 8
  %5138 = load i8, i8* %5137, align 1
  %5139 = zext i8 %5138 to i32
  %5140 = or i32 %5132, %5139
  %5141 = load %struct.DState*, %struct.DState** %2, align 8
  %5142 = getelementptr inbounds %struct.DState, %struct.DState* %5141, i32 0, i32 7
  store i32 %5140, i32* %5142, align 8
  %5143 = load %struct.DState*, %struct.DState** %2, align 8
  %5144 = getelementptr inbounds %struct.DState, %struct.DState* %5143, i32 0, i32 8
  %5145 = load i32, i32* %5144, align 4
  %5146 = add nsw i32 %5145, 8
  store i32 %5146, i32* %5144, align 4
  %5147 = load %struct.DState*, %struct.DState** %2, align 8
  %5148 = getelementptr inbounds %struct.DState, %struct.DState* %5147, i32 0, i32 0
  %5149 = load %struct.bz_stream*, %struct.bz_stream** %5148, align 8
  %5150 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5149, i32 0, i32 0
  %5151 = load i8*, i8** %5150, align 8
  %5152 = getelementptr inbounds i8, i8* %5151, i32 1
  store i8* %5152, i8** %5150, align 8
  %5153 = load %struct.DState*, %struct.DState** %2, align 8
  %5154 = getelementptr inbounds %struct.DState, %struct.DState* %5153, i32 0, i32 0
  %5155 = load %struct.bz_stream*, %struct.bz_stream** %5154, align 8
  %5156 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5155, i32 0, i32 1
  %5157 = load i32, i32* %5156, align 8
  %5158 = add i32 %5157, -1
  store i32 %5158, i32* %5156, align 8
  %5159 = load %struct.DState*, %struct.DState** %2, align 8
  %5160 = getelementptr inbounds %struct.DState, %struct.DState* %5159, i32 0, i32 0
  %5161 = load %struct.bz_stream*, %struct.bz_stream** %5160, align 8
  %5162 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5161, i32 0, i32 2
  %5163 = load i32, i32* %5162, align 4
  %5164 = add i32 %5163, 1
  store i32 %5164, i32* %5162, align 4
  %5165 = load %struct.DState*, %struct.DState** %2, align 8
  %5166 = getelementptr inbounds %struct.DState, %struct.DState* %5165, i32 0, i32 0
  %5167 = load %struct.bz_stream*, %struct.bz_stream** %5166, align 8
  %5168 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5167, i32 0, i32 2
  %5169 = load i32, i32* %5168, align 4
  %5170 = icmp eq i32 %5169, 0
  br i1 %5170, label %5171, label %5178

; <label>:5171:                                   ; preds = %5128
  %5172 = load %struct.DState*, %struct.DState** %2, align 8
  %5173 = getelementptr inbounds %struct.DState, %struct.DState* %5172, i32 0, i32 0
  %5174 = load %struct.bz_stream*, %struct.bz_stream** %5173, align 8
  %5175 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5174, i32 0, i32 3
  %5176 = load i32, i32* %5175, align 8
  %5177 = add i32 %5176, 1
  store i32 %5177, i32* %5175, align 8
  br label %5178

; <label>:5178:                                   ; preds = %5171, %5128
  br label %5099

; <label>:5179:                                   ; preds = %5104
  %5180 = load i8, i8* %3, align 1
  %5181 = zext i8 %5180 to i32
  %5182 = icmp ne i32 %5181, 56
  br i1 %5182, label %5183, label %5184

; <label>:5183:                                   ; preds = %5179
  store i32 -4, i32* %4, align 4
  br label %5741

; <label>:5184:                                   ; preds = %5179
  br label %5185

; <label>:5185:                                   ; preds = %5184, %144
  %5186 = load %struct.DState*, %struct.DState** %2, align 8
  %5187 = getelementptr inbounds %struct.DState, %struct.DState* %5186, i32 0, i32 1
  store i32 45, i32* %5187, align 8
  br label %5188

; <label>:5188:                                   ; preds = %5267, %5185
  %5189 = load %struct.DState*, %struct.DState** %2, align 8
  %5190 = getelementptr inbounds %struct.DState, %struct.DState* %5189, i32 0, i32 8
  %5191 = load i32, i32* %5190, align 4
  %5192 = icmp sge i32 %5191, 8
  br i1 %5192, label %5193, label %5209

; <label>:5193:                                   ; preds = %5188
  %5194 = load %struct.DState*, %struct.DState** %2, align 8
  %5195 = getelementptr inbounds %struct.DState, %struct.DState* %5194, i32 0, i32 7
  %5196 = load i32, i32* %5195, align 8
  %5197 = load %struct.DState*, %struct.DState** %2, align 8
  %5198 = getelementptr inbounds %struct.DState, %struct.DState* %5197, i32 0, i32 8
  %5199 = load i32, i32* %5198, align 4
  %5200 = sub nsw i32 %5199, 8
  %5201 = lshr i32 %5196, %5200
  %5202 = and i32 %5201, 255
  store i32 %5202, i32* %82, align 4
  %5203 = load %struct.DState*, %struct.DState** %2, align 8
  %5204 = getelementptr inbounds %struct.DState, %struct.DState* %5203, i32 0, i32 8
  %5205 = load i32, i32* %5204, align 4
  %5206 = sub nsw i32 %5205, 8
  store i32 %5206, i32* %5204, align 4
  %5207 = load i32, i32* %82, align 4
  %5208 = trunc i32 %5207 to i8
  store i8 %5208, i8* %3, align 1
  br label %5268

; <label>:5209:                                   ; preds = %5188
  %5210 = load %struct.DState*, %struct.DState** %2, align 8
  %5211 = getelementptr inbounds %struct.DState, %struct.DState* %5210, i32 0, i32 0
  %5212 = load %struct.bz_stream*, %struct.bz_stream** %5211, align 8
  %5213 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5212, i32 0, i32 1
  %5214 = load i32, i32* %5213, align 8
  %5215 = icmp eq i32 %5214, 0
  br i1 %5215, label %5216, label %5217

; <label>:5216:                                   ; preds = %5209
  store i32 0, i32* %4, align 4
  br label %5741

; <label>:5217:                                   ; preds = %5209
  %5218 = load %struct.DState*, %struct.DState** %2, align 8
  %5219 = getelementptr inbounds %struct.DState, %struct.DState* %5218, i32 0, i32 7
  %5220 = load i32, i32* %5219, align 8
  %5221 = shl i32 %5220, 8
  %5222 = load %struct.DState*, %struct.DState** %2, align 8
  %5223 = getelementptr inbounds %struct.DState, %struct.DState* %5222, i32 0, i32 0
  %5224 = load %struct.bz_stream*, %struct.bz_stream** %5223, align 8
  %5225 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5224, i32 0, i32 0
  %5226 = load i8*, i8** %5225, align 8
  %5227 = load i8, i8* %5226, align 1
  %5228 = zext i8 %5227 to i32
  %5229 = or i32 %5221, %5228
  %5230 = load %struct.DState*, %struct.DState** %2, align 8
  %5231 = getelementptr inbounds %struct.DState, %struct.DState* %5230, i32 0, i32 7
  store i32 %5229, i32* %5231, align 8
  %5232 = load %struct.DState*, %struct.DState** %2, align 8
  %5233 = getelementptr inbounds %struct.DState, %struct.DState* %5232, i32 0, i32 8
  %5234 = load i32, i32* %5233, align 4
  %5235 = add nsw i32 %5234, 8
  store i32 %5235, i32* %5233, align 4
  %5236 = load %struct.DState*, %struct.DState** %2, align 8
  %5237 = getelementptr inbounds %struct.DState, %struct.DState* %5236, i32 0, i32 0
  %5238 = load %struct.bz_stream*, %struct.bz_stream** %5237, align 8
  %5239 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5238, i32 0, i32 0
  %5240 = load i8*, i8** %5239, align 8
  %5241 = getelementptr inbounds i8, i8* %5240, i32 1
  store i8* %5241, i8** %5239, align 8
  %5242 = load %struct.DState*, %struct.DState** %2, align 8
  %5243 = getelementptr inbounds %struct.DState, %struct.DState* %5242, i32 0, i32 0
  %5244 = load %struct.bz_stream*, %struct.bz_stream** %5243, align 8
  %5245 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5244, i32 0, i32 1
  %5246 = load i32, i32* %5245, align 8
  %5247 = add i32 %5246, -1
  store i32 %5247, i32* %5245, align 8
  %5248 = load %struct.DState*, %struct.DState** %2, align 8
  %5249 = getelementptr inbounds %struct.DState, %struct.DState* %5248, i32 0, i32 0
  %5250 = load %struct.bz_stream*, %struct.bz_stream** %5249, align 8
  %5251 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5250, i32 0, i32 2
  %5252 = load i32, i32* %5251, align 4
  %5253 = add i32 %5252, 1
  store i32 %5253, i32* %5251, align 4
  %5254 = load %struct.DState*, %struct.DState** %2, align 8
  %5255 = getelementptr inbounds %struct.DState, %struct.DState* %5254, i32 0, i32 0
  %5256 = load %struct.bz_stream*, %struct.bz_stream** %5255, align 8
  %5257 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5256, i32 0, i32 2
  %5258 = load i32, i32* %5257, align 4
  %5259 = icmp eq i32 %5258, 0
  br i1 %5259, label %5260, label %5267

; <label>:5260:                                   ; preds = %5217
  %5261 = load %struct.DState*, %struct.DState** %2, align 8
  %5262 = getelementptr inbounds %struct.DState, %struct.DState* %5261, i32 0, i32 0
  %5263 = load %struct.bz_stream*, %struct.bz_stream** %5262, align 8
  %5264 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5263, i32 0, i32 3
  %5265 = load i32, i32* %5264, align 8
  %5266 = add i32 %5265, 1
  store i32 %5266, i32* %5264, align 8
  br label %5267

; <label>:5267:                                   ; preds = %5260, %5217
  br label %5188

; <label>:5268:                                   ; preds = %5193
  %5269 = load i8, i8* %3, align 1
  %5270 = zext i8 %5269 to i32
  %5271 = icmp ne i32 %5270, 80
  br i1 %5271, label %5272, label %5273

; <label>:5272:                                   ; preds = %5268
  store i32 -4, i32* %4, align 4
  br label %5741

; <label>:5273:                                   ; preds = %5268
  br label %5274

; <label>:5274:                                   ; preds = %5273, %144
  %5275 = load %struct.DState*, %struct.DState** %2, align 8
  %5276 = getelementptr inbounds %struct.DState, %struct.DState* %5275, i32 0, i32 1
  store i32 46, i32* %5276, align 8
  br label %5277

; <label>:5277:                                   ; preds = %5356, %5274
  %5278 = load %struct.DState*, %struct.DState** %2, align 8
  %5279 = getelementptr inbounds %struct.DState, %struct.DState* %5278, i32 0, i32 8
  %5280 = load i32, i32* %5279, align 4
  %5281 = icmp sge i32 %5280, 8
  br i1 %5281, label %5282, label %5298

; <label>:5282:                                   ; preds = %5277
  %5283 = load %struct.DState*, %struct.DState** %2, align 8
  %5284 = getelementptr inbounds %struct.DState, %struct.DState* %5283, i32 0, i32 7
  %5285 = load i32, i32* %5284, align 8
  %5286 = load %struct.DState*, %struct.DState** %2, align 8
  %5287 = getelementptr inbounds %struct.DState, %struct.DState* %5286, i32 0, i32 8
  %5288 = load i32, i32* %5287, align 4
  %5289 = sub nsw i32 %5288, 8
  %5290 = lshr i32 %5285, %5289
  %5291 = and i32 %5290, 255
  store i32 %5291, i32* %83, align 4
  %5292 = load %struct.DState*, %struct.DState** %2, align 8
  %5293 = getelementptr inbounds %struct.DState, %struct.DState* %5292, i32 0, i32 8
  %5294 = load i32, i32* %5293, align 4
  %5295 = sub nsw i32 %5294, 8
  store i32 %5295, i32* %5293, align 4
  %5296 = load i32, i32* %83, align 4
  %5297 = trunc i32 %5296 to i8
  store i8 %5297, i8* %3, align 1
  br label %5357

; <label>:5298:                                   ; preds = %5277
  %5299 = load %struct.DState*, %struct.DState** %2, align 8
  %5300 = getelementptr inbounds %struct.DState, %struct.DState* %5299, i32 0, i32 0
  %5301 = load %struct.bz_stream*, %struct.bz_stream** %5300, align 8
  %5302 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5301, i32 0, i32 1
  %5303 = load i32, i32* %5302, align 8
  %5304 = icmp eq i32 %5303, 0
  br i1 %5304, label %5305, label %5306

; <label>:5305:                                   ; preds = %5298
  store i32 0, i32* %4, align 4
  br label %5741

; <label>:5306:                                   ; preds = %5298
  %5307 = load %struct.DState*, %struct.DState** %2, align 8
  %5308 = getelementptr inbounds %struct.DState, %struct.DState* %5307, i32 0, i32 7
  %5309 = load i32, i32* %5308, align 8
  %5310 = shl i32 %5309, 8
  %5311 = load %struct.DState*, %struct.DState** %2, align 8
  %5312 = getelementptr inbounds %struct.DState, %struct.DState* %5311, i32 0, i32 0
  %5313 = load %struct.bz_stream*, %struct.bz_stream** %5312, align 8
  %5314 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5313, i32 0, i32 0
  %5315 = load i8*, i8** %5314, align 8
  %5316 = load i8, i8* %5315, align 1
  %5317 = zext i8 %5316 to i32
  %5318 = or i32 %5310, %5317
  %5319 = load %struct.DState*, %struct.DState** %2, align 8
  %5320 = getelementptr inbounds %struct.DState, %struct.DState* %5319, i32 0, i32 7
  store i32 %5318, i32* %5320, align 8
  %5321 = load %struct.DState*, %struct.DState** %2, align 8
  %5322 = getelementptr inbounds %struct.DState, %struct.DState* %5321, i32 0, i32 8
  %5323 = load i32, i32* %5322, align 4
  %5324 = add nsw i32 %5323, 8
  store i32 %5324, i32* %5322, align 4
  %5325 = load %struct.DState*, %struct.DState** %2, align 8
  %5326 = getelementptr inbounds %struct.DState, %struct.DState* %5325, i32 0, i32 0
  %5327 = load %struct.bz_stream*, %struct.bz_stream** %5326, align 8
  %5328 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5327, i32 0, i32 0
  %5329 = load i8*, i8** %5328, align 8
  %5330 = getelementptr inbounds i8, i8* %5329, i32 1
  store i8* %5330, i8** %5328, align 8
  %5331 = load %struct.DState*, %struct.DState** %2, align 8
  %5332 = getelementptr inbounds %struct.DState, %struct.DState* %5331, i32 0, i32 0
  %5333 = load %struct.bz_stream*, %struct.bz_stream** %5332, align 8
  %5334 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5333, i32 0, i32 1
  %5335 = load i32, i32* %5334, align 8
  %5336 = add i32 %5335, -1
  store i32 %5336, i32* %5334, align 8
  %5337 = load %struct.DState*, %struct.DState** %2, align 8
  %5338 = getelementptr inbounds %struct.DState, %struct.DState* %5337, i32 0, i32 0
  %5339 = load %struct.bz_stream*, %struct.bz_stream** %5338, align 8
  %5340 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5339, i32 0, i32 2
  %5341 = load i32, i32* %5340, align 4
  %5342 = add i32 %5341, 1
  store i32 %5342, i32* %5340, align 4
  %5343 = load %struct.DState*, %struct.DState** %2, align 8
  %5344 = getelementptr inbounds %struct.DState, %struct.DState* %5343, i32 0, i32 0
  %5345 = load %struct.bz_stream*, %struct.bz_stream** %5344, align 8
  %5346 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5345, i32 0, i32 2
  %5347 = load i32, i32* %5346, align 4
  %5348 = icmp eq i32 %5347, 0
  br i1 %5348, label %5349, label %5356

; <label>:5349:                                   ; preds = %5306
  %5350 = load %struct.DState*, %struct.DState** %2, align 8
  %5351 = getelementptr inbounds %struct.DState, %struct.DState* %5350, i32 0, i32 0
  %5352 = load %struct.bz_stream*, %struct.bz_stream** %5351, align 8
  %5353 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5352, i32 0, i32 3
  %5354 = load i32, i32* %5353, align 8
  %5355 = add i32 %5354, 1
  store i32 %5355, i32* %5353, align 8
  br label %5356

; <label>:5356:                                   ; preds = %5349, %5306
  br label %5277

; <label>:5357:                                   ; preds = %5282
  %5358 = load i8, i8* %3, align 1
  %5359 = zext i8 %5358 to i32
  %5360 = icmp ne i32 %5359, 144
  br i1 %5360, label %5361, label %5362

; <label>:5361:                                   ; preds = %5357
  store i32 -4, i32* %4, align 4
  br label %5741

; <label>:5362:                                   ; preds = %5357
  %5363 = load %struct.DState*, %struct.DState** %2, align 8
  %5364 = getelementptr inbounds %struct.DState, %struct.DState* %5363, i32 0, i32 24
  store i32 0, i32* %5364, align 4
  br label %5365

; <label>:5365:                                   ; preds = %5362, %144
  %5366 = load %struct.DState*, %struct.DState** %2, align 8
  %5367 = getelementptr inbounds %struct.DState, %struct.DState* %5366, i32 0, i32 1
  store i32 47, i32* %5367, align 8
  br label %5368

; <label>:5368:                                   ; preds = %5447, %5365
  %5369 = load %struct.DState*, %struct.DState** %2, align 8
  %5370 = getelementptr inbounds %struct.DState, %struct.DState* %5369, i32 0, i32 8
  %5371 = load i32, i32* %5370, align 4
  %5372 = icmp sge i32 %5371, 8
  br i1 %5372, label %5373, label %5389

; <label>:5373:                                   ; preds = %5368
  %5374 = load %struct.DState*, %struct.DState** %2, align 8
  %5375 = getelementptr inbounds %struct.DState, %struct.DState* %5374, i32 0, i32 7
  %5376 = load i32, i32* %5375, align 8
  %5377 = load %struct.DState*, %struct.DState** %2, align 8
  %5378 = getelementptr inbounds %struct.DState, %struct.DState* %5377, i32 0, i32 8
  %5379 = load i32, i32* %5378, align 4
  %5380 = sub nsw i32 %5379, 8
  %5381 = lshr i32 %5376, %5380
  %5382 = and i32 %5381, 255
  store i32 %5382, i32* %84, align 4
  %5383 = load %struct.DState*, %struct.DState** %2, align 8
  %5384 = getelementptr inbounds %struct.DState, %struct.DState* %5383, i32 0, i32 8
  %5385 = load i32, i32* %5384, align 4
  %5386 = sub nsw i32 %5385, 8
  store i32 %5386, i32* %5384, align 4
  %5387 = load i32, i32* %84, align 4
  %5388 = trunc i32 %5387 to i8
  store i8 %5388, i8* %3, align 1
  br label %5448

; <label>:5389:                                   ; preds = %5368
  %5390 = load %struct.DState*, %struct.DState** %2, align 8
  %5391 = getelementptr inbounds %struct.DState, %struct.DState* %5390, i32 0, i32 0
  %5392 = load %struct.bz_stream*, %struct.bz_stream** %5391, align 8
  %5393 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5392, i32 0, i32 1
  %5394 = load i32, i32* %5393, align 8
  %5395 = icmp eq i32 %5394, 0
  br i1 %5395, label %5396, label %5397

; <label>:5396:                                   ; preds = %5389
  store i32 0, i32* %4, align 4
  br label %5741

; <label>:5397:                                   ; preds = %5389
  %5398 = load %struct.DState*, %struct.DState** %2, align 8
  %5399 = getelementptr inbounds %struct.DState, %struct.DState* %5398, i32 0, i32 7
  %5400 = load i32, i32* %5399, align 8
  %5401 = shl i32 %5400, 8
  %5402 = load %struct.DState*, %struct.DState** %2, align 8
  %5403 = getelementptr inbounds %struct.DState, %struct.DState* %5402, i32 0, i32 0
  %5404 = load %struct.bz_stream*, %struct.bz_stream** %5403, align 8
  %5405 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5404, i32 0, i32 0
  %5406 = load i8*, i8** %5405, align 8
  %5407 = load i8, i8* %5406, align 1
  %5408 = zext i8 %5407 to i32
  %5409 = or i32 %5401, %5408
  %5410 = load %struct.DState*, %struct.DState** %2, align 8
  %5411 = getelementptr inbounds %struct.DState, %struct.DState* %5410, i32 0, i32 7
  store i32 %5409, i32* %5411, align 8
  %5412 = load %struct.DState*, %struct.DState** %2, align 8
  %5413 = getelementptr inbounds %struct.DState, %struct.DState* %5412, i32 0, i32 8
  %5414 = load i32, i32* %5413, align 4
  %5415 = add nsw i32 %5414, 8
  store i32 %5415, i32* %5413, align 4
  %5416 = load %struct.DState*, %struct.DState** %2, align 8
  %5417 = getelementptr inbounds %struct.DState, %struct.DState* %5416, i32 0, i32 0
  %5418 = load %struct.bz_stream*, %struct.bz_stream** %5417, align 8
  %5419 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5418, i32 0, i32 0
  %5420 = load i8*, i8** %5419, align 8
  %5421 = getelementptr inbounds i8, i8* %5420, i32 1
  store i8* %5421, i8** %5419, align 8
  %5422 = load %struct.DState*, %struct.DState** %2, align 8
  %5423 = getelementptr inbounds %struct.DState, %struct.DState* %5422, i32 0, i32 0
  %5424 = load %struct.bz_stream*, %struct.bz_stream** %5423, align 8
  %5425 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5424, i32 0, i32 1
  %5426 = load i32, i32* %5425, align 8
  %5427 = add i32 %5426, -1
  store i32 %5427, i32* %5425, align 8
  %5428 = load %struct.DState*, %struct.DState** %2, align 8
  %5429 = getelementptr inbounds %struct.DState, %struct.DState* %5428, i32 0, i32 0
  %5430 = load %struct.bz_stream*, %struct.bz_stream** %5429, align 8
  %5431 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5430, i32 0, i32 2
  %5432 = load i32, i32* %5431, align 4
  %5433 = add i32 %5432, 1
  store i32 %5433, i32* %5431, align 4
  %5434 = load %struct.DState*, %struct.DState** %2, align 8
  %5435 = getelementptr inbounds %struct.DState, %struct.DState* %5434, i32 0, i32 0
  %5436 = load %struct.bz_stream*, %struct.bz_stream** %5435, align 8
  %5437 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5436, i32 0, i32 2
  %5438 = load i32, i32* %5437, align 4
  %5439 = icmp eq i32 %5438, 0
  br i1 %5439, label %5440, label %5447

; <label>:5440:                                   ; preds = %5397
  %5441 = load %struct.DState*, %struct.DState** %2, align 8
  %5442 = getelementptr inbounds %struct.DState, %struct.DState* %5441, i32 0, i32 0
  %5443 = load %struct.bz_stream*, %struct.bz_stream** %5442, align 8
  %5444 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5443, i32 0, i32 3
  %5445 = load i32, i32* %5444, align 8
  %5446 = add i32 %5445, 1
  store i32 %5446, i32* %5444, align 8
  br label %5447

; <label>:5447:                                   ; preds = %5440, %5397
  br label %5368

; <label>:5448:                                   ; preds = %5373
  %5449 = load %struct.DState*, %struct.DState** %2, align 8
  %5450 = getelementptr inbounds %struct.DState, %struct.DState* %5449, i32 0, i32 24
  %5451 = load i32, i32* %5450, align 4
  %5452 = shl i32 %5451, 8
  %5453 = load i8, i8* %3, align 1
  %5454 = zext i8 %5453 to i32
  %5455 = or i32 %5452, %5454
  %5456 = load %struct.DState*, %struct.DState** %2, align 8
  %5457 = getelementptr inbounds %struct.DState, %struct.DState* %5456, i32 0, i32 24
  store i32 %5455, i32* %5457, align 4
  br label %5458

; <label>:5458:                                   ; preds = %5448, %144
  %5459 = load %struct.DState*, %struct.DState** %2, align 8
  %5460 = getelementptr inbounds %struct.DState, %struct.DState* %5459, i32 0, i32 1
  store i32 48, i32* %5460, align 8
  br label %5461

; <label>:5461:                                   ; preds = %5540, %5458
  %5462 = load %struct.DState*, %struct.DState** %2, align 8
  %5463 = getelementptr inbounds %struct.DState, %struct.DState* %5462, i32 0, i32 8
  %5464 = load i32, i32* %5463, align 4
  %5465 = icmp sge i32 %5464, 8
  br i1 %5465, label %5466, label %5482

; <label>:5466:                                   ; preds = %5461
  %5467 = load %struct.DState*, %struct.DState** %2, align 8
  %5468 = getelementptr inbounds %struct.DState, %struct.DState* %5467, i32 0, i32 7
  %5469 = load i32, i32* %5468, align 8
  %5470 = load %struct.DState*, %struct.DState** %2, align 8
  %5471 = getelementptr inbounds %struct.DState, %struct.DState* %5470, i32 0, i32 8
  %5472 = load i32, i32* %5471, align 4
  %5473 = sub nsw i32 %5472, 8
  %5474 = lshr i32 %5469, %5473
  %5475 = and i32 %5474, 255
  store i32 %5475, i32* %85, align 4
  %5476 = load %struct.DState*, %struct.DState** %2, align 8
  %5477 = getelementptr inbounds %struct.DState, %struct.DState* %5476, i32 0, i32 8
  %5478 = load i32, i32* %5477, align 4
  %5479 = sub nsw i32 %5478, 8
  store i32 %5479, i32* %5477, align 4
  %5480 = load i32, i32* %85, align 4
  %5481 = trunc i32 %5480 to i8
  store i8 %5481, i8* %3, align 1
  br label %5541

; <label>:5482:                                   ; preds = %5461
  %5483 = load %struct.DState*, %struct.DState** %2, align 8
  %5484 = getelementptr inbounds %struct.DState, %struct.DState* %5483, i32 0, i32 0
  %5485 = load %struct.bz_stream*, %struct.bz_stream** %5484, align 8
  %5486 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5485, i32 0, i32 1
  %5487 = load i32, i32* %5486, align 8
  %5488 = icmp eq i32 %5487, 0
  br i1 %5488, label %5489, label %5490

; <label>:5489:                                   ; preds = %5482
  store i32 0, i32* %4, align 4
  br label %5741

; <label>:5490:                                   ; preds = %5482
  %5491 = load %struct.DState*, %struct.DState** %2, align 8
  %5492 = getelementptr inbounds %struct.DState, %struct.DState* %5491, i32 0, i32 7
  %5493 = load i32, i32* %5492, align 8
  %5494 = shl i32 %5493, 8
  %5495 = load %struct.DState*, %struct.DState** %2, align 8
  %5496 = getelementptr inbounds %struct.DState, %struct.DState* %5495, i32 0, i32 0
  %5497 = load %struct.bz_stream*, %struct.bz_stream** %5496, align 8
  %5498 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5497, i32 0, i32 0
  %5499 = load i8*, i8** %5498, align 8
  %5500 = load i8, i8* %5499, align 1
  %5501 = zext i8 %5500 to i32
  %5502 = or i32 %5494, %5501
  %5503 = load %struct.DState*, %struct.DState** %2, align 8
  %5504 = getelementptr inbounds %struct.DState, %struct.DState* %5503, i32 0, i32 7
  store i32 %5502, i32* %5504, align 8
  %5505 = load %struct.DState*, %struct.DState** %2, align 8
  %5506 = getelementptr inbounds %struct.DState, %struct.DState* %5505, i32 0, i32 8
  %5507 = load i32, i32* %5506, align 4
  %5508 = add nsw i32 %5507, 8
  store i32 %5508, i32* %5506, align 4
  %5509 = load %struct.DState*, %struct.DState** %2, align 8
  %5510 = getelementptr inbounds %struct.DState, %struct.DState* %5509, i32 0, i32 0
  %5511 = load %struct.bz_stream*, %struct.bz_stream** %5510, align 8
  %5512 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5511, i32 0, i32 0
  %5513 = load i8*, i8** %5512, align 8
  %5514 = getelementptr inbounds i8, i8* %5513, i32 1
  store i8* %5514, i8** %5512, align 8
  %5515 = load %struct.DState*, %struct.DState** %2, align 8
  %5516 = getelementptr inbounds %struct.DState, %struct.DState* %5515, i32 0, i32 0
  %5517 = load %struct.bz_stream*, %struct.bz_stream** %5516, align 8
  %5518 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5517, i32 0, i32 1
  %5519 = load i32, i32* %5518, align 8
  %5520 = add i32 %5519, -1
  store i32 %5520, i32* %5518, align 8
  %5521 = load %struct.DState*, %struct.DState** %2, align 8
  %5522 = getelementptr inbounds %struct.DState, %struct.DState* %5521, i32 0, i32 0
  %5523 = load %struct.bz_stream*, %struct.bz_stream** %5522, align 8
  %5524 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5523, i32 0, i32 2
  %5525 = load i32, i32* %5524, align 4
  %5526 = add i32 %5525, 1
  store i32 %5526, i32* %5524, align 4
  %5527 = load %struct.DState*, %struct.DState** %2, align 8
  %5528 = getelementptr inbounds %struct.DState, %struct.DState* %5527, i32 0, i32 0
  %5529 = load %struct.bz_stream*, %struct.bz_stream** %5528, align 8
  %5530 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5529, i32 0, i32 2
  %5531 = load i32, i32* %5530, align 4
  %5532 = icmp eq i32 %5531, 0
  br i1 %5532, label %5533, label %5540

; <label>:5533:                                   ; preds = %5490
  %5534 = load %struct.DState*, %struct.DState** %2, align 8
  %5535 = getelementptr inbounds %struct.DState, %struct.DState* %5534, i32 0, i32 0
  %5536 = load %struct.bz_stream*, %struct.bz_stream** %5535, align 8
  %5537 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5536, i32 0, i32 3
  %5538 = load i32, i32* %5537, align 8
  %5539 = add i32 %5538, 1
  store i32 %5539, i32* %5537, align 8
  br label %5540

; <label>:5540:                                   ; preds = %5533, %5490
  br label %5461

; <label>:5541:                                   ; preds = %5466
  %5542 = load %struct.DState*, %struct.DState** %2, align 8
  %5543 = getelementptr inbounds %struct.DState, %struct.DState* %5542, i32 0, i32 24
  %5544 = load i32, i32* %5543, align 4
  %5545 = shl i32 %5544, 8
  %5546 = load i8, i8* %3, align 1
  %5547 = zext i8 %5546 to i32
  %5548 = or i32 %5545, %5547
  %5549 = load %struct.DState*, %struct.DState** %2, align 8
  %5550 = getelementptr inbounds %struct.DState, %struct.DState* %5549, i32 0, i32 24
  store i32 %5548, i32* %5550, align 4
  br label %5551

; <label>:5551:                                   ; preds = %5541, %144
  %5552 = load %struct.DState*, %struct.DState** %2, align 8
  %5553 = getelementptr inbounds %struct.DState, %struct.DState* %5552, i32 0, i32 1
  store i32 49, i32* %5553, align 8
  br label %5554

; <label>:5554:                                   ; preds = %5633, %5551
  %5555 = load %struct.DState*, %struct.DState** %2, align 8
  %5556 = getelementptr inbounds %struct.DState, %struct.DState* %5555, i32 0, i32 8
  %5557 = load i32, i32* %5556, align 4
  %5558 = icmp sge i32 %5557, 8
  br i1 %5558, label %5559, label %5575

; <label>:5559:                                   ; preds = %5554
  %5560 = load %struct.DState*, %struct.DState** %2, align 8
  %5561 = getelementptr inbounds %struct.DState, %struct.DState* %5560, i32 0, i32 7
  %5562 = load i32, i32* %5561, align 8
  %5563 = load %struct.DState*, %struct.DState** %2, align 8
  %5564 = getelementptr inbounds %struct.DState, %struct.DState* %5563, i32 0, i32 8
  %5565 = load i32, i32* %5564, align 4
  %5566 = sub nsw i32 %5565, 8
  %5567 = lshr i32 %5562, %5566
  %5568 = and i32 %5567, 255
  store i32 %5568, i32* %86, align 4
  %5569 = load %struct.DState*, %struct.DState** %2, align 8
  %5570 = getelementptr inbounds %struct.DState, %struct.DState* %5569, i32 0, i32 8
  %5571 = load i32, i32* %5570, align 4
  %5572 = sub nsw i32 %5571, 8
  store i32 %5572, i32* %5570, align 4
  %5573 = load i32, i32* %86, align 4
  %5574 = trunc i32 %5573 to i8
  store i8 %5574, i8* %3, align 1
  br label %5634

; <label>:5575:                                   ; preds = %5554
  %5576 = load %struct.DState*, %struct.DState** %2, align 8
  %5577 = getelementptr inbounds %struct.DState, %struct.DState* %5576, i32 0, i32 0
  %5578 = load %struct.bz_stream*, %struct.bz_stream** %5577, align 8
  %5579 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5578, i32 0, i32 1
  %5580 = load i32, i32* %5579, align 8
  %5581 = icmp eq i32 %5580, 0
  br i1 %5581, label %5582, label %5583

; <label>:5582:                                   ; preds = %5575
  store i32 0, i32* %4, align 4
  br label %5741

; <label>:5583:                                   ; preds = %5575
  %5584 = load %struct.DState*, %struct.DState** %2, align 8
  %5585 = getelementptr inbounds %struct.DState, %struct.DState* %5584, i32 0, i32 7
  %5586 = load i32, i32* %5585, align 8
  %5587 = shl i32 %5586, 8
  %5588 = load %struct.DState*, %struct.DState** %2, align 8
  %5589 = getelementptr inbounds %struct.DState, %struct.DState* %5588, i32 0, i32 0
  %5590 = load %struct.bz_stream*, %struct.bz_stream** %5589, align 8
  %5591 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5590, i32 0, i32 0
  %5592 = load i8*, i8** %5591, align 8
  %5593 = load i8, i8* %5592, align 1
  %5594 = zext i8 %5593 to i32
  %5595 = or i32 %5587, %5594
  %5596 = load %struct.DState*, %struct.DState** %2, align 8
  %5597 = getelementptr inbounds %struct.DState, %struct.DState* %5596, i32 0, i32 7
  store i32 %5595, i32* %5597, align 8
  %5598 = load %struct.DState*, %struct.DState** %2, align 8
  %5599 = getelementptr inbounds %struct.DState, %struct.DState* %5598, i32 0, i32 8
  %5600 = load i32, i32* %5599, align 4
  %5601 = add nsw i32 %5600, 8
  store i32 %5601, i32* %5599, align 4
  %5602 = load %struct.DState*, %struct.DState** %2, align 8
  %5603 = getelementptr inbounds %struct.DState, %struct.DState* %5602, i32 0, i32 0
  %5604 = load %struct.bz_stream*, %struct.bz_stream** %5603, align 8
  %5605 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5604, i32 0, i32 0
  %5606 = load i8*, i8** %5605, align 8
  %5607 = getelementptr inbounds i8, i8* %5606, i32 1
  store i8* %5607, i8** %5605, align 8
  %5608 = load %struct.DState*, %struct.DState** %2, align 8
  %5609 = getelementptr inbounds %struct.DState, %struct.DState* %5608, i32 0, i32 0
  %5610 = load %struct.bz_stream*, %struct.bz_stream** %5609, align 8
  %5611 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5610, i32 0, i32 1
  %5612 = load i32, i32* %5611, align 8
  %5613 = add i32 %5612, -1
  store i32 %5613, i32* %5611, align 8
  %5614 = load %struct.DState*, %struct.DState** %2, align 8
  %5615 = getelementptr inbounds %struct.DState, %struct.DState* %5614, i32 0, i32 0
  %5616 = load %struct.bz_stream*, %struct.bz_stream** %5615, align 8
  %5617 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5616, i32 0, i32 2
  %5618 = load i32, i32* %5617, align 4
  %5619 = add i32 %5618, 1
  store i32 %5619, i32* %5617, align 4
  %5620 = load %struct.DState*, %struct.DState** %2, align 8
  %5621 = getelementptr inbounds %struct.DState, %struct.DState* %5620, i32 0, i32 0
  %5622 = load %struct.bz_stream*, %struct.bz_stream** %5621, align 8
  %5623 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5622, i32 0, i32 2
  %5624 = load i32, i32* %5623, align 4
  %5625 = icmp eq i32 %5624, 0
  br i1 %5625, label %5626, label %5633

; <label>:5626:                                   ; preds = %5583
  %5627 = load %struct.DState*, %struct.DState** %2, align 8
  %5628 = getelementptr inbounds %struct.DState, %struct.DState* %5627, i32 0, i32 0
  %5629 = load %struct.bz_stream*, %struct.bz_stream** %5628, align 8
  %5630 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5629, i32 0, i32 3
  %5631 = load i32, i32* %5630, align 8
  %5632 = add i32 %5631, 1
  store i32 %5632, i32* %5630, align 8
  br label %5633

; <label>:5633:                                   ; preds = %5626, %5583
  br label %5554

; <label>:5634:                                   ; preds = %5559
  %5635 = load %struct.DState*, %struct.DState** %2, align 8
  %5636 = getelementptr inbounds %struct.DState, %struct.DState* %5635, i32 0, i32 24
  %5637 = load i32, i32* %5636, align 4
  %5638 = shl i32 %5637, 8
  %5639 = load i8, i8* %3, align 1
  %5640 = zext i8 %5639 to i32
  %5641 = or i32 %5638, %5640
  %5642 = load %struct.DState*, %struct.DState** %2, align 8
  %5643 = getelementptr inbounds %struct.DState, %struct.DState* %5642, i32 0, i32 24
  store i32 %5641, i32* %5643, align 4
  br label %5644

; <label>:5644:                                   ; preds = %5634, %144
  %5645 = load %struct.DState*, %struct.DState** %2, align 8
  %5646 = getelementptr inbounds %struct.DState, %struct.DState* %5645, i32 0, i32 1
  store i32 50, i32* %5646, align 8
  br label %5647

; <label>:5647:                                   ; preds = %5726, %5644
  %5648 = load %struct.DState*, %struct.DState** %2, align 8
  %5649 = getelementptr inbounds %struct.DState, %struct.DState* %5648, i32 0, i32 8
  %5650 = load i32, i32* %5649, align 4
  %5651 = icmp sge i32 %5650, 8
  br i1 %5651, label %5652, label %5668

; <label>:5652:                                   ; preds = %5647
  %5653 = load %struct.DState*, %struct.DState** %2, align 8
  %5654 = getelementptr inbounds %struct.DState, %struct.DState* %5653, i32 0, i32 7
  %5655 = load i32, i32* %5654, align 8
  %5656 = load %struct.DState*, %struct.DState** %2, align 8
  %5657 = getelementptr inbounds %struct.DState, %struct.DState* %5656, i32 0, i32 8
  %5658 = load i32, i32* %5657, align 4
  %5659 = sub nsw i32 %5658, 8
  %5660 = lshr i32 %5655, %5659
  %5661 = and i32 %5660, 255
  store i32 %5661, i32* %87, align 4
  %5662 = load %struct.DState*, %struct.DState** %2, align 8
  %5663 = getelementptr inbounds %struct.DState, %struct.DState* %5662, i32 0, i32 8
  %5664 = load i32, i32* %5663, align 4
  %5665 = sub nsw i32 %5664, 8
  store i32 %5665, i32* %5663, align 4
  %5666 = load i32, i32* %87, align 4
  %5667 = trunc i32 %5666 to i8
  store i8 %5667, i8* %3, align 1
  br label %5727

; <label>:5668:                                   ; preds = %5647
  %5669 = load %struct.DState*, %struct.DState** %2, align 8
  %5670 = getelementptr inbounds %struct.DState, %struct.DState* %5669, i32 0, i32 0
  %5671 = load %struct.bz_stream*, %struct.bz_stream** %5670, align 8
  %5672 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5671, i32 0, i32 1
  %5673 = load i32, i32* %5672, align 8
  %5674 = icmp eq i32 %5673, 0
  br i1 %5674, label %5675, label %5676

; <label>:5675:                                   ; preds = %5668
  store i32 0, i32* %4, align 4
  br label %5741

; <label>:5676:                                   ; preds = %5668
  %5677 = load %struct.DState*, %struct.DState** %2, align 8
  %5678 = getelementptr inbounds %struct.DState, %struct.DState* %5677, i32 0, i32 7
  %5679 = load i32, i32* %5678, align 8
  %5680 = shl i32 %5679, 8
  %5681 = load %struct.DState*, %struct.DState** %2, align 8
  %5682 = getelementptr inbounds %struct.DState, %struct.DState* %5681, i32 0, i32 0
  %5683 = load %struct.bz_stream*, %struct.bz_stream** %5682, align 8
  %5684 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5683, i32 0, i32 0
  %5685 = load i8*, i8** %5684, align 8
  %5686 = load i8, i8* %5685, align 1
  %5687 = zext i8 %5686 to i32
  %5688 = or i32 %5680, %5687
  %5689 = load %struct.DState*, %struct.DState** %2, align 8
  %5690 = getelementptr inbounds %struct.DState, %struct.DState* %5689, i32 0, i32 7
  store i32 %5688, i32* %5690, align 8
  %5691 = load %struct.DState*, %struct.DState** %2, align 8
  %5692 = getelementptr inbounds %struct.DState, %struct.DState* %5691, i32 0, i32 8
  %5693 = load i32, i32* %5692, align 4
  %5694 = add nsw i32 %5693, 8
  store i32 %5694, i32* %5692, align 4
  %5695 = load %struct.DState*, %struct.DState** %2, align 8
  %5696 = getelementptr inbounds %struct.DState, %struct.DState* %5695, i32 0, i32 0
  %5697 = load %struct.bz_stream*, %struct.bz_stream** %5696, align 8
  %5698 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5697, i32 0, i32 0
  %5699 = load i8*, i8** %5698, align 8
  %5700 = getelementptr inbounds i8, i8* %5699, i32 1
  store i8* %5700, i8** %5698, align 8
  %5701 = load %struct.DState*, %struct.DState** %2, align 8
  %5702 = getelementptr inbounds %struct.DState, %struct.DState* %5701, i32 0, i32 0
  %5703 = load %struct.bz_stream*, %struct.bz_stream** %5702, align 8
  %5704 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5703, i32 0, i32 1
  %5705 = load i32, i32* %5704, align 8
  %5706 = add i32 %5705, -1
  store i32 %5706, i32* %5704, align 8
  %5707 = load %struct.DState*, %struct.DState** %2, align 8
  %5708 = getelementptr inbounds %struct.DState, %struct.DState* %5707, i32 0, i32 0
  %5709 = load %struct.bz_stream*, %struct.bz_stream** %5708, align 8
  %5710 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5709, i32 0, i32 2
  %5711 = load i32, i32* %5710, align 4
  %5712 = add i32 %5711, 1
  store i32 %5712, i32* %5710, align 4
  %5713 = load %struct.DState*, %struct.DState** %2, align 8
  %5714 = getelementptr inbounds %struct.DState, %struct.DState* %5713, i32 0, i32 0
  %5715 = load %struct.bz_stream*, %struct.bz_stream** %5714, align 8
  %5716 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5715, i32 0, i32 2
  %5717 = load i32, i32* %5716, align 4
  %5718 = icmp eq i32 %5717, 0
  br i1 %5718, label %5719, label %5726

; <label>:5719:                                   ; preds = %5676
  %5720 = load %struct.DState*, %struct.DState** %2, align 8
  %5721 = getelementptr inbounds %struct.DState, %struct.DState* %5720, i32 0, i32 0
  %5722 = load %struct.bz_stream*, %struct.bz_stream** %5721, align 8
  %5723 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5722, i32 0, i32 3
  %5724 = load i32, i32* %5723, align 8
  %5725 = add i32 %5724, 1
  store i32 %5725, i32* %5723, align 8
  br label %5726

; <label>:5726:                                   ; preds = %5719, %5676
  br label %5647

; <label>:5727:                                   ; preds = %5652
  %5728 = load %struct.DState*, %struct.DState** %2, align 8
  %5729 = getelementptr inbounds %struct.DState, %struct.DState* %5728, i32 0, i32 24
  %5730 = load i32, i32* %5729, align 4
  %5731 = shl i32 %5730, 8
  %5732 = load i8, i8* %3, align 1
  %5733 = zext i8 %5732 to i32
  %5734 = or i32 %5731, %5733
  %5735 = load %struct.DState*, %struct.DState** %2, align 8
  %5736 = getelementptr inbounds %struct.DState, %struct.DState* %5735, i32 0, i32 24
  store i32 %5734, i32* %5736, align 4
  %5737 = load %struct.DState*, %struct.DState** %2, align 8
  %5738 = getelementptr inbounds %struct.DState, %struct.DState* %5737, i32 0, i32 1
  store i32 1, i32* %5738, align 8
  store i32 4, i32* %4, align 4
  br label %5741

; <label>:5739:                                   ; preds = %144
  call void @BZ2_bz__AssertH__fail(i32 4001)
  br label %5740

; <label>:5740:                                   ; preds = %5739
  call void @BZ2_bz__AssertH__fail(i32 4002)
  br label %5741

; <label>:5741:                                   ; preds = %5740, %5727, %5675, %5582, %5489, %5396, %5361, %5305, %5272, %5216, %5183, %5127, %5094, %5038, %5005, %4949, %4916, %4348, %4281, %4257, %4182, %4139, %4083, %4010, %3692, %3672, %3649, %3591, %3516, %3473, %3417, %3344, %3291, %3216, %3173, %3117, %3044, %2799, %2710, %2677, %2613, %2506, %2443, %2404, %2349, %2317, %2259, %2223, %2143, %2010, %1973, %1962, %1896, %1803, %1710, %1624, %1529, %1436, %1343, %1250, %1200, %1144, %1111, %1055, %1022, %966, %933, %877, %844, %788, %755, %694, %660, %636, %581, %519, %485, %429, %396, %340, %307, %251
  %5742 = load i32, i32* %8, align 4
  %5743 = load %struct.DState*, %struct.DState** %2, align 8
  %5744 = getelementptr inbounds %struct.DState, %struct.DState* %5743, i32 0, i32 40
  store i32 %5742, i32* %5744, align 4
  %5745 = load i32, i32* %9, align 4
  %5746 = load %struct.DState*, %struct.DState** %2, align 8
  %5747 = getelementptr inbounds %struct.DState, %struct.DState* %5746, i32 0, i32 41
  store i32 %5745, i32* %5747, align 8
  %5748 = load i32, i32* %10, align 4
  %5749 = load %struct.DState*, %struct.DState** %2, align 8
  %5750 = getelementptr inbounds %struct.DState, %struct.DState* %5749, i32 0, i32 42
  store i32 %5748, i32* %5750, align 4
  %5751 = load i32, i32* %11, align 4
  %5752 = load %struct.DState*, %struct.DState** %2, align 8
  %5753 = getelementptr inbounds %struct.DState, %struct.DState* %5752, i32 0, i32 43
  store i32 %5751, i32* %5753, align 8
  %5754 = load i32, i32* %12, align 4
  %5755 = load %struct.DState*, %struct.DState** %2, align 8
  %5756 = getelementptr inbounds %struct.DState, %struct.DState* %5755, i32 0, i32 44
  store i32 %5754, i32* %5756, align 4
  %5757 = load i32, i32* %13, align 4
  %5758 = load %struct.DState*, %struct.DState** %2, align 8
  %5759 = getelementptr inbounds %struct.DState, %struct.DState* %5758, i32 0, i32 45
  store i32 %5757, i32* %5759, align 8
  %5760 = load i32, i32* %14, align 4
  %5761 = load %struct.DState*, %struct.DState** %2, align 8
  %5762 = getelementptr inbounds %struct.DState, %struct.DState* %5761, i32 0, i32 46
  store i32 %5760, i32* %5762, align 4
  %5763 = load i32, i32* %15, align 4
  %5764 = load %struct.DState*, %struct.DState** %2, align 8
  %5765 = getelementptr inbounds %struct.DState, %struct.DState* %5764, i32 0, i32 47
  store i32 %5763, i32* %5765, align 8
  %5766 = load i32, i32* %16, align 4
  %5767 = load %struct.DState*, %struct.DState** %2, align 8
  %5768 = getelementptr inbounds %struct.DState, %struct.DState* %5767, i32 0, i32 48
  store i32 %5766, i32* %5768, align 4
  %5769 = load i32, i32* %17, align 4
  %5770 = load %struct.DState*, %struct.DState** %2, align 8
  %5771 = getelementptr inbounds %struct.DState, %struct.DState* %5770, i32 0, i32 49
  store i32 %5769, i32* %5771, align 8
  %5772 = load i32, i32* %18, align 4
  %5773 = load %struct.DState*, %struct.DState** %2, align 8
  %5774 = getelementptr inbounds %struct.DState, %struct.DState* %5773, i32 0, i32 50
  store i32 %5772, i32* %5774, align 4
  %5775 = load i32, i32* %19, align 4
  %5776 = load %struct.DState*, %struct.DState** %2, align 8
  %5777 = getelementptr inbounds %struct.DState, %struct.DState* %5776, i32 0, i32 51
  store i32 %5775, i32* %5777, align 8
  %5778 = load i32, i32* %20, align 4
  %5779 = load %struct.DState*, %struct.DState** %2, align 8
  %5780 = getelementptr inbounds %struct.DState, %struct.DState* %5779, i32 0, i32 52
  store i32 %5778, i32* %5780, align 4
  %5781 = load i32, i32* %21, align 4
  %5782 = load %struct.DState*, %struct.DState** %2, align 8
  %5783 = getelementptr inbounds %struct.DState, %struct.DState* %5782, i32 0, i32 53
  store i32 %5781, i32* %5783, align 8
  %5784 = load i32, i32* %22, align 4
  %5785 = load %struct.DState*, %struct.DState** %2, align 8
  %5786 = getelementptr inbounds %struct.DState, %struct.DState* %5785, i32 0, i32 54
  store i32 %5784, i32* %5786, align 4
  %5787 = load i32, i32* %23, align 4
  %5788 = load %struct.DState*, %struct.DState** %2, align 8
  %5789 = getelementptr inbounds %struct.DState, %struct.DState* %5788, i32 0, i32 55
  store i32 %5787, i32* %5789, align 8
  %5790 = load i32, i32* %24, align 4
  %5791 = load %struct.DState*, %struct.DState** %2, align 8
  %5792 = getelementptr inbounds %struct.DState, %struct.DState* %5791, i32 0, i32 56
  store i32 %5790, i32* %5792, align 4
  %5793 = load i32, i32* %25, align 4
  %5794 = load %struct.DState*, %struct.DState** %2, align 8
  %5795 = getelementptr inbounds %struct.DState, %struct.DState* %5794, i32 0, i32 57
  store i32 %5793, i32* %5795, align 8
  %5796 = load i32, i32* %26, align 4
  %5797 = load %struct.DState*, %struct.DState** %2, align 8
  %5798 = getelementptr inbounds %struct.DState, %struct.DState* %5797, i32 0, i32 58
  store i32 %5796, i32* %5798, align 4
  %5799 = load i32, i32* %27, align 4
  %5800 = load %struct.DState*, %struct.DState** %2, align 8
  %5801 = getelementptr inbounds %struct.DState, %struct.DState* %5800, i32 0, i32 59
  store i32 %5799, i32* %5801, align 8
  %5802 = load i32, i32* %28, align 4
  %5803 = load %struct.DState*, %struct.DState** %2, align 8
  %5804 = getelementptr inbounds %struct.DState, %struct.DState* %5803, i32 0, i32 60
  store i32 %5802, i32* %5804, align 4
  %5805 = load i32*, i32** %29, align 8
  %5806 = load %struct.DState*, %struct.DState** %2, align 8
  %5807 = getelementptr inbounds %struct.DState, %struct.DState* %5806, i32 0, i32 61
  store i32* %5805, i32** %5807, align 8
  %5808 = load i32*, i32** %30, align 8
  %5809 = load %struct.DState*, %struct.DState** %2, align 8
  %5810 = getelementptr inbounds %struct.DState, %struct.DState* %5809, i32 0, i32 62
  store i32* %5808, i32** %5810, align 8
  %5811 = load i32*, i32** %31, align 8
  %5812 = load %struct.DState*, %struct.DState** %2, align 8
  %5813 = getelementptr inbounds %struct.DState, %struct.DState* %5812, i32 0, i32 63
  store i32* %5811, i32** %5813, align 8
  %5814 = load i32, i32* %4, align 4
  ret i32 %5814
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @makeMaps_d(%struct.DState*) #0 {
  %2 = alloca %struct.DState*, align 8
  %3 = alloca i32, align 4
  store %struct.DState* %0, %struct.DState** %2, align 8
  %4 = load %struct.DState*, %struct.DState** %2, align 8
  %5 = getelementptr inbounds %struct.DState, %struct.DState* %4, i32 0, i32 27
  store i32 0, i32* %5, align 8
  store i32 0, i32* %3, align 4
  br label %6

; <label>:6:                                      ; preds = %32, %1
  %7 = load i32, i32* %3, align 4
  %8 = icmp slt i32 %7, 256
  br i1 %8, label %9, label %35

; <label>:9:                                      ; preds = %6
  %10 = load %struct.DState*, %struct.DState** %2, align 8
  %11 = getelementptr inbounds %struct.DState, %struct.DState* %10, i32 0, i32 28
  %12 = load i32, i32* %3, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [256 x i8], [256 x i8]* %11, i64 0, i64 %13
  %15 = load i8, i8* %14, align 1
  %16 = icmp ne i8 %15, 0
  br i1 %16, label %17, label %31

; <label>:17:                                     ; preds = %9
  %18 = load i32, i32* %3, align 4
  %19 = trunc i32 %18 to i8
  %20 = load %struct.DState*, %struct.DState** %2, align 8
  %21 = getelementptr inbounds %struct.DState, %struct.DState* %20, i32 0, i32 30
  %22 = load %struct.DState*, %struct.DState** %2, align 8
  %23 = getelementptr inbounds %struct.DState, %struct.DState* %22, i32 0, i32 27
  %24 = load i32, i32* %23, align 8
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [256 x i8], [256 x i8]* %21, i64 0, i64 %25
  store i8 %19, i8* %26, align 1
  %27 = load %struct.DState*, %struct.DState** %2, align 8
  %28 = getelementptr inbounds %struct.DState, %struct.DState* %27, i32 0, i32 27
  %29 = load i32, i32* %28, align 8
  %30 = add nsw i32 %29, 1
  store i32 %30, i32* %28, align 8
  br label %31

; <label>:31:                                     ; preds = %17, %9
  br label %32

; <label>:32:                                     ; preds = %31
  %33 = load i32, i32* %3, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, i32* %3, align 4
  br label %6

; <label>:35:                                     ; preds = %6
  ret void
}

declare void @BZ2_hbCreateDecodeTables(i32*, i32*, i32*, i8*, i32, i32, i32) #1

declare i32 @BZ2_indexIntoF(i32, i32*) #1

declare void @BZ2_bz__AssertH__fail(i32) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
