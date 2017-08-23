; ModuleID = 'tmp1.ll'
source_filename = "decompress.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.DState = type { %struct.bz_stream*, i32, i8, i32, i8, i32, i32, i32, i32, i32, i8, i32, i32, i32, i32, i32, [256 x i32], i32, [257 x i32], [257 x i32], i32*, i16*, i8*, i32, i32, i32, i32, i32, [256 x i8], [16 x i8], [256 x i8], [4096 x i8], [16 x i32], [18002 x i8], [18002 x i8], [6 x [258 x i8]], [6 x [258 x i32]], [6 x [258 x i32]], [6 x [258 x i32]], [6 x i32], i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32*, i32*, i32* }
%struct.bz_stream = type { i8*, i32, i32, i32, i8*, i32, i32, i32, i8*, i8* (i8*, i32, i32)*, void (i8*, i8*)*, i8* }

$__llvm_profile_raw_version = comdat any

@stderr = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [20 x i8] c"\0A    [%d: huff+mtf \00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"rt+rld\00", align 1
@BZ2_rNums = external global [512 x i32], align 16
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_BZ2_decompress = private constant [14 x i8] c"BZ2_decompress"
@__profn_tmp1.ll_makeMaps_d = private constant [18 x i8] c"tmp1.ll:makeMaps_d"
@__profc_BZ2_decompress = private global [283 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_BZ2_decompress = private global [3 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_BZ2_decompress = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6773542313233903267, i64 144963712369373351, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i32 0, i32 0), i8* bitcast (i32 (%struct.DState*)* @BZ2_decompress to i8*), i8* bitcast ([3 x i64]* @__profvp_BZ2_decompress to i8*), i32 283, [1 x i16] [i16 3] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_makeMaps_d = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_makeMaps_d = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7608421366451297242, i64 45130900406, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_makeMaps_d, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [10 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [43 x i8] c"!)x\DAs\8A2\8AOIM\CE\CF-(J-.f,\C9-0\D4\CB\C9\B1\CAM\CCN\F5M,(\8EO\01\00\CA?\0C\18", section "__llvm_prf_names"
@llvm.used = appending global [4 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BZ2_decompress to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_makeMaps_d to i8*), i8* bitcast ([10 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([43 x i8], [43 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
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
  br i1 %94, label %95, label %145

; <label>:95:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 19)
  %96 = add i64 %pgocount, 1
  store i64 %96, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 19)
  %97 = load %struct.DState*, %struct.DState** %2, align 8
  %98 = getelementptr inbounds %struct.DState, %struct.DState* %97, i32 0, i32 40
  store i32 0, i32* %98, align 4
  %99 = load %struct.DState*, %struct.DState** %2, align 8
  %100 = getelementptr inbounds %struct.DState, %struct.DState* %99, i32 0, i32 41
  store i32 0, i32* %100, align 8
  %101 = load %struct.DState*, %struct.DState** %2, align 8
  %102 = getelementptr inbounds %struct.DState, %struct.DState* %101, i32 0, i32 42
  store i32 0, i32* %102, align 4
  %103 = load %struct.DState*, %struct.DState** %2, align 8
  %104 = getelementptr inbounds %struct.DState, %struct.DState* %103, i32 0, i32 43
  store i32 0, i32* %104, align 8
  %105 = load %struct.DState*, %struct.DState** %2, align 8
  %106 = getelementptr inbounds %struct.DState, %struct.DState* %105, i32 0, i32 44
  store i32 0, i32* %106, align 4
  %107 = load %struct.DState*, %struct.DState** %2, align 8
  %108 = getelementptr inbounds %struct.DState, %struct.DState* %107, i32 0, i32 45
  store i32 0, i32* %108, align 8
  %109 = load %struct.DState*, %struct.DState** %2, align 8
  %110 = getelementptr inbounds %struct.DState, %struct.DState* %109, i32 0, i32 46
  store i32 0, i32* %110, align 4
  %111 = load %struct.DState*, %struct.DState** %2, align 8
  %112 = getelementptr inbounds %struct.DState, %struct.DState* %111, i32 0, i32 47
  store i32 0, i32* %112, align 8
  %113 = load %struct.DState*, %struct.DState** %2, align 8
  %114 = getelementptr inbounds %struct.DState, %struct.DState* %113, i32 0, i32 48
  store i32 0, i32* %114, align 4
  %115 = load %struct.DState*, %struct.DState** %2, align 8
  %116 = getelementptr inbounds %struct.DState, %struct.DState* %115, i32 0, i32 49
  store i32 0, i32* %116, align 8
  %117 = load %struct.DState*, %struct.DState** %2, align 8
  %118 = getelementptr inbounds %struct.DState, %struct.DState* %117, i32 0, i32 50
  store i32 0, i32* %118, align 4
  %119 = load %struct.DState*, %struct.DState** %2, align 8
  %120 = getelementptr inbounds %struct.DState, %struct.DState* %119, i32 0, i32 51
  store i32 0, i32* %120, align 8
  %121 = load %struct.DState*, %struct.DState** %2, align 8
  %122 = getelementptr inbounds %struct.DState, %struct.DState* %121, i32 0, i32 52
  store i32 0, i32* %122, align 4
  %123 = load %struct.DState*, %struct.DState** %2, align 8
  %124 = getelementptr inbounds %struct.DState, %struct.DState* %123, i32 0, i32 53
  store i32 0, i32* %124, align 8
  %125 = load %struct.DState*, %struct.DState** %2, align 8
  %126 = getelementptr inbounds %struct.DState, %struct.DState* %125, i32 0, i32 54
  store i32 0, i32* %126, align 4
  %127 = load %struct.DState*, %struct.DState** %2, align 8
  %128 = getelementptr inbounds %struct.DState, %struct.DState* %127, i32 0, i32 55
  store i32 0, i32* %128, align 8
  %129 = load %struct.DState*, %struct.DState** %2, align 8
  %130 = getelementptr inbounds %struct.DState, %struct.DState* %129, i32 0, i32 56
  store i32 0, i32* %130, align 4
  %131 = load %struct.DState*, %struct.DState** %2, align 8
  %132 = getelementptr inbounds %struct.DState, %struct.DState* %131, i32 0, i32 57
  store i32 0, i32* %132, align 8
  %133 = load %struct.DState*, %struct.DState** %2, align 8
  %134 = getelementptr inbounds %struct.DState, %struct.DState* %133, i32 0, i32 58
  store i32 0, i32* %134, align 4
  %135 = load %struct.DState*, %struct.DState** %2, align 8
  %136 = getelementptr inbounds %struct.DState, %struct.DState* %135, i32 0, i32 59
  store i32 0, i32* %136, align 8
  %137 = load %struct.DState*, %struct.DState** %2, align 8
  %138 = getelementptr inbounds %struct.DState, %struct.DState* %137, i32 0, i32 60
  store i32 0, i32* %138, align 4
  %139 = load %struct.DState*, %struct.DState** %2, align 8
  %140 = getelementptr inbounds %struct.DState, %struct.DState* %139, i32 0, i32 61
  store i32* null, i32** %140, align 8
  %141 = load %struct.DState*, %struct.DState** %2, align 8
  %142 = getelementptr inbounds %struct.DState, %struct.DState* %141, i32 0, i32 62
  store i32* null, i32** %142, align 8
  %143 = load %struct.DState*, %struct.DState** %2, align 8
  %144 = getelementptr inbounds %struct.DState, %struct.DState* %143, i32 0, i32 63
  store i32* null, i32** %144, align 8
  br label %145

; <label>:145:                                    ; preds = %95, %1
  %146 = load %struct.DState*, %struct.DState** %2, align 8
  %147 = getelementptr inbounds %struct.DState, %struct.DState* %146, i32 0, i32 40
  %148 = load i32, i32* %147, align 4
  store i32 %148, i32* %8, align 4
  %149 = load %struct.DState*, %struct.DState** %2, align 8
  %150 = getelementptr inbounds %struct.DState, %struct.DState* %149, i32 0, i32 41
  %151 = load i32, i32* %150, align 8
  store i32 %151, i32* %9, align 4
  %152 = load %struct.DState*, %struct.DState** %2, align 8
  %153 = getelementptr inbounds %struct.DState, %struct.DState* %152, i32 0, i32 42
  %154 = load i32, i32* %153, align 4
  store i32 %154, i32* %10, align 4
  %155 = load %struct.DState*, %struct.DState** %2, align 8
  %156 = getelementptr inbounds %struct.DState, %struct.DState* %155, i32 0, i32 43
  %157 = load i32, i32* %156, align 8
  store i32 %157, i32* %11, align 4
  %158 = load %struct.DState*, %struct.DState** %2, align 8
  %159 = getelementptr inbounds %struct.DState, %struct.DState* %158, i32 0, i32 44
  %160 = load i32, i32* %159, align 4
  store i32 %160, i32* %12, align 4
  %161 = load %struct.DState*, %struct.DState** %2, align 8
  %162 = getelementptr inbounds %struct.DState, %struct.DState* %161, i32 0, i32 45
  %163 = load i32, i32* %162, align 8
  store i32 %163, i32* %13, align 4
  %164 = load %struct.DState*, %struct.DState** %2, align 8
  %165 = getelementptr inbounds %struct.DState, %struct.DState* %164, i32 0, i32 46
  %166 = load i32, i32* %165, align 4
  store i32 %166, i32* %14, align 4
  %167 = load %struct.DState*, %struct.DState** %2, align 8
  %168 = getelementptr inbounds %struct.DState, %struct.DState* %167, i32 0, i32 47
  %169 = load i32, i32* %168, align 8
  store i32 %169, i32* %15, align 4
  %170 = load %struct.DState*, %struct.DState** %2, align 8
  %171 = getelementptr inbounds %struct.DState, %struct.DState* %170, i32 0, i32 48
  %172 = load i32, i32* %171, align 4
  store i32 %172, i32* %16, align 4
  %173 = load %struct.DState*, %struct.DState** %2, align 8
  %174 = getelementptr inbounds %struct.DState, %struct.DState* %173, i32 0, i32 49
  %175 = load i32, i32* %174, align 8
  store i32 %175, i32* %17, align 4
  %176 = load %struct.DState*, %struct.DState** %2, align 8
  %177 = getelementptr inbounds %struct.DState, %struct.DState* %176, i32 0, i32 50
  %178 = load i32, i32* %177, align 4
  store i32 %178, i32* %18, align 4
  %179 = load %struct.DState*, %struct.DState** %2, align 8
  %180 = getelementptr inbounds %struct.DState, %struct.DState* %179, i32 0, i32 51
  %181 = load i32, i32* %180, align 8
  store i32 %181, i32* %19, align 4
  %182 = load %struct.DState*, %struct.DState** %2, align 8
  %183 = getelementptr inbounds %struct.DState, %struct.DState* %182, i32 0, i32 52
  %184 = load i32, i32* %183, align 4
  store i32 %184, i32* %20, align 4
  %185 = load %struct.DState*, %struct.DState** %2, align 8
  %186 = getelementptr inbounds %struct.DState, %struct.DState* %185, i32 0, i32 53
  %187 = load i32, i32* %186, align 8
  store i32 %187, i32* %21, align 4
  %188 = load %struct.DState*, %struct.DState** %2, align 8
  %189 = getelementptr inbounds %struct.DState, %struct.DState* %188, i32 0, i32 54
  %190 = load i32, i32* %189, align 4
  store i32 %190, i32* %22, align 4
  %191 = load %struct.DState*, %struct.DState** %2, align 8
  %192 = getelementptr inbounds %struct.DState, %struct.DState* %191, i32 0, i32 55
  %193 = load i32, i32* %192, align 8
  store i32 %193, i32* %23, align 4
  %194 = load %struct.DState*, %struct.DState** %2, align 8
  %195 = getelementptr inbounds %struct.DState, %struct.DState* %194, i32 0, i32 56
  %196 = load i32, i32* %195, align 4
  store i32 %196, i32* %24, align 4
  %197 = load %struct.DState*, %struct.DState** %2, align 8
  %198 = getelementptr inbounds %struct.DState, %struct.DState* %197, i32 0, i32 57
  %199 = load i32, i32* %198, align 8
  store i32 %199, i32* %25, align 4
  %200 = load %struct.DState*, %struct.DState** %2, align 8
  %201 = getelementptr inbounds %struct.DState, %struct.DState* %200, i32 0, i32 58
  %202 = load i32, i32* %201, align 4
  store i32 %202, i32* %26, align 4
  %203 = load %struct.DState*, %struct.DState** %2, align 8
  %204 = getelementptr inbounds %struct.DState, %struct.DState* %203, i32 0, i32 59
  %205 = load i32, i32* %204, align 8
  store i32 %205, i32* %27, align 4
  %206 = load %struct.DState*, %struct.DState** %2, align 8
  %207 = getelementptr inbounds %struct.DState, %struct.DState* %206, i32 0, i32 60
  %208 = load i32, i32* %207, align 4
  store i32 %208, i32* %28, align 4
  %209 = load %struct.DState*, %struct.DState** %2, align 8
  %210 = getelementptr inbounds %struct.DState, %struct.DState* %209, i32 0, i32 61
  %211 = load i32*, i32** %210, align 8
  store i32* %211, i32** %29, align 8
  %212 = load %struct.DState*, %struct.DState** %2, align 8
  %213 = getelementptr inbounds %struct.DState, %struct.DState* %212, i32 0, i32 62
  %214 = load i32*, i32** %213, align 8
  store i32* %214, i32** %30, align 8
  %215 = load %struct.DState*, %struct.DState** %2, align 8
  %216 = getelementptr inbounds %struct.DState, %struct.DState* %215, i32 0, i32 63
  %217 = load i32*, i32** %216, align 8
  store i32* %217, i32** %31, align 8
  store i32 0, i32* %4, align 4
  %218 = load %struct.DState*, %struct.DState** %2, align 8
  %219 = getelementptr inbounds %struct.DState, %struct.DState* %218, i32 0, i32 1
  %220 = load i32, i32* %219, align 8
  switch i32 %220, label %6026 [
    i32 10, label %221
    i32 11, label %315
    i32 12, label %409
    i32 13, label %503
    i32 14, label %692
    i32 15, label %791
    i32 16, label %885
    i32 17, label %979
    i32 18, label %1073
    i32 19, label %1167
    i32 20, label %1279
    i32 21, label %1376
    i32 22, label %1473
    i32 23, label %1570
    i32 24, label %1667
    i32 25, label %1759
    i32 26, label %1856
    i32 27, label %1953
    i32 28, label %2073
    i32 29, label %2216
    i32 30, label %2339
    i32 31, label %2435
    i32 32, label %2533
    i32 33, label %2715
    i32 34, label %2817
    i32 35, label %2910
    i32 36, label %3239
    i32 37, label %3349
    i32 38, label %3557
    i32 39, label %3667
    i32 40, label %4255
    i32 41, label %4366
    i32 42, label %5164
    i32 43, label %5258
    i32 44, label %5352
    i32 45, label %5446
    i32 46, label %5540
    i32 47, label %5636
    i32 48, label %5733
    i32 49, label %5830
    i32 50, label %5927
  ]

; <label>:221:                                    ; preds = %145
  %222 = load %struct.DState*, %struct.DState** %2, align 8
  %223 = getelementptr inbounds %struct.DState, %struct.DState* %222, i32 0, i32 1
  store i32 10, i32* %223, align 8
  br label %224

; <label>:224:                                    ; preds = %306, %221
  %225 = load %struct.DState*, %struct.DState** %2, align 8
  %226 = getelementptr inbounds %struct.DState, %struct.DState* %225, i32 0, i32 8
  %227 = load i32, i32* %226, align 4
  %228 = icmp sge i32 %227, 8
  br i1 %228, label %229, label %245

; <label>:229:                                    ; preds = %224
  %230 = load %struct.DState*, %struct.DState** %2, align 8
  %231 = getelementptr inbounds %struct.DState, %struct.DState* %230, i32 0, i32 7
  %232 = load i32, i32* %231, align 8
  %233 = load %struct.DState*, %struct.DState** %2, align 8
  %234 = getelementptr inbounds %struct.DState, %struct.DState* %233, i32 0, i32 8
  %235 = load i32, i32* %234, align 4
  %236 = sub nsw i32 %235, 8
  %237 = lshr i32 %232, %236
  %238 = and i32 %237, 255
  store i32 %238, i32* %32, align 4
  %239 = load %struct.DState*, %struct.DState** %2, align 8
  %240 = getelementptr inbounds %struct.DState, %struct.DState* %239, i32 0, i32 8
  %241 = load i32, i32* %240, align 4
  %242 = sub nsw i32 %241, 8
  store i32 %242, i32* %240, align 4
  %243 = load i32, i32* %32, align 4
  %244 = trunc i32 %243 to i8
  store i8 %244, i8* %3, align 1
  br label %307

; <label>:245:                                    ; preds = %224
  %246 = load %struct.DState*, %struct.DState** %2, align 8
  %247 = getelementptr inbounds %struct.DState, %struct.DState* %246, i32 0, i32 0
  %248 = load %struct.bz_stream*, %struct.bz_stream** %247, align 8
  %249 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %248, i32 0, i32 1
  %250 = load i32, i32* %249, align 8
  %251 = icmp eq i32 %250, 0
  br i1 %251, label %252, label %254

; <label>:252:                                    ; preds = %245
  %pgocount1 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 173)
  %253 = add i64 %pgocount1, 1
  store i64 %253, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 173)
  store i32 0, i32* %4, align 4
  br label %6029

; <label>:254:                                    ; preds = %245
  %pgocount2 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 52)
  %255 = add i64 %pgocount2, 1
  store i64 %255, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 52)
  %256 = load %struct.DState*, %struct.DState** %2, align 8
  %257 = getelementptr inbounds %struct.DState, %struct.DState* %256, i32 0, i32 7
  %258 = load i32, i32* %257, align 8
  %259 = shl i32 %258, 8
  %260 = load %struct.DState*, %struct.DState** %2, align 8
  %261 = getelementptr inbounds %struct.DState, %struct.DState* %260, i32 0, i32 0
  %262 = load %struct.bz_stream*, %struct.bz_stream** %261, align 8
  %263 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %262, i32 0, i32 0
  %264 = load i8*, i8** %263, align 8
  %265 = load i8, i8* %264, align 1
  %266 = zext i8 %265 to i32
  %267 = or i32 %259, %266
  %268 = load %struct.DState*, %struct.DState** %2, align 8
  %269 = getelementptr inbounds %struct.DState, %struct.DState* %268, i32 0, i32 7
  store i32 %267, i32* %269, align 8
  %270 = load %struct.DState*, %struct.DState** %2, align 8
  %271 = getelementptr inbounds %struct.DState, %struct.DState* %270, i32 0, i32 8
  %272 = load i32, i32* %271, align 4
  %273 = add nsw i32 %272, 8
  store i32 %273, i32* %271, align 4
  %274 = load %struct.DState*, %struct.DState** %2, align 8
  %275 = getelementptr inbounds %struct.DState, %struct.DState* %274, i32 0, i32 0
  %276 = load %struct.bz_stream*, %struct.bz_stream** %275, align 8
  %277 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %276, i32 0, i32 0
  %278 = load i8*, i8** %277, align 8
  %279 = getelementptr inbounds i8, i8* %278, i32 1
  store i8* %279, i8** %277, align 8
  %280 = load %struct.DState*, %struct.DState** %2, align 8
  %281 = getelementptr inbounds %struct.DState, %struct.DState* %280, i32 0, i32 0
  %282 = load %struct.bz_stream*, %struct.bz_stream** %281, align 8
  %283 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %282, i32 0, i32 1
  %284 = load i32, i32* %283, align 8
  %285 = add i32 %284, -1
  store i32 %285, i32* %283, align 8
  %286 = load %struct.DState*, %struct.DState** %2, align 8
  %287 = getelementptr inbounds %struct.DState, %struct.DState* %286, i32 0, i32 0
  %288 = load %struct.bz_stream*, %struct.bz_stream** %287, align 8
  %289 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %288, i32 0, i32 2
  %290 = load i32, i32* %289, align 4
  %291 = add i32 %290, 1
  store i32 %291, i32* %289, align 4
  %292 = load %struct.DState*, %struct.DState** %2, align 8
  %293 = getelementptr inbounds %struct.DState, %struct.DState* %292, i32 0, i32 0
  %294 = load %struct.bz_stream*, %struct.bz_stream** %293, align 8
  %295 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %294, i32 0, i32 2
  %296 = load i32, i32* %295, align 4
  %297 = icmp eq i32 %296, 0
  br i1 %297, label %298, label %306

; <label>:298:                                    ; preds = %254
  %pgocount3 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 94)
  %299 = add i64 %pgocount3, 1
  store i64 %299, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 94)
  %300 = load %struct.DState*, %struct.DState** %2, align 8
  %301 = getelementptr inbounds %struct.DState, %struct.DState* %300, i32 0, i32 0
  %302 = load %struct.bz_stream*, %struct.bz_stream** %301, align 8
  %303 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %302, i32 0, i32 3
  %304 = load i32, i32* %303, align 8
  %305 = add i32 %304, 1
  store i32 %305, i32* %303, align 8
  br label %306

; <label>:306:                                    ; preds = %298, %254
  br label %224

; <label>:307:                                    ; preds = %229
  %308 = load i8, i8* %3, align 1
  %309 = zext i8 %308 to i32
  %310 = icmp ne i32 %309, 66
  br i1 %310, label %311, label %313

; <label>:311:                                    ; preds = %307
  %pgocount4 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 224)
  %312 = add i64 %pgocount4, 1
  store i64 %312, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 224)
  store i32 -5, i32* %4, align 4
  br label %6029

; <label>:313:                                    ; preds = %307
  %pgocount5 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 225)
  %314 = add i64 %pgocount5, 1
  store i64 %314, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 225)
  br label %315

; <label>:315:                                    ; preds = %313, %145
  %316 = load %struct.DState*, %struct.DState** %2, align 8
  %317 = getelementptr inbounds %struct.DState, %struct.DState* %316, i32 0, i32 1
  store i32 11, i32* %317, align 8
  br label %318

; <label>:318:                                    ; preds = %399, %315
  %319 = load %struct.DState*, %struct.DState** %2, align 8
  %320 = getelementptr inbounds %struct.DState, %struct.DState* %319, i32 0, i32 8
  %321 = load i32, i32* %320, align 4
  %322 = icmp sge i32 %321, 8
  br i1 %322, label %323, label %339

; <label>:323:                                    ; preds = %318
  %324 = load %struct.DState*, %struct.DState** %2, align 8
  %325 = getelementptr inbounds %struct.DState, %struct.DState* %324, i32 0, i32 7
  %326 = load i32, i32* %325, align 8
  %327 = load %struct.DState*, %struct.DState** %2, align 8
  %328 = getelementptr inbounds %struct.DState, %struct.DState* %327, i32 0, i32 8
  %329 = load i32, i32* %328, align 4
  %330 = sub nsw i32 %329, 8
  %331 = lshr i32 %326, %330
  %332 = and i32 %331, 255
  store i32 %332, i32* %33, align 4
  %333 = load %struct.DState*, %struct.DState** %2, align 8
  %334 = getelementptr inbounds %struct.DState, %struct.DState* %333, i32 0, i32 8
  %335 = load i32, i32* %334, align 4
  %336 = sub nsw i32 %335, 8
  store i32 %336, i32* %334, align 4
  %337 = load i32, i32* %33, align 4
  %338 = trunc i32 %337 to i8
  store i8 %338, i8* %3, align 1
  br label %401

; <label>:339:                                    ; preds = %318
  %340 = load %struct.DState*, %struct.DState** %2, align 8
  %341 = getelementptr inbounds %struct.DState, %struct.DState* %340, i32 0, i32 0
  %342 = load %struct.bz_stream*, %struct.bz_stream** %341, align 8
  %343 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %342, i32 0, i32 1
  %344 = load i32, i32* %343, align 8
  %345 = icmp eq i32 %344, 0
  br i1 %345, label %346, label %348

; <label>:346:                                    ; preds = %339
  %pgocount6 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 155)
  %347 = add i64 %pgocount6, 1
  store i64 %347, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 155)
  store i32 0, i32* %4, align 4
  br label %6029

; <label>:348:                                    ; preds = %339
  %349 = load %struct.DState*, %struct.DState** %2, align 8
  %350 = getelementptr inbounds %struct.DState, %struct.DState* %349, i32 0, i32 7
  %351 = load i32, i32* %350, align 8
  %352 = shl i32 %351, 8
  %353 = load %struct.DState*, %struct.DState** %2, align 8
  %354 = getelementptr inbounds %struct.DState, %struct.DState* %353, i32 0, i32 0
  %355 = load %struct.bz_stream*, %struct.bz_stream** %354, align 8
  %356 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %355, i32 0, i32 0
  %357 = load i8*, i8** %356, align 8
  %358 = load i8, i8* %357, align 1
  %359 = zext i8 %358 to i32
  %360 = or i32 %352, %359
  %361 = load %struct.DState*, %struct.DState** %2, align 8
  %362 = getelementptr inbounds %struct.DState, %struct.DState* %361, i32 0, i32 7
  store i32 %360, i32* %362, align 8
  %363 = load %struct.DState*, %struct.DState** %2, align 8
  %364 = getelementptr inbounds %struct.DState, %struct.DState* %363, i32 0, i32 8
  %365 = load i32, i32* %364, align 4
  %366 = add nsw i32 %365, 8
  store i32 %366, i32* %364, align 4
  %367 = load %struct.DState*, %struct.DState** %2, align 8
  %368 = getelementptr inbounds %struct.DState, %struct.DState* %367, i32 0, i32 0
  %369 = load %struct.bz_stream*, %struct.bz_stream** %368, align 8
  %370 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %369, i32 0, i32 0
  %371 = load i8*, i8** %370, align 8
  %372 = getelementptr inbounds i8, i8* %371, i32 1
  store i8* %372, i8** %370, align 8
  %373 = load %struct.DState*, %struct.DState** %2, align 8
  %374 = getelementptr inbounds %struct.DState, %struct.DState* %373, i32 0, i32 0
  %375 = load %struct.bz_stream*, %struct.bz_stream** %374, align 8
  %376 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %375, i32 0, i32 1
  %377 = load i32, i32* %376, align 8
  %378 = add i32 %377, -1
  store i32 %378, i32* %376, align 8
  %379 = load %struct.DState*, %struct.DState** %2, align 8
  %380 = getelementptr inbounds %struct.DState, %struct.DState* %379, i32 0, i32 0
  %381 = load %struct.bz_stream*, %struct.bz_stream** %380, align 8
  %382 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %381, i32 0, i32 2
  %383 = load i32, i32* %382, align 4
  %384 = add i32 %383, 1
  store i32 %384, i32* %382, align 4
  %385 = load %struct.DState*, %struct.DState** %2, align 8
  %386 = getelementptr inbounds %struct.DState, %struct.DState* %385, i32 0, i32 0
  %387 = load %struct.bz_stream*, %struct.bz_stream** %386, align 8
  %388 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %387, i32 0, i32 2
  %389 = load i32, i32* %388, align 4
  %390 = icmp eq i32 %389, 0
  br i1 %390, label %391, label %399

; <label>:391:                                    ; preds = %348
  %pgocount7 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 85)
  %392 = add i64 %pgocount7, 1
  store i64 %392, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 85)
  %393 = load %struct.DState*, %struct.DState** %2, align 8
  %394 = getelementptr inbounds %struct.DState, %struct.DState* %393, i32 0, i32 0
  %395 = load %struct.bz_stream*, %struct.bz_stream** %394, align 8
  %396 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %395, i32 0, i32 3
  %397 = load i32, i32* %396, align 8
  %398 = add i32 %397, 1
  store i32 %398, i32* %396, align 8
  br label %399

; <label>:399:                                    ; preds = %391, %348
  %pgocount8 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 41)
  %400 = add i64 %pgocount8, 1
  store i64 %400, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 41)
  br label %318

; <label>:401:                                    ; preds = %323
  %402 = load i8, i8* %3, align 1
  %403 = zext i8 %402 to i32
  %404 = icmp ne i32 %403, 90
  br i1 %404, label %405, label %407

; <label>:405:                                    ; preds = %401
  %pgocount9 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 212)
  %406 = add i64 %pgocount9, 1
  store i64 %406, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 212)
  store i32 -5, i32* %4, align 4
  br label %6029

; <label>:407:                                    ; preds = %401
  %pgocount10 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 213)
  %408 = add i64 %pgocount10, 1
  store i64 %408, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 213)
  br label %409

; <label>:409:                                    ; preds = %407, %145
  %410 = load %struct.DState*, %struct.DState** %2, align 8
  %411 = getelementptr inbounds %struct.DState, %struct.DState* %410, i32 0, i32 1
  store i32 12, i32* %411, align 8
  br label %412

; <label>:412:                                    ; preds = %493, %409
  %413 = load %struct.DState*, %struct.DState** %2, align 8
  %414 = getelementptr inbounds %struct.DState, %struct.DState* %413, i32 0, i32 8
  %415 = load i32, i32* %414, align 4
  %416 = icmp sge i32 %415, 8
  br i1 %416, label %417, label %433

; <label>:417:                                    ; preds = %412
  %418 = load %struct.DState*, %struct.DState** %2, align 8
  %419 = getelementptr inbounds %struct.DState, %struct.DState* %418, i32 0, i32 7
  %420 = load i32, i32* %419, align 8
  %421 = load %struct.DState*, %struct.DState** %2, align 8
  %422 = getelementptr inbounds %struct.DState, %struct.DState* %421, i32 0, i32 8
  %423 = load i32, i32* %422, align 4
  %424 = sub nsw i32 %423, 8
  %425 = lshr i32 %420, %424
  %426 = and i32 %425, 255
  store i32 %426, i32* %34, align 4
  %427 = load %struct.DState*, %struct.DState** %2, align 8
  %428 = getelementptr inbounds %struct.DState, %struct.DState* %427, i32 0, i32 8
  %429 = load i32, i32* %428, align 4
  %430 = sub nsw i32 %429, 8
  store i32 %430, i32* %428, align 4
  %431 = load i32, i32* %34, align 4
  %432 = trunc i32 %431 to i8
  store i8 %432, i8* %3, align 1
  br label %495

; <label>:433:                                    ; preds = %412
  %434 = load %struct.DState*, %struct.DState** %2, align 8
  %435 = getelementptr inbounds %struct.DState, %struct.DState* %434, i32 0, i32 0
  %436 = load %struct.bz_stream*, %struct.bz_stream** %435, align 8
  %437 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %436, i32 0, i32 1
  %438 = load i32, i32* %437, align 8
  %439 = icmp eq i32 %438, 0
  br i1 %439, label %440, label %442

; <label>:440:                                    ; preds = %433
  %pgocount11 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 151)
  %441 = add i64 %pgocount11, 1
  store i64 %441, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 151)
  store i32 0, i32* %4, align 4
  br label %6029

; <label>:442:                                    ; preds = %433
  %443 = load %struct.DState*, %struct.DState** %2, align 8
  %444 = getelementptr inbounds %struct.DState, %struct.DState* %443, i32 0, i32 7
  %445 = load i32, i32* %444, align 8
  %446 = shl i32 %445, 8
  %447 = load %struct.DState*, %struct.DState** %2, align 8
  %448 = getelementptr inbounds %struct.DState, %struct.DState* %447, i32 0, i32 0
  %449 = load %struct.bz_stream*, %struct.bz_stream** %448, align 8
  %450 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %449, i32 0, i32 0
  %451 = load i8*, i8** %450, align 8
  %452 = load i8, i8* %451, align 1
  %453 = zext i8 %452 to i32
  %454 = or i32 %446, %453
  %455 = load %struct.DState*, %struct.DState** %2, align 8
  %456 = getelementptr inbounds %struct.DState, %struct.DState* %455, i32 0, i32 7
  store i32 %454, i32* %456, align 8
  %457 = load %struct.DState*, %struct.DState** %2, align 8
  %458 = getelementptr inbounds %struct.DState, %struct.DState* %457, i32 0, i32 8
  %459 = load i32, i32* %458, align 4
  %460 = add nsw i32 %459, 8
  store i32 %460, i32* %458, align 4
  %461 = load %struct.DState*, %struct.DState** %2, align 8
  %462 = getelementptr inbounds %struct.DState, %struct.DState* %461, i32 0, i32 0
  %463 = load %struct.bz_stream*, %struct.bz_stream** %462, align 8
  %464 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %463, i32 0, i32 0
  %465 = load i8*, i8** %464, align 8
  %466 = getelementptr inbounds i8, i8* %465, i32 1
  store i8* %466, i8** %464, align 8
  %467 = load %struct.DState*, %struct.DState** %2, align 8
  %468 = getelementptr inbounds %struct.DState, %struct.DState* %467, i32 0, i32 0
  %469 = load %struct.bz_stream*, %struct.bz_stream** %468, align 8
  %470 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %469, i32 0, i32 1
  %471 = load i32, i32* %470, align 8
  %472 = add i32 %471, -1
  store i32 %472, i32* %470, align 8
  %473 = load %struct.DState*, %struct.DState** %2, align 8
  %474 = getelementptr inbounds %struct.DState, %struct.DState* %473, i32 0, i32 0
  %475 = load %struct.bz_stream*, %struct.bz_stream** %474, align 8
  %476 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %475, i32 0, i32 2
  %477 = load i32, i32* %476, align 4
  %478 = add i32 %477, 1
  store i32 %478, i32* %476, align 4
  %479 = load %struct.DState*, %struct.DState** %2, align 8
  %480 = getelementptr inbounds %struct.DState, %struct.DState* %479, i32 0, i32 0
  %481 = load %struct.bz_stream*, %struct.bz_stream** %480, align 8
  %482 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %481, i32 0, i32 2
  %483 = load i32, i32* %482, align 4
  %484 = icmp eq i32 %483, 0
  br i1 %484, label %485, label %493

; <label>:485:                                    ; preds = %442
  %pgocount12 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 82)
  %486 = add i64 %pgocount12, 1
  store i64 %486, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 82)
  %487 = load %struct.DState*, %struct.DState** %2, align 8
  %488 = getelementptr inbounds %struct.DState, %struct.DState* %487, i32 0, i32 0
  %489 = load %struct.bz_stream*, %struct.bz_stream** %488, align 8
  %490 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %489, i32 0, i32 3
  %491 = load i32, i32* %490, align 8
  %492 = add i32 %491, 1
  store i32 %492, i32* %490, align 8
  br label %493

; <label>:493:                                    ; preds = %485, %442
  %pgocount13 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 38)
  %494 = add i64 %pgocount13, 1
  store i64 %494, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 38)
  br label %412

; <label>:495:                                    ; preds = %417
  %496 = load i8, i8* %3, align 1
  %497 = zext i8 %496 to i32
  %498 = icmp ne i32 %497, 104
  br i1 %498, label %499, label %501

; <label>:499:                                    ; preds = %495
  %pgocount14 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 204)
  %500 = add i64 %pgocount14, 1
  store i64 %500, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 204)
  store i32 -5, i32* %4, align 4
  br label %6029

; <label>:501:                                    ; preds = %495
  %pgocount15 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 205)
  %502 = add i64 %pgocount15, 1
  store i64 %502, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 205)
  br label %503

; <label>:503:                                    ; preds = %501, %145
  %504 = load %struct.DState*, %struct.DState** %2, align 8
  %505 = getelementptr inbounds %struct.DState, %struct.DState* %504, i32 0, i32 1
  store i32 13, i32* %505, align 8
  br label %506

; <label>:506:                                    ; preds = %588, %503
  %507 = load %struct.DState*, %struct.DState** %2, align 8
  %508 = getelementptr inbounds %struct.DState, %struct.DState* %507, i32 0, i32 8
  %509 = load i32, i32* %508, align 4
  %510 = icmp sge i32 %509, 8
  br i1 %510, label %511, label %528

; <label>:511:                                    ; preds = %506
  %512 = load %struct.DState*, %struct.DState** %2, align 8
  %513 = getelementptr inbounds %struct.DState, %struct.DState* %512, i32 0, i32 7
  %514 = load i32, i32* %513, align 8
  %515 = load %struct.DState*, %struct.DState** %2, align 8
  %516 = getelementptr inbounds %struct.DState, %struct.DState* %515, i32 0, i32 8
  %517 = load i32, i32* %516, align 4
  %518 = sub nsw i32 %517, 8
  %519 = lshr i32 %514, %518
  %520 = and i32 %519, 255
  store i32 %520, i32* %35, align 4
  %521 = load %struct.DState*, %struct.DState** %2, align 8
  %522 = getelementptr inbounds %struct.DState, %struct.DState* %521, i32 0, i32 8
  %523 = load i32, i32* %522, align 4
  %524 = sub nsw i32 %523, 8
  store i32 %524, i32* %522, align 4
  %525 = load i32, i32* %35, align 4
  %526 = load %struct.DState*, %struct.DState** %2, align 8
  %527 = getelementptr inbounds %struct.DState, %struct.DState* %526, i32 0, i32 9
  store i32 %525, i32* %527, align 8
  br label %590

; <label>:528:                                    ; preds = %506
  %529 = load %struct.DState*, %struct.DState** %2, align 8
  %530 = getelementptr inbounds %struct.DState, %struct.DState* %529, i32 0, i32 0
  %531 = load %struct.bz_stream*, %struct.bz_stream** %530, align 8
  %532 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %531, i32 0, i32 1
  %533 = load i32, i32* %532, align 8
  %534 = icmp eq i32 %533, 0
  br i1 %534, label %535, label %537

; <label>:535:                                    ; preds = %528
  %pgocount16 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 147)
  %536 = add i64 %pgocount16, 1
  store i64 %536, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 147)
  store i32 0, i32* %4, align 4
  br label %6029

; <label>:537:                                    ; preds = %528
  %538 = load %struct.DState*, %struct.DState** %2, align 8
  %539 = getelementptr inbounds %struct.DState, %struct.DState* %538, i32 0, i32 7
  %540 = load i32, i32* %539, align 8
  %541 = shl i32 %540, 8
  %542 = load %struct.DState*, %struct.DState** %2, align 8
  %543 = getelementptr inbounds %struct.DState, %struct.DState* %542, i32 0, i32 0
  %544 = load %struct.bz_stream*, %struct.bz_stream** %543, align 8
  %545 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %544, i32 0, i32 0
  %546 = load i8*, i8** %545, align 8
  %547 = load i8, i8* %546, align 1
  %548 = zext i8 %547 to i32
  %549 = or i32 %541, %548
  %550 = load %struct.DState*, %struct.DState** %2, align 8
  %551 = getelementptr inbounds %struct.DState, %struct.DState* %550, i32 0, i32 7
  store i32 %549, i32* %551, align 8
  %552 = load %struct.DState*, %struct.DState** %2, align 8
  %553 = getelementptr inbounds %struct.DState, %struct.DState* %552, i32 0, i32 8
  %554 = load i32, i32* %553, align 4
  %555 = add nsw i32 %554, 8
  store i32 %555, i32* %553, align 4
  %556 = load %struct.DState*, %struct.DState** %2, align 8
  %557 = getelementptr inbounds %struct.DState, %struct.DState* %556, i32 0, i32 0
  %558 = load %struct.bz_stream*, %struct.bz_stream** %557, align 8
  %559 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %558, i32 0, i32 0
  %560 = load i8*, i8** %559, align 8
  %561 = getelementptr inbounds i8, i8* %560, i32 1
  store i8* %561, i8** %559, align 8
  %562 = load %struct.DState*, %struct.DState** %2, align 8
  %563 = getelementptr inbounds %struct.DState, %struct.DState* %562, i32 0, i32 0
  %564 = load %struct.bz_stream*, %struct.bz_stream** %563, align 8
  %565 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %564, i32 0, i32 1
  %566 = load i32, i32* %565, align 8
  %567 = add i32 %566, -1
  store i32 %567, i32* %565, align 8
  %568 = load %struct.DState*, %struct.DState** %2, align 8
  %569 = getelementptr inbounds %struct.DState, %struct.DState* %568, i32 0, i32 0
  %570 = load %struct.bz_stream*, %struct.bz_stream** %569, align 8
  %571 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %570, i32 0, i32 2
  %572 = load i32, i32* %571, align 4
  %573 = add i32 %572, 1
  store i32 %573, i32* %571, align 4
  %574 = load %struct.DState*, %struct.DState** %2, align 8
  %575 = getelementptr inbounds %struct.DState, %struct.DState* %574, i32 0, i32 0
  %576 = load %struct.bz_stream*, %struct.bz_stream** %575, align 8
  %577 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %576, i32 0, i32 2
  %578 = load i32, i32* %577, align 4
  %579 = icmp eq i32 %578, 0
  br i1 %579, label %580, label %588

; <label>:580:                                    ; preds = %537
  %pgocount17 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 78)
  %581 = add i64 %pgocount17, 1
  store i64 %581, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 78)
  %582 = load %struct.DState*, %struct.DState** %2, align 8
  %583 = getelementptr inbounds %struct.DState, %struct.DState* %582, i32 0, i32 0
  %584 = load %struct.bz_stream*, %struct.bz_stream** %583, align 8
  %585 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %584, i32 0, i32 3
  %586 = load i32, i32* %585, align 8
  %587 = add i32 %586, 1
  store i32 %587, i32* %585, align 8
  br label %588

; <label>:588:                                    ; preds = %580, %537
  %pgocount18 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 34)
  %589 = add i64 %pgocount18, 1
  store i64 %589, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 34)
  br label %506

; <label>:590:                                    ; preds = %511
  %591 = load %struct.DState*, %struct.DState** %2, align 8
  %592 = getelementptr inbounds %struct.DState, %struct.DState* %591, i32 0, i32 9
  %593 = load i32, i32* %592, align 8
  %594 = icmp slt i32 %593, 49
  br i1 %594, label %601, label %595

; <label>:595:                                    ; preds = %590
  %pgocount19 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 197)
  %596 = add i64 %pgocount19, 1
  store i64 %596, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 197)
  %597 = load %struct.DState*, %struct.DState** %2, align 8
  %598 = getelementptr inbounds %struct.DState, %struct.DState* %597, i32 0, i32 9
  %599 = load i32, i32* %598, align 8
  %600 = icmp sgt i32 %599, 57
  br i1 %600, label %601, label %603

; <label>:601:                                    ; preds = %595, %590
  %pgocount20 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 169)
  %602 = add i64 %pgocount20, 1
  store i64 %602, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 169)
  store i32 -5, i32* %4, align 4
  br label %6029

; <label>:603:                                    ; preds = %595
  %604 = load %struct.DState*, %struct.DState** %2, align 8
  %605 = getelementptr inbounds %struct.DState, %struct.DState* %604, i32 0, i32 9
  %606 = load i32, i32* %605, align 8
  %607 = sub nsw i32 %606, 48
  store i32 %607, i32* %605, align 8
  %608 = load %struct.DState*, %struct.DState** %2, align 8
  %609 = getelementptr inbounds %struct.DState, %struct.DState* %608, i32 0, i32 10
  %610 = load i8, i8* %609, align 4
  %611 = icmp ne i8 %610, 0
  br i1 %611, label %612, label %664

; <label>:612:                                    ; preds = %603
  %613 = load %struct.bz_stream*, %struct.bz_stream** %7, align 8
  %614 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %613, i32 0, i32 9
  %615 = load i8* (i8*, i32, i32)*, i8* (i8*, i32, i32)** %614, align 8
  %616 = load %struct.bz_stream*, %struct.bz_stream** %7, align 8
  %617 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %616, i32 0, i32 11
  %618 = load i8*, i8** %617, align 8
  %619 = load %struct.DState*, %struct.DState** %2, align 8
  %620 = getelementptr inbounds %struct.DState, %struct.DState* %619, i32 0, i32 9
  %621 = load i32, i32* %620, align 8
  %622 = mul nsw i32 %621, 100000
  %623 = sext i32 %622 to i64
  %624 = mul i64 %623, 2
  %625 = trunc i64 %624 to i32
  %626 = ptrtoint i8* (i8*, i32, i32)* %615 to i64
  call void @__llvm_profile_instrument_target(i64 %626, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BZ2_decompress to i8*), i32 0)
  %627 = call i8* %615(i8* %618, i32 %625, i32 1)
  %628 = bitcast i8* %627 to i16*
  %629 = load %struct.DState*, %struct.DState** %2, align 8
  %630 = getelementptr inbounds %struct.DState, %struct.DState* %629, i32 0, i32 21
  store i16* %628, i16** %630, align 8
  %631 = load %struct.bz_stream*, %struct.bz_stream** %7, align 8
  %632 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %631, i32 0, i32 9
  %633 = load i8* (i8*, i32, i32)*, i8* (i8*, i32, i32)** %632, align 8
  %634 = load %struct.bz_stream*, %struct.bz_stream** %7, align 8
  %635 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %634, i32 0, i32 11
  %636 = load i8*, i8** %635, align 8
  %637 = load %struct.DState*, %struct.DState** %2, align 8
  %638 = getelementptr inbounds %struct.DState, %struct.DState* %637, i32 0, i32 9
  %639 = load i32, i32* %638, align 8
  %640 = mul nsw i32 %639, 100000
  %641 = add nsw i32 1, %640
  %642 = ashr i32 %641, 1
  %643 = sext i32 %642 to i64
  %644 = mul i64 %643, 1
  %645 = trunc i64 %644 to i32
  %646 = ptrtoint i8* (i8*, i32, i32)* %633 to i64
  call void @__llvm_profile_instrument_target(i64 %646, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BZ2_decompress to i8*), i32 1)
  %647 = call i8* %633(i8* %636, i32 %645, i32 1)
  %648 = load %struct.DState*, %struct.DState** %2, align 8
  %649 = getelementptr inbounds %struct.DState, %struct.DState* %648, i32 0, i32 22
  store i8* %647, i8** %649, align 8
  %650 = load %struct.DState*, %struct.DState** %2, align 8
  %651 = getelementptr inbounds %struct.DState, %struct.DState* %650, i32 0, i32 21
  %652 = load i16*, i16** %651, align 8
  %653 = icmp eq i16* %652, null
  br i1 %653, label %660, label %654

; <label>:654:                                    ; preds = %612
  %pgocount21 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 256)
  %655 = add i64 %pgocount21, 1
  store i64 %655, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 256)
  %656 = load %struct.DState*, %struct.DState** %2, align 8
  %657 = getelementptr inbounds %struct.DState, %struct.DState* %656, i32 0, i32 22
  %658 = load i8*, i8** %657, align 8
  %659 = icmp eq i8* %658, null
  br i1 %659, label %660, label %662

; <label>:660:                                    ; preds = %654, %612
  %pgocount22 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 257)
  %661 = add i64 %pgocount22, 1
  store i64 %661, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 257)
  store i32 -3, i32* %4, align 4
  br label %6029

; <label>:662:                                    ; preds = %654
  %pgocount23 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 259)
  %663 = add i64 %pgocount23, 1
  store i64 %663, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 259)
  br label %691

; <label>:664:                                    ; preds = %603
  %665 = load %struct.bz_stream*, %struct.bz_stream** %7, align 8
  %666 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %665, i32 0, i32 9
  %667 = load i8* (i8*, i32, i32)*, i8* (i8*, i32, i32)** %666, align 8
  %668 = load %struct.bz_stream*, %struct.bz_stream** %7, align 8
  %669 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %668, i32 0, i32 11
  %670 = load i8*, i8** %669, align 8
  %671 = load %struct.DState*, %struct.DState** %2, align 8
  %672 = getelementptr inbounds %struct.DState, %struct.DState* %671, i32 0, i32 9
  %673 = load i32, i32* %672, align 8
  %674 = mul nsw i32 %673, 100000
  %675 = sext i32 %674 to i64
  %676 = mul i64 %675, 4
  %677 = trunc i64 %676 to i32
  %678 = ptrtoint i8* (i8*, i32, i32)* %667 to i64
  call void @__llvm_profile_instrument_target(i64 %678, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BZ2_decompress to i8*), i32 2)
  %679 = call i8* %667(i8* %670, i32 %677, i32 1)
  %680 = bitcast i8* %679 to i32*
  %681 = load %struct.DState*, %struct.DState** %2, align 8
  %682 = getelementptr inbounds %struct.DState, %struct.DState* %681, i32 0, i32 20
  store i32* %680, i32** %682, align 8
  %683 = load %struct.DState*, %struct.DState** %2, align 8
  %684 = getelementptr inbounds %struct.DState, %struct.DState* %683, i32 0, i32 20
  %685 = load i32*, i32** %684, align 8
  %686 = icmp eq i32* %685, null
  br i1 %686, label %687, label %689

; <label>:687:                                    ; preds = %664
  %pgocount24 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 265)
  %688 = add i64 %pgocount24, 1
  store i64 %688, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 265)
  store i32 -3, i32* %4, align 4
  br label %6029

; <label>:689:                                    ; preds = %664
  %pgocount25 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 260)
  %690 = add i64 %pgocount25, 1
  store i64 %690, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 260)
  br label %691

; <label>:691:                                    ; preds = %689, %662
  br label %692

; <label>:692:                                    ; preds = %691, %145
  %693 = load %struct.DState*, %struct.DState** %2, align 8
  %694 = getelementptr inbounds %struct.DState, %struct.DState* %693, i32 0, i32 1
  store i32 14, i32* %694, align 8
  br label %695

; <label>:695:                                    ; preds = %777, %692
  %696 = load %struct.DState*, %struct.DState** %2, align 8
  %697 = getelementptr inbounds %struct.DState, %struct.DState* %696, i32 0, i32 8
  %698 = load i32, i32* %697, align 4
  %699 = icmp sge i32 %698, 8
  br i1 %699, label %700, label %716

; <label>:700:                                    ; preds = %695
  %701 = load %struct.DState*, %struct.DState** %2, align 8
  %702 = getelementptr inbounds %struct.DState, %struct.DState* %701, i32 0, i32 7
  %703 = load i32, i32* %702, align 8
  %704 = load %struct.DState*, %struct.DState** %2, align 8
  %705 = getelementptr inbounds %struct.DState, %struct.DState* %704, i32 0, i32 8
  %706 = load i32, i32* %705, align 4
  %707 = sub nsw i32 %706, 8
  %708 = lshr i32 %703, %707
  %709 = and i32 %708, 255
  store i32 %709, i32* %36, align 4
  %710 = load %struct.DState*, %struct.DState** %2, align 8
  %711 = getelementptr inbounds %struct.DState, %struct.DState* %710, i32 0, i32 8
  %712 = load i32, i32* %711, align 4
  %713 = sub nsw i32 %712, 8
  store i32 %713, i32* %711, align 4
  %714 = load i32, i32* %36, align 4
  %715 = trunc i32 %714 to i8
  store i8 %715, i8* %3, align 1
  br label %778

; <label>:716:                                    ; preds = %695
  %717 = load %struct.DState*, %struct.DState** %2, align 8
  %718 = getelementptr inbounds %struct.DState, %struct.DState* %717, i32 0, i32 0
  %719 = load %struct.bz_stream*, %struct.bz_stream** %718, align 8
  %720 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %719, i32 0, i32 1
  %721 = load i32, i32* %720, align 8
  %722 = icmp eq i32 %721, 0
  br i1 %722, label %723, label %725

; <label>:723:                                    ; preds = %716
  %pgocount26 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 164)
  %724 = add i64 %pgocount26, 1
  store i64 %724, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 164)
  store i32 0, i32* %4, align 4
  br label %6029

; <label>:725:                                    ; preds = %716
  %pgocount27 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 47)
  %726 = add i64 %pgocount27, 1
  store i64 %726, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 47)
  %727 = load %struct.DState*, %struct.DState** %2, align 8
  %728 = getelementptr inbounds %struct.DState, %struct.DState* %727, i32 0, i32 7
  %729 = load i32, i32* %728, align 8
  %730 = shl i32 %729, 8
  %731 = load %struct.DState*, %struct.DState** %2, align 8
  %732 = getelementptr inbounds %struct.DState, %struct.DState* %731, i32 0, i32 0
  %733 = load %struct.bz_stream*, %struct.bz_stream** %732, align 8
  %734 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %733, i32 0, i32 0
  %735 = load i8*, i8** %734, align 8
  %736 = load i8, i8* %735, align 1
  %737 = zext i8 %736 to i32
  %738 = or i32 %730, %737
  %739 = load %struct.DState*, %struct.DState** %2, align 8
  %740 = getelementptr inbounds %struct.DState, %struct.DState* %739, i32 0, i32 7
  store i32 %738, i32* %740, align 8
  %741 = load %struct.DState*, %struct.DState** %2, align 8
  %742 = getelementptr inbounds %struct.DState, %struct.DState* %741, i32 0, i32 8
  %743 = load i32, i32* %742, align 4
  %744 = add nsw i32 %743, 8
  store i32 %744, i32* %742, align 4
  %745 = load %struct.DState*, %struct.DState** %2, align 8
  %746 = getelementptr inbounds %struct.DState, %struct.DState* %745, i32 0, i32 0
  %747 = load %struct.bz_stream*, %struct.bz_stream** %746, align 8
  %748 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %747, i32 0, i32 0
  %749 = load i8*, i8** %748, align 8
  %750 = getelementptr inbounds i8, i8* %749, i32 1
  store i8* %750, i8** %748, align 8
  %751 = load %struct.DState*, %struct.DState** %2, align 8
  %752 = getelementptr inbounds %struct.DState, %struct.DState* %751, i32 0, i32 0
  %753 = load %struct.bz_stream*, %struct.bz_stream** %752, align 8
  %754 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %753, i32 0, i32 1
  %755 = load i32, i32* %754, align 8
  %756 = add i32 %755, -1
  store i32 %756, i32* %754, align 8
  %757 = load %struct.DState*, %struct.DState** %2, align 8
  %758 = getelementptr inbounds %struct.DState, %struct.DState* %757, i32 0, i32 0
  %759 = load %struct.bz_stream*, %struct.bz_stream** %758, align 8
  %760 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %759, i32 0, i32 2
  %761 = load i32, i32* %760, align 4
  %762 = add i32 %761, 1
  store i32 %762, i32* %760, align 4
  %763 = load %struct.DState*, %struct.DState** %2, align 8
  %764 = getelementptr inbounds %struct.DState, %struct.DState* %763, i32 0, i32 0
  %765 = load %struct.bz_stream*, %struct.bz_stream** %764, align 8
  %766 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %765, i32 0, i32 2
  %767 = load i32, i32* %766, align 4
  %768 = icmp eq i32 %767, 0
  br i1 %768, label %769, label %777

; <label>:769:                                    ; preds = %725
  %pgocount28 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 89)
  %770 = add i64 %pgocount28, 1
  store i64 %770, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 89)
  %771 = load %struct.DState*, %struct.DState** %2, align 8
  %772 = getelementptr inbounds %struct.DState, %struct.DState* %771, i32 0, i32 0
  %773 = load %struct.bz_stream*, %struct.bz_stream** %772, align 8
  %774 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %773, i32 0, i32 3
  %775 = load i32, i32* %774, align 8
  %776 = add i32 %775, 1
  store i32 %776, i32* %774, align 8
  br label %777

; <label>:777:                                    ; preds = %769, %725
  br label %695

; <label>:778:                                    ; preds = %700
  %779 = load i8, i8* %3, align 1
  %780 = zext i8 %779 to i32
  %781 = icmp eq i32 %780, 23
  br i1 %781, label %782, label %783

; <label>:782:                                    ; preds = %778
  br label %5162

; <label>:783:                                    ; preds = %778
  %784 = load i8, i8* %3, align 1
  %785 = zext i8 %784 to i32
  %786 = icmp ne i32 %785, 49
  br i1 %786, label %787, label %789

; <label>:787:                                    ; preds = %783
  %pgocount29 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 245)
  %788 = add i64 %pgocount29, 1
  store i64 %788, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 245)
  store i32 -4, i32* %4, align 4
  br label %6029

; <label>:789:                                    ; preds = %783
  %pgocount30 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 246)
  %790 = add i64 %pgocount30, 1
  store i64 %790, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 246)
  br label %791

; <label>:791:                                    ; preds = %789, %145
  %792 = load %struct.DState*, %struct.DState** %2, align 8
  %793 = getelementptr inbounds %struct.DState, %struct.DState* %792, i32 0, i32 1
  store i32 15, i32* %793, align 8
  br label %794

; <label>:794:                                    ; preds = %876, %791
  %795 = load %struct.DState*, %struct.DState** %2, align 8
  %796 = getelementptr inbounds %struct.DState, %struct.DState* %795, i32 0, i32 8
  %797 = load i32, i32* %796, align 4
  %798 = icmp sge i32 %797, 8
  br i1 %798, label %799, label %815

; <label>:799:                                    ; preds = %794
  %800 = load %struct.DState*, %struct.DState** %2, align 8
  %801 = getelementptr inbounds %struct.DState, %struct.DState* %800, i32 0, i32 7
  %802 = load i32, i32* %801, align 8
  %803 = load %struct.DState*, %struct.DState** %2, align 8
  %804 = getelementptr inbounds %struct.DState, %struct.DState* %803, i32 0, i32 8
  %805 = load i32, i32* %804, align 4
  %806 = sub nsw i32 %805, 8
  %807 = lshr i32 %802, %806
  %808 = and i32 %807, 255
  store i32 %808, i32* %37, align 4
  %809 = load %struct.DState*, %struct.DState** %2, align 8
  %810 = getelementptr inbounds %struct.DState, %struct.DState* %809, i32 0, i32 8
  %811 = load i32, i32* %810, align 4
  %812 = sub nsw i32 %811, 8
  store i32 %812, i32* %810, align 4
  %813 = load i32, i32* %37, align 4
  %814 = trunc i32 %813 to i8
  store i8 %814, i8* %3, align 1
  br label %877

; <label>:815:                                    ; preds = %794
  %816 = load %struct.DState*, %struct.DState** %2, align 8
  %817 = getelementptr inbounds %struct.DState, %struct.DState* %816, i32 0, i32 0
  %818 = load %struct.bz_stream*, %struct.bz_stream** %817, align 8
  %819 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %818, i32 0, i32 1
  %820 = load i32, i32* %819, align 8
  %821 = icmp eq i32 %820, 0
  br i1 %821, label %822, label %824

; <label>:822:                                    ; preds = %815
  %pgocount31 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 160)
  %823 = add i64 %pgocount31, 1
  store i64 %823, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 160)
  store i32 0, i32* %4, align 4
  br label %6029

; <label>:824:                                    ; preds = %815
  %pgocount32 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 46)
  %825 = add i64 %pgocount32, 1
  store i64 %825, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 46)
  %826 = load %struct.DState*, %struct.DState** %2, align 8
  %827 = getelementptr inbounds %struct.DState, %struct.DState* %826, i32 0, i32 7
  %828 = load i32, i32* %827, align 8
  %829 = shl i32 %828, 8
  %830 = load %struct.DState*, %struct.DState** %2, align 8
  %831 = getelementptr inbounds %struct.DState, %struct.DState* %830, i32 0, i32 0
  %832 = load %struct.bz_stream*, %struct.bz_stream** %831, align 8
  %833 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %832, i32 0, i32 0
  %834 = load i8*, i8** %833, align 8
  %835 = load i8, i8* %834, align 1
  %836 = zext i8 %835 to i32
  %837 = or i32 %829, %836
  %838 = load %struct.DState*, %struct.DState** %2, align 8
  %839 = getelementptr inbounds %struct.DState, %struct.DState* %838, i32 0, i32 7
  store i32 %837, i32* %839, align 8
  %840 = load %struct.DState*, %struct.DState** %2, align 8
  %841 = getelementptr inbounds %struct.DState, %struct.DState* %840, i32 0, i32 8
  %842 = load i32, i32* %841, align 4
  %843 = add nsw i32 %842, 8
  store i32 %843, i32* %841, align 4
  %844 = load %struct.DState*, %struct.DState** %2, align 8
  %845 = getelementptr inbounds %struct.DState, %struct.DState* %844, i32 0, i32 0
  %846 = load %struct.bz_stream*, %struct.bz_stream** %845, align 8
  %847 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %846, i32 0, i32 0
  %848 = load i8*, i8** %847, align 8
  %849 = getelementptr inbounds i8, i8* %848, i32 1
  store i8* %849, i8** %847, align 8
  %850 = load %struct.DState*, %struct.DState** %2, align 8
  %851 = getelementptr inbounds %struct.DState, %struct.DState* %850, i32 0, i32 0
  %852 = load %struct.bz_stream*, %struct.bz_stream** %851, align 8
  %853 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %852, i32 0, i32 1
  %854 = load i32, i32* %853, align 8
  %855 = add i32 %854, -1
  store i32 %855, i32* %853, align 8
  %856 = load %struct.DState*, %struct.DState** %2, align 8
  %857 = getelementptr inbounds %struct.DState, %struct.DState* %856, i32 0, i32 0
  %858 = load %struct.bz_stream*, %struct.bz_stream** %857, align 8
  %859 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %858, i32 0, i32 2
  %860 = load i32, i32* %859, align 4
  %861 = add i32 %860, 1
  store i32 %861, i32* %859, align 4
  %862 = load %struct.DState*, %struct.DState** %2, align 8
  %863 = getelementptr inbounds %struct.DState, %struct.DState* %862, i32 0, i32 0
  %864 = load %struct.bz_stream*, %struct.bz_stream** %863, align 8
  %865 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %864, i32 0, i32 2
  %866 = load i32, i32* %865, align 4
  %867 = icmp eq i32 %866, 0
  br i1 %867, label %868, label %876

; <label>:868:                                    ; preds = %824
  %pgocount33 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 88)
  %869 = add i64 %pgocount33, 1
  store i64 %869, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 88)
  %870 = load %struct.DState*, %struct.DState** %2, align 8
  %871 = getelementptr inbounds %struct.DState, %struct.DState* %870, i32 0, i32 0
  %872 = load %struct.bz_stream*, %struct.bz_stream** %871, align 8
  %873 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %872, i32 0, i32 3
  %874 = load i32, i32* %873, align 8
  %875 = add i32 %874, 1
  store i32 %875, i32* %873, align 8
  br label %876

; <label>:876:                                    ; preds = %868, %824
  br label %794

; <label>:877:                                    ; preds = %799
  %878 = load i8, i8* %3, align 1
  %879 = zext i8 %878 to i32
  %880 = icmp ne i32 %879, 65
  br i1 %880, label %881, label %883

; <label>:881:                                    ; preds = %877
  %pgocount34 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 219)
  %882 = add i64 %pgocount34, 1
  store i64 %882, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 219)
  store i32 -4, i32* %4, align 4
  br label %6029

; <label>:883:                                    ; preds = %877
  %pgocount35 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 220)
  %884 = add i64 %pgocount35, 1
  store i64 %884, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 220)
  br label %885

; <label>:885:                                    ; preds = %883, %145
  %886 = load %struct.DState*, %struct.DState** %2, align 8
  %887 = getelementptr inbounds %struct.DState, %struct.DState* %886, i32 0, i32 1
  store i32 16, i32* %887, align 8
  br label %888

; <label>:888:                                    ; preds = %969, %885
  %889 = load %struct.DState*, %struct.DState** %2, align 8
  %890 = getelementptr inbounds %struct.DState, %struct.DState* %889, i32 0, i32 8
  %891 = load i32, i32* %890, align 4
  %892 = icmp sge i32 %891, 8
  br i1 %892, label %893, label %909

; <label>:893:                                    ; preds = %888
  %894 = load %struct.DState*, %struct.DState** %2, align 8
  %895 = getelementptr inbounds %struct.DState, %struct.DState* %894, i32 0, i32 7
  %896 = load i32, i32* %895, align 8
  %897 = load %struct.DState*, %struct.DState** %2, align 8
  %898 = getelementptr inbounds %struct.DState, %struct.DState* %897, i32 0, i32 8
  %899 = load i32, i32* %898, align 4
  %900 = sub nsw i32 %899, 8
  %901 = lshr i32 %896, %900
  %902 = and i32 %901, 255
  store i32 %902, i32* %38, align 4
  %903 = load %struct.DState*, %struct.DState** %2, align 8
  %904 = getelementptr inbounds %struct.DState, %struct.DState* %903, i32 0, i32 8
  %905 = load i32, i32* %904, align 4
  %906 = sub nsw i32 %905, 8
  store i32 %906, i32* %904, align 4
  %907 = load i32, i32* %38, align 4
  %908 = trunc i32 %907 to i8
  store i8 %908, i8* %3, align 1
  br label %971

; <label>:909:                                    ; preds = %888
  %910 = load %struct.DState*, %struct.DState** %2, align 8
  %911 = getelementptr inbounds %struct.DState, %struct.DState* %910, i32 0, i32 0
  %912 = load %struct.bz_stream*, %struct.bz_stream** %911, align 8
  %913 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %912, i32 0, i32 1
  %914 = load i32, i32* %913, align 8
  %915 = icmp eq i32 %914, 0
  br i1 %915, label %916, label %918

; <label>:916:                                    ; preds = %909
  %pgocount36 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 152)
  %917 = add i64 %pgocount36, 1
  store i64 %917, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 152)
  store i32 0, i32* %4, align 4
  br label %6029

; <label>:918:                                    ; preds = %909
  %919 = load %struct.DState*, %struct.DState** %2, align 8
  %920 = getelementptr inbounds %struct.DState, %struct.DState* %919, i32 0, i32 7
  %921 = load i32, i32* %920, align 8
  %922 = shl i32 %921, 8
  %923 = load %struct.DState*, %struct.DState** %2, align 8
  %924 = getelementptr inbounds %struct.DState, %struct.DState* %923, i32 0, i32 0
  %925 = load %struct.bz_stream*, %struct.bz_stream** %924, align 8
  %926 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %925, i32 0, i32 0
  %927 = load i8*, i8** %926, align 8
  %928 = load i8, i8* %927, align 1
  %929 = zext i8 %928 to i32
  %930 = or i32 %922, %929
  %931 = load %struct.DState*, %struct.DState** %2, align 8
  %932 = getelementptr inbounds %struct.DState, %struct.DState* %931, i32 0, i32 7
  store i32 %930, i32* %932, align 8
  %933 = load %struct.DState*, %struct.DState** %2, align 8
  %934 = getelementptr inbounds %struct.DState, %struct.DState* %933, i32 0, i32 8
  %935 = load i32, i32* %934, align 4
  %936 = add nsw i32 %935, 8
  store i32 %936, i32* %934, align 4
  %937 = load %struct.DState*, %struct.DState** %2, align 8
  %938 = getelementptr inbounds %struct.DState, %struct.DState* %937, i32 0, i32 0
  %939 = load %struct.bz_stream*, %struct.bz_stream** %938, align 8
  %940 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %939, i32 0, i32 0
  %941 = load i8*, i8** %940, align 8
  %942 = getelementptr inbounds i8, i8* %941, i32 1
  store i8* %942, i8** %940, align 8
  %943 = load %struct.DState*, %struct.DState** %2, align 8
  %944 = getelementptr inbounds %struct.DState, %struct.DState* %943, i32 0, i32 0
  %945 = load %struct.bz_stream*, %struct.bz_stream** %944, align 8
  %946 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %945, i32 0, i32 1
  %947 = load i32, i32* %946, align 8
  %948 = add i32 %947, -1
  store i32 %948, i32* %946, align 8
  %949 = load %struct.DState*, %struct.DState** %2, align 8
  %950 = getelementptr inbounds %struct.DState, %struct.DState* %949, i32 0, i32 0
  %951 = load %struct.bz_stream*, %struct.bz_stream** %950, align 8
  %952 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %951, i32 0, i32 2
  %953 = load i32, i32* %952, align 4
  %954 = add i32 %953, 1
  store i32 %954, i32* %952, align 4
  %955 = load %struct.DState*, %struct.DState** %2, align 8
  %956 = getelementptr inbounds %struct.DState, %struct.DState* %955, i32 0, i32 0
  %957 = load %struct.bz_stream*, %struct.bz_stream** %956, align 8
  %958 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %957, i32 0, i32 2
  %959 = load i32, i32* %958, align 4
  %960 = icmp eq i32 %959, 0
  br i1 %960, label %961, label %969

; <label>:961:                                    ; preds = %918
  %pgocount37 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 83)
  %962 = add i64 %pgocount37, 1
  store i64 %962, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 83)
  %963 = load %struct.DState*, %struct.DState** %2, align 8
  %964 = getelementptr inbounds %struct.DState, %struct.DState* %963, i32 0, i32 0
  %965 = load %struct.bz_stream*, %struct.bz_stream** %964, align 8
  %966 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %965, i32 0, i32 3
  %967 = load i32, i32* %966, align 8
  %968 = add i32 %967, 1
  store i32 %968, i32* %966, align 8
  br label %969

; <label>:969:                                    ; preds = %961, %918
  %pgocount38 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 39)
  %970 = add i64 %pgocount38, 1
  store i64 %970, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 39)
  br label %888

; <label>:971:                                    ; preds = %893
  %972 = load i8, i8* %3, align 1
  %973 = zext i8 %972 to i32
  %974 = icmp ne i32 %973, 89
  br i1 %974, label %975, label %977

; <label>:975:                                    ; preds = %971
  %pgocount39 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 206)
  %976 = add i64 %pgocount39, 1
  store i64 %976, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 206)
  store i32 -4, i32* %4, align 4
  br label %6029

; <label>:977:                                    ; preds = %971
  %pgocount40 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 207)
  %978 = add i64 %pgocount40, 1
  store i64 %978, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 207)
  br label %979

; <label>:979:                                    ; preds = %977, %145
  %980 = load %struct.DState*, %struct.DState** %2, align 8
  %981 = getelementptr inbounds %struct.DState, %struct.DState* %980, i32 0, i32 1
  store i32 17, i32* %981, align 8
  br label %982

; <label>:982:                                    ; preds = %1063, %979
  %983 = load %struct.DState*, %struct.DState** %2, align 8
  %984 = getelementptr inbounds %struct.DState, %struct.DState* %983, i32 0, i32 8
  %985 = load i32, i32* %984, align 4
  %986 = icmp sge i32 %985, 8
  br i1 %986, label %987, label %1003

; <label>:987:                                    ; preds = %982
  %988 = load %struct.DState*, %struct.DState** %2, align 8
  %989 = getelementptr inbounds %struct.DState, %struct.DState* %988, i32 0, i32 7
  %990 = load i32, i32* %989, align 8
  %991 = load %struct.DState*, %struct.DState** %2, align 8
  %992 = getelementptr inbounds %struct.DState, %struct.DState* %991, i32 0, i32 8
  %993 = load i32, i32* %992, align 4
  %994 = sub nsw i32 %993, 8
  %995 = lshr i32 %990, %994
  %996 = and i32 %995, 255
  store i32 %996, i32* %39, align 4
  %997 = load %struct.DState*, %struct.DState** %2, align 8
  %998 = getelementptr inbounds %struct.DState, %struct.DState* %997, i32 0, i32 8
  %999 = load i32, i32* %998, align 4
  %1000 = sub nsw i32 %999, 8
  store i32 %1000, i32* %998, align 4
  %1001 = load i32, i32* %39, align 4
  %1002 = trunc i32 %1001 to i8
  store i8 %1002, i8* %3, align 1
  br label %1065

; <label>:1003:                                   ; preds = %982
  %1004 = load %struct.DState*, %struct.DState** %2, align 8
  %1005 = getelementptr inbounds %struct.DState, %struct.DState* %1004, i32 0, i32 0
  %1006 = load %struct.bz_stream*, %struct.bz_stream** %1005, align 8
  %1007 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1006, i32 0, i32 1
  %1008 = load i32, i32* %1007, align 8
  %1009 = icmp eq i32 %1008, 0
  br i1 %1009, label %1010, label %1012

; <label>:1010:                                   ; preds = %1003
  %pgocount41 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 149)
  %1011 = add i64 %pgocount41, 1
  store i64 %1011, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 149)
  store i32 0, i32* %4, align 4
  br label %6029

; <label>:1012:                                   ; preds = %1003
  %1013 = load %struct.DState*, %struct.DState** %2, align 8
  %1014 = getelementptr inbounds %struct.DState, %struct.DState* %1013, i32 0, i32 7
  %1015 = load i32, i32* %1014, align 8
  %1016 = shl i32 %1015, 8
  %1017 = load %struct.DState*, %struct.DState** %2, align 8
  %1018 = getelementptr inbounds %struct.DState, %struct.DState* %1017, i32 0, i32 0
  %1019 = load %struct.bz_stream*, %struct.bz_stream** %1018, align 8
  %1020 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1019, i32 0, i32 0
  %1021 = load i8*, i8** %1020, align 8
  %1022 = load i8, i8* %1021, align 1
  %1023 = zext i8 %1022 to i32
  %1024 = or i32 %1016, %1023
  %1025 = load %struct.DState*, %struct.DState** %2, align 8
  %1026 = getelementptr inbounds %struct.DState, %struct.DState* %1025, i32 0, i32 7
  store i32 %1024, i32* %1026, align 8
  %1027 = load %struct.DState*, %struct.DState** %2, align 8
  %1028 = getelementptr inbounds %struct.DState, %struct.DState* %1027, i32 0, i32 8
  %1029 = load i32, i32* %1028, align 4
  %1030 = add nsw i32 %1029, 8
  store i32 %1030, i32* %1028, align 4
  %1031 = load %struct.DState*, %struct.DState** %2, align 8
  %1032 = getelementptr inbounds %struct.DState, %struct.DState* %1031, i32 0, i32 0
  %1033 = load %struct.bz_stream*, %struct.bz_stream** %1032, align 8
  %1034 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1033, i32 0, i32 0
  %1035 = load i8*, i8** %1034, align 8
  %1036 = getelementptr inbounds i8, i8* %1035, i32 1
  store i8* %1036, i8** %1034, align 8
  %1037 = load %struct.DState*, %struct.DState** %2, align 8
  %1038 = getelementptr inbounds %struct.DState, %struct.DState* %1037, i32 0, i32 0
  %1039 = load %struct.bz_stream*, %struct.bz_stream** %1038, align 8
  %1040 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1039, i32 0, i32 1
  %1041 = load i32, i32* %1040, align 8
  %1042 = add i32 %1041, -1
  store i32 %1042, i32* %1040, align 8
  %1043 = load %struct.DState*, %struct.DState** %2, align 8
  %1044 = getelementptr inbounds %struct.DState, %struct.DState* %1043, i32 0, i32 0
  %1045 = load %struct.bz_stream*, %struct.bz_stream** %1044, align 8
  %1046 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1045, i32 0, i32 2
  %1047 = load i32, i32* %1046, align 4
  %1048 = add i32 %1047, 1
  store i32 %1048, i32* %1046, align 4
  %1049 = load %struct.DState*, %struct.DState** %2, align 8
  %1050 = getelementptr inbounds %struct.DState, %struct.DState* %1049, i32 0, i32 0
  %1051 = load %struct.bz_stream*, %struct.bz_stream** %1050, align 8
  %1052 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1051, i32 0, i32 2
  %1053 = load i32, i32* %1052, align 4
  %1054 = icmp eq i32 %1053, 0
  br i1 %1054, label %1055, label %1063

; <label>:1055:                                   ; preds = %1012
  %pgocount42 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 80)
  %1056 = add i64 %pgocount42, 1
  store i64 %1056, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 80)
  %1057 = load %struct.DState*, %struct.DState** %2, align 8
  %1058 = getelementptr inbounds %struct.DState, %struct.DState* %1057, i32 0, i32 0
  %1059 = load %struct.bz_stream*, %struct.bz_stream** %1058, align 8
  %1060 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1059, i32 0, i32 3
  %1061 = load i32, i32* %1060, align 8
  %1062 = add i32 %1061, 1
  store i32 %1062, i32* %1060, align 8
  br label %1063

; <label>:1063:                                   ; preds = %1055, %1012
  %pgocount43 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 36)
  %1064 = add i64 %pgocount43, 1
  store i64 %1064, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 36)
  br label %982

; <label>:1065:                                   ; preds = %987
  %1066 = load i8, i8* %3, align 1
  %1067 = zext i8 %1066 to i32
  %1068 = icmp ne i32 %1067, 38
  br i1 %1068, label %1069, label %1071

; <label>:1069:                                   ; preds = %1065
  %pgocount44 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 200)
  %1070 = add i64 %pgocount44, 1
  store i64 %1070, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 200)
  store i32 -4, i32* %4, align 4
  br label %6029

; <label>:1071:                                   ; preds = %1065
  %pgocount45 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 201)
  %1072 = add i64 %pgocount45, 1
  store i64 %1072, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 201)
  br label %1073

; <label>:1073:                                   ; preds = %1071, %145
  %1074 = load %struct.DState*, %struct.DState** %2, align 8
  %1075 = getelementptr inbounds %struct.DState, %struct.DState* %1074, i32 0, i32 1
  store i32 18, i32* %1075, align 8
  br label %1076

; <label>:1076:                                   ; preds = %1158, %1073
  %1077 = load %struct.DState*, %struct.DState** %2, align 8
  %1078 = getelementptr inbounds %struct.DState, %struct.DState* %1077, i32 0, i32 8
  %1079 = load i32, i32* %1078, align 4
  %1080 = icmp sge i32 %1079, 8
  br i1 %1080, label %1081, label %1097

; <label>:1081:                                   ; preds = %1076
  %1082 = load %struct.DState*, %struct.DState** %2, align 8
  %1083 = getelementptr inbounds %struct.DState, %struct.DState* %1082, i32 0, i32 7
  %1084 = load i32, i32* %1083, align 8
  %1085 = load %struct.DState*, %struct.DState** %2, align 8
  %1086 = getelementptr inbounds %struct.DState, %struct.DState* %1085, i32 0, i32 8
  %1087 = load i32, i32* %1086, align 4
  %1088 = sub nsw i32 %1087, 8
  %1089 = lshr i32 %1084, %1088
  %1090 = and i32 %1089, 255
  store i32 %1090, i32* %40, align 4
  %1091 = load %struct.DState*, %struct.DState** %2, align 8
  %1092 = getelementptr inbounds %struct.DState, %struct.DState* %1091, i32 0, i32 8
  %1093 = load i32, i32* %1092, align 4
  %1094 = sub nsw i32 %1093, 8
  store i32 %1094, i32* %1092, align 4
  %1095 = load i32, i32* %40, align 4
  %1096 = trunc i32 %1095 to i8
  store i8 %1096, i8* %3, align 1
  br label %1159

; <label>:1097:                                   ; preds = %1076
  %1098 = load %struct.DState*, %struct.DState** %2, align 8
  %1099 = getelementptr inbounds %struct.DState, %struct.DState* %1098, i32 0, i32 0
  %1100 = load %struct.bz_stream*, %struct.bz_stream** %1099, align 8
  %1101 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1100, i32 0, i32 1
  %1102 = load i32, i32* %1101, align 8
  %1103 = icmp eq i32 %1102, 0
  br i1 %1103, label %1104, label %1106

; <label>:1104:                                   ; preds = %1097
  %pgocount46 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 145)
  %1105 = add i64 %pgocount46, 1
  store i64 %1105, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 145)
  store i32 0, i32* %4, align 4
  br label %6029

; <label>:1106:                                   ; preds = %1097
  %pgocount47 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 32)
  %1107 = add i64 %pgocount47, 1
  store i64 %1107, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 32)
  %1108 = load %struct.DState*, %struct.DState** %2, align 8
  %1109 = getelementptr inbounds %struct.DState, %struct.DState* %1108, i32 0, i32 7
  %1110 = load i32, i32* %1109, align 8
  %1111 = shl i32 %1110, 8
  %1112 = load %struct.DState*, %struct.DState** %2, align 8
  %1113 = getelementptr inbounds %struct.DState, %struct.DState* %1112, i32 0, i32 0
  %1114 = load %struct.bz_stream*, %struct.bz_stream** %1113, align 8
  %1115 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1114, i32 0, i32 0
  %1116 = load i8*, i8** %1115, align 8
  %1117 = load i8, i8* %1116, align 1
  %1118 = zext i8 %1117 to i32
  %1119 = or i32 %1111, %1118
  %1120 = load %struct.DState*, %struct.DState** %2, align 8
  %1121 = getelementptr inbounds %struct.DState, %struct.DState* %1120, i32 0, i32 7
  store i32 %1119, i32* %1121, align 8
  %1122 = load %struct.DState*, %struct.DState** %2, align 8
  %1123 = getelementptr inbounds %struct.DState, %struct.DState* %1122, i32 0, i32 8
  %1124 = load i32, i32* %1123, align 4
  %1125 = add nsw i32 %1124, 8
  store i32 %1125, i32* %1123, align 4
  %1126 = load %struct.DState*, %struct.DState** %2, align 8
  %1127 = getelementptr inbounds %struct.DState, %struct.DState* %1126, i32 0, i32 0
  %1128 = load %struct.bz_stream*, %struct.bz_stream** %1127, align 8
  %1129 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1128, i32 0, i32 0
  %1130 = load i8*, i8** %1129, align 8
  %1131 = getelementptr inbounds i8, i8* %1130, i32 1
  store i8* %1131, i8** %1129, align 8
  %1132 = load %struct.DState*, %struct.DState** %2, align 8
  %1133 = getelementptr inbounds %struct.DState, %struct.DState* %1132, i32 0, i32 0
  %1134 = load %struct.bz_stream*, %struct.bz_stream** %1133, align 8
  %1135 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1134, i32 0, i32 1
  %1136 = load i32, i32* %1135, align 8
  %1137 = add i32 %1136, -1
  store i32 %1137, i32* %1135, align 8
  %1138 = load %struct.DState*, %struct.DState** %2, align 8
  %1139 = getelementptr inbounds %struct.DState, %struct.DState* %1138, i32 0, i32 0
  %1140 = load %struct.bz_stream*, %struct.bz_stream** %1139, align 8
  %1141 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1140, i32 0, i32 2
  %1142 = load i32, i32* %1141, align 4
  %1143 = add i32 %1142, 1
  store i32 %1143, i32* %1141, align 4
  %1144 = load %struct.DState*, %struct.DState** %2, align 8
  %1145 = getelementptr inbounds %struct.DState, %struct.DState* %1144, i32 0, i32 0
  %1146 = load %struct.bz_stream*, %struct.bz_stream** %1145, align 8
  %1147 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1146, i32 0, i32 2
  %1148 = load i32, i32* %1147, align 4
  %1149 = icmp eq i32 %1148, 0
  br i1 %1149, label %1150, label %1158

; <label>:1150:                                   ; preds = %1106
  %pgocount48 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 76)
  %1151 = add i64 %pgocount48, 1
  store i64 %1151, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 76)
  %1152 = load %struct.DState*, %struct.DState** %2, align 8
  %1153 = getelementptr inbounds %struct.DState, %struct.DState* %1152, i32 0, i32 0
  %1154 = load %struct.bz_stream*, %struct.bz_stream** %1153, align 8
  %1155 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1154, i32 0, i32 3
  %1156 = load i32, i32* %1155, align 8
  %1157 = add i32 %1156, 1
  store i32 %1157, i32* %1155, align 8
  br label %1158

; <label>:1158:                                   ; preds = %1150, %1106
  br label %1076

; <label>:1159:                                   ; preds = %1081
  %1160 = load i8, i8* %3, align 1
  %1161 = zext i8 %1160 to i32
  %1162 = icmp ne i32 %1161, 83
  br i1 %1162, label %1163, label %1165

; <label>:1163:                                   ; preds = %1159
  %pgocount49 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 193)
  %1164 = add i64 %pgocount49, 1
  store i64 %1164, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 193)
  store i32 -4, i32* %4, align 4
  br label %6029

; <label>:1165:                                   ; preds = %1159
  %pgocount50 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 194)
  %1166 = add i64 %pgocount50, 1
  store i64 %1166, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 194)
  br label %1167

; <label>:1167:                                   ; preds = %1165, %145
  %1168 = load %struct.DState*, %struct.DState** %2, align 8
  %1169 = getelementptr inbounds %struct.DState, %struct.DState* %1168, i32 0, i32 1
  store i32 19, i32* %1169, align 8
  br label %1170

; <label>:1170:                                   ; preds = %1252, %1167
  %1171 = load %struct.DState*, %struct.DState** %2, align 8
  %1172 = getelementptr inbounds %struct.DState, %struct.DState* %1171, i32 0, i32 8
  %1173 = load i32, i32* %1172, align 4
  %1174 = icmp sge i32 %1173, 8
  br i1 %1174, label %1175, label %1191

; <label>:1175:                                   ; preds = %1170
  %1176 = load %struct.DState*, %struct.DState** %2, align 8
  %1177 = getelementptr inbounds %struct.DState, %struct.DState* %1176, i32 0, i32 7
  %1178 = load i32, i32* %1177, align 8
  %1179 = load %struct.DState*, %struct.DState** %2, align 8
  %1180 = getelementptr inbounds %struct.DState, %struct.DState* %1179, i32 0, i32 8
  %1181 = load i32, i32* %1180, align 4
  %1182 = sub nsw i32 %1181, 8
  %1183 = lshr i32 %1178, %1182
  %1184 = and i32 %1183, 255
  store i32 %1184, i32* %41, align 4
  %1185 = load %struct.DState*, %struct.DState** %2, align 8
  %1186 = getelementptr inbounds %struct.DState, %struct.DState* %1185, i32 0, i32 8
  %1187 = load i32, i32* %1186, align 4
  %1188 = sub nsw i32 %1187, 8
  store i32 %1188, i32* %1186, align 4
  %1189 = load i32, i32* %41, align 4
  %1190 = trunc i32 %1189 to i8
  store i8 %1190, i8* %3, align 1
  br label %1253

; <label>:1191:                                   ; preds = %1170
  %1192 = load %struct.DState*, %struct.DState** %2, align 8
  %1193 = getelementptr inbounds %struct.DState, %struct.DState* %1192, i32 0, i32 0
  %1194 = load %struct.bz_stream*, %struct.bz_stream** %1193, align 8
  %1195 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1194, i32 0, i32 1
  %1196 = load i32, i32* %1195, align 8
  %1197 = icmp eq i32 %1196, 0
  br i1 %1197, label %1198, label %1200

; <label>:1198:                                   ; preds = %1191
  %pgocount51 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 143)
  %1199 = add i64 %pgocount51, 1
  store i64 %1199, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 143)
  store i32 0, i32* %4, align 4
  br label %6029

; <label>:1200:                                   ; preds = %1191
  %pgocount52 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 30)
  %1201 = add i64 %pgocount52, 1
  store i64 %1201, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 30)
  %1202 = load %struct.DState*, %struct.DState** %2, align 8
  %1203 = getelementptr inbounds %struct.DState, %struct.DState* %1202, i32 0, i32 7
  %1204 = load i32, i32* %1203, align 8
  %1205 = shl i32 %1204, 8
  %1206 = load %struct.DState*, %struct.DState** %2, align 8
  %1207 = getelementptr inbounds %struct.DState, %struct.DState* %1206, i32 0, i32 0
  %1208 = load %struct.bz_stream*, %struct.bz_stream** %1207, align 8
  %1209 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1208, i32 0, i32 0
  %1210 = load i8*, i8** %1209, align 8
  %1211 = load i8, i8* %1210, align 1
  %1212 = zext i8 %1211 to i32
  %1213 = or i32 %1205, %1212
  %1214 = load %struct.DState*, %struct.DState** %2, align 8
  %1215 = getelementptr inbounds %struct.DState, %struct.DState* %1214, i32 0, i32 7
  store i32 %1213, i32* %1215, align 8
  %1216 = load %struct.DState*, %struct.DState** %2, align 8
  %1217 = getelementptr inbounds %struct.DState, %struct.DState* %1216, i32 0, i32 8
  %1218 = load i32, i32* %1217, align 4
  %1219 = add nsw i32 %1218, 8
  store i32 %1219, i32* %1217, align 4
  %1220 = load %struct.DState*, %struct.DState** %2, align 8
  %1221 = getelementptr inbounds %struct.DState, %struct.DState* %1220, i32 0, i32 0
  %1222 = load %struct.bz_stream*, %struct.bz_stream** %1221, align 8
  %1223 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1222, i32 0, i32 0
  %1224 = load i8*, i8** %1223, align 8
  %1225 = getelementptr inbounds i8, i8* %1224, i32 1
  store i8* %1225, i8** %1223, align 8
  %1226 = load %struct.DState*, %struct.DState** %2, align 8
  %1227 = getelementptr inbounds %struct.DState, %struct.DState* %1226, i32 0, i32 0
  %1228 = load %struct.bz_stream*, %struct.bz_stream** %1227, align 8
  %1229 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1228, i32 0, i32 1
  %1230 = load i32, i32* %1229, align 8
  %1231 = add i32 %1230, -1
  store i32 %1231, i32* %1229, align 8
  %1232 = load %struct.DState*, %struct.DState** %2, align 8
  %1233 = getelementptr inbounds %struct.DState, %struct.DState* %1232, i32 0, i32 0
  %1234 = load %struct.bz_stream*, %struct.bz_stream** %1233, align 8
  %1235 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1234, i32 0, i32 2
  %1236 = load i32, i32* %1235, align 4
  %1237 = add i32 %1236, 1
  store i32 %1237, i32* %1235, align 4
  %1238 = load %struct.DState*, %struct.DState** %2, align 8
  %1239 = getelementptr inbounds %struct.DState, %struct.DState* %1238, i32 0, i32 0
  %1240 = load %struct.bz_stream*, %struct.bz_stream** %1239, align 8
  %1241 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1240, i32 0, i32 2
  %1242 = load i32, i32* %1241, align 4
  %1243 = icmp eq i32 %1242, 0
  br i1 %1243, label %1244, label %1252

; <label>:1244:                                   ; preds = %1200
  %pgocount53 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 74)
  %1245 = add i64 %pgocount53, 1
  store i64 %1245, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 74)
  %1246 = load %struct.DState*, %struct.DState** %2, align 8
  %1247 = getelementptr inbounds %struct.DState, %struct.DState* %1246, i32 0, i32 0
  %1248 = load %struct.bz_stream*, %struct.bz_stream** %1247, align 8
  %1249 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1248, i32 0, i32 3
  %1250 = load i32, i32* %1249, align 8
  %1251 = add i32 %1250, 1
  store i32 %1251, i32* %1249, align 8
  br label %1252

; <label>:1252:                                   ; preds = %1244, %1200
  br label %1170

; <label>:1253:                                   ; preds = %1175
  %1254 = load i8, i8* %3, align 1
  %1255 = zext i8 %1254 to i32
  %1256 = icmp ne i32 %1255, 89
  br i1 %1256, label %1257, label %1259

; <label>:1257:                                   ; preds = %1253
  %pgocount54 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 187)
  %1258 = add i64 %pgocount54, 1
  store i64 %1258, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 187)
  store i32 -4, i32* %4, align 4
  br label %6029

; <label>:1259:                                   ; preds = %1253
  %1260 = load %struct.DState*, %struct.DState** %2, align 8
  %1261 = getelementptr inbounds %struct.DState, %struct.DState* %1260, i32 0, i32 11
  %1262 = load i32, i32* %1261, align 8
  %1263 = add nsw i32 %1262, 1
  store i32 %1263, i32* %1261, align 8
  %1264 = load %struct.DState*, %struct.DState** %2, align 8
  %1265 = getelementptr inbounds %struct.DState, %struct.DState* %1264, i32 0, i32 12
  %1266 = load i32, i32* %1265, align 4
  %1267 = icmp sge i32 %1266, 2
  br i1 %1267, label %1268, label %1275

; <label>:1268:                                   ; preds = %1259
  %pgocount55 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 242)
  %1269 = add i64 %pgocount55, 1
  store i64 %1269, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 242)
  %1270 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1271 = load %struct.DState*, %struct.DState** %2, align 8
  %1272 = getelementptr inbounds %struct.DState, %struct.DState* %1271, i32 0, i32 11
  %1273 = load i32, i32* %1272, align 8
  %1274 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1270, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str, i32 0, i32 0), i32 %1273)
  br label %1275

; <label>:1275:                                   ; preds = %1268, %1259
  %pgocount56 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 188)
  %1276 = add i64 %pgocount56, 1
  store i64 %1276, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 188)
  %1277 = load %struct.DState*, %struct.DState** %2, align 8
  %1278 = getelementptr inbounds %struct.DState, %struct.DState* %1277, i32 0, i32 23
  store i32 0, i32* %1278, align 8
  br label %1279

; <label>:1279:                                   ; preds = %1275, %145
  %1280 = load %struct.DState*, %struct.DState** %2, align 8
  %1281 = getelementptr inbounds %struct.DState, %struct.DState* %1280, i32 0, i32 1
  store i32 20, i32* %1281, align 8
  br label %1282

; <label>:1282:                                   ; preds = %1364, %1279
  %1283 = load %struct.DState*, %struct.DState** %2, align 8
  %1284 = getelementptr inbounds %struct.DState, %struct.DState* %1283, i32 0, i32 8
  %1285 = load i32, i32* %1284, align 4
  %1286 = icmp sge i32 %1285, 8
  br i1 %1286, label %1287, label %1303

; <label>:1287:                                   ; preds = %1282
  %1288 = load %struct.DState*, %struct.DState** %2, align 8
  %1289 = getelementptr inbounds %struct.DState, %struct.DState* %1288, i32 0, i32 7
  %1290 = load i32, i32* %1289, align 8
  %1291 = load %struct.DState*, %struct.DState** %2, align 8
  %1292 = getelementptr inbounds %struct.DState, %struct.DState* %1291, i32 0, i32 8
  %1293 = load i32, i32* %1292, align 4
  %1294 = sub nsw i32 %1293, 8
  %1295 = lshr i32 %1290, %1294
  %1296 = and i32 %1295, 255
  store i32 %1296, i32* %42, align 4
  %1297 = load %struct.DState*, %struct.DState** %2, align 8
  %1298 = getelementptr inbounds %struct.DState, %struct.DState* %1297, i32 0, i32 8
  %1299 = load i32, i32* %1298, align 4
  %1300 = sub nsw i32 %1299, 8
  store i32 %1300, i32* %1298, align 4
  %1301 = load i32, i32* %42, align 4
  %1302 = trunc i32 %1301 to i8
  store i8 %1302, i8* %3, align 1
  br label %1365

; <label>:1303:                                   ; preds = %1282
  %1304 = load %struct.DState*, %struct.DState** %2, align 8
  %1305 = getelementptr inbounds %struct.DState, %struct.DState* %1304, i32 0, i32 0
  %1306 = load %struct.bz_stream*, %struct.bz_stream** %1305, align 8
  %1307 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1306, i32 0, i32 1
  %1308 = load i32, i32* %1307, align 8
  %1309 = icmp eq i32 %1308, 0
  br i1 %1309, label %1310, label %1312

; <label>:1310:                                   ; preds = %1303
  %pgocount57 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 140)
  %1311 = add i64 %pgocount57, 1
  store i64 %1311, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 140)
  store i32 0, i32* %4, align 4
  br label %6029

; <label>:1312:                                   ; preds = %1303
  %pgocount58 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 28)
  %1313 = add i64 %pgocount58, 1
  store i64 %1313, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 28)
  %1314 = load %struct.DState*, %struct.DState** %2, align 8
  %1315 = getelementptr inbounds %struct.DState, %struct.DState* %1314, i32 0, i32 7
  %1316 = load i32, i32* %1315, align 8
  %1317 = shl i32 %1316, 8
  %1318 = load %struct.DState*, %struct.DState** %2, align 8
  %1319 = getelementptr inbounds %struct.DState, %struct.DState* %1318, i32 0, i32 0
  %1320 = load %struct.bz_stream*, %struct.bz_stream** %1319, align 8
  %1321 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1320, i32 0, i32 0
  %1322 = load i8*, i8** %1321, align 8
  %1323 = load i8, i8* %1322, align 1
  %1324 = zext i8 %1323 to i32
  %1325 = or i32 %1317, %1324
  %1326 = load %struct.DState*, %struct.DState** %2, align 8
  %1327 = getelementptr inbounds %struct.DState, %struct.DState* %1326, i32 0, i32 7
  store i32 %1325, i32* %1327, align 8
  %1328 = load %struct.DState*, %struct.DState** %2, align 8
  %1329 = getelementptr inbounds %struct.DState, %struct.DState* %1328, i32 0, i32 8
  %1330 = load i32, i32* %1329, align 4
  %1331 = add nsw i32 %1330, 8
  store i32 %1331, i32* %1329, align 4
  %1332 = load %struct.DState*, %struct.DState** %2, align 8
  %1333 = getelementptr inbounds %struct.DState, %struct.DState* %1332, i32 0, i32 0
  %1334 = load %struct.bz_stream*, %struct.bz_stream** %1333, align 8
  %1335 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1334, i32 0, i32 0
  %1336 = load i8*, i8** %1335, align 8
  %1337 = getelementptr inbounds i8, i8* %1336, i32 1
  store i8* %1337, i8** %1335, align 8
  %1338 = load %struct.DState*, %struct.DState** %2, align 8
  %1339 = getelementptr inbounds %struct.DState, %struct.DState* %1338, i32 0, i32 0
  %1340 = load %struct.bz_stream*, %struct.bz_stream** %1339, align 8
  %1341 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1340, i32 0, i32 1
  %1342 = load i32, i32* %1341, align 8
  %1343 = add i32 %1342, -1
  store i32 %1343, i32* %1341, align 8
  %1344 = load %struct.DState*, %struct.DState** %2, align 8
  %1345 = getelementptr inbounds %struct.DState, %struct.DState* %1344, i32 0, i32 0
  %1346 = load %struct.bz_stream*, %struct.bz_stream** %1345, align 8
  %1347 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1346, i32 0, i32 2
  %1348 = load i32, i32* %1347, align 4
  %1349 = add i32 %1348, 1
  store i32 %1349, i32* %1347, align 4
  %1350 = load %struct.DState*, %struct.DState** %2, align 8
  %1351 = getelementptr inbounds %struct.DState, %struct.DState* %1350, i32 0, i32 0
  %1352 = load %struct.bz_stream*, %struct.bz_stream** %1351, align 8
  %1353 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1352, i32 0, i32 2
  %1354 = load i32, i32* %1353, align 4
  %1355 = icmp eq i32 %1354, 0
  br i1 %1355, label %1356, label %1364

; <label>:1356:                                   ; preds = %1312
  %pgocount59 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 72)
  %1357 = add i64 %pgocount59, 1
  store i64 %1357, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 72)
  %1358 = load %struct.DState*, %struct.DState** %2, align 8
  %1359 = getelementptr inbounds %struct.DState, %struct.DState* %1358, i32 0, i32 0
  %1360 = load %struct.bz_stream*, %struct.bz_stream** %1359, align 8
  %1361 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1360, i32 0, i32 3
  %1362 = load i32, i32* %1361, align 8
  %1363 = add i32 %1362, 1
  store i32 %1363, i32* %1361, align 8
  br label %1364

; <label>:1364:                                   ; preds = %1356, %1312
  br label %1282

; <label>:1365:                                   ; preds = %1287
  %pgocount60 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 133)
  %1366 = add i64 %pgocount60, 1
  store i64 %1366, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 133)
  %1367 = load %struct.DState*, %struct.DState** %2, align 8
  %1368 = getelementptr inbounds %struct.DState, %struct.DState* %1367, i32 0, i32 23
  %1369 = load i32, i32* %1368, align 8
  %1370 = shl i32 %1369, 8
  %1371 = load i8, i8* %3, align 1
  %1372 = zext i8 %1371 to i32
  %1373 = or i32 %1370, %1372
  %1374 = load %struct.DState*, %struct.DState** %2, align 8
  %1375 = getelementptr inbounds %struct.DState, %struct.DState* %1374, i32 0, i32 23
  store i32 %1373, i32* %1375, align 8
  br label %1376

; <label>:1376:                                   ; preds = %1365, %145
  %1377 = load %struct.DState*, %struct.DState** %2, align 8
  %1378 = getelementptr inbounds %struct.DState, %struct.DState* %1377, i32 0, i32 1
  store i32 21, i32* %1378, align 8
  br label %1379

; <label>:1379:                                   ; preds = %1460, %1376
  %1380 = load %struct.DState*, %struct.DState** %2, align 8
  %1381 = getelementptr inbounds %struct.DState, %struct.DState* %1380, i32 0, i32 8
  %1382 = load i32, i32* %1381, align 4
  %1383 = icmp sge i32 %1382, 8
  br i1 %1383, label %1384, label %1400

; <label>:1384:                                   ; preds = %1379
  %1385 = load %struct.DState*, %struct.DState** %2, align 8
  %1386 = getelementptr inbounds %struct.DState, %struct.DState* %1385, i32 0, i32 7
  %1387 = load i32, i32* %1386, align 8
  %1388 = load %struct.DState*, %struct.DState** %2, align 8
  %1389 = getelementptr inbounds %struct.DState, %struct.DState* %1388, i32 0, i32 8
  %1390 = load i32, i32* %1389, align 4
  %1391 = sub nsw i32 %1390, 8
  %1392 = lshr i32 %1387, %1391
  %1393 = and i32 %1392, 255
  store i32 %1393, i32* %43, align 4
  %1394 = load %struct.DState*, %struct.DState** %2, align 8
  %1395 = getelementptr inbounds %struct.DState, %struct.DState* %1394, i32 0, i32 8
  %1396 = load i32, i32* %1395, align 4
  %1397 = sub nsw i32 %1396, 8
  store i32 %1397, i32* %1395, align 4
  %1398 = load i32, i32* %43, align 4
  %1399 = trunc i32 %1398 to i8
  store i8 %1399, i8* %3, align 1
  br label %1462

; <label>:1400:                                   ; preds = %1379
  %1401 = load %struct.DState*, %struct.DState** %2, align 8
  %1402 = getelementptr inbounds %struct.DState, %struct.DState* %1401, i32 0, i32 0
  %1403 = load %struct.bz_stream*, %struct.bz_stream** %1402, align 8
  %1404 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1403, i32 0, i32 1
  %1405 = load i32, i32* %1404, align 8
  %1406 = icmp eq i32 %1405, 0
  br i1 %1406, label %1407, label %1409

; <label>:1407:                                   ; preds = %1400
  %pgocount61 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 125)
  %1408 = add i64 %pgocount61, 1
  store i64 %1408, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 125)
  store i32 0, i32* %4, align 4
  br label %6029

; <label>:1409:                                   ; preds = %1400
  %1410 = load %struct.DState*, %struct.DState** %2, align 8
  %1411 = getelementptr inbounds %struct.DState, %struct.DState* %1410, i32 0, i32 7
  %1412 = load i32, i32* %1411, align 8
  %1413 = shl i32 %1412, 8
  %1414 = load %struct.DState*, %struct.DState** %2, align 8
  %1415 = getelementptr inbounds %struct.DState, %struct.DState* %1414, i32 0, i32 0
  %1416 = load %struct.bz_stream*, %struct.bz_stream** %1415, align 8
  %1417 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1416, i32 0, i32 0
  %1418 = load i8*, i8** %1417, align 8
  %1419 = load i8, i8* %1418, align 1
  %1420 = zext i8 %1419 to i32
  %1421 = or i32 %1413, %1420
  %1422 = load %struct.DState*, %struct.DState** %2, align 8
  %1423 = getelementptr inbounds %struct.DState, %struct.DState* %1422, i32 0, i32 7
  store i32 %1421, i32* %1423, align 8
  %1424 = load %struct.DState*, %struct.DState** %2, align 8
  %1425 = getelementptr inbounds %struct.DState, %struct.DState* %1424, i32 0, i32 8
  %1426 = load i32, i32* %1425, align 4
  %1427 = add nsw i32 %1426, 8
  store i32 %1427, i32* %1425, align 4
  %1428 = load %struct.DState*, %struct.DState** %2, align 8
  %1429 = getelementptr inbounds %struct.DState, %struct.DState* %1428, i32 0, i32 0
  %1430 = load %struct.bz_stream*, %struct.bz_stream** %1429, align 8
  %1431 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1430, i32 0, i32 0
  %1432 = load i8*, i8** %1431, align 8
  %1433 = getelementptr inbounds i8, i8* %1432, i32 1
  store i8* %1433, i8** %1431, align 8
  %1434 = load %struct.DState*, %struct.DState** %2, align 8
  %1435 = getelementptr inbounds %struct.DState, %struct.DState* %1434, i32 0, i32 0
  %1436 = load %struct.bz_stream*, %struct.bz_stream** %1435, align 8
  %1437 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1436, i32 0, i32 1
  %1438 = load i32, i32* %1437, align 8
  %1439 = add i32 %1438, -1
  store i32 %1439, i32* %1437, align 8
  %1440 = load %struct.DState*, %struct.DState** %2, align 8
  %1441 = getelementptr inbounds %struct.DState, %struct.DState* %1440, i32 0, i32 0
  %1442 = load %struct.bz_stream*, %struct.bz_stream** %1441, align 8
  %1443 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1442, i32 0, i32 2
  %1444 = load i32, i32* %1443, align 4
  %1445 = add i32 %1444, 1
  store i32 %1445, i32* %1443, align 4
  %1446 = load %struct.DState*, %struct.DState** %2, align 8
  %1447 = getelementptr inbounds %struct.DState, %struct.DState* %1446, i32 0, i32 0
  %1448 = load %struct.bz_stream*, %struct.bz_stream** %1447, align 8
  %1449 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1448, i32 0, i32 2
  %1450 = load i32, i32* %1449, align 4
  %1451 = icmp eq i32 %1450, 0
  br i1 %1451, label %1452, label %1460

; <label>:1452:                                   ; preds = %1409
  %pgocount62 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 63)
  %1453 = add i64 %pgocount62, 1
  store i64 %1453, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 63)
  %1454 = load %struct.DState*, %struct.DState** %2, align 8
  %1455 = getelementptr inbounds %struct.DState, %struct.DState* %1454, i32 0, i32 0
  %1456 = load %struct.bz_stream*, %struct.bz_stream** %1455, align 8
  %1457 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1456, i32 0, i32 3
  %1458 = load i32, i32* %1457, align 8
  %1459 = add i32 %1458, 1
  store i32 %1459, i32* %1457, align 8
  br label %1460

; <label>:1460:                                   ; preds = %1452, %1409
  %pgocount63 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 14)
  %1461 = add i64 %pgocount63, 1
  store i64 %1461, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 14)
  br label %1379

; <label>:1462:                                   ; preds = %1384
  %pgocount64 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 122)
  %1463 = add i64 %pgocount64, 1
  store i64 %1463, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 122)
  %1464 = load %struct.DState*, %struct.DState** %2, align 8
  %1465 = getelementptr inbounds %struct.DState, %struct.DState* %1464, i32 0, i32 23
  %1466 = load i32, i32* %1465, align 8
  %1467 = shl i32 %1466, 8
  %1468 = load i8, i8* %3, align 1
  %1469 = zext i8 %1468 to i32
  %1470 = or i32 %1467, %1469
  %1471 = load %struct.DState*, %struct.DState** %2, align 8
  %1472 = getelementptr inbounds %struct.DState, %struct.DState* %1471, i32 0, i32 23
  store i32 %1470, i32* %1472, align 8
  br label %1473

; <label>:1473:                                   ; preds = %1462, %145
  %1474 = load %struct.DState*, %struct.DState** %2, align 8
  %1475 = getelementptr inbounds %struct.DState, %struct.DState* %1474, i32 0, i32 1
  store i32 22, i32* %1475, align 8
  br label %1476

; <label>:1476:                                   ; preds = %1557, %1473
  %1477 = load %struct.DState*, %struct.DState** %2, align 8
  %1478 = getelementptr inbounds %struct.DState, %struct.DState* %1477, i32 0, i32 8
  %1479 = load i32, i32* %1478, align 4
  %1480 = icmp sge i32 %1479, 8
  br i1 %1480, label %1481, label %1497

; <label>:1481:                                   ; preds = %1476
  %1482 = load %struct.DState*, %struct.DState** %2, align 8
  %1483 = getelementptr inbounds %struct.DState, %struct.DState* %1482, i32 0, i32 7
  %1484 = load i32, i32* %1483, align 8
  %1485 = load %struct.DState*, %struct.DState** %2, align 8
  %1486 = getelementptr inbounds %struct.DState, %struct.DState* %1485, i32 0, i32 8
  %1487 = load i32, i32* %1486, align 4
  %1488 = sub nsw i32 %1487, 8
  %1489 = lshr i32 %1484, %1488
  %1490 = and i32 %1489, 255
  store i32 %1490, i32* %44, align 4
  %1491 = load %struct.DState*, %struct.DState** %2, align 8
  %1492 = getelementptr inbounds %struct.DState, %struct.DState* %1491, i32 0, i32 8
  %1493 = load i32, i32* %1492, align 4
  %1494 = sub nsw i32 %1493, 8
  store i32 %1494, i32* %1492, align 4
  %1495 = load i32, i32* %44, align 4
  %1496 = trunc i32 %1495 to i8
  store i8 %1496, i8* %3, align 1
  br label %1559

; <label>:1497:                                   ; preds = %1476
  %1498 = load %struct.DState*, %struct.DState** %2, align 8
  %1499 = getelementptr inbounds %struct.DState, %struct.DState* %1498, i32 0, i32 0
  %1500 = load %struct.bz_stream*, %struct.bz_stream** %1499, align 8
  %1501 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1500, i32 0, i32 1
  %1502 = load i32, i32* %1501, align 8
  %1503 = icmp eq i32 %1502, 0
  br i1 %1503, label %1504, label %1506

; <label>:1504:                                   ; preds = %1497
  %pgocount65 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 119)
  %1505 = add i64 %pgocount65, 1
  store i64 %1505, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 119)
  store i32 0, i32* %4, align 4
  br label %6029

; <label>:1506:                                   ; preds = %1497
  %1507 = load %struct.DState*, %struct.DState** %2, align 8
  %1508 = getelementptr inbounds %struct.DState, %struct.DState* %1507, i32 0, i32 7
  %1509 = load i32, i32* %1508, align 8
  %1510 = shl i32 %1509, 8
  %1511 = load %struct.DState*, %struct.DState** %2, align 8
  %1512 = getelementptr inbounds %struct.DState, %struct.DState* %1511, i32 0, i32 0
  %1513 = load %struct.bz_stream*, %struct.bz_stream** %1512, align 8
  %1514 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1513, i32 0, i32 0
  %1515 = load i8*, i8** %1514, align 8
  %1516 = load i8, i8* %1515, align 1
  %1517 = zext i8 %1516 to i32
  %1518 = or i32 %1510, %1517
  %1519 = load %struct.DState*, %struct.DState** %2, align 8
  %1520 = getelementptr inbounds %struct.DState, %struct.DState* %1519, i32 0, i32 7
  store i32 %1518, i32* %1520, align 8
  %1521 = load %struct.DState*, %struct.DState** %2, align 8
  %1522 = getelementptr inbounds %struct.DState, %struct.DState* %1521, i32 0, i32 8
  %1523 = load i32, i32* %1522, align 4
  %1524 = add nsw i32 %1523, 8
  store i32 %1524, i32* %1522, align 4
  %1525 = load %struct.DState*, %struct.DState** %2, align 8
  %1526 = getelementptr inbounds %struct.DState, %struct.DState* %1525, i32 0, i32 0
  %1527 = load %struct.bz_stream*, %struct.bz_stream** %1526, align 8
  %1528 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1527, i32 0, i32 0
  %1529 = load i8*, i8** %1528, align 8
  %1530 = getelementptr inbounds i8, i8* %1529, i32 1
  store i8* %1530, i8** %1528, align 8
  %1531 = load %struct.DState*, %struct.DState** %2, align 8
  %1532 = getelementptr inbounds %struct.DState, %struct.DState* %1531, i32 0, i32 0
  %1533 = load %struct.bz_stream*, %struct.bz_stream** %1532, align 8
  %1534 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1533, i32 0, i32 1
  %1535 = load i32, i32* %1534, align 8
  %1536 = add i32 %1535, -1
  store i32 %1536, i32* %1534, align 8
  %1537 = load %struct.DState*, %struct.DState** %2, align 8
  %1538 = getelementptr inbounds %struct.DState, %struct.DState* %1537, i32 0, i32 0
  %1539 = load %struct.bz_stream*, %struct.bz_stream** %1538, align 8
  %1540 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1539, i32 0, i32 2
  %1541 = load i32, i32* %1540, align 4
  %1542 = add i32 %1541, 1
  store i32 %1542, i32* %1540, align 4
  %1543 = load %struct.DState*, %struct.DState** %2, align 8
  %1544 = getelementptr inbounds %struct.DState, %struct.DState* %1543, i32 0, i32 0
  %1545 = load %struct.bz_stream*, %struct.bz_stream** %1544, align 8
  %1546 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1545, i32 0, i32 2
  %1547 = load i32, i32* %1546, align 4
  %1548 = icmp eq i32 %1547, 0
  br i1 %1548, label %1549, label %1557

; <label>:1549:                                   ; preds = %1506
  %pgocount66 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 61)
  %1550 = add i64 %pgocount66, 1
  store i64 %1550, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 61)
  %1551 = load %struct.DState*, %struct.DState** %2, align 8
  %1552 = getelementptr inbounds %struct.DState, %struct.DState* %1551, i32 0, i32 0
  %1553 = load %struct.bz_stream*, %struct.bz_stream** %1552, align 8
  %1554 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1553, i32 0, i32 3
  %1555 = load i32, i32* %1554, align 8
  %1556 = add i32 %1555, 1
  store i32 %1556, i32* %1554, align 8
  br label %1557

; <label>:1557:                                   ; preds = %1549, %1506
  %pgocount67 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 12)
  %1558 = add i64 %pgocount67, 1
  store i64 %1558, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 12)
  br label %1476

; <label>:1559:                                   ; preds = %1481
  %pgocount68 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 117)
  %1560 = add i64 %pgocount68, 1
  store i64 %1560, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 117)
  %1561 = load %struct.DState*, %struct.DState** %2, align 8
  %1562 = getelementptr inbounds %struct.DState, %struct.DState* %1561, i32 0, i32 23
  %1563 = load i32, i32* %1562, align 8
  %1564 = shl i32 %1563, 8
  %1565 = load i8, i8* %3, align 1
  %1566 = zext i8 %1565 to i32
  %1567 = or i32 %1564, %1566
  %1568 = load %struct.DState*, %struct.DState** %2, align 8
  %1569 = getelementptr inbounds %struct.DState, %struct.DState* %1568, i32 0, i32 23
  store i32 %1567, i32* %1569, align 8
  br label %1570

; <label>:1570:                                   ; preds = %1559, %145
  %1571 = load %struct.DState*, %struct.DState** %2, align 8
  %1572 = getelementptr inbounds %struct.DState, %struct.DState* %1571, i32 0, i32 1
  store i32 23, i32* %1572, align 8
  br label %1573

; <label>:1573:                                   ; preds = %1655, %1570
  %1574 = load %struct.DState*, %struct.DState** %2, align 8
  %1575 = getelementptr inbounds %struct.DState, %struct.DState* %1574, i32 0, i32 8
  %1576 = load i32, i32* %1575, align 4
  %1577 = icmp sge i32 %1576, 8
  br i1 %1577, label %1578, label %1594

; <label>:1578:                                   ; preds = %1573
  %1579 = load %struct.DState*, %struct.DState** %2, align 8
  %1580 = getelementptr inbounds %struct.DState, %struct.DState* %1579, i32 0, i32 7
  %1581 = load i32, i32* %1580, align 8
  %1582 = load %struct.DState*, %struct.DState** %2, align 8
  %1583 = getelementptr inbounds %struct.DState, %struct.DState* %1582, i32 0, i32 8
  %1584 = load i32, i32* %1583, align 4
  %1585 = sub nsw i32 %1584, 8
  %1586 = lshr i32 %1581, %1585
  %1587 = and i32 %1586, 255
  store i32 %1587, i32* %45, align 4
  %1588 = load %struct.DState*, %struct.DState** %2, align 8
  %1589 = getelementptr inbounds %struct.DState, %struct.DState* %1588, i32 0, i32 8
  %1590 = load i32, i32* %1589, align 4
  %1591 = sub nsw i32 %1590, 8
  store i32 %1591, i32* %1589, align 4
  %1592 = load i32, i32* %45, align 4
  %1593 = trunc i32 %1592 to i8
  store i8 %1593, i8* %3, align 1
  br label %1656

; <label>:1594:                                   ; preds = %1573
  %1595 = load %struct.DState*, %struct.DState** %2, align 8
  %1596 = getelementptr inbounds %struct.DState, %struct.DState* %1595, i32 0, i32 0
  %1597 = load %struct.bz_stream*, %struct.bz_stream** %1596, align 8
  %1598 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1597, i32 0, i32 1
  %1599 = load i32, i32* %1598, align 8
  %1600 = icmp eq i32 %1599, 0
  br i1 %1600, label %1601, label %1603

; <label>:1601:                                   ; preds = %1594
  %pgocount69 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 115)
  %1602 = add i64 %pgocount69, 1
  store i64 %1602, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 115)
  store i32 0, i32* %4, align 4
  br label %6029

; <label>:1603:                                   ; preds = %1594
  %pgocount70 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 10)
  %1604 = add i64 %pgocount70, 1
  store i64 %1604, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 10)
  %1605 = load %struct.DState*, %struct.DState** %2, align 8
  %1606 = getelementptr inbounds %struct.DState, %struct.DState* %1605, i32 0, i32 7
  %1607 = load i32, i32* %1606, align 8
  %1608 = shl i32 %1607, 8
  %1609 = load %struct.DState*, %struct.DState** %2, align 8
  %1610 = getelementptr inbounds %struct.DState, %struct.DState* %1609, i32 0, i32 0
  %1611 = load %struct.bz_stream*, %struct.bz_stream** %1610, align 8
  %1612 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1611, i32 0, i32 0
  %1613 = load i8*, i8** %1612, align 8
  %1614 = load i8, i8* %1613, align 1
  %1615 = zext i8 %1614 to i32
  %1616 = or i32 %1608, %1615
  %1617 = load %struct.DState*, %struct.DState** %2, align 8
  %1618 = getelementptr inbounds %struct.DState, %struct.DState* %1617, i32 0, i32 7
  store i32 %1616, i32* %1618, align 8
  %1619 = load %struct.DState*, %struct.DState** %2, align 8
  %1620 = getelementptr inbounds %struct.DState, %struct.DState* %1619, i32 0, i32 8
  %1621 = load i32, i32* %1620, align 4
  %1622 = add nsw i32 %1621, 8
  store i32 %1622, i32* %1620, align 4
  %1623 = load %struct.DState*, %struct.DState** %2, align 8
  %1624 = getelementptr inbounds %struct.DState, %struct.DState* %1623, i32 0, i32 0
  %1625 = load %struct.bz_stream*, %struct.bz_stream** %1624, align 8
  %1626 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1625, i32 0, i32 0
  %1627 = load i8*, i8** %1626, align 8
  %1628 = getelementptr inbounds i8, i8* %1627, i32 1
  store i8* %1628, i8** %1626, align 8
  %1629 = load %struct.DState*, %struct.DState** %2, align 8
  %1630 = getelementptr inbounds %struct.DState, %struct.DState* %1629, i32 0, i32 0
  %1631 = load %struct.bz_stream*, %struct.bz_stream** %1630, align 8
  %1632 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1631, i32 0, i32 1
  %1633 = load i32, i32* %1632, align 8
  %1634 = add i32 %1633, -1
  store i32 %1634, i32* %1632, align 8
  %1635 = load %struct.DState*, %struct.DState** %2, align 8
  %1636 = getelementptr inbounds %struct.DState, %struct.DState* %1635, i32 0, i32 0
  %1637 = load %struct.bz_stream*, %struct.bz_stream** %1636, align 8
  %1638 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1637, i32 0, i32 2
  %1639 = load i32, i32* %1638, align 4
  %1640 = add i32 %1639, 1
  store i32 %1640, i32* %1638, align 4
  %1641 = load %struct.DState*, %struct.DState** %2, align 8
  %1642 = getelementptr inbounds %struct.DState, %struct.DState* %1641, i32 0, i32 0
  %1643 = load %struct.bz_stream*, %struct.bz_stream** %1642, align 8
  %1644 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1643, i32 0, i32 2
  %1645 = load i32, i32* %1644, align 4
  %1646 = icmp eq i32 %1645, 0
  br i1 %1646, label %1647, label %1655

; <label>:1647:                                   ; preds = %1603
  %pgocount71 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 58)
  %1648 = add i64 %pgocount71, 1
  store i64 %1648, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 58)
  %1649 = load %struct.DState*, %struct.DState** %2, align 8
  %1650 = getelementptr inbounds %struct.DState, %struct.DState* %1649, i32 0, i32 0
  %1651 = load %struct.bz_stream*, %struct.bz_stream** %1650, align 8
  %1652 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1651, i32 0, i32 3
  %1653 = load i32, i32* %1652, align 8
  %1654 = add i32 %1653, 1
  store i32 %1654, i32* %1652, align 8
  br label %1655

; <label>:1655:                                   ; preds = %1647, %1603
  br label %1573

; <label>:1656:                                   ; preds = %1578
  %pgocount72 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 112)
  %1657 = add i64 %pgocount72, 1
  store i64 %1657, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 112)
  %1658 = load %struct.DState*, %struct.DState** %2, align 8
  %1659 = getelementptr inbounds %struct.DState, %struct.DState* %1658, i32 0, i32 23
  %1660 = load i32, i32* %1659, align 8
  %1661 = shl i32 %1660, 8
  %1662 = load i8, i8* %3, align 1
  %1663 = zext i8 %1662 to i32
  %1664 = or i32 %1661, %1663
  %1665 = load %struct.DState*, %struct.DState** %2, align 8
  %1666 = getelementptr inbounds %struct.DState, %struct.DState* %1665, i32 0, i32 23
  store i32 %1664, i32* %1666, align 8
  br label %1667

; <label>:1667:                                   ; preds = %1656, %145
  %1668 = load %struct.DState*, %struct.DState** %2, align 8
  %1669 = getelementptr inbounds %struct.DState, %struct.DState* %1668, i32 0, i32 1
  store i32 24, i32* %1669, align 8
  br label %1670

; <label>:1670:                                   ; preds = %1753, %1667
  %1671 = load %struct.DState*, %struct.DState** %2, align 8
  %1672 = getelementptr inbounds %struct.DState, %struct.DState* %1671, i32 0, i32 8
  %1673 = load i32, i32* %1672, align 4
  %1674 = icmp sge i32 %1673, 1
  br i1 %1674, label %1675, label %1693

; <label>:1675:                                   ; preds = %1670
  %1676 = load %struct.DState*, %struct.DState** %2, align 8
  %1677 = getelementptr inbounds %struct.DState, %struct.DState* %1676, i32 0, i32 7
  %1678 = load i32, i32* %1677, align 8
  %1679 = load %struct.DState*, %struct.DState** %2, align 8
  %1680 = getelementptr inbounds %struct.DState, %struct.DState* %1679, i32 0, i32 8
  %1681 = load i32, i32* %1680, align 4
  %1682 = sub nsw i32 %1681, 1
  %1683 = lshr i32 %1678, %1682
  %1684 = and i32 %1683, 1
  store i32 %1684, i32* %46, align 4
  %1685 = load %struct.DState*, %struct.DState** %2, align 8
  %1686 = getelementptr inbounds %struct.DState, %struct.DState* %1685, i32 0, i32 8
  %1687 = load i32, i32* %1686, align 4
  %1688 = sub nsw i32 %1687, 1
  store i32 %1688, i32* %1686, align 4
  %1689 = load i32, i32* %46, align 4
  %1690 = trunc i32 %1689 to i8
  %1691 = load %struct.DState*, %struct.DState** %2, align 8
  %1692 = getelementptr inbounds %struct.DState, %struct.DState* %1691, i32 0, i32 4
  store i8 %1690, i8* %1692, align 4
  br label %1755

; <label>:1693:                                   ; preds = %1670
  %1694 = load %struct.DState*, %struct.DState** %2, align 8
  %1695 = getelementptr inbounds %struct.DState, %struct.DState* %1694, i32 0, i32 0
  %1696 = load %struct.bz_stream*, %struct.bz_stream** %1695, align 8
  %1697 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1696, i32 0, i32 1
  %1698 = load i32, i32* %1697, align 8
  %1699 = icmp eq i32 %1698, 0
  br i1 %1699, label %1700, label %1702

; <label>:1700:                                   ; preds = %1693
  %pgocount73 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 114)
  %1701 = add i64 %pgocount73, 1
  store i64 %1701, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 114)
  store i32 0, i32* %4, align 4
  br label %6029

; <label>:1702:                                   ; preds = %1693
  %1703 = load %struct.DState*, %struct.DState** %2, align 8
  %1704 = getelementptr inbounds %struct.DState, %struct.DState* %1703, i32 0, i32 7
  %1705 = load i32, i32* %1704, align 8
  %1706 = shl i32 %1705, 8
  %1707 = load %struct.DState*, %struct.DState** %2, align 8
  %1708 = getelementptr inbounds %struct.DState, %struct.DState* %1707, i32 0, i32 0
  %1709 = load %struct.bz_stream*, %struct.bz_stream** %1708, align 8
  %1710 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1709, i32 0, i32 0
  %1711 = load i8*, i8** %1710, align 8
  %1712 = load i8, i8* %1711, align 1
  %1713 = zext i8 %1712 to i32
  %1714 = or i32 %1706, %1713
  %1715 = load %struct.DState*, %struct.DState** %2, align 8
  %1716 = getelementptr inbounds %struct.DState, %struct.DState* %1715, i32 0, i32 7
  store i32 %1714, i32* %1716, align 8
  %1717 = load %struct.DState*, %struct.DState** %2, align 8
  %1718 = getelementptr inbounds %struct.DState, %struct.DState* %1717, i32 0, i32 8
  %1719 = load i32, i32* %1718, align 4
  %1720 = add nsw i32 %1719, 8
  store i32 %1720, i32* %1718, align 4
  %1721 = load %struct.DState*, %struct.DState** %2, align 8
  %1722 = getelementptr inbounds %struct.DState, %struct.DState* %1721, i32 0, i32 0
  %1723 = load %struct.bz_stream*, %struct.bz_stream** %1722, align 8
  %1724 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1723, i32 0, i32 0
  %1725 = load i8*, i8** %1724, align 8
  %1726 = getelementptr inbounds i8, i8* %1725, i32 1
  store i8* %1726, i8** %1724, align 8
  %1727 = load %struct.DState*, %struct.DState** %2, align 8
  %1728 = getelementptr inbounds %struct.DState, %struct.DState* %1727, i32 0, i32 0
  %1729 = load %struct.bz_stream*, %struct.bz_stream** %1728, align 8
  %1730 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1729, i32 0, i32 1
  %1731 = load i32, i32* %1730, align 8
  %1732 = add i32 %1731, -1
  store i32 %1732, i32* %1730, align 8
  %1733 = load %struct.DState*, %struct.DState** %2, align 8
  %1734 = getelementptr inbounds %struct.DState, %struct.DState* %1733, i32 0, i32 0
  %1735 = load %struct.bz_stream*, %struct.bz_stream** %1734, align 8
  %1736 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1735, i32 0, i32 2
  %1737 = load i32, i32* %1736, align 4
  %1738 = add i32 %1737, 1
  store i32 %1738, i32* %1736, align 4
  %1739 = load %struct.DState*, %struct.DState** %2, align 8
  %1740 = getelementptr inbounds %struct.DState, %struct.DState* %1739, i32 0, i32 0
  %1741 = load %struct.bz_stream*, %struct.bz_stream** %1740, align 8
  %1742 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1741, i32 0, i32 2
  %1743 = load i32, i32* %1742, align 4
  %1744 = icmp eq i32 %1743, 0
  br i1 %1744, label %1745, label %1753

; <label>:1745:                                   ; preds = %1702
  %pgocount74 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 57)
  %1746 = add i64 %pgocount74, 1
  store i64 %1746, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 57)
  %1747 = load %struct.DState*, %struct.DState** %2, align 8
  %1748 = getelementptr inbounds %struct.DState, %struct.DState* %1747, i32 0, i32 0
  %1749 = load %struct.bz_stream*, %struct.bz_stream** %1748, align 8
  %1750 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1749, i32 0, i32 3
  %1751 = load i32, i32* %1750, align 8
  %1752 = add i32 %1751, 1
  store i32 %1752, i32* %1750, align 8
  br label %1753

; <label>:1753:                                   ; preds = %1745, %1702
  %pgocount75 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 8)
  %1754 = add i64 %pgocount75, 1
  store i64 %1754, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 8)
  br label %1670

; <label>:1755:                                   ; preds = %1675
  %pgocount76 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 107)
  %1756 = add i64 %pgocount76, 1
  store i64 %1756, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 107)
  %1757 = load %struct.DState*, %struct.DState** %2, align 8
  %1758 = getelementptr inbounds %struct.DState, %struct.DState* %1757, i32 0, i32 13
  store i32 0, i32* %1758, align 8
  br label %1759

; <label>:1759:                                   ; preds = %1755, %145
  %1760 = load %struct.DState*, %struct.DState** %2, align 8
  %1761 = getelementptr inbounds %struct.DState, %struct.DState* %1760, i32 0, i32 1
  store i32 25, i32* %1761, align 8
  br label %1762

; <label>:1762:                                   ; preds = %1843, %1759
  %1763 = load %struct.DState*, %struct.DState** %2, align 8
  %1764 = getelementptr inbounds %struct.DState, %struct.DState* %1763, i32 0, i32 8
  %1765 = load i32, i32* %1764, align 4
  %1766 = icmp sge i32 %1765, 8
  br i1 %1766, label %1767, label %1783

; <label>:1767:                                   ; preds = %1762
  %1768 = load %struct.DState*, %struct.DState** %2, align 8
  %1769 = getelementptr inbounds %struct.DState, %struct.DState* %1768, i32 0, i32 7
  %1770 = load i32, i32* %1769, align 8
  %1771 = load %struct.DState*, %struct.DState** %2, align 8
  %1772 = getelementptr inbounds %struct.DState, %struct.DState* %1771, i32 0, i32 8
  %1773 = load i32, i32* %1772, align 4
  %1774 = sub nsw i32 %1773, 8
  %1775 = lshr i32 %1770, %1774
  %1776 = and i32 %1775, 255
  store i32 %1776, i32* %47, align 4
  %1777 = load %struct.DState*, %struct.DState** %2, align 8
  %1778 = getelementptr inbounds %struct.DState, %struct.DState* %1777, i32 0, i32 8
  %1779 = load i32, i32* %1778, align 4
  %1780 = sub nsw i32 %1779, 8
  store i32 %1780, i32* %1778, align 4
  %1781 = load i32, i32* %47, align 4
  %1782 = trunc i32 %1781 to i8
  store i8 %1782, i8* %3, align 1
  br label %1845

; <label>:1783:                                   ; preds = %1762
  %1784 = load %struct.DState*, %struct.DState** %2, align 8
  %1785 = getelementptr inbounds %struct.DState, %struct.DState* %1784, i32 0, i32 0
  %1786 = load %struct.bz_stream*, %struct.bz_stream** %1785, align 8
  %1787 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1786, i32 0, i32 1
  %1788 = load i32, i32* %1787, align 8
  %1789 = icmp eq i32 %1788, 0
  br i1 %1789, label %1790, label %1792

; <label>:1790:                                   ; preds = %1783
  %pgocount77 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 111)
  %1791 = add i64 %pgocount77, 1
  store i64 %1791, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 111)
  store i32 0, i32* %4, align 4
  br label %6029

; <label>:1792:                                   ; preds = %1783
  %1793 = load %struct.DState*, %struct.DState** %2, align 8
  %1794 = getelementptr inbounds %struct.DState, %struct.DState* %1793, i32 0, i32 7
  %1795 = load i32, i32* %1794, align 8
  %1796 = shl i32 %1795, 8
  %1797 = load %struct.DState*, %struct.DState** %2, align 8
  %1798 = getelementptr inbounds %struct.DState, %struct.DState* %1797, i32 0, i32 0
  %1799 = load %struct.bz_stream*, %struct.bz_stream** %1798, align 8
  %1800 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1799, i32 0, i32 0
  %1801 = load i8*, i8** %1800, align 8
  %1802 = load i8, i8* %1801, align 1
  %1803 = zext i8 %1802 to i32
  %1804 = or i32 %1796, %1803
  %1805 = load %struct.DState*, %struct.DState** %2, align 8
  %1806 = getelementptr inbounds %struct.DState, %struct.DState* %1805, i32 0, i32 7
  store i32 %1804, i32* %1806, align 8
  %1807 = load %struct.DState*, %struct.DState** %2, align 8
  %1808 = getelementptr inbounds %struct.DState, %struct.DState* %1807, i32 0, i32 8
  %1809 = load i32, i32* %1808, align 4
  %1810 = add nsw i32 %1809, 8
  store i32 %1810, i32* %1808, align 4
  %1811 = load %struct.DState*, %struct.DState** %2, align 8
  %1812 = getelementptr inbounds %struct.DState, %struct.DState* %1811, i32 0, i32 0
  %1813 = load %struct.bz_stream*, %struct.bz_stream** %1812, align 8
  %1814 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1813, i32 0, i32 0
  %1815 = load i8*, i8** %1814, align 8
  %1816 = getelementptr inbounds i8, i8* %1815, i32 1
  store i8* %1816, i8** %1814, align 8
  %1817 = load %struct.DState*, %struct.DState** %2, align 8
  %1818 = getelementptr inbounds %struct.DState, %struct.DState* %1817, i32 0, i32 0
  %1819 = load %struct.bz_stream*, %struct.bz_stream** %1818, align 8
  %1820 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1819, i32 0, i32 1
  %1821 = load i32, i32* %1820, align 8
  %1822 = add i32 %1821, -1
  store i32 %1822, i32* %1820, align 8
  %1823 = load %struct.DState*, %struct.DState** %2, align 8
  %1824 = getelementptr inbounds %struct.DState, %struct.DState* %1823, i32 0, i32 0
  %1825 = load %struct.bz_stream*, %struct.bz_stream** %1824, align 8
  %1826 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1825, i32 0, i32 2
  %1827 = load i32, i32* %1826, align 4
  %1828 = add i32 %1827, 1
  store i32 %1828, i32* %1826, align 4
  %1829 = load %struct.DState*, %struct.DState** %2, align 8
  %1830 = getelementptr inbounds %struct.DState, %struct.DState* %1829, i32 0, i32 0
  %1831 = load %struct.bz_stream*, %struct.bz_stream** %1830, align 8
  %1832 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1831, i32 0, i32 2
  %1833 = load i32, i32* %1832, align 4
  %1834 = icmp eq i32 %1833, 0
  br i1 %1834, label %1835, label %1843

; <label>:1835:                                   ; preds = %1792
  %pgocount78 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 56)
  %1836 = add i64 %pgocount78, 1
  store i64 %1836, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 56)
  %1837 = load %struct.DState*, %struct.DState** %2, align 8
  %1838 = getelementptr inbounds %struct.DState, %struct.DState* %1837, i32 0, i32 0
  %1839 = load %struct.bz_stream*, %struct.bz_stream** %1838, align 8
  %1840 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1839, i32 0, i32 3
  %1841 = load i32, i32* %1840, align 8
  %1842 = add i32 %1841, 1
  store i32 %1842, i32* %1840, align 8
  br label %1843

; <label>:1843:                                   ; preds = %1835, %1792
  %pgocount79 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 7)
  %1844 = add i64 %pgocount79, 1
  store i64 %1844, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 7)
  br label %1762

; <label>:1845:                                   ; preds = %1767
  %pgocount80 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 106)
  %1846 = add i64 %pgocount80, 1
  store i64 %1846, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 106)
  %1847 = load %struct.DState*, %struct.DState** %2, align 8
  %1848 = getelementptr inbounds %struct.DState, %struct.DState* %1847, i32 0, i32 13
  %1849 = load i32, i32* %1848, align 8
  %1850 = shl i32 %1849, 8
  %1851 = load i8, i8* %3, align 1
  %1852 = zext i8 %1851 to i32
  %1853 = or i32 %1850, %1852
  %1854 = load %struct.DState*, %struct.DState** %2, align 8
  %1855 = getelementptr inbounds %struct.DState, %struct.DState* %1854, i32 0, i32 13
  store i32 %1853, i32* %1855, align 8
  br label %1856

; <label>:1856:                                   ; preds = %1845, %145
  %1857 = load %struct.DState*, %struct.DState** %2, align 8
  %1858 = getelementptr inbounds %struct.DState, %struct.DState* %1857, i32 0, i32 1
  store i32 26, i32* %1858, align 8
  br label %1859

; <label>:1859:                                   ; preds = %1940, %1856
  %1860 = load %struct.DState*, %struct.DState** %2, align 8
  %1861 = getelementptr inbounds %struct.DState, %struct.DState* %1860, i32 0, i32 8
  %1862 = load i32, i32* %1861, align 4
  %1863 = icmp sge i32 %1862, 8
  br i1 %1863, label %1864, label %1880

; <label>:1864:                                   ; preds = %1859
  %1865 = load %struct.DState*, %struct.DState** %2, align 8
  %1866 = getelementptr inbounds %struct.DState, %struct.DState* %1865, i32 0, i32 7
  %1867 = load i32, i32* %1866, align 8
  %1868 = load %struct.DState*, %struct.DState** %2, align 8
  %1869 = getelementptr inbounds %struct.DState, %struct.DState* %1868, i32 0, i32 8
  %1870 = load i32, i32* %1869, align 4
  %1871 = sub nsw i32 %1870, 8
  %1872 = lshr i32 %1867, %1871
  %1873 = and i32 %1872, 255
  store i32 %1873, i32* %48, align 4
  %1874 = load %struct.DState*, %struct.DState** %2, align 8
  %1875 = getelementptr inbounds %struct.DState, %struct.DState* %1874, i32 0, i32 8
  %1876 = load i32, i32* %1875, align 4
  %1877 = sub nsw i32 %1876, 8
  store i32 %1877, i32* %1875, align 4
  %1878 = load i32, i32* %48, align 4
  %1879 = trunc i32 %1878 to i8
  store i8 %1879, i8* %3, align 1
  br label %1942

; <label>:1880:                                   ; preds = %1859
  %1881 = load %struct.DState*, %struct.DState** %2, align 8
  %1882 = getelementptr inbounds %struct.DState, %struct.DState* %1881, i32 0, i32 0
  %1883 = load %struct.bz_stream*, %struct.bz_stream** %1882, align 8
  %1884 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1883, i32 0, i32 1
  %1885 = load i32, i32* %1884, align 8
  %1886 = icmp eq i32 %1885, 0
  br i1 %1886, label %1887, label %1889

; <label>:1887:                                   ; preds = %1880
  %pgocount81 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 110)
  %1888 = add i64 %pgocount81, 1
  store i64 %1888, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 110)
  store i32 0, i32* %4, align 4
  br label %6029

; <label>:1889:                                   ; preds = %1880
  %1890 = load %struct.DState*, %struct.DState** %2, align 8
  %1891 = getelementptr inbounds %struct.DState, %struct.DState* %1890, i32 0, i32 7
  %1892 = load i32, i32* %1891, align 8
  %1893 = shl i32 %1892, 8
  %1894 = load %struct.DState*, %struct.DState** %2, align 8
  %1895 = getelementptr inbounds %struct.DState, %struct.DState* %1894, i32 0, i32 0
  %1896 = load %struct.bz_stream*, %struct.bz_stream** %1895, align 8
  %1897 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1896, i32 0, i32 0
  %1898 = load i8*, i8** %1897, align 8
  %1899 = load i8, i8* %1898, align 1
  %1900 = zext i8 %1899 to i32
  %1901 = or i32 %1893, %1900
  %1902 = load %struct.DState*, %struct.DState** %2, align 8
  %1903 = getelementptr inbounds %struct.DState, %struct.DState* %1902, i32 0, i32 7
  store i32 %1901, i32* %1903, align 8
  %1904 = load %struct.DState*, %struct.DState** %2, align 8
  %1905 = getelementptr inbounds %struct.DState, %struct.DState* %1904, i32 0, i32 8
  %1906 = load i32, i32* %1905, align 4
  %1907 = add nsw i32 %1906, 8
  store i32 %1907, i32* %1905, align 4
  %1908 = load %struct.DState*, %struct.DState** %2, align 8
  %1909 = getelementptr inbounds %struct.DState, %struct.DState* %1908, i32 0, i32 0
  %1910 = load %struct.bz_stream*, %struct.bz_stream** %1909, align 8
  %1911 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1910, i32 0, i32 0
  %1912 = load i8*, i8** %1911, align 8
  %1913 = getelementptr inbounds i8, i8* %1912, i32 1
  store i8* %1913, i8** %1911, align 8
  %1914 = load %struct.DState*, %struct.DState** %2, align 8
  %1915 = getelementptr inbounds %struct.DState, %struct.DState* %1914, i32 0, i32 0
  %1916 = load %struct.bz_stream*, %struct.bz_stream** %1915, align 8
  %1917 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1916, i32 0, i32 1
  %1918 = load i32, i32* %1917, align 8
  %1919 = add i32 %1918, -1
  store i32 %1919, i32* %1917, align 8
  %1920 = load %struct.DState*, %struct.DState** %2, align 8
  %1921 = getelementptr inbounds %struct.DState, %struct.DState* %1920, i32 0, i32 0
  %1922 = load %struct.bz_stream*, %struct.bz_stream** %1921, align 8
  %1923 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1922, i32 0, i32 2
  %1924 = load i32, i32* %1923, align 4
  %1925 = add i32 %1924, 1
  store i32 %1925, i32* %1923, align 4
  %1926 = load %struct.DState*, %struct.DState** %2, align 8
  %1927 = getelementptr inbounds %struct.DState, %struct.DState* %1926, i32 0, i32 0
  %1928 = load %struct.bz_stream*, %struct.bz_stream** %1927, align 8
  %1929 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1928, i32 0, i32 2
  %1930 = load i32, i32* %1929, align 4
  %1931 = icmp eq i32 %1930, 0
  br i1 %1931, label %1932, label %1940

; <label>:1932:                                   ; preds = %1889
  %pgocount82 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 55)
  %1933 = add i64 %pgocount82, 1
  store i64 %1933, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 55)
  %1934 = load %struct.DState*, %struct.DState** %2, align 8
  %1935 = getelementptr inbounds %struct.DState, %struct.DState* %1934, i32 0, i32 0
  %1936 = load %struct.bz_stream*, %struct.bz_stream** %1935, align 8
  %1937 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1936, i32 0, i32 3
  %1938 = load i32, i32* %1937, align 8
  %1939 = add i32 %1938, 1
  store i32 %1939, i32* %1937, align 8
  br label %1940

; <label>:1940:                                   ; preds = %1932, %1889
  %pgocount83 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 6)
  %1941 = add i64 %pgocount83, 1
  store i64 %1941, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 6)
  br label %1859

; <label>:1942:                                   ; preds = %1864
  %pgocount84 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 105)
  %1943 = add i64 %pgocount84, 1
  store i64 %1943, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 105)
  %1944 = load %struct.DState*, %struct.DState** %2, align 8
  %1945 = getelementptr inbounds %struct.DState, %struct.DState* %1944, i32 0, i32 13
  %1946 = load i32, i32* %1945, align 8
  %1947 = shl i32 %1946, 8
  %1948 = load i8, i8* %3, align 1
  %1949 = zext i8 %1948 to i32
  %1950 = or i32 %1947, %1949
  %1951 = load %struct.DState*, %struct.DState** %2, align 8
  %1952 = getelementptr inbounds %struct.DState, %struct.DState* %1951, i32 0, i32 13
  store i32 %1950, i32* %1952, align 8
  br label %1953

; <label>:1953:                                   ; preds = %1942, %145
  %1954 = load %struct.DState*, %struct.DState** %2, align 8
  %1955 = getelementptr inbounds %struct.DState, %struct.DState* %1954, i32 0, i32 1
  store i32 27, i32* %1955, align 8
  br label %1956

; <label>:1956:                                   ; preds = %2038, %1953
  %1957 = load %struct.DState*, %struct.DState** %2, align 8
  %1958 = getelementptr inbounds %struct.DState, %struct.DState* %1957, i32 0, i32 8
  %1959 = load i32, i32* %1958, align 4
  %1960 = icmp sge i32 %1959, 8
  br i1 %1960, label %1961, label %1977

; <label>:1961:                                   ; preds = %1956
  %1962 = load %struct.DState*, %struct.DState** %2, align 8
  %1963 = getelementptr inbounds %struct.DState, %struct.DState* %1962, i32 0, i32 7
  %1964 = load i32, i32* %1963, align 8
  %1965 = load %struct.DState*, %struct.DState** %2, align 8
  %1966 = getelementptr inbounds %struct.DState, %struct.DState* %1965, i32 0, i32 8
  %1967 = load i32, i32* %1966, align 4
  %1968 = sub nsw i32 %1967, 8
  %1969 = lshr i32 %1964, %1968
  %1970 = and i32 %1969, 255
  store i32 %1970, i32* %49, align 4
  %1971 = load %struct.DState*, %struct.DState** %2, align 8
  %1972 = getelementptr inbounds %struct.DState, %struct.DState* %1971, i32 0, i32 8
  %1973 = load i32, i32* %1972, align 4
  %1974 = sub nsw i32 %1973, 8
  store i32 %1974, i32* %1972, align 4
  %1975 = load i32, i32* %49, align 4
  %1976 = trunc i32 %1975 to i8
  store i8 %1976, i8* %3, align 1
  br label %2039

; <label>:1977:                                   ; preds = %1956
  %1978 = load %struct.DState*, %struct.DState** %2, align 8
  %1979 = getelementptr inbounds %struct.DState, %struct.DState* %1978, i32 0, i32 0
  %1980 = load %struct.bz_stream*, %struct.bz_stream** %1979, align 8
  %1981 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1980, i32 0, i32 1
  %1982 = load i32, i32* %1981, align 8
  %1983 = icmp eq i32 %1982, 0
  br i1 %1983, label %1984, label %1986

; <label>:1984:                                   ; preds = %1977
  %pgocount85 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 109)
  %1985 = add i64 %pgocount85, 1
  store i64 %1985, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 109)
  store i32 0, i32* %4, align 4
  br label %6029

; <label>:1986:                                   ; preds = %1977
  %pgocount86 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 5)
  %1987 = add i64 %pgocount86, 1
  store i64 %1987, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 5)
  %1988 = load %struct.DState*, %struct.DState** %2, align 8
  %1989 = getelementptr inbounds %struct.DState, %struct.DState* %1988, i32 0, i32 7
  %1990 = load i32, i32* %1989, align 8
  %1991 = shl i32 %1990, 8
  %1992 = load %struct.DState*, %struct.DState** %2, align 8
  %1993 = getelementptr inbounds %struct.DState, %struct.DState* %1992, i32 0, i32 0
  %1994 = load %struct.bz_stream*, %struct.bz_stream** %1993, align 8
  %1995 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %1994, i32 0, i32 0
  %1996 = load i8*, i8** %1995, align 8
  %1997 = load i8, i8* %1996, align 1
  %1998 = zext i8 %1997 to i32
  %1999 = or i32 %1991, %1998
  %2000 = load %struct.DState*, %struct.DState** %2, align 8
  %2001 = getelementptr inbounds %struct.DState, %struct.DState* %2000, i32 0, i32 7
  store i32 %1999, i32* %2001, align 8
  %2002 = load %struct.DState*, %struct.DState** %2, align 8
  %2003 = getelementptr inbounds %struct.DState, %struct.DState* %2002, i32 0, i32 8
  %2004 = load i32, i32* %2003, align 4
  %2005 = add nsw i32 %2004, 8
  store i32 %2005, i32* %2003, align 4
  %2006 = load %struct.DState*, %struct.DState** %2, align 8
  %2007 = getelementptr inbounds %struct.DState, %struct.DState* %2006, i32 0, i32 0
  %2008 = load %struct.bz_stream*, %struct.bz_stream** %2007, align 8
  %2009 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2008, i32 0, i32 0
  %2010 = load i8*, i8** %2009, align 8
  %2011 = getelementptr inbounds i8, i8* %2010, i32 1
  store i8* %2011, i8** %2009, align 8
  %2012 = load %struct.DState*, %struct.DState** %2, align 8
  %2013 = getelementptr inbounds %struct.DState, %struct.DState* %2012, i32 0, i32 0
  %2014 = load %struct.bz_stream*, %struct.bz_stream** %2013, align 8
  %2015 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2014, i32 0, i32 1
  %2016 = load i32, i32* %2015, align 8
  %2017 = add i32 %2016, -1
  store i32 %2017, i32* %2015, align 8
  %2018 = load %struct.DState*, %struct.DState** %2, align 8
  %2019 = getelementptr inbounds %struct.DState, %struct.DState* %2018, i32 0, i32 0
  %2020 = load %struct.bz_stream*, %struct.bz_stream** %2019, align 8
  %2021 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2020, i32 0, i32 2
  %2022 = load i32, i32* %2021, align 4
  %2023 = add i32 %2022, 1
  store i32 %2023, i32* %2021, align 4
  %2024 = load %struct.DState*, %struct.DState** %2, align 8
  %2025 = getelementptr inbounds %struct.DState, %struct.DState* %2024, i32 0, i32 0
  %2026 = load %struct.bz_stream*, %struct.bz_stream** %2025, align 8
  %2027 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2026, i32 0, i32 2
  %2028 = load i32, i32* %2027, align 4
  %2029 = icmp eq i32 %2028, 0
  br i1 %2029, label %2030, label %2038

; <label>:2030:                                   ; preds = %1986
  %pgocount87 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 54)
  %2031 = add i64 %pgocount87, 1
  store i64 %2031, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 54)
  %2032 = load %struct.DState*, %struct.DState** %2, align 8
  %2033 = getelementptr inbounds %struct.DState, %struct.DState* %2032, i32 0, i32 0
  %2034 = load %struct.bz_stream*, %struct.bz_stream** %2033, align 8
  %2035 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2034, i32 0, i32 3
  %2036 = load i32, i32* %2035, align 8
  %2037 = add i32 %2036, 1
  store i32 %2037, i32* %2035, align 8
  br label %2038

; <label>:2038:                                   ; preds = %2030, %1986
  br label %1956

; <label>:2039:                                   ; preds = %1961
  %2040 = load %struct.DState*, %struct.DState** %2, align 8
  %2041 = getelementptr inbounds %struct.DState, %struct.DState* %2040, i32 0, i32 13
  %2042 = load i32, i32* %2041, align 8
  %2043 = shl i32 %2042, 8
  %2044 = load i8, i8* %3, align 1
  %2045 = zext i8 %2044 to i32
  %2046 = or i32 %2043, %2045
  %2047 = load %struct.DState*, %struct.DState** %2, align 8
  %2048 = getelementptr inbounds %struct.DState, %struct.DState* %2047, i32 0, i32 13
  store i32 %2046, i32* %2048, align 8
  %2049 = load %struct.DState*, %struct.DState** %2, align 8
  %2050 = getelementptr inbounds %struct.DState, %struct.DState* %2049, i32 0, i32 13
  %2051 = load i32, i32* %2050, align 8
  %2052 = icmp slt i32 %2051, 0
  br i1 %2052, label %2053, label %2055

; <label>:2053:                                   ; preds = %2039
  %pgocount88 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 184)
  %2054 = add i64 %pgocount88, 1
  store i64 %2054, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 184)
  store i32 -4, i32* %4, align 4
  br label %6029

; <label>:2055:                                   ; preds = %2039
  %2056 = load %struct.DState*, %struct.DState** %2, align 8
  %2057 = getelementptr inbounds %struct.DState, %struct.DState* %2056, i32 0, i32 13
  %2058 = load i32, i32* %2057, align 8
  %2059 = load %struct.DState*, %struct.DState** %2, align 8
  %2060 = getelementptr inbounds %struct.DState, %struct.DState* %2059, i32 0, i32 9
  %2061 = load i32, i32* %2060, align 8
  %2062 = mul nsw i32 100000, %2061
  %2063 = add nsw i32 10, %2062
  %2064 = icmp sgt i32 %2058, %2063
  br i1 %2064, label %2065, label %2067

; <label>:2065:                                   ; preds = %2055
  %pgocount89 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 210)
  %2066 = add i64 %pgocount89, 1
  store i64 %2066, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 210)
  store i32 -4, i32* %4, align 4
  br label %6029

; <label>:2067:                                   ; preds = %2055
  %pgocount90 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 211)
  %2068 = add i64 %pgocount90, 1
  store i64 %2068, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 211)
  store i32 0, i32* %8, align 4
  br label %2069

; <label>:2069:                                   ; preds = %2178, %2067
  %2070 = load i32, i32* %8, align 4
  %2071 = icmp slt i32 %2070, 16
  br i1 %2071, label %2072, label %2181

; <label>:2072:                                   ; preds = %2069
  br label %2073

; <label>:2073:                                   ; preds = %2072, %145
  %2074 = load %struct.DState*, %struct.DState** %2, align 8
  %2075 = getelementptr inbounds %struct.DState, %struct.DState* %2074, i32 0, i32 1
  store i32 28, i32* %2075, align 8
  br label %2076

; <label>:2076:                                   ; preds = %2157, %2073
  %2077 = load %struct.DState*, %struct.DState** %2, align 8
  %2078 = getelementptr inbounds %struct.DState, %struct.DState* %2077, i32 0, i32 8
  %2079 = load i32, i32* %2078, align 4
  %2080 = icmp sge i32 %2079, 1
  br i1 %2080, label %2081, label %2097

; <label>:2081:                                   ; preds = %2076
  %2082 = load %struct.DState*, %struct.DState** %2, align 8
  %2083 = getelementptr inbounds %struct.DState, %struct.DState* %2082, i32 0, i32 7
  %2084 = load i32, i32* %2083, align 8
  %2085 = load %struct.DState*, %struct.DState** %2, align 8
  %2086 = getelementptr inbounds %struct.DState, %struct.DState* %2085, i32 0, i32 8
  %2087 = load i32, i32* %2086, align 4
  %2088 = sub nsw i32 %2087, 1
  %2089 = lshr i32 %2084, %2088
  %2090 = and i32 %2089, 1
  store i32 %2090, i32* %50, align 4
  %2091 = load %struct.DState*, %struct.DState** %2, align 8
  %2092 = getelementptr inbounds %struct.DState, %struct.DState* %2091, i32 0, i32 8
  %2093 = load i32, i32* %2092, align 4
  %2094 = sub nsw i32 %2093, 1
  store i32 %2094, i32* %2092, align 4
  %2095 = load i32, i32* %50, align 4
  %2096 = trunc i32 %2095 to i8
  store i8 %2096, i8* %3, align 1
  br label %2159

; <label>:2097:                                   ; preds = %2076
  %2098 = load %struct.DState*, %struct.DState** %2, align 8
  %2099 = getelementptr inbounds %struct.DState, %struct.DState* %2098, i32 0, i32 0
  %2100 = load %struct.bz_stream*, %struct.bz_stream** %2099, align 8
  %2101 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2100, i32 0, i32 1
  %2102 = load i32, i32* %2101, align 8
  %2103 = icmp eq i32 %2102, 0
  br i1 %2103, label %2104, label %2106

; <label>:2104:                                   ; preds = %2097
  %pgocount91 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 148)
  %2105 = add i64 %pgocount91, 1
  store i64 %2105, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 148)
  store i32 0, i32* %4, align 4
  br label %6029

; <label>:2106:                                   ; preds = %2097
  %2107 = load %struct.DState*, %struct.DState** %2, align 8
  %2108 = getelementptr inbounds %struct.DState, %struct.DState* %2107, i32 0, i32 7
  %2109 = load i32, i32* %2108, align 8
  %2110 = shl i32 %2109, 8
  %2111 = load %struct.DState*, %struct.DState** %2, align 8
  %2112 = getelementptr inbounds %struct.DState, %struct.DState* %2111, i32 0, i32 0
  %2113 = load %struct.bz_stream*, %struct.bz_stream** %2112, align 8
  %2114 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2113, i32 0, i32 0
  %2115 = load i8*, i8** %2114, align 8
  %2116 = load i8, i8* %2115, align 1
  %2117 = zext i8 %2116 to i32
  %2118 = or i32 %2110, %2117
  %2119 = load %struct.DState*, %struct.DState** %2, align 8
  %2120 = getelementptr inbounds %struct.DState, %struct.DState* %2119, i32 0, i32 7
  store i32 %2118, i32* %2120, align 8
  %2121 = load %struct.DState*, %struct.DState** %2, align 8
  %2122 = getelementptr inbounds %struct.DState, %struct.DState* %2121, i32 0, i32 8
  %2123 = load i32, i32* %2122, align 4
  %2124 = add nsw i32 %2123, 8
  store i32 %2124, i32* %2122, align 4
  %2125 = load %struct.DState*, %struct.DState** %2, align 8
  %2126 = getelementptr inbounds %struct.DState, %struct.DState* %2125, i32 0, i32 0
  %2127 = load %struct.bz_stream*, %struct.bz_stream** %2126, align 8
  %2128 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2127, i32 0, i32 0
  %2129 = load i8*, i8** %2128, align 8
  %2130 = getelementptr inbounds i8, i8* %2129, i32 1
  store i8* %2130, i8** %2128, align 8
  %2131 = load %struct.DState*, %struct.DState** %2, align 8
  %2132 = getelementptr inbounds %struct.DState, %struct.DState* %2131, i32 0, i32 0
  %2133 = load %struct.bz_stream*, %struct.bz_stream** %2132, align 8
  %2134 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2133, i32 0, i32 1
  %2135 = load i32, i32* %2134, align 8
  %2136 = add i32 %2135, -1
  store i32 %2136, i32* %2134, align 8
  %2137 = load %struct.DState*, %struct.DState** %2, align 8
  %2138 = getelementptr inbounds %struct.DState, %struct.DState* %2137, i32 0, i32 0
  %2139 = load %struct.bz_stream*, %struct.bz_stream** %2138, align 8
  %2140 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2139, i32 0, i32 2
  %2141 = load i32, i32* %2140, align 4
  %2142 = add i32 %2141, 1
  store i32 %2142, i32* %2140, align 4
  %2143 = load %struct.DState*, %struct.DState** %2, align 8
  %2144 = getelementptr inbounds %struct.DState, %struct.DState* %2143, i32 0, i32 0
  %2145 = load %struct.bz_stream*, %struct.bz_stream** %2144, align 8
  %2146 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2145, i32 0, i32 2
  %2147 = load i32, i32* %2146, align 4
  %2148 = icmp eq i32 %2147, 0
  br i1 %2148, label %2149, label %2157

; <label>:2149:                                   ; preds = %2106
  %pgocount92 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 79)
  %2150 = add i64 %pgocount92, 1
  store i64 %2150, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 79)
  %2151 = load %struct.DState*, %struct.DState** %2, align 8
  %2152 = getelementptr inbounds %struct.DState, %struct.DState* %2151, i32 0, i32 0
  %2153 = load %struct.bz_stream*, %struct.bz_stream** %2152, align 8
  %2154 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2153, i32 0, i32 3
  %2155 = load i32, i32* %2154, align 8
  %2156 = add i32 %2155, 1
  store i32 %2156, i32* %2154, align 8
  br label %2157

; <label>:2157:                                   ; preds = %2149, %2106
  %pgocount93 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 35)
  %2158 = add i64 %pgocount93, 1
  store i64 %2158, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 35)
  br label %2076

; <label>:2159:                                   ; preds = %2081
  %2160 = load i8, i8* %3, align 1
  %2161 = zext i8 %2160 to i32
  %2162 = icmp eq i32 %2161, 1
  br i1 %2162, label %2163, label %2170

; <label>:2163:                                   ; preds = %2159
  %pgocount94 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 198)
  %2164 = add i64 %pgocount94, 1
  store i64 %2164, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 198)
  %2165 = load %struct.DState*, %struct.DState** %2, align 8
  %2166 = getelementptr inbounds %struct.DState, %struct.DState* %2165, i32 0, i32 29
  %2167 = load i32, i32* %8, align 4
  %2168 = sext i32 %2167 to i64
  %2169 = getelementptr inbounds [16 x i8], [16 x i8]* %2166, i64 0, i64 %2168
  store i8 1, i8* %2169, align 1
  br label %2177

; <label>:2170:                                   ; preds = %2159
  %pgocount95 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 199)
  %2171 = add i64 %pgocount95, 1
  store i64 %2171, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 199)
  %2172 = load %struct.DState*, %struct.DState** %2, align 8
  %2173 = getelementptr inbounds %struct.DState, %struct.DState* %2172, i32 0, i32 29
  %2174 = load i32, i32* %8, align 4
  %2175 = sext i32 %2174 to i64
  %2176 = getelementptr inbounds [16 x i8], [16 x i8]* %2173, i64 0, i64 %2175
  store i8 0, i8* %2176, align 1
  br label %2177

; <label>:2177:                                   ; preds = %2170, %2163
  br label %2178

; <label>:2178:                                   ; preds = %2177
  %2179 = load i32, i32* %8, align 4
  %2180 = add nsw i32 %2179, 1
  store i32 %2180, i32* %8, align 4
  br label %2069

; <label>:2181:                                   ; preds = %2069
  store i32 0, i32* %8, align 4
  br label %2182

; <label>:2182:                                   ; preds = %2191, %2181
  %2183 = load i32, i32* %8, align 4
  %2184 = icmp slt i32 %2183, 256
  br i1 %2184, label %2185, label %2195

; <label>:2185:                                   ; preds = %2182
  %2186 = load %struct.DState*, %struct.DState** %2, align 8
  %2187 = getelementptr inbounds %struct.DState, %struct.DState* %2186, i32 0, i32 28
  %2188 = load i32, i32* %8, align 4
  %2189 = sext i32 %2188 to i64
  %2190 = getelementptr inbounds [256 x i8], [256 x i8]* %2187, i64 0, i64 %2189
  store i8 0, i8* %2190, align 1
  br label %2191

; <label>:2191:                                   ; preds = %2185
  %pgocount96 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 23)
  %2192 = add i64 %pgocount96, 1
  store i64 %2192, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 23)
  %2193 = load i32, i32* %8, align 4
  %2194 = add nsw i32 %2193, 1
  store i32 %2194, i32* %8, align 4
  br label %2182

; <label>:2195:                                   ; preds = %2182
  %pgocount97 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 136)
  %2196 = add i64 %pgocount97, 1
  store i64 %2196, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 136)
  store i32 0, i32* %8, align 4
  br label %2197

; <label>:2197:                                   ; preds = %2322, %2195
  %2198 = load i32, i32* %8, align 4
  %2199 = icmp slt i32 %2198, 16
  br i1 %2199, label %2200, label %2325

; <label>:2200:                                   ; preds = %2197
  %pgocount98 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 121)
  %2201 = add i64 %pgocount98, 1
  store i64 %2201, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 121)
  %2202 = load %struct.DState*, %struct.DState** %2, align 8
  %2203 = getelementptr inbounds %struct.DState, %struct.DState* %2202, i32 0, i32 29
  %2204 = load i32, i32* %8, align 4
  %2205 = sext i32 %2204 to i64
  %2206 = getelementptr inbounds [16 x i8], [16 x i8]* %2203, i64 0, i64 %2205
  %2207 = load i8, i8* %2206, align 1
  %2208 = icmp ne i8 %2207, 0
  br i1 %2208, label %2209, label %2321

; <label>:2209:                                   ; preds = %2200
  %pgocount99 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 165)
  %2210 = add i64 %pgocount99, 1
  store i64 %2210, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 165)
  store i32 0, i32* %9, align 4
  br label %2211

; <label>:2211:                                   ; preds = %2317, %2209
  %2212 = load i32, i32* %9, align 4
  %2213 = icmp slt i32 %2212, 16
  br i1 %2213, label %2214, label %2320

; <label>:2214:                                   ; preds = %2211
  %pgocount100 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 124)
  %2215 = add i64 %pgocount100, 1
  store i64 %2215, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 124)
  br label %2216

; <label>:2216:                                   ; preds = %2214, %145
  %2217 = load %struct.DState*, %struct.DState** %2, align 8
  %2218 = getelementptr inbounds %struct.DState, %struct.DState* %2217, i32 0, i32 1
  store i32 29, i32* %2218, align 8
  br label %2219

; <label>:2219:                                   ; preds = %2301, %2216
  %2220 = load %struct.DState*, %struct.DState** %2, align 8
  %2221 = getelementptr inbounds %struct.DState, %struct.DState* %2220, i32 0, i32 8
  %2222 = load i32, i32* %2221, align 4
  %2223 = icmp sge i32 %2222, 1
  br i1 %2223, label %2224, label %2240

; <label>:2224:                                   ; preds = %2219
  %2225 = load %struct.DState*, %struct.DState** %2, align 8
  %2226 = getelementptr inbounds %struct.DState, %struct.DState* %2225, i32 0, i32 7
  %2227 = load i32, i32* %2226, align 8
  %2228 = load %struct.DState*, %struct.DState** %2, align 8
  %2229 = getelementptr inbounds %struct.DState, %struct.DState* %2228, i32 0, i32 8
  %2230 = load i32, i32* %2229, align 4
  %2231 = sub nsw i32 %2230, 1
  %2232 = lshr i32 %2227, %2231
  %2233 = and i32 %2232, 1
  store i32 %2233, i32* %51, align 4
  %2234 = load %struct.DState*, %struct.DState** %2, align 8
  %2235 = getelementptr inbounds %struct.DState, %struct.DState* %2234, i32 0, i32 8
  %2236 = load i32, i32* %2235, align 4
  %2237 = sub nsw i32 %2236, 1
  store i32 %2237, i32* %2235, align 4
  %2238 = load i32, i32* %51, align 4
  %2239 = trunc i32 %2238 to i8
  store i8 %2239, i8* %3, align 1
  br label %2302

; <label>:2240:                                   ; preds = %2219
  %2241 = load %struct.DState*, %struct.DState** %2, align 8
  %2242 = getelementptr inbounds %struct.DState, %struct.DState* %2241, i32 0, i32 0
  %2243 = load %struct.bz_stream*, %struct.bz_stream** %2242, align 8
  %2244 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2243, i32 0, i32 1
  %2245 = load i32, i32* %2244, align 8
  %2246 = icmp eq i32 %2245, 0
  br i1 %2246, label %2247, label %2249

; <label>:2247:                                   ; preds = %2240
  %pgocount101 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 127)
  %2248 = add i64 %pgocount101, 1
  store i64 %2248, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 127)
  store i32 0, i32* %4, align 4
  br label %6029

; <label>:2249:                                   ; preds = %2240
  %pgocount102 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 15)
  %2250 = add i64 %pgocount102, 1
  store i64 %2250, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 15)
  %2251 = load %struct.DState*, %struct.DState** %2, align 8
  %2252 = getelementptr inbounds %struct.DState, %struct.DState* %2251, i32 0, i32 7
  %2253 = load i32, i32* %2252, align 8
  %2254 = shl i32 %2253, 8
  %2255 = load %struct.DState*, %struct.DState** %2, align 8
  %2256 = getelementptr inbounds %struct.DState, %struct.DState* %2255, i32 0, i32 0
  %2257 = load %struct.bz_stream*, %struct.bz_stream** %2256, align 8
  %2258 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2257, i32 0, i32 0
  %2259 = load i8*, i8** %2258, align 8
  %2260 = load i8, i8* %2259, align 1
  %2261 = zext i8 %2260 to i32
  %2262 = or i32 %2254, %2261
  %2263 = load %struct.DState*, %struct.DState** %2, align 8
  %2264 = getelementptr inbounds %struct.DState, %struct.DState* %2263, i32 0, i32 7
  store i32 %2262, i32* %2264, align 8
  %2265 = load %struct.DState*, %struct.DState** %2, align 8
  %2266 = getelementptr inbounds %struct.DState, %struct.DState* %2265, i32 0, i32 8
  %2267 = load i32, i32* %2266, align 4
  %2268 = add nsw i32 %2267, 8
  store i32 %2268, i32* %2266, align 4
  %2269 = load %struct.DState*, %struct.DState** %2, align 8
  %2270 = getelementptr inbounds %struct.DState, %struct.DState* %2269, i32 0, i32 0
  %2271 = load %struct.bz_stream*, %struct.bz_stream** %2270, align 8
  %2272 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2271, i32 0, i32 0
  %2273 = load i8*, i8** %2272, align 8
  %2274 = getelementptr inbounds i8, i8* %2273, i32 1
  store i8* %2274, i8** %2272, align 8
  %2275 = load %struct.DState*, %struct.DState** %2, align 8
  %2276 = getelementptr inbounds %struct.DState, %struct.DState* %2275, i32 0, i32 0
  %2277 = load %struct.bz_stream*, %struct.bz_stream** %2276, align 8
  %2278 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2277, i32 0, i32 1
  %2279 = load i32, i32* %2278, align 8
  %2280 = add i32 %2279, -1
  store i32 %2280, i32* %2278, align 8
  %2281 = load %struct.DState*, %struct.DState** %2, align 8
  %2282 = getelementptr inbounds %struct.DState, %struct.DState* %2281, i32 0, i32 0
  %2283 = load %struct.bz_stream*, %struct.bz_stream** %2282, align 8
  %2284 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2283, i32 0, i32 2
  %2285 = load i32, i32* %2284, align 4
  %2286 = add i32 %2285, 1
  store i32 %2286, i32* %2284, align 4
  %2287 = load %struct.DState*, %struct.DState** %2, align 8
  %2288 = getelementptr inbounds %struct.DState, %struct.DState* %2287, i32 0, i32 0
  %2289 = load %struct.bz_stream*, %struct.bz_stream** %2288, align 8
  %2290 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2289, i32 0, i32 2
  %2291 = load i32, i32* %2290, align 4
  %2292 = icmp eq i32 %2291, 0
  br i1 %2292, label %2293, label %2301

; <label>:2293:                                   ; preds = %2249
  %pgocount103 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 64)
  %2294 = add i64 %pgocount103, 1
  store i64 %2294, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 64)
  %2295 = load %struct.DState*, %struct.DState** %2, align 8
  %2296 = getelementptr inbounds %struct.DState, %struct.DState* %2295, i32 0, i32 0
  %2297 = load %struct.bz_stream*, %struct.bz_stream** %2296, align 8
  %2298 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2297, i32 0, i32 3
  %2299 = load i32, i32* %2298, align 8
  %2300 = add i32 %2299, 1
  store i32 %2300, i32* %2298, align 8
  br label %2301

; <label>:2301:                                   ; preds = %2293, %2249
  br label %2219

; <label>:2302:                                   ; preds = %2224
  %2303 = load i8, i8* %3, align 1
  %2304 = zext i8 %2303 to i32
  %2305 = icmp eq i32 %2304, 1
  br i1 %2305, label %2306, label %2316

; <label>:2306:                                   ; preds = %2302
  %pgocount104 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 181)
  %2307 = add i64 %pgocount104, 1
  store i64 %2307, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 181)
  %2308 = load %struct.DState*, %struct.DState** %2, align 8
  %2309 = getelementptr inbounds %struct.DState, %struct.DState* %2308, i32 0, i32 28
  %2310 = load i32, i32* %8, align 4
  %2311 = mul nsw i32 %2310, 16
  %2312 = load i32, i32* %9, align 4
  %2313 = add nsw i32 %2311, %2312
  %2314 = sext i32 %2313 to i64
  %2315 = getelementptr inbounds [256 x i8], [256 x i8]* %2309, i64 0, i64 %2314
  store i8 1, i8* %2315, align 1
  br label %2316

; <label>:2316:                                   ; preds = %2306, %2302
  br label %2317

; <label>:2317:                                   ; preds = %2316
  %2318 = load i32, i32* %9, align 4
  %2319 = add nsw i32 %2318, 1
  store i32 %2319, i32* %9, align 4
  br label %2211

; <label>:2320:                                   ; preds = %2211
  br label %2321

; <label>:2321:                                   ; preds = %2320, %2200
  br label %2322

; <label>:2322:                                   ; preds = %2321
  %2323 = load i32, i32* %8, align 4
  %2324 = add nsw i32 %2323, 1
  store i32 %2324, i32* %8, align 4
  br label %2197

; <label>:2325:                                   ; preds = %2197
  %2326 = load %struct.DState*, %struct.DState** %2, align 8
  call void @makeMaps_d(%struct.DState* %2326)
  %2327 = load %struct.DState*, %struct.DState** %2, align 8
  %2328 = getelementptr inbounds %struct.DState, %struct.DState* %2327, i32 0, i32 27
  %2329 = load i32, i32* %2328, align 8
  %2330 = icmp eq i32 %2329, 0
  br i1 %2330, label %2331, label %2333

; <label>:2331:                                   ; preds = %2325
  %pgocount105 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 214)
  %2332 = add i64 %pgocount105, 1
  store i64 %2332, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 214)
  store i32 -4, i32* %4, align 4
  br label %6029

; <label>:2333:                                   ; preds = %2325
  %pgocount106 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 166)
  %2334 = add i64 %pgocount106, 1
  store i64 %2334, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 166)
  %2335 = load %struct.DState*, %struct.DState** %2, align 8
  %2336 = getelementptr inbounds %struct.DState, %struct.DState* %2335, i32 0, i32 27
  %2337 = load i32, i32* %2336, align 8
  %2338 = add nsw i32 %2337, 2
  store i32 %2338, i32* %11, align 4
  br label %2339

; <label>:2339:                                   ; preds = %2333, %145
  %2340 = load %struct.DState*, %struct.DState** %2, align 8
  %2341 = getelementptr inbounds %struct.DState, %struct.DState* %2340, i32 0, i32 1
  store i32 30, i32* %2341, align 8
  br label %2342

; <label>:2342:                                   ; preds = %2422, %2339
  %2343 = load %struct.DState*, %struct.DState** %2, align 8
  %2344 = getelementptr inbounds %struct.DState, %struct.DState* %2343, i32 0, i32 8
  %2345 = load i32, i32* %2344, align 4
  %2346 = icmp sge i32 %2345, 3
  br i1 %2346, label %2347, label %2362

; <label>:2347:                                   ; preds = %2342
  %2348 = load %struct.DState*, %struct.DState** %2, align 8
  %2349 = getelementptr inbounds %struct.DState, %struct.DState* %2348, i32 0, i32 7
  %2350 = load i32, i32* %2349, align 8
  %2351 = load %struct.DState*, %struct.DState** %2, align 8
  %2352 = getelementptr inbounds %struct.DState, %struct.DState* %2351, i32 0, i32 8
  %2353 = load i32, i32* %2352, align 4
  %2354 = sub nsw i32 %2353, 3
  %2355 = lshr i32 %2350, %2354
  %2356 = and i32 %2355, 7
  store i32 %2356, i32* %52, align 4
  %2357 = load %struct.DState*, %struct.DState** %2, align 8
  %2358 = getelementptr inbounds %struct.DState, %struct.DState* %2357, i32 0, i32 8
  %2359 = load i32, i32* %2358, align 4
  %2360 = sub nsw i32 %2359, 3
  store i32 %2360, i32* %2358, align 4
  %2361 = load i32, i32* %52, align 4
  store i32 %2361, i32* %12, align 4
  br label %2424

; <label>:2362:                                   ; preds = %2342
  %2363 = load %struct.DState*, %struct.DState** %2, align 8
  %2364 = getelementptr inbounds %struct.DState, %struct.DState* %2363, i32 0, i32 0
  %2365 = load %struct.bz_stream*, %struct.bz_stream** %2364, align 8
  %2366 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2365, i32 0, i32 1
  %2367 = load i32, i32* %2366, align 8
  %2368 = icmp eq i32 %2367, 0
  br i1 %2368, label %2369, label %2371

; <label>:2369:                                   ; preds = %2362
  %pgocount107 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 129)
  %2370 = add i64 %pgocount107, 1
  store i64 %2370, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 129)
  store i32 0, i32* %4, align 4
  br label %6029

; <label>:2371:                                   ; preds = %2362
  %2372 = load %struct.DState*, %struct.DState** %2, align 8
  %2373 = getelementptr inbounds %struct.DState, %struct.DState* %2372, i32 0, i32 7
  %2374 = load i32, i32* %2373, align 8
  %2375 = shl i32 %2374, 8
  %2376 = load %struct.DState*, %struct.DState** %2, align 8
  %2377 = getelementptr inbounds %struct.DState, %struct.DState* %2376, i32 0, i32 0
  %2378 = load %struct.bz_stream*, %struct.bz_stream** %2377, align 8
  %2379 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2378, i32 0, i32 0
  %2380 = load i8*, i8** %2379, align 8
  %2381 = load i8, i8* %2380, align 1
  %2382 = zext i8 %2381 to i32
  %2383 = or i32 %2375, %2382
  %2384 = load %struct.DState*, %struct.DState** %2, align 8
  %2385 = getelementptr inbounds %struct.DState, %struct.DState* %2384, i32 0, i32 7
  store i32 %2383, i32* %2385, align 8
  %2386 = load %struct.DState*, %struct.DState** %2, align 8
  %2387 = getelementptr inbounds %struct.DState, %struct.DState* %2386, i32 0, i32 8
  %2388 = load i32, i32* %2387, align 4
  %2389 = add nsw i32 %2388, 8
  store i32 %2389, i32* %2387, align 4
  %2390 = load %struct.DState*, %struct.DState** %2, align 8
  %2391 = getelementptr inbounds %struct.DState, %struct.DState* %2390, i32 0, i32 0
  %2392 = load %struct.bz_stream*, %struct.bz_stream** %2391, align 8
  %2393 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2392, i32 0, i32 0
  %2394 = load i8*, i8** %2393, align 8
  %2395 = getelementptr inbounds i8, i8* %2394, i32 1
  store i8* %2395, i8** %2393, align 8
  %2396 = load %struct.DState*, %struct.DState** %2, align 8
  %2397 = getelementptr inbounds %struct.DState, %struct.DState* %2396, i32 0, i32 0
  %2398 = load %struct.bz_stream*, %struct.bz_stream** %2397, align 8
  %2399 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2398, i32 0, i32 1
  %2400 = load i32, i32* %2399, align 8
  %2401 = add i32 %2400, -1
  store i32 %2401, i32* %2399, align 8
  %2402 = load %struct.DState*, %struct.DState** %2, align 8
  %2403 = getelementptr inbounds %struct.DState, %struct.DState* %2402, i32 0, i32 0
  %2404 = load %struct.bz_stream*, %struct.bz_stream** %2403, align 8
  %2405 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2404, i32 0, i32 2
  %2406 = load i32, i32* %2405, align 4
  %2407 = add i32 %2406, 1
  store i32 %2407, i32* %2405, align 4
  %2408 = load %struct.DState*, %struct.DState** %2, align 8
  %2409 = getelementptr inbounds %struct.DState, %struct.DState* %2408, i32 0, i32 0
  %2410 = load %struct.bz_stream*, %struct.bz_stream** %2409, align 8
  %2411 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2410, i32 0, i32 2
  %2412 = load i32, i32* %2411, align 4
  %2413 = icmp eq i32 %2412, 0
  br i1 %2413, label %2414, label %2422

; <label>:2414:                                   ; preds = %2371
  %pgocount108 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 66)
  %2415 = add i64 %pgocount108, 1
  store i64 %2415, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 66)
  %2416 = load %struct.DState*, %struct.DState** %2, align 8
  %2417 = getelementptr inbounds %struct.DState, %struct.DState* %2416, i32 0, i32 0
  %2418 = load %struct.bz_stream*, %struct.bz_stream** %2417, align 8
  %2419 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2418, i32 0, i32 3
  %2420 = load i32, i32* %2419, align 8
  %2421 = add i32 %2420, 1
  store i32 %2421, i32* %2419, align 8
  br label %2422

; <label>:2422:                                   ; preds = %2414, %2371
  %pgocount109 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 17)
  %2423 = add i64 %pgocount109, 1
  store i64 %2423, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 17)
  br label %2342

; <label>:2424:                                   ; preds = %2347
  %2425 = load i32, i32* %12, align 4
  %2426 = icmp slt i32 %2425, 2
  br i1 %2426, label %2431, label %2427

; <label>:2427:                                   ; preds = %2424
  %pgocount110 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 183)
  %2428 = add i64 %pgocount110, 1
  store i64 %2428, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 183)
  %2429 = load i32, i32* %12, align 4
  %2430 = icmp sgt i32 %2429, 6
  br i1 %2430, label %2431, label %2433

; <label>:2431:                                   ; preds = %2427, %2424
  %pgocount111 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 159)
  %2432 = add i64 %pgocount111, 1
  store i64 %2432, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 159)
  store i32 -4, i32* %4, align 4
  br label %6029

; <label>:2433:                                   ; preds = %2427
  %pgocount112 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 233)
  %2434 = add i64 %pgocount112, 1
  store i64 %2434, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 233)
  br label %2435

; <label>:2435:                                   ; preds = %2433, %145
  %2436 = load %struct.DState*, %struct.DState** %2, align 8
  %2437 = getelementptr inbounds %struct.DState, %struct.DState* %2436, i32 0, i32 1
  store i32 31, i32* %2437, align 8
  br label %2438

; <label>:2438:                                   ; preds = %2518, %2435
  %2439 = load %struct.DState*, %struct.DState** %2, align 8
  %2440 = getelementptr inbounds %struct.DState, %struct.DState* %2439, i32 0, i32 8
  %2441 = load i32, i32* %2440, align 4
  %2442 = icmp sge i32 %2441, 15
  br i1 %2442, label %2443, label %2458

; <label>:2443:                                   ; preds = %2438
  %2444 = load %struct.DState*, %struct.DState** %2, align 8
  %2445 = getelementptr inbounds %struct.DState, %struct.DState* %2444, i32 0, i32 7
  %2446 = load i32, i32* %2445, align 8
  %2447 = load %struct.DState*, %struct.DState** %2, align 8
  %2448 = getelementptr inbounds %struct.DState, %struct.DState* %2447, i32 0, i32 8
  %2449 = load i32, i32* %2448, align 4
  %2450 = sub nsw i32 %2449, 15
  %2451 = lshr i32 %2446, %2450
  %2452 = and i32 %2451, 32767
  store i32 %2452, i32* %53, align 4
  %2453 = load %struct.DState*, %struct.DState** %2, align 8
  %2454 = getelementptr inbounds %struct.DState, %struct.DState* %2453, i32 0, i32 8
  %2455 = load i32, i32* %2454, align 4
  %2456 = sub nsw i32 %2455, 15
  store i32 %2456, i32* %2454, align 4
  %2457 = load i32, i32* %53, align 4
  store i32 %2457, i32* %13, align 4
  br label %2520

; <label>:2458:                                   ; preds = %2438
  %2459 = load %struct.DState*, %struct.DState** %2, align 8
  %2460 = getelementptr inbounds %struct.DState, %struct.DState* %2459, i32 0, i32 0
  %2461 = load %struct.bz_stream*, %struct.bz_stream** %2460, align 8
  %2462 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2461, i32 0, i32 1
  %2463 = load i32, i32* %2462, align 8
  %2464 = icmp eq i32 %2463, 0
  br i1 %2464, label %2465, label %2467

; <label>:2465:                                   ; preds = %2458
  %pgocount113 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 158)
  %2466 = add i64 %pgocount113, 1
  store i64 %2466, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 158)
  store i32 0, i32* %4, align 4
  br label %6029

; <label>:2467:                                   ; preds = %2458
  %2468 = load %struct.DState*, %struct.DState** %2, align 8
  %2469 = getelementptr inbounds %struct.DState, %struct.DState* %2468, i32 0, i32 7
  %2470 = load i32, i32* %2469, align 8
  %2471 = shl i32 %2470, 8
  %2472 = load %struct.DState*, %struct.DState** %2, align 8
  %2473 = getelementptr inbounds %struct.DState, %struct.DState* %2472, i32 0, i32 0
  %2474 = load %struct.bz_stream*, %struct.bz_stream** %2473, align 8
  %2475 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2474, i32 0, i32 0
  %2476 = load i8*, i8** %2475, align 8
  %2477 = load i8, i8* %2476, align 1
  %2478 = zext i8 %2477 to i32
  %2479 = or i32 %2471, %2478
  %2480 = load %struct.DState*, %struct.DState** %2, align 8
  %2481 = getelementptr inbounds %struct.DState, %struct.DState* %2480, i32 0, i32 7
  store i32 %2479, i32* %2481, align 8
  %2482 = load %struct.DState*, %struct.DState** %2, align 8
  %2483 = getelementptr inbounds %struct.DState, %struct.DState* %2482, i32 0, i32 8
  %2484 = load i32, i32* %2483, align 4
  %2485 = add nsw i32 %2484, 8
  store i32 %2485, i32* %2483, align 4
  %2486 = load %struct.DState*, %struct.DState** %2, align 8
  %2487 = getelementptr inbounds %struct.DState, %struct.DState* %2486, i32 0, i32 0
  %2488 = load %struct.bz_stream*, %struct.bz_stream** %2487, align 8
  %2489 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2488, i32 0, i32 0
  %2490 = load i8*, i8** %2489, align 8
  %2491 = getelementptr inbounds i8, i8* %2490, i32 1
  store i8* %2491, i8** %2489, align 8
  %2492 = load %struct.DState*, %struct.DState** %2, align 8
  %2493 = getelementptr inbounds %struct.DState, %struct.DState* %2492, i32 0, i32 0
  %2494 = load %struct.bz_stream*, %struct.bz_stream** %2493, align 8
  %2495 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2494, i32 0, i32 1
  %2496 = load i32, i32* %2495, align 8
  %2497 = add i32 %2496, -1
  store i32 %2497, i32* %2495, align 8
  %2498 = load %struct.DState*, %struct.DState** %2, align 8
  %2499 = getelementptr inbounds %struct.DState, %struct.DState* %2498, i32 0, i32 0
  %2500 = load %struct.bz_stream*, %struct.bz_stream** %2499, align 8
  %2501 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2500, i32 0, i32 2
  %2502 = load i32, i32* %2501, align 4
  %2503 = add i32 %2502, 1
  store i32 %2503, i32* %2501, align 4
  %2504 = load %struct.DState*, %struct.DState** %2, align 8
  %2505 = getelementptr inbounds %struct.DState, %struct.DState* %2504, i32 0, i32 0
  %2506 = load %struct.bz_stream*, %struct.bz_stream** %2505, align 8
  %2507 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2506, i32 0, i32 2
  %2508 = load i32, i32* %2507, align 4
  %2509 = icmp eq i32 %2508, 0
  br i1 %2509, label %2510, label %2518

; <label>:2510:                                   ; preds = %2467
  %pgocount114 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 87)
  %2511 = add i64 %pgocount114, 1
  store i64 %2511, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 87)
  %2512 = load %struct.DState*, %struct.DState** %2, align 8
  %2513 = getelementptr inbounds %struct.DState, %struct.DState* %2512, i32 0, i32 0
  %2514 = load %struct.bz_stream*, %struct.bz_stream** %2513, align 8
  %2515 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2514, i32 0, i32 3
  %2516 = load i32, i32* %2515, align 8
  %2517 = add i32 %2516, 1
  store i32 %2517, i32* %2515, align 8
  br label %2518

; <label>:2518:                                   ; preds = %2510, %2467
  %pgocount115 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 45)
  %2519 = add i64 %pgocount115, 1
  store i64 %2519, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 45)
  br label %2438

; <label>:2520:                                   ; preds = %2443
  %2521 = load i32, i32* %13, align 4
  %2522 = icmp slt i32 %2521, 1
  br i1 %2522, label %2523, label %2525

; <label>:2523:                                   ; preds = %2520
  %pgocount116 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 230)
  %2524 = add i64 %pgocount116, 1
  store i64 %2524, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 230)
  store i32 -4, i32* %4, align 4
  br label %6029

; <label>:2525:                                   ; preds = %2520
  store i32 0, i32* %8, align 4
  br label %2526

; <label>:2526:                                   ; preds = %2642, %2525
  %2527 = load i32, i32* %8, align 4
  %2528 = load i32, i32* %13, align 4
  %2529 = icmp slt i32 %2527, %2528
  br i1 %2529, label %2530, label %2646

; <label>:2530:                                   ; preds = %2526
  %pgocount117 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 238)
  %2531 = add i64 %pgocount117, 1
  store i64 %2531, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 238)
  store i32 0, i32* %9, align 4
  br label %2532

; <label>:2532:                                   ; preds = %2632, %2530
  br label %2533

; <label>:2533:                                   ; preds = %2532, %145
  %2534 = load %struct.DState*, %struct.DState** %2, align 8
  %2535 = getelementptr inbounds %struct.DState, %struct.DState* %2534, i32 0, i32 1
  store i32 32, i32* %2535, align 8
  br label %2536

; <label>:2536:                                   ; preds = %2618, %2533
  %2537 = load %struct.DState*, %struct.DState** %2, align 8
  %2538 = getelementptr inbounds %struct.DState, %struct.DState* %2537, i32 0, i32 8
  %2539 = load i32, i32* %2538, align 4
  %2540 = icmp sge i32 %2539, 1
  br i1 %2540, label %2541, label %2557

; <label>:2541:                                   ; preds = %2536
  %2542 = load %struct.DState*, %struct.DState** %2, align 8
  %2543 = getelementptr inbounds %struct.DState, %struct.DState* %2542, i32 0, i32 7
  %2544 = load i32, i32* %2543, align 8
  %2545 = load %struct.DState*, %struct.DState** %2, align 8
  %2546 = getelementptr inbounds %struct.DState, %struct.DState* %2545, i32 0, i32 8
  %2547 = load i32, i32* %2546, align 4
  %2548 = sub nsw i32 %2547, 1
  %2549 = lshr i32 %2544, %2548
  %2550 = and i32 %2549, 1
  store i32 %2550, i32* %54, align 4
  %2551 = load %struct.DState*, %struct.DState** %2, align 8
  %2552 = getelementptr inbounds %struct.DState, %struct.DState* %2551, i32 0, i32 8
  %2553 = load i32, i32* %2552, align 4
  %2554 = sub nsw i32 %2553, 1
  store i32 %2554, i32* %2552, align 4
  %2555 = load i32, i32* %54, align 4
  %2556 = trunc i32 %2555 to i8
  store i8 %2556, i8* %3, align 1
  br label %2619

; <label>:2557:                                   ; preds = %2536
  %2558 = load %struct.DState*, %struct.DState** %2, align 8
  %2559 = getelementptr inbounds %struct.DState, %struct.DState* %2558, i32 0, i32 0
  %2560 = load %struct.bz_stream*, %struct.bz_stream** %2559, align 8
  %2561 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2560, i32 0, i32 1
  %2562 = load i32, i32* %2561, align 8
  %2563 = icmp eq i32 %2562, 0
  br i1 %2563, label %2564, label %2566

; <label>:2564:                                   ; preds = %2557
  %pgocount118 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 157)
  %2565 = add i64 %pgocount118, 1
  store i64 %2565, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 157)
  store i32 0, i32* %4, align 4
  br label %6029

; <label>:2566:                                   ; preds = %2557
  %pgocount119 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 44)
  %2567 = add i64 %pgocount119, 1
  store i64 %2567, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 44)
  %2568 = load %struct.DState*, %struct.DState** %2, align 8
  %2569 = getelementptr inbounds %struct.DState, %struct.DState* %2568, i32 0, i32 7
  %2570 = load i32, i32* %2569, align 8
  %2571 = shl i32 %2570, 8
  %2572 = load %struct.DState*, %struct.DState** %2, align 8
  %2573 = getelementptr inbounds %struct.DState, %struct.DState* %2572, i32 0, i32 0
  %2574 = load %struct.bz_stream*, %struct.bz_stream** %2573, align 8
  %2575 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2574, i32 0, i32 0
  %2576 = load i8*, i8** %2575, align 8
  %2577 = load i8, i8* %2576, align 1
  %2578 = zext i8 %2577 to i32
  %2579 = or i32 %2571, %2578
  %2580 = load %struct.DState*, %struct.DState** %2, align 8
  %2581 = getelementptr inbounds %struct.DState, %struct.DState* %2580, i32 0, i32 7
  store i32 %2579, i32* %2581, align 8
  %2582 = load %struct.DState*, %struct.DState** %2, align 8
  %2583 = getelementptr inbounds %struct.DState, %struct.DState* %2582, i32 0, i32 8
  %2584 = load i32, i32* %2583, align 4
  %2585 = add nsw i32 %2584, 8
  store i32 %2585, i32* %2583, align 4
  %2586 = load %struct.DState*, %struct.DState** %2, align 8
  %2587 = getelementptr inbounds %struct.DState, %struct.DState* %2586, i32 0, i32 0
  %2588 = load %struct.bz_stream*, %struct.bz_stream** %2587, align 8
  %2589 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2588, i32 0, i32 0
  %2590 = load i8*, i8** %2589, align 8
  %2591 = getelementptr inbounds i8, i8* %2590, i32 1
  store i8* %2591, i8** %2589, align 8
  %2592 = load %struct.DState*, %struct.DState** %2, align 8
  %2593 = getelementptr inbounds %struct.DState, %struct.DState* %2592, i32 0, i32 0
  %2594 = load %struct.bz_stream*, %struct.bz_stream** %2593, align 8
  %2595 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2594, i32 0, i32 1
  %2596 = load i32, i32* %2595, align 8
  %2597 = add i32 %2596, -1
  store i32 %2597, i32* %2595, align 8
  %2598 = load %struct.DState*, %struct.DState** %2, align 8
  %2599 = getelementptr inbounds %struct.DState, %struct.DState* %2598, i32 0, i32 0
  %2600 = load %struct.bz_stream*, %struct.bz_stream** %2599, align 8
  %2601 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2600, i32 0, i32 2
  %2602 = load i32, i32* %2601, align 4
  %2603 = add i32 %2602, 1
  store i32 %2603, i32* %2601, align 4
  %2604 = load %struct.DState*, %struct.DState** %2, align 8
  %2605 = getelementptr inbounds %struct.DState, %struct.DState* %2604, i32 0, i32 0
  %2606 = load %struct.bz_stream*, %struct.bz_stream** %2605, align 8
  %2607 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2606, i32 0, i32 2
  %2608 = load i32, i32* %2607, align 4
  %2609 = icmp eq i32 %2608, 0
  br i1 %2609, label %2610, label %2618

; <label>:2610:                                   ; preds = %2566
  %pgocount120 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 86)
  %2611 = add i64 %pgocount120, 1
  store i64 %2611, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 86)
  %2612 = load %struct.DState*, %struct.DState** %2, align 8
  %2613 = getelementptr inbounds %struct.DState, %struct.DState* %2612, i32 0, i32 0
  %2614 = load %struct.bz_stream*, %struct.bz_stream** %2613, align 8
  %2615 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2614, i32 0, i32 3
  %2616 = load i32, i32* %2615, align 8
  %2617 = add i32 %2616, 1
  store i32 %2617, i32* %2615, align 8
  br label %2618

; <label>:2618:                                   ; preds = %2610, %2566
  br label %2536

; <label>:2619:                                   ; preds = %2541
  %2620 = load i8, i8* %3, align 1
  %2621 = zext i8 %2620 to i32
  %2622 = icmp eq i32 %2621, 0
  br i1 %2622, label %2623, label %2624

; <label>:2623:                                   ; preds = %2619
  br label %2634

; <label>:2624:                                   ; preds = %2619
  %2625 = load i32, i32* %9, align 4
  %2626 = add nsw i32 %2625, 1
  store i32 %2626, i32* %9, align 4
  %2627 = load i32, i32* %9, align 4
  %2628 = load i32, i32* %12, align 4
  %2629 = icmp sge i32 %2627, %2628
  br i1 %2629, label %2630, label %2632

; <label>:2630:                                   ; preds = %2624
  %pgocount121 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 234)
  %2631 = add i64 %pgocount121, 1
  store i64 %2631, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 234)
  store i32 -4, i32* %4, align 4
  br label %6029

; <label>:2632:                                   ; preds = %2624
  %pgocount122 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 235)
  %2633 = add i64 %pgocount122, 1
  store i64 %2633, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 235)
  br label %2532

; <label>:2634:                                   ; preds = %2623
  %2635 = load i32, i32* %9, align 4
  %2636 = trunc i32 %2635 to i8
  %2637 = load %struct.DState*, %struct.DState** %2, align 8
  %2638 = getelementptr inbounds %struct.DState, %struct.DState* %2637, i32 0, i32 34
  %2639 = load i32, i32* %8, align 4
  %2640 = sext i32 %2639 to i64
  %2641 = getelementptr inbounds [18002 x i8], [18002 x i8]* %2638, i64 0, i64 %2640
  store i8 %2636, i8* %2641, align 1
  br label %2642

; <label>:2642:                                   ; preds = %2634
  %pgocount123 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 229)
  %2643 = add i64 %pgocount123, 1
  store i64 %2643, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 229)
  %2644 = load i32, i32* %8, align 4
  %2645 = add nsw i32 %2644, 1
  store i32 %2645, i32* %8, align 4
  br label %2526

; <label>:2646:                                   ; preds = %2526
  %pgocount124 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 239)
  %2647 = add i64 %pgocount124, 1
  store i64 %2647, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 239)
  store i8 0, i8* %57, align 1
  br label %2648

; <label>:2648:                                   ; preds = %2658, %2646
  %2649 = load i8, i8* %57, align 1
  %2650 = zext i8 %2649 to i32
  %2651 = load i32, i32* %12, align 4
  %2652 = icmp slt i32 %2650, %2651
  br i1 %2652, label %2653, label %2662

; <label>:2653:                                   ; preds = %2648
  %2654 = load i8, i8* %57, align 1
  %2655 = load i8, i8* %57, align 1
  %2656 = zext i8 %2655 to i64
  %2657 = getelementptr inbounds [6 x i8], [6 x i8]* %55, i64 0, i64 %2656
  store i8 %2654, i8* %2657, align 1
  br label %2658

; <label>:2658:                                   ; preds = %2653
  %pgocount125 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 42)
  %2659 = add i64 %pgocount125, 1
  store i64 %2659, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 42)
  %2660 = load i8, i8* %57, align 1
  %2661 = add i8 %2660, 1
  store i8 %2661, i8* %57, align 1
  br label %2648

; <label>:2662:                                   ; preds = %2648
  store i32 0, i32* %8, align 4
  br label %2663

; <label>:2663:                                   ; preds = %2704, %2662
  %2664 = load i32, i32* %8, align 4
  %2665 = load i32, i32* %13, align 4
  %2666 = icmp slt i32 %2664, %2665
  br i1 %2666, label %2667, label %2708

; <label>:2667:                                   ; preds = %2663
  %2668 = load %struct.DState*, %struct.DState** %2, align 8
  %2669 = getelementptr inbounds %struct.DState, %struct.DState* %2668, i32 0, i32 34
  %2670 = load i32, i32* %8, align 4
  %2671 = sext i32 %2670 to i64
  %2672 = getelementptr inbounds [18002 x i8], [18002 x i8]* %2669, i64 0, i64 %2671
  %2673 = load i8, i8* %2672, align 1
  store i8 %2673, i8* %57, align 1
  %2674 = load i8, i8* %57, align 1
  %2675 = zext i8 %2674 to i64
  %2676 = getelementptr inbounds [6 x i8], [6 x i8]* %55, i64 0, i64 %2675
  %2677 = load i8, i8* %2676, align 1
  store i8 %2677, i8* %56, align 1
  br label %2678

; <label>:2678:                                   ; preds = %2682, %2667
  %2679 = load i8, i8* %57, align 1
  %2680 = zext i8 %2679 to i32
  %2681 = icmp sgt i32 %2680, 0
  br i1 %2681, label %2682, label %2695

; <label>:2682:                                   ; preds = %2678
  %pgocount126 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 2)
  %2683 = add i64 %pgocount126, 1
  store i64 %2683, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 2)
  %2684 = load i8, i8* %57, align 1
  %2685 = zext i8 %2684 to i32
  %2686 = sub nsw i32 %2685, 1
  %2687 = sext i32 %2686 to i64
  %2688 = getelementptr inbounds [6 x i8], [6 x i8]* %55, i64 0, i64 %2687
  %2689 = load i8, i8* %2688, align 1
  %2690 = load i8, i8* %57, align 1
  %2691 = zext i8 %2690 to i64
  %2692 = getelementptr inbounds [6 x i8], [6 x i8]* %55, i64 0, i64 %2691
  store i8 %2689, i8* %2692, align 1
  %2693 = load i8, i8* %57, align 1
  %2694 = add i8 %2693, -1
  store i8 %2694, i8* %57, align 1
  br label %2678

; <label>:2695:                                   ; preds = %2678
  %2696 = load i8, i8* %56, align 1
  %2697 = getelementptr inbounds [6 x i8], [6 x i8]* %55, i64 0, i64 0
  store i8 %2696, i8* %2697, align 1
  %2698 = load i8, i8* %56, align 1
  %2699 = load %struct.DState*, %struct.DState** %2, align 8
  %2700 = getelementptr inbounds %struct.DState, %struct.DState* %2699, i32 0, i32 33
  %2701 = load i32, i32* %8, align 4
  %2702 = sext i32 %2701 to i64
  %2703 = getelementptr inbounds [18002 x i8], [18002 x i8]* %2700, i64 0, i64 %2702
  store i8 %2698, i8* %2703, align 1
  br label %2704

; <label>:2704:                                   ; preds = %2695
  %pgocount127 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 43)
  %2705 = add i64 %pgocount127, 1
  store i64 %2705, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 43)
  %2706 = load i32, i32* %8, align 4
  %2707 = add nsw i32 %2706, 1
  store i32 %2707, i32* %8, align 4
  br label %2663

; <label>:2708:                                   ; preds = %2663
  store i32 0, i32* %10, align 4
  br label %2709

; <label>:2709:                                   ; preds = %3025, %2708
  %2710 = load i32, i32* %10, align 4
  %2711 = load i32, i32* %12, align 4
  %2712 = icmp slt i32 %2710, %2711
  br i1 %2712, label %2713, label %3028

; <label>:2713:                                   ; preds = %2709
  %pgocount128 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 156)
  %2714 = add i64 %pgocount128, 1
  store i64 %2714, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 156)
  br label %2715

; <label>:2715:                                   ; preds = %2713, %145
  %2716 = load %struct.DState*, %struct.DState** %2, align 8
  %2717 = getelementptr inbounds %struct.DState, %struct.DState* %2716, i32 0, i32 1
  store i32 33, i32* %2717, align 8
  br label %2718

; <label>:2718:                                   ; preds = %2799, %2715
  %2719 = load %struct.DState*, %struct.DState** %2, align 8
  %2720 = getelementptr inbounds %struct.DState, %struct.DState* %2719, i32 0, i32 8
  %2721 = load i32, i32* %2720, align 4
  %2722 = icmp sge i32 %2721, 5
  br i1 %2722, label %2723, label %2738

; <label>:2723:                                   ; preds = %2718
  %2724 = load %struct.DState*, %struct.DState** %2, align 8
  %2725 = getelementptr inbounds %struct.DState, %struct.DState* %2724, i32 0, i32 7
  %2726 = load i32, i32* %2725, align 8
  %2727 = load %struct.DState*, %struct.DState** %2, align 8
  %2728 = getelementptr inbounds %struct.DState, %struct.DState* %2727, i32 0, i32 8
  %2729 = load i32, i32* %2728, align 4
  %2730 = sub nsw i32 %2729, 5
  %2731 = lshr i32 %2726, %2730
  %2732 = and i32 %2731, 31
  store i32 %2732, i32* %58, align 4
  %2733 = load %struct.DState*, %struct.DState** %2, align 8
  %2734 = getelementptr inbounds %struct.DState, %struct.DState* %2733, i32 0, i32 8
  %2735 = load i32, i32* %2734, align 4
  %2736 = sub nsw i32 %2735, 5
  store i32 %2736, i32* %2734, align 4
  %2737 = load i32, i32* %58, align 4
  store i32 %2737, i32* %22, align 4
  br label %2800

; <label>:2738:                                   ; preds = %2718
  %2739 = load %struct.DState*, %struct.DState** %2, align 8
  %2740 = getelementptr inbounds %struct.DState, %struct.DState* %2739, i32 0, i32 0
  %2741 = load %struct.bz_stream*, %struct.bz_stream** %2740, align 8
  %2742 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2741, i32 0, i32 1
  %2743 = load i32, i32* %2742, align 8
  %2744 = icmp eq i32 %2743, 0
  br i1 %2744, label %2745, label %2747

; <label>:2745:                                   ; preds = %2738
  %pgocount129 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 137)
  %2746 = add i64 %pgocount129, 1
  store i64 %2746, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 137)
  store i32 0, i32* %4, align 4
  br label %6029

; <label>:2747:                                   ; preds = %2738
  %pgocount130 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 24)
  %2748 = add i64 %pgocount130, 1
  store i64 %2748, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 24)
  %2749 = load %struct.DState*, %struct.DState** %2, align 8
  %2750 = getelementptr inbounds %struct.DState, %struct.DState* %2749, i32 0, i32 7
  %2751 = load i32, i32* %2750, align 8
  %2752 = shl i32 %2751, 8
  %2753 = load %struct.DState*, %struct.DState** %2, align 8
  %2754 = getelementptr inbounds %struct.DState, %struct.DState* %2753, i32 0, i32 0
  %2755 = load %struct.bz_stream*, %struct.bz_stream** %2754, align 8
  %2756 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2755, i32 0, i32 0
  %2757 = load i8*, i8** %2756, align 8
  %2758 = load i8, i8* %2757, align 1
  %2759 = zext i8 %2758 to i32
  %2760 = or i32 %2752, %2759
  %2761 = load %struct.DState*, %struct.DState** %2, align 8
  %2762 = getelementptr inbounds %struct.DState, %struct.DState* %2761, i32 0, i32 7
  store i32 %2760, i32* %2762, align 8
  %2763 = load %struct.DState*, %struct.DState** %2, align 8
  %2764 = getelementptr inbounds %struct.DState, %struct.DState* %2763, i32 0, i32 8
  %2765 = load i32, i32* %2764, align 4
  %2766 = add nsw i32 %2765, 8
  store i32 %2766, i32* %2764, align 4
  %2767 = load %struct.DState*, %struct.DState** %2, align 8
  %2768 = getelementptr inbounds %struct.DState, %struct.DState* %2767, i32 0, i32 0
  %2769 = load %struct.bz_stream*, %struct.bz_stream** %2768, align 8
  %2770 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2769, i32 0, i32 0
  %2771 = load i8*, i8** %2770, align 8
  %2772 = getelementptr inbounds i8, i8* %2771, i32 1
  store i8* %2772, i8** %2770, align 8
  %2773 = load %struct.DState*, %struct.DState** %2, align 8
  %2774 = getelementptr inbounds %struct.DState, %struct.DState* %2773, i32 0, i32 0
  %2775 = load %struct.bz_stream*, %struct.bz_stream** %2774, align 8
  %2776 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2775, i32 0, i32 1
  %2777 = load i32, i32* %2776, align 8
  %2778 = add i32 %2777, -1
  store i32 %2778, i32* %2776, align 8
  %2779 = load %struct.DState*, %struct.DState** %2, align 8
  %2780 = getelementptr inbounds %struct.DState, %struct.DState* %2779, i32 0, i32 0
  %2781 = load %struct.bz_stream*, %struct.bz_stream** %2780, align 8
  %2782 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2781, i32 0, i32 2
  %2783 = load i32, i32* %2782, align 4
  %2784 = add i32 %2783, 1
  store i32 %2784, i32* %2782, align 4
  %2785 = load %struct.DState*, %struct.DState** %2, align 8
  %2786 = getelementptr inbounds %struct.DState, %struct.DState* %2785, i32 0, i32 0
  %2787 = load %struct.bz_stream*, %struct.bz_stream** %2786, align 8
  %2788 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2787, i32 0, i32 2
  %2789 = load i32, i32* %2788, align 4
  %2790 = icmp eq i32 %2789, 0
  br i1 %2790, label %2791, label %2799

; <label>:2791:                                   ; preds = %2747
  %pgocount131 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 68)
  %2792 = add i64 %pgocount131, 1
  store i64 %2792, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 68)
  %2793 = load %struct.DState*, %struct.DState** %2, align 8
  %2794 = getelementptr inbounds %struct.DState, %struct.DState* %2793, i32 0, i32 0
  %2795 = load %struct.bz_stream*, %struct.bz_stream** %2794, align 8
  %2796 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2795, i32 0, i32 3
  %2797 = load i32, i32* %2796, align 8
  %2798 = add i32 %2797, 1
  store i32 %2798, i32* %2796, align 8
  br label %2799

; <label>:2799:                                   ; preds = %2791, %2747
  br label %2718

; <label>:2800:                                   ; preds = %2723
  store i32 0, i32* %8, align 4
  br label %2801

; <label>:2801:                                   ; preds = %3020, %2800
  %2802 = load i32, i32* %8, align 4
  %2803 = load i32, i32* %11, align 4
  %2804 = icmp slt i32 %2802, %2803
  br i1 %2804, label %2805, label %3024

; <label>:2805:                                   ; preds = %2801
  %pgocount132 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 135)
  %2806 = add i64 %pgocount132, 1
  store i64 %2806, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 135)
  br label %2807

; <label>:2807:                                   ; preds = %3008, %2805
  %2808 = load i32, i32* %22, align 4
  %2809 = icmp slt i32 %2808, 1
  br i1 %2809, label %2814, label %2810

; <label>:2810:                                   ; preds = %2807
  %pgocount133 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 99)
  %2811 = add i64 %pgocount133, 1
  store i64 %2811, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 99)
  %2812 = load i32, i32* %22, align 4
  %2813 = icmp sgt i32 %2812, 20
  br i1 %2813, label %2814, label %2815

; <label>:2814:                                   ; preds = %2810, %2807
  store i32 -4, i32* %4, align 4
  br label %6029

; <label>:2815:                                   ; preds = %2810
  %pgocount134 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 182)
  %2816 = add i64 %pgocount134, 1
  store i64 %2816, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 182)
  br label %2817

; <label>:2817:                                   ; preds = %2815, %145
  %2818 = load %struct.DState*, %struct.DState** %2, align 8
  %2819 = getelementptr inbounds %struct.DState, %struct.DState* %2818, i32 0, i32 1
  store i32 34, i32* %2819, align 8
  br label %2820

; <label>:2820:                                   ; preds = %2902, %2817
  %2821 = load %struct.DState*, %struct.DState** %2, align 8
  %2822 = getelementptr inbounds %struct.DState, %struct.DState* %2821, i32 0, i32 8
  %2823 = load i32, i32* %2822, align 4
  %2824 = icmp sge i32 %2823, 1
  br i1 %2824, label %2825, label %2841

; <label>:2825:                                   ; preds = %2820
  %2826 = load %struct.DState*, %struct.DState** %2, align 8
  %2827 = getelementptr inbounds %struct.DState, %struct.DState* %2826, i32 0, i32 7
  %2828 = load i32, i32* %2827, align 8
  %2829 = load %struct.DState*, %struct.DState** %2, align 8
  %2830 = getelementptr inbounds %struct.DState, %struct.DState* %2829, i32 0, i32 8
  %2831 = load i32, i32* %2830, align 4
  %2832 = sub nsw i32 %2831, 1
  %2833 = lshr i32 %2828, %2832
  %2834 = and i32 %2833, 1
  store i32 %2834, i32* %59, align 4
  %2835 = load %struct.DState*, %struct.DState** %2, align 8
  %2836 = getelementptr inbounds %struct.DState, %struct.DState* %2835, i32 0, i32 8
  %2837 = load i32, i32* %2836, align 4
  %2838 = sub nsw i32 %2837, 1
  store i32 %2838, i32* %2836, align 4
  %2839 = load i32, i32* %59, align 4
  %2840 = trunc i32 %2839 to i8
  store i8 %2840, i8* %3, align 1
  br label %2903

; <label>:2841:                                   ; preds = %2820
  %2842 = load %struct.DState*, %struct.DState** %2, align 8
  %2843 = getelementptr inbounds %struct.DState, %struct.DState* %2842, i32 0, i32 0
  %2844 = load %struct.bz_stream*, %struct.bz_stream** %2843, align 8
  %2845 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2844, i32 0, i32 1
  %2846 = load i32, i32* %2845, align 8
  %2847 = icmp eq i32 %2846, 0
  br i1 %2847, label %2848, label %2850

; <label>:2848:                                   ; preds = %2841
  %pgocount135 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 138)
  %2849 = add i64 %pgocount135, 1
  store i64 %2849, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 138)
  store i32 0, i32* %4, align 4
  br label %6029

; <label>:2850:                                   ; preds = %2841
  %pgocount136 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 25)
  %2851 = add i64 %pgocount136, 1
  store i64 %2851, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 25)
  %2852 = load %struct.DState*, %struct.DState** %2, align 8
  %2853 = getelementptr inbounds %struct.DState, %struct.DState* %2852, i32 0, i32 7
  %2854 = load i32, i32* %2853, align 8
  %2855 = shl i32 %2854, 8
  %2856 = load %struct.DState*, %struct.DState** %2, align 8
  %2857 = getelementptr inbounds %struct.DState, %struct.DState* %2856, i32 0, i32 0
  %2858 = load %struct.bz_stream*, %struct.bz_stream** %2857, align 8
  %2859 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2858, i32 0, i32 0
  %2860 = load i8*, i8** %2859, align 8
  %2861 = load i8, i8* %2860, align 1
  %2862 = zext i8 %2861 to i32
  %2863 = or i32 %2855, %2862
  %2864 = load %struct.DState*, %struct.DState** %2, align 8
  %2865 = getelementptr inbounds %struct.DState, %struct.DState* %2864, i32 0, i32 7
  store i32 %2863, i32* %2865, align 8
  %2866 = load %struct.DState*, %struct.DState** %2, align 8
  %2867 = getelementptr inbounds %struct.DState, %struct.DState* %2866, i32 0, i32 8
  %2868 = load i32, i32* %2867, align 4
  %2869 = add nsw i32 %2868, 8
  store i32 %2869, i32* %2867, align 4
  %2870 = load %struct.DState*, %struct.DState** %2, align 8
  %2871 = getelementptr inbounds %struct.DState, %struct.DState* %2870, i32 0, i32 0
  %2872 = load %struct.bz_stream*, %struct.bz_stream** %2871, align 8
  %2873 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2872, i32 0, i32 0
  %2874 = load i8*, i8** %2873, align 8
  %2875 = getelementptr inbounds i8, i8* %2874, i32 1
  store i8* %2875, i8** %2873, align 8
  %2876 = load %struct.DState*, %struct.DState** %2, align 8
  %2877 = getelementptr inbounds %struct.DState, %struct.DState* %2876, i32 0, i32 0
  %2878 = load %struct.bz_stream*, %struct.bz_stream** %2877, align 8
  %2879 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2878, i32 0, i32 1
  %2880 = load i32, i32* %2879, align 8
  %2881 = add i32 %2880, -1
  store i32 %2881, i32* %2879, align 8
  %2882 = load %struct.DState*, %struct.DState** %2, align 8
  %2883 = getelementptr inbounds %struct.DState, %struct.DState* %2882, i32 0, i32 0
  %2884 = load %struct.bz_stream*, %struct.bz_stream** %2883, align 8
  %2885 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2884, i32 0, i32 2
  %2886 = load i32, i32* %2885, align 4
  %2887 = add i32 %2886, 1
  store i32 %2887, i32* %2885, align 4
  %2888 = load %struct.DState*, %struct.DState** %2, align 8
  %2889 = getelementptr inbounds %struct.DState, %struct.DState* %2888, i32 0, i32 0
  %2890 = load %struct.bz_stream*, %struct.bz_stream** %2889, align 8
  %2891 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2890, i32 0, i32 2
  %2892 = load i32, i32* %2891, align 4
  %2893 = icmp eq i32 %2892, 0
  br i1 %2893, label %2894, label %2902

; <label>:2894:                                   ; preds = %2850
  %pgocount137 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 69)
  %2895 = add i64 %pgocount137, 1
  store i64 %2895, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 69)
  %2896 = load %struct.DState*, %struct.DState** %2, align 8
  %2897 = getelementptr inbounds %struct.DState, %struct.DState* %2896, i32 0, i32 0
  %2898 = load %struct.bz_stream*, %struct.bz_stream** %2897, align 8
  %2899 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2898, i32 0, i32 3
  %2900 = load i32, i32* %2899, align 8
  %2901 = add i32 %2900, 1
  store i32 %2901, i32* %2899, align 8
  br label %2902

; <label>:2902:                                   ; preds = %2894, %2850
  br label %2820

; <label>:2903:                                   ; preds = %2825
  %2904 = load i8, i8* %3, align 1
  %2905 = zext i8 %2904 to i32
  %2906 = icmp eq i32 %2905, 0
  br i1 %2906, label %2907, label %2908

; <label>:2907:                                   ; preds = %2903
  br label %3009

; <label>:2908:                                   ; preds = %2903
  %pgocount138 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 179)
  %2909 = add i64 %pgocount138, 1
  store i64 %2909, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 179)
  br label %2910

; <label>:2910:                                   ; preds = %2908, %145
  %2911 = load %struct.DState*, %struct.DState** %2, align 8
  %2912 = getelementptr inbounds %struct.DState, %struct.DState* %2911, i32 0, i32 1
  store i32 35, i32* %2912, align 8
  br label %2913

; <label>:2913:                                   ; preds = %2995, %2910
  %2914 = load %struct.DState*, %struct.DState** %2, align 8
  %2915 = getelementptr inbounds %struct.DState, %struct.DState* %2914, i32 0, i32 8
  %2916 = load i32, i32* %2915, align 4
  %2917 = icmp sge i32 %2916, 1
  br i1 %2917, label %2918, label %2934

; <label>:2918:                                   ; preds = %2913
  %2919 = load %struct.DState*, %struct.DState** %2, align 8
  %2920 = getelementptr inbounds %struct.DState, %struct.DState* %2919, i32 0, i32 7
  %2921 = load i32, i32* %2920, align 8
  %2922 = load %struct.DState*, %struct.DState** %2, align 8
  %2923 = getelementptr inbounds %struct.DState, %struct.DState* %2922, i32 0, i32 8
  %2924 = load i32, i32* %2923, align 4
  %2925 = sub nsw i32 %2924, 1
  %2926 = lshr i32 %2921, %2925
  %2927 = and i32 %2926, 1
  store i32 %2927, i32* %60, align 4
  %2928 = load %struct.DState*, %struct.DState** %2, align 8
  %2929 = getelementptr inbounds %struct.DState, %struct.DState* %2928, i32 0, i32 8
  %2930 = load i32, i32* %2929, align 4
  %2931 = sub nsw i32 %2930, 1
  store i32 %2931, i32* %2929, align 4
  %2932 = load i32, i32* %60, align 4
  %2933 = trunc i32 %2932 to i8
  store i8 %2933, i8* %3, align 1
  br label %2996

; <label>:2934:                                   ; preds = %2913
  %2935 = load %struct.DState*, %struct.DState** %2, align 8
  %2936 = getelementptr inbounds %struct.DState, %struct.DState* %2935, i32 0, i32 0
  %2937 = load %struct.bz_stream*, %struct.bz_stream** %2936, align 8
  %2938 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2937, i32 0, i32 1
  %2939 = load i32, i32* %2938, align 8
  %2940 = icmp eq i32 %2939, 0
  br i1 %2940, label %2941, label %2943

; <label>:2941:                                   ; preds = %2934
  %pgocount139 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 139)
  %2942 = add i64 %pgocount139, 1
  store i64 %2942, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 139)
  store i32 0, i32* %4, align 4
  br label %6029

; <label>:2943:                                   ; preds = %2934
  %pgocount140 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 26)
  %2944 = add i64 %pgocount140, 1
  store i64 %2944, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 26)
  %2945 = load %struct.DState*, %struct.DState** %2, align 8
  %2946 = getelementptr inbounds %struct.DState, %struct.DState* %2945, i32 0, i32 7
  %2947 = load i32, i32* %2946, align 8
  %2948 = shl i32 %2947, 8
  %2949 = load %struct.DState*, %struct.DState** %2, align 8
  %2950 = getelementptr inbounds %struct.DState, %struct.DState* %2949, i32 0, i32 0
  %2951 = load %struct.bz_stream*, %struct.bz_stream** %2950, align 8
  %2952 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2951, i32 0, i32 0
  %2953 = load i8*, i8** %2952, align 8
  %2954 = load i8, i8* %2953, align 1
  %2955 = zext i8 %2954 to i32
  %2956 = or i32 %2948, %2955
  %2957 = load %struct.DState*, %struct.DState** %2, align 8
  %2958 = getelementptr inbounds %struct.DState, %struct.DState* %2957, i32 0, i32 7
  store i32 %2956, i32* %2958, align 8
  %2959 = load %struct.DState*, %struct.DState** %2, align 8
  %2960 = getelementptr inbounds %struct.DState, %struct.DState* %2959, i32 0, i32 8
  %2961 = load i32, i32* %2960, align 4
  %2962 = add nsw i32 %2961, 8
  store i32 %2962, i32* %2960, align 4
  %2963 = load %struct.DState*, %struct.DState** %2, align 8
  %2964 = getelementptr inbounds %struct.DState, %struct.DState* %2963, i32 0, i32 0
  %2965 = load %struct.bz_stream*, %struct.bz_stream** %2964, align 8
  %2966 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2965, i32 0, i32 0
  %2967 = load i8*, i8** %2966, align 8
  %2968 = getelementptr inbounds i8, i8* %2967, i32 1
  store i8* %2968, i8** %2966, align 8
  %2969 = load %struct.DState*, %struct.DState** %2, align 8
  %2970 = getelementptr inbounds %struct.DState, %struct.DState* %2969, i32 0, i32 0
  %2971 = load %struct.bz_stream*, %struct.bz_stream** %2970, align 8
  %2972 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2971, i32 0, i32 1
  %2973 = load i32, i32* %2972, align 8
  %2974 = add i32 %2973, -1
  store i32 %2974, i32* %2972, align 8
  %2975 = load %struct.DState*, %struct.DState** %2, align 8
  %2976 = getelementptr inbounds %struct.DState, %struct.DState* %2975, i32 0, i32 0
  %2977 = load %struct.bz_stream*, %struct.bz_stream** %2976, align 8
  %2978 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2977, i32 0, i32 2
  %2979 = load i32, i32* %2978, align 4
  %2980 = add i32 %2979, 1
  store i32 %2980, i32* %2978, align 4
  %2981 = load %struct.DState*, %struct.DState** %2, align 8
  %2982 = getelementptr inbounds %struct.DState, %struct.DState* %2981, i32 0, i32 0
  %2983 = load %struct.bz_stream*, %struct.bz_stream** %2982, align 8
  %2984 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2983, i32 0, i32 2
  %2985 = load i32, i32* %2984, align 4
  %2986 = icmp eq i32 %2985, 0
  br i1 %2986, label %2987, label %2995

; <label>:2987:                                   ; preds = %2943
  %pgocount141 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 70)
  %2988 = add i64 %pgocount141, 1
  store i64 %2988, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 70)
  %2989 = load %struct.DState*, %struct.DState** %2, align 8
  %2990 = getelementptr inbounds %struct.DState, %struct.DState* %2989, i32 0, i32 0
  %2991 = load %struct.bz_stream*, %struct.bz_stream** %2990, align 8
  %2992 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %2991, i32 0, i32 3
  %2993 = load i32, i32* %2992, align 8
  %2994 = add i32 %2993, 1
  store i32 %2994, i32* %2992, align 8
  br label %2995

; <label>:2995:                                   ; preds = %2987, %2943
  br label %2913

; <label>:2996:                                   ; preds = %2918
  %2997 = load i8, i8* %3, align 1
  %2998 = zext i8 %2997 to i32
  %2999 = icmp eq i32 %2998, 0
  br i1 %2999, label %3000, label %3004

; <label>:3000:                                   ; preds = %2996
  %pgocount142 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 222)
  %3001 = add i64 %pgocount142, 1
  store i64 %3001, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 222)
  %3002 = load i32, i32* %22, align 4
  %3003 = add nsw i32 %3002, 1
  store i32 %3003, i32* %22, align 4
  br label %3008

; <label>:3004:                                   ; preds = %2996
  %pgocount143 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 180)
  %3005 = add i64 %pgocount143, 1
  store i64 %3005, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 180)
  %3006 = load i32, i32* %22, align 4
  %3007 = add nsw i32 %3006, -1
  store i32 %3007, i32* %22, align 4
  br label %3008

; <label>:3008:                                   ; preds = %3004, %3000
  br label %2807

; <label>:3009:                                   ; preds = %2907
  %3010 = load i32, i32* %22, align 4
  %3011 = trunc i32 %3010 to i8
  %3012 = load %struct.DState*, %struct.DState** %2, align 8
  %3013 = getelementptr inbounds %struct.DState, %struct.DState* %3012, i32 0, i32 35
  %3014 = load i32, i32* %10, align 4
  %3015 = sext i32 %3014 to i64
  %3016 = getelementptr inbounds [6 x [258 x i8]], [6 x [258 x i8]]* %3013, i64 0, i64 %3015
  %3017 = load i32, i32* %8, align 4
  %3018 = sext i32 %3017 to i64
  %3019 = getelementptr inbounds [258 x i8], [258 x i8]* %3016, i64 0, i64 %3018
  store i8 %3011, i8* %3019, align 1
  br label %3020

; <label>:3020:                                   ; preds = %3009
  %pgocount144 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 223)
  %3021 = add i64 %pgocount144, 1
  store i64 %3021, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 223)
  %3022 = load i32, i32* %8, align 4
  %3023 = add nsw i32 %3022, 1
  store i32 %3023, i32* %8, align 4
  br label %2801

; <label>:3024:                                   ; preds = %2801
  br label %3025

; <label>:3025:                                   ; preds = %3024
  %3026 = load i32, i32* %10, align 4
  %3027 = add nsw i32 %3026, 1
  store i32 %3027, i32* %10, align 4
  br label %2709

; <label>:3028:                                   ; preds = %2709
  store i32 0, i32* %10, align 4
  br label %3029

; <label>:3029:                                   ; preds = %3127, %3028
  %3030 = load i32, i32* %10, align 4
  %3031 = load i32, i32* %12, align 4
  %3032 = icmp slt i32 %3030, %3031
  br i1 %3032, label %3033, label %3131

; <label>:3033:                                   ; preds = %3029
  store i32 32, i32* %5, align 4
  store i32 0, i32* %6, align 4
  store i32 0, i32* %8, align 4
  br label %3034

; <label>:3034:                                   ; preds = %3089, %3033
  %3035 = load i32, i32* %8, align 4
  %3036 = load i32, i32* %11, align 4
  %3037 = icmp slt i32 %3035, %3036
  br i1 %3037, label %3038, label %3093

; <label>:3038:                                   ; preds = %3034
  %3039 = load %struct.DState*, %struct.DState** %2, align 8
  %3040 = getelementptr inbounds %struct.DState, %struct.DState* %3039, i32 0, i32 35
  %3041 = load i32, i32* %10, align 4
  %3042 = sext i32 %3041 to i64
  %3043 = getelementptr inbounds [6 x [258 x i8]], [6 x [258 x i8]]* %3040, i64 0, i64 %3042
  %3044 = load i32, i32* %8, align 4
  %3045 = sext i32 %3044 to i64
  %3046 = getelementptr inbounds [258 x i8], [258 x i8]* %3043, i64 0, i64 %3045
  %3047 = load i8, i8* %3046, align 1
  %3048 = zext i8 %3047 to i32
  %3049 = load i32, i32* %6, align 4
  %3050 = icmp sgt i32 %3048, %3049
  br i1 %3050, label %3051, label %3063

; <label>:3051:                                   ; preds = %3038
  %pgocount145 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 3)
  %3052 = add i64 %pgocount145, 1
  store i64 %3052, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 3)
  %3053 = load %struct.DState*, %struct.DState** %2, align 8
  %3054 = getelementptr inbounds %struct.DState, %struct.DState* %3053, i32 0, i32 35
  %3055 = load i32, i32* %10, align 4
  %3056 = sext i32 %3055 to i64
  %3057 = getelementptr inbounds [6 x [258 x i8]], [6 x [258 x i8]]* %3054, i64 0, i64 %3056
  %3058 = load i32, i32* %8, align 4
  %3059 = sext i32 %3058 to i64
  %3060 = getelementptr inbounds [258 x i8], [258 x i8]* %3057, i64 0, i64 %3059
  %3061 = load i8, i8* %3060, align 1
  %3062 = zext i8 %3061 to i32
  store i32 %3062, i32* %6, align 4
  br label %3063

; <label>:3063:                                   ; preds = %3051, %3038
  %3064 = load %struct.DState*, %struct.DState** %2, align 8
  %3065 = getelementptr inbounds %struct.DState, %struct.DState* %3064, i32 0, i32 35
  %3066 = load i32, i32* %10, align 4
  %3067 = sext i32 %3066 to i64
  %3068 = getelementptr inbounds [6 x [258 x i8]], [6 x [258 x i8]]* %3065, i64 0, i64 %3067
  %3069 = load i32, i32* %8, align 4
  %3070 = sext i32 %3069 to i64
  %3071 = getelementptr inbounds [258 x i8], [258 x i8]* %3068, i64 0, i64 %3070
  %3072 = load i8, i8* %3071, align 1
  %3073 = zext i8 %3072 to i32
  %3074 = load i32, i32* %5, align 4
  %3075 = icmp slt i32 %3073, %3074
  br i1 %3075, label %3076, label %3088

; <label>:3076:                                   ; preds = %3063
  %pgocount146 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 4)
  %3077 = add i64 %pgocount146, 1
  store i64 %3077, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 4)
  %3078 = load %struct.DState*, %struct.DState** %2, align 8
  %3079 = getelementptr inbounds %struct.DState, %struct.DState* %3078, i32 0, i32 35
  %3080 = load i32, i32* %10, align 4
  %3081 = sext i32 %3080 to i64
  %3082 = getelementptr inbounds [6 x [258 x i8]], [6 x [258 x i8]]* %3079, i64 0, i64 %3081
  %3083 = load i32, i32* %8, align 4
  %3084 = sext i32 %3083 to i64
  %3085 = getelementptr inbounds [258 x i8], [258 x i8]* %3082, i64 0, i64 %3084
  %3086 = load i8, i8* %3085, align 1
  %3087 = zext i8 %3086 to i32
  store i32 %3087, i32* %5, align 4
  br label %3088

; <label>:3088:                                   ; preds = %3076, %3063
  br label %3089

; <label>:3089:                                   ; preds = %3088
  %pgocount147 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 0)
  %3090 = add i64 %pgocount147, 1
  store i64 %3090, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 0)
  %3091 = load i32, i32* %8, align 4
  %3092 = add nsw i32 %3091, 1
  store i32 %3092, i32* %8, align 4
  br label %3034

; <label>:3093:                                   ; preds = %3034
  %3094 = load %struct.DState*, %struct.DState** %2, align 8
  %3095 = getelementptr inbounds %struct.DState, %struct.DState* %3094, i32 0, i32 36
  %3096 = load i32, i32* %10, align 4
  %3097 = sext i32 %3096 to i64
  %3098 = getelementptr inbounds [6 x [258 x i32]], [6 x [258 x i32]]* %3095, i64 0, i64 %3097
  %3099 = getelementptr inbounds [258 x i32], [258 x i32]* %3098, i64 0, i64 0
  %3100 = load %struct.DState*, %struct.DState** %2, align 8
  %3101 = getelementptr inbounds %struct.DState, %struct.DState* %3100, i32 0, i32 37
  %3102 = load i32, i32* %10, align 4
  %3103 = sext i32 %3102 to i64
  %3104 = getelementptr inbounds [6 x [258 x i32]], [6 x [258 x i32]]* %3101, i64 0, i64 %3103
  %3105 = getelementptr inbounds [258 x i32], [258 x i32]* %3104, i64 0, i64 0
  %3106 = load %struct.DState*, %struct.DState** %2, align 8
  %3107 = getelementptr inbounds %struct.DState, %struct.DState* %3106, i32 0, i32 38
  %3108 = load i32, i32* %10, align 4
  %3109 = sext i32 %3108 to i64
  %3110 = getelementptr inbounds [6 x [258 x i32]], [6 x [258 x i32]]* %3107, i64 0, i64 %3109
  %3111 = getelementptr inbounds [258 x i32], [258 x i32]* %3110, i64 0, i64 0
  %3112 = load %struct.DState*, %struct.DState** %2, align 8
  %3113 = getelementptr inbounds %struct.DState, %struct.DState* %3112, i32 0, i32 35
  %3114 = load i32, i32* %10, align 4
  %3115 = sext i32 %3114 to i64
  %3116 = getelementptr inbounds [6 x [258 x i8]], [6 x [258 x i8]]* %3113, i64 0, i64 %3115
  %3117 = getelementptr inbounds [258 x i8], [258 x i8]* %3116, i64 0, i64 0
  %3118 = load i32, i32* %5, align 4
  %3119 = load i32, i32* %6, align 4
  %3120 = load i32, i32* %11, align 4
  call void @BZ2_hbCreateDecodeTables(i32* %3099, i32* %3105, i32* %3111, i8* %3117, i32 %3118, i32 %3119, i32 %3120)
  %3121 = load i32, i32* %5, align 4
  %3122 = load %struct.DState*, %struct.DState** %2, align 8
  %3123 = getelementptr inbounds %struct.DState, %struct.DState* %3122, i32 0, i32 39
  %3124 = load i32, i32* %10, align 4
  %3125 = sext i32 %3124 to i64
  %3126 = getelementptr inbounds [6 x i32], [6 x i32]* %3123, i64 0, i64 %3125
  store i32 %3121, i32* %3126, align 4
  br label %3127

; <label>:3127:                                   ; preds = %3093
  %pgocount148 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 20)
  %3128 = add i64 %pgocount148, 1
  store i64 %3128, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 20)
  %3129 = load i32, i32* %10, align 4
  %3130 = add nsw i32 %3129, 1
  store i32 %3130, i32* %10, align 4
  br label %3029

; <label>:3131:                                   ; preds = %3029
  %3132 = load %struct.DState*, %struct.DState** %2, align 8
  %3133 = getelementptr inbounds %struct.DState, %struct.DState* %3132, i32 0, i32 27
  %3134 = load i32, i32* %3133, align 8
  %3135 = add nsw i32 %3134, 1
  store i32 %3135, i32* %14, align 4
  %3136 = load %struct.DState*, %struct.DState** %2, align 8
  %3137 = getelementptr inbounds %struct.DState, %struct.DState* %3136, i32 0, i32 9
  %3138 = load i32, i32* %3137, align 8
  %3139 = mul nsw i32 100000, %3138
  store i32 %3139, i32* %18, align 4
  store i32 -1, i32* %15, align 4
  store i32 0, i32* %16, align 4
  store i32 0, i32* %8, align 4
  br label %3140

; <label>:3140:                                   ; preds = %3149, %3131
  %3141 = load i32, i32* %8, align 4
  %3142 = icmp sle i32 %3141, 255
  br i1 %3142, label %3143, label %3153

; <label>:3143:                                   ; preds = %3140
  %3144 = load %struct.DState*, %struct.DState** %2, align 8
  %3145 = getelementptr inbounds %struct.DState, %struct.DState* %3144, i32 0, i32 16
  %3146 = load i32, i32* %8, align 4
  %3147 = sext i32 %3146 to i64
  %3148 = getelementptr inbounds [256 x i32], [256 x i32]* %3145, i64 0, i64 %3147
  store i32 0, i32* %3148, align 4
  br label %3149

; <label>:3149:                                   ; preds = %3143
  %pgocount149 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 21)
  %3150 = add i64 %pgocount149, 1
  store i64 %3150, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 21)
  %3151 = load i32, i32* %8, align 4
  %3152 = add nsw i32 %3151, 1
  store i32 %3152, i32* %8, align 4
  br label %3140

; <label>:3153:                                   ; preds = %3140
  store i32 4095, i32* %63, align 4
  store i32 15, i32* %61, align 4
  br label %3154

; <label>:3154:                                   ; preds = %3186, %3153
  %3155 = load i32, i32* %61, align 4
  %3156 = icmp sge i32 %3155, 0
  br i1 %3156, label %3157, label %3190

; <label>:3157:                                   ; preds = %3154
  store i32 15, i32* %62, align 4
  br label %3158

; <label>:3158:                                   ; preds = %3174, %3157
  %3159 = load i32, i32* %62, align 4
  %3160 = icmp sge i32 %3159, 0
  br i1 %3160, label %3161, label %3178

; <label>:3161:                                   ; preds = %3158
  %3162 = load i32, i32* %61, align 4
  %3163 = mul nsw i32 %3162, 16
  %3164 = load i32, i32* %62, align 4
  %3165 = add nsw i32 %3163, %3164
  %3166 = trunc i32 %3165 to i8
  %3167 = load %struct.DState*, %struct.DState** %2, align 8
  %3168 = getelementptr inbounds %struct.DState, %struct.DState* %3167, i32 0, i32 31
  %3169 = load i32, i32* %63, align 4
  %3170 = sext i32 %3169 to i64
  %3171 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3168, i64 0, i64 %3170
  store i8 %3166, i8* %3171, align 1
  %3172 = load i32, i32* %63, align 4
  %3173 = add nsw i32 %3172, -1
  store i32 %3173, i32* %63, align 4
  br label %3174

; <label>:3174:                                   ; preds = %3161
  %pgocount150 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 1)
  %3175 = add i64 %pgocount150, 1
  store i64 %3175, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 1)
  %3176 = load i32, i32* %62, align 4
  %3177 = add nsw i32 %3176, -1
  store i32 %3177, i32* %62, align 4
  br label %3158

; <label>:3178:                                   ; preds = %3158
  %3179 = load i32, i32* %63, align 4
  %3180 = add nsw i32 %3179, 1
  %3181 = load %struct.DState*, %struct.DState** %2, align 8
  %3182 = getelementptr inbounds %struct.DState, %struct.DState* %3181, i32 0, i32 32
  %3183 = load i32, i32* %61, align 4
  %3184 = sext i32 %3183 to i64
  %3185 = getelementptr inbounds [16 x i32], [16 x i32]* %3182, i64 0, i64 %3184
  store i32 %3180, i32* %3185, align 4
  br label %3186

; <label>:3186:                                   ; preds = %3178
  %pgocount151 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 22)
  %3187 = add i64 %pgocount151, 1
  store i64 %3187, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 22)
  %3188 = load i32, i32* %61, align 4
  %3189 = add nsw i32 %3188, -1
  store i32 %3189, i32* %61, align 4
  br label %3154

; <label>:3190:                                   ; preds = %3154
  store i32 0, i32* %19, align 4
  %3191 = load i32, i32* %16, align 4
  %3192 = icmp eq i32 %3191, 0
  br i1 %3192, label %3193, label %3234

; <label>:3193:                                   ; preds = %3190
  %3194 = load i32, i32* %15, align 4
  %3195 = add nsw i32 %3194, 1
  store i32 %3195, i32* %15, align 4
  %3196 = load i32, i32* %15, align 4
  %3197 = load i32, i32* %13, align 4
  %3198 = icmp sge i32 %3196, %3197
  br i1 %3198, label %3199, label %3201

; <label>:3199:                                   ; preds = %3193
  %pgocount152 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 248)
  %3200 = add i64 %pgocount152, 1
  store i64 %3200, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 248)
  store i32 -4, i32* %4, align 4
  br label %6029

; <label>:3201:                                   ; preds = %3193
  %pgocount153 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 249)
  %3202 = add i64 %pgocount153, 1
  store i64 %3202, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 249)
  store i32 50, i32* %16, align 4
  %3203 = load %struct.DState*, %struct.DState** %2, align 8
  %3204 = getelementptr inbounds %struct.DState, %struct.DState* %3203, i32 0, i32 33
  %3205 = load i32, i32* %15, align 4
  %3206 = sext i32 %3205 to i64
  %3207 = getelementptr inbounds [18002 x i8], [18002 x i8]* %3204, i64 0, i64 %3206
  %3208 = load i8, i8* %3207, align 1
  %3209 = zext i8 %3208 to i32
  store i32 %3209, i32* %27, align 4
  %3210 = load %struct.DState*, %struct.DState** %2, align 8
  %3211 = getelementptr inbounds %struct.DState, %struct.DState* %3210, i32 0, i32 39
  %3212 = load i32, i32* %27, align 4
  %3213 = sext i32 %3212 to i64
  %3214 = getelementptr inbounds [6 x i32], [6 x i32]* %3211, i64 0, i64 %3213
  %3215 = load i32, i32* %3214, align 4
  store i32 %3215, i32* %28, align 4
  %3216 = load %struct.DState*, %struct.DState** %2, align 8
  %3217 = getelementptr inbounds %struct.DState, %struct.DState* %3216, i32 0, i32 36
  %3218 = load i32, i32* %27, align 4
  %3219 = sext i32 %3218 to i64
  %3220 = getelementptr inbounds [6 x [258 x i32]], [6 x [258 x i32]]* %3217, i64 0, i64 %3219
  %3221 = getelementptr inbounds [258 x i32], [258 x i32]* %3220, i64 0, i64 0
  store i32* %3221, i32** %29, align 8
  %3222 = load %struct.DState*, %struct.DState** %2, align 8
  %3223 = getelementptr inbounds %struct.DState, %struct.DState* %3222, i32 0, i32 38
  %3224 = load i32, i32* %27, align 4
  %3225 = sext i32 %3224 to i64
  %3226 = getelementptr inbounds [6 x [258 x i32]], [6 x [258 x i32]]* %3223, i64 0, i64 %3225
  %3227 = getelementptr inbounds [258 x i32], [258 x i32]* %3226, i64 0, i64 0
  store i32* %3227, i32** %31, align 8
  %3228 = load %struct.DState*, %struct.DState** %2, align 8
  %3229 = getelementptr inbounds %struct.DState, %struct.DState* %3228, i32 0, i32 37
  %3230 = load i32, i32* %27, align 4
  %3231 = sext i32 %3230 to i64
  %3232 = getelementptr inbounds [6 x [258 x i32]], [6 x [258 x i32]]* %3229, i64 0, i64 %3231
  %3233 = getelementptr inbounds [258 x i32], [258 x i32]* %3232, i64 0, i64 0
  store i32* %3233, i32** %30, align 8
  br label %3234

; <label>:3234:                                   ; preds = %3201, %3190
  %pgocount154 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 161)
  %3235 = add i64 %pgocount154, 1
  store i64 %3235, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 161)
  %3236 = load i32, i32* %16, align 4
  %3237 = add nsw i32 %3236, -1
  store i32 %3237, i32* %16, align 4
  %3238 = load i32, i32* %28, align 4
  store i32 %3238, i32* %24, align 4
  br label %3239

; <label>:3239:                                   ; preds = %3234, %145
  %3240 = load %struct.DState*, %struct.DState** %2, align 8
  %3241 = getelementptr inbounds %struct.DState, %struct.DState* %3240, i32 0, i32 1
  store i32 36, i32* %3241, align 8
  br label %3242

; <label>:3242:                                   ; preds = %3328, %3239
  %3243 = load %struct.DState*, %struct.DState** %2, align 8
  %3244 = getelementptr inbounds %struct.DState, %struct.DState* %3243, i32 0, i32 8
  %3245 = load i32, i32* %3244, align 4
  %3246 = load i32, i32* %24, align 4
  %3247 = icmp sge i32 %3245, %3246
  br i1 %3247, label %3248, label %3268

; <label>:3248:                                   ; preds = %3242
  %3249 = load %struct.DState*, %struct.DState** %2, align 8
  %3250 = getelementptr inbounds %struct.DState, %struct.DState* %3249, i32 0, i32 7
  %3251 = load i32, i32* %3250, align 8
  %3252 = load %struct.DState*, %struct.DState** %2, align 8
  %3253 = getelementptr inbounds %struct.DState, %struct.DState* %3252, i32 0, i32 8
  %3254 = load i32, i32* %3253, align 4
  %3255 = load i32, i32* %24, align 4
  %3256 = sub nsw i32 %3254, %3255
  %3257 = lshr i32 %3251, %3256
  %3258 = load i32, i32* %24, align 4
  %3259 = shl i32 1, %3258
  %3260 = sub nsw i32 %3259, 1
  %3261 = and i32 %3257, %3260
  store i32 %3261, i32* %64, align 4
  %3262 = load i32, i32* %24, align 4
  %3263 = load %struct.DState*, %struct.DState** %2, align 8
  %3264 = getelementptr inbounds %struct.DState, %struct.DState* %3263, i32 0, i32 8
  %3265 = load i32, i32* %3264, align 4
  %3266 = sub nsw i32 %3265, %3262
  store i32 %3266, i32* %3264, align 4
  %3267 = load i32, i32* %64, align 4
  store i32 %3267, i32* %25, align 4
  br label %3330

; <label>:3268:                                   ; preds = %3242
  %3269 = load %struct.DState*, %struct.DState** %2, align 8
  %3270 = getelementptr inbounds %struct.DState, %struct.DState* %3269, i32 0, i32 0
  %3271 = load %struct.bz_stream*, %struct.bz_stream** %3270, align 8
  %3272 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3271, i32 0, i32 1
  %3273 = load i32, i32* %3272, align 8
  %3274 = icmp eq i32 %3273, 0
  br i1 %3274, label %3275, label %3277

; <label>:3275:                                   ; preds = %3268
  %pgocount155 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 128)
  %3276 = add i64 %pgocount155, 1
  store i64 %3276, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 128)
  store i32 0, i32* %4, align 4
  br label %6029

; <label>:3277:                                   ; preds = %3268
  %3278 = load %struct.DState*, %struct.DState** %2, align 8
  %3279 = getelementptr inbounds %struct.DState, %struct.DState* %3278, i32 0, i32 7
  %3280 = load i32, i32* %3279, align 8
  %3281 = shl i32 %3280, 8
  %3282 = load %struct.DState*, %struct.DState** %2, align 8
  %3283 = getelementptr inbounds %struct.DState, %struct.DState* %3282, i32 0, i32 0
  %3284 = load %struct.bz_stream*, %struct.bz_stream** %3283, align 8
  %3285 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3284, i32 0, i32 0
  %3286 = load i8*, i8** %3285, align 8
  %3287 = load i8, i8* %3286, align 1
  %3288 = zext i8 %3287 to i32
  %3289 = or i32 %3281, %3288
  %3290 = load %struct.DState*, %struct.DState** %2, align 8
  %3291 = getelementptr inbounds %struct.DState, %struct.DState* %3290, i32 0, i32 7
  store i32 %3289, i32* %3291, align 8
  %3292 = load %struct.DState*, %struct.DState** %2, align 8
  %3293 = getelementptr inbounds %struct.DState, %struct.DState* %3292, i32 0, i32 8
  %3294 = load i32, i32* %3293, align 4
  %3295 = add nsw i32 %3294, 8
  store i32 %3295, i32* %3293, align 4
  %3296 = load %struct.DState*, %struct.DState** %2, align 8
  %3297 = getelementptr inbounds %struct.DState, %struct.DState* %3296, i32 0, i32 0
  %3298 = load %struct.bz_stream*, %struct.bz_stream** %3297, align 8
  %3299 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3298, i32 0, i32 0
  %3300 = load i8*, i8** %3299, align 8
  %3301 = getelementptr inbounds i8, i8* %3300, i32 1
  store i8* %3301, i8** %3299, align 8
  %3302 = load %struct.DState*, %struct.DState** %2, align 8
  %3303 = getelementptr inbounds %struct.DState, %struct.DState* %3302, i32 0, i32 0
  %3304 = load %struct.bz_stream*, %struct.bz_stream** %3303, align 8
  %3305 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3304, i32 0, i32 1
  %3306 = load i32, i32* %3305, align 8
  %3307 = add i32 %3306, -1
  store i32 %3307, i32* %3305, align 8
  %3308 = load %struct.DState*, %struct.DState** %2, align 8
  %3309 = getelementptr inbounds %struct.DState, %struct.DState* %3308, i32 0, i32 0
  %3310 = load %struct.bz_stream*, %struct.bz_stream** %3309, align 8
  %3311 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3310, i32 0, i32 2
  %3312 = load i32, i32* %3311, align 4
  %3313 = add i32 %3312, 1
  store i32 %3313, i32* %3311, align 4
  %3314 = load %struct.DState*, %struct.DState** %2, align 8
  %3315 = getelementptr inbounds %struct.DState, %struct.DState* %3314, i32 0, i32 0
  %3316 = load %struct.bz_stream*, %struct.bz_stream** %3315, align 8
  %3317 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3316, i32 0, i32 2
  %3318 = load i32, i32* %3317, align 4
  %3319 = icmp eq i32 %3318, 0
  br i1 %3319, label %3320, label %3328

; <label>:3320:                                   ; preds = %3277
  %pgocount156 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 65)
  %3321 = add i64 %pgocount156, 1
  store i64 %3321, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 65)
  %3322 = load %struct.DState*, %struct.DState** %2, align 8
  %3323 = getelementptr inbounds %struct.DState, %struct.DState* %3322, i32 0, i32 0
  %3324 = load %struct.bz_stream*, %struct.bz_stream** %3323, align 8
  %3325 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3324, i32 0, i32 3
  %3326 = load i32, i32* %3325, align 8
  %3327 = add i32 %3326, 1
  store i32 %3327, i32* %3325, align 8
  br label %3328

; <label>:3328:                                   ; preds = %3320, %3277
  %pgocount157 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 16)
  %3329 = add i64 %pgocount157, 1
  store i64 %3329, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 16)
  br label %3242

; <label>:3330:                                   ; preds = %3248
  br label %3331

; <label>:3331:                                   ; preds = %3434, %3330
  %3332 = load i32, i32* %24, align 4
  %3333 = icmp sgt i32 %3332, 20
  br i1 %3333, label %3334, label %3336

; <label>:3334:                                   ; preds = %3331
  %pgocount158 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 131)
  %3335 = add i64 %pgocount158, 1
  store i64 %3335, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 131)
  store i32 -4, i32* %4, align 4
  br label %6029

; <label>:3336:                                   ; preds = %3331
  %3337 = load i32, i32* %25, align 4
  %3338 = load i32*, i32** %29, align 8
  %3339 = load i32, i32* %24, align 4
  %3340 = sext i32 %3339 to i64
  %3341 = getelementptr inbounds i32, i32* %3338, i64 %3340
  %3342 = load i32, i32* %3341, align 4
  %3343 = icmp sle i32 %3337, %3342
  br i1 %3343, label %3344, label %3345

; <label>:3344:                                   ; preds = %3336
  br label %3440

; <label>:3345:                                   ; preds = %3336
  %pgocount159 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 186)
  %3346 = add i64 %pgocount159, 1
  store i64 %3346, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 186)
  %3347 = load i32, i32* %24, align 4
  %3348 = add nsw i32 %3347, 1
  store i32 %3348, i32* %24, align 4
  br label %3349

; <label>:3349:                                   ; preds = %3345, %145
  %3350 = load %struct.DState*, %struct.DState** %2, align 8
  %3351 = getelementptr inbounds %struct.DState, %struct.DState* %3350, i32 0, i32 1
  store i32 37, i32* %3351, align 8
  br label %3352

; <label>:3352:                                   ; preds = %3433, %3349
  %3353 = load %struct.DState*, %struct.DState** %2, align 8
  %3354 = getelementptr inbounds %struct.DState, %struct.DState* %3353, i32 0, i32 8
  %3355 = load i32, i32* %3354, align 4
  %3356 = icmp sge i32 %3355, 1
  br i1 %3356, label %3357, label %3372

; <label>:3357:                                   ; preds = %3352
  %3358 = load %struct.DState*, %struct.DState** %2, align 8
  %3359 = getelementptr inbounds %struct.DState, %struct.DState* %3358, i32 0, i32 7
  %3360 = load i32, i32* %3359, align 8
  %3361 = load %struct.DState*, %struct.DState** %2, align 8
  %3362 = getelementptr inbounds %struct.DState, %struct.DState* %3361, i32 0, i32 8
  %3363 = load i32, i32* %3362, align 4
  %3364 = sub nsw i32 %3363, 1
  %3365 = lshr i32 %3360, %3364
  %3366 = and i32 %3365, 1
  store i32 %3366, i32* %65, align 4
  %3367 = load %struct.DState*, %struct.DState** %2, align 8
  %3368 = getelementptr inbounds %struct.DState, %struct.DState* %3367, i32 0, i32 8
  %3369 = load i32, i32* %3368, align 4
  %3370 = sub nsw i32 %3369, 1
  store i32 %3370, i32* %3368, align 4
  %3371 = load i32, i32* %65, align 4
  store i32 %3371, i32* %26, align 4
  br label %3434

; <label>:3372:                                   ; preds = %3352
  %3373 = load %struct.DState*, %struct.DState** %2, align 8
  %3374 = getelementptr inbounds %struct.DState, %struct.DState* %3373, i32 0, i32 0
  %3375 = load %struct.bz_stream*, %struct.bz_stream** %3374, align 8
  %3376 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3375, i32 0, i32 1
  %3377 = load i32, i32* %3376, align 8
  %3378 = icmp eq i32 %3377, 0
  br i1 %3378, label %3379, label %3381

; <label>:3379:                                   ; preds = %3372
  %pgocount160 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 132)
  %3380 = add i64 %pgocount160, 1
  store i64 %3380, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 132)
  store i32 0, i32* %4, align 4
  br label %6029

; <label>:3381:                                   ; preds = %3372
  %pgocount161 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 18)
  %3382 = add i64 %pgocount161, 1
  store i64 %3382, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 18)
  %3383 = load %struct.DState*, %struct.DState** %2, align 8
  %3384 = getelementptr inbounds %struct.DState, %struct.DState* %3383, i32 0, i32 7
  %3385 = load i32, i32* %3384, align 8
  %3386 = shl i32 %3385, 8
  %3387 = load %struct.DState*, %struct.DState** %2, align 8
  %3388 = getelementptr inbounds %struct.DState, %struct.DState* %3387, i32 0, i32 0
  %3389 = load %struct.bz_stream*, %struct.bz_stream** %3388, align 8
  %3390 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3389, i32 0, i32 0
  %3391 = load i8*, i8** %3390, align 8
  %3392 = load i8, i8* %3391, align 1
  %3393 = zext i8 %3392 to i32
  %3394 = or i32 %3386, %3393
  %3395 = load %struct.DState*, %struct.DState** %2, align 8
  %3396 = getelementptr inbounds %struct.DState, %struct.DState* %3395, i32 0, i32 7
  store i32 %3394, i32* %3396, align 8
  %3397 = load %struct.DState*, %struct.DState** %2, align 8
  %3398 = getelementptr inbounds %struct.DState, %struct.DState* %3397, i32 0, i32 8
  %3399 = load i32, i32* %3398, align 4
  %3400 = add nsw i32 %3399, 8
  store i32 %3400, i32* %3398, align 4
  %3401 = load %struct.DState*, %struct.DState** %2, align 8
  %3402 = getelementptr inbounds %struct.DState, %struct.DState* %3401, i32 0, i32 0
  %3403 = load %struct.bz_stream*, %struct.bz_stream** %3402, align 8
  %3404 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3403, i32 0, i32 0
  %3405 = load i8*, i8** %3404, align 8
  %3406 = getelementptr inbounds i8, i8* %3405, i32 1
  store i8* %3406, i8** %3404, align 8
  %3407 = load %struct.DState*, %struct.DState** %2, align 8
  %3408 = getelementptr inbounds %struct.DState, %struct.DState* %3407, i32 0, i32 0
  %3409 = load %struct.bz_stream*, %struct.bz_stream** %3408, align 8
  %3410 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3409, i32 0, i32 1
  %3411 = load i32, i32* %3410, align 8
  %3412 = add i32 %3411, -1
  store i32 %3412, i32* %3410, align 8
  %3413 = load %struct.DState*, %struct.DState** %2, align 8
  %3414 = getelementptr inbounds %struct.DState, %struct.DState* %3413, i32 0, i32 0
  %3415 = load %struct.bz_stream*, %struct.bz_stream** %3414, align 8
  %3416 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3415, i32 0, i32 2
  %3417 = load i32, i32* %3416, align 4
  %3418 = add i32 %3417, 1
  store i32 %3418, i32* %3416, align 4
  %3419 = load %struct.DState*, %struct.DState** %2, align 8
  %3420 = getelementptr inbounds %struct.DState, %struct.DState* %3419, i32 0, i32 0
  %3421 = load %struct.bz_stream*, %struct.bz_stream** %3420, align 8
  %3422 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3421, i32 0, i32 2
  %3423 = load i32, i32* %3422, align 4
  %3424 = icmp eq i32 %3423, 0
  br i1 %3424, label %3425, label %3433

; <label>:3425:                                   ; preds = %3381
  %pgocount162 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 67)
  %3426 = add i64 %pgocount162, 1
  store i64 %3426, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 67)
  %3427 = load %struct.DState*, %struct.DState** %2, align 8
  %3428 = getelementptr inbounds %struct.DState, %struct.DState* %3427, i32 0, i32 0
  %3429 = load %struct.bz_stream*, %struct.bz_stream** %3428, align 8
  %3430 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3429, i32 0, i32 3
  %3431 = load i32, i32* %3430, align 8
  %3432 = add i32 %3431, 1
  store i32 %3432, i32* %3430, align 8
  br label %3433

; <label>:3433:                                   ; preds = %3425, %3381
  br label %3352

; <label>:3434:                                   ; preds = %3357
  %pgocount163 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 130)
  %3435 = add i64 %pgocount163, 1
  store i64 %3435, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 130)
  %3436 = load i32, i32* %25, align 4
  %3437 = shl i32 %3436, 1
  %3438 = load i32, i32* %26, align 4
  %3439 = or i32 %3437, %3438
  store i32 %3439, i32* %25, align 4
  br label %3331

; <label>:3440:                                   ; preds = %3344
  %3441 = load i32, i32* %25, align 4
  %3442 = load i32*, i32** %30, align 8
  %3443 = load i32, i32* %24, align 4
  %3444 = sext i32 %3443 to i64
  %3445 = getelementptr inbounds i32, i32* %3442, i64 %3444
  %3446 = load i32, i32* %3445, align 4
  %3447 = sub nsw i32 %3441, %3446
  %3448 = icmp slt i32 %3447, 0
  br i1 %3448, label %3459, label %3449

; <label>:3449:                                   ; preds = %3440
  %pgocount164 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 231)
  %3450 = add i64 %pgocount164, 1
  store i64 %3450, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 231)
  %3451 = load i32, i32* %25, align 4
  %3452 = load i32*, i32** %30, align 8
  %3453 = load i32, i32* %24, align 4
  %3454 = sext i32 %3453 to i64
  %3455 = getelementptr inbounds i32, i32* %3452, i64 %3454
  %3456 = load i32, i32* %3455, align 4
  %3457 = sub nsw i32 %3451, %3456
  %3458 = icmp sge i32 %3457, 258
  br i1 %3458, label %3459, label %3461

; <label>:3459:                                   ; preds = %3449, %3440
  %pgocount165 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 228)
  %3460 = add i64 %pgocount165, 1
  store i64 %3460, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 228)
  store i32 -4, i32* %4, align 4
  br label %6029

; <label>:3461:                                   ; preds = %3449
  %3462 = load i32*, i32** %31, align 8
  %3463 = load i32, i32* %25, align 4
  %3464 = load i32*, i32** %30, align 8
  %3465 = load i32, i32* %24, align 4
  %3466 = sext i32 %3465 to i64
  %3467 = getelementptr inbounds i32, i32* %3464, i64 %3466
  %3468 = load i32, i32* %3467, align 4
  %3469 = sub nsw i32 %3463, %3468
  %3470 = sext i32 %3469 to i64
  %3471 = getelementptr inbounds i32, i32* %3462, i64 %3470
  %3472 = load i32, i32* %3471, align 4
  store i32 %3472, i32* %17, align 4
  br label %3473

; <label>:3473:                                   ; preds = %4477, %3882, %3461
  %3474 = load i32, i32* %17, align 4
  %3475 = load i32, i32* %14, align 4
  %3476 = icmp eq i32 %3474, %3475
  br i1 %3476, label %3477, label %3479

; <label>:3477:                                   ; preds = %3473
  %pgocount166 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 251)
  %3478 = add i64 %pgocount166, 1
  store i64 %3478, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 251)
  br label %4490

; <label>:3479:                                   ; preds = %3473
  %pgocount167 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 252)
  %3480 = add i64 %pgocount167, 1
  store i64 %3480, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 252)
  %3481 = load i32, i32* %17, align 4
  %3482 = icmp eq i32 %3481, 0
  br i1 %3482, label %3487, label %3483

; <label>:3483:                                   ; preds = %3479
  %pgocount168 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 215)
  %3484 = add i64 %pgocount168, 1
  store i64 %3484, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 215)
  %3485 = load i32, i32* %17, align 4
  %3486 = icmp eq i32 %3485, 1
  br i1 %3486, label %3487, label %3883

; <label>:3487:                                   ; preds = %3483, %3479
  store i32 -1, i32* %20, align 4
  store i32 1, i32* %21, align 4
  br label %3488

; <label>:3488:                                   ; preds = %3799, %3487
  %3489 = load i32, i32* %17, align 4
  %3490 = icmp eq i32 %3489, 0
  br i1 %3490, label %3491, label %3497

; <label>:3491:                                   ; preds = %3488
  %pgocount169 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 218)
  %3492 = add i64 %pgocount169, 1
  store i64 %3492, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 218)
  %3493 = load i32, i32* %20, align 4
  %3494 = load i32, i32* %21, align 4
  %3495 = mul nsw i32 1, %3494
  %3496 = add nsw i32 %3493, %3495
  store i32 %3496, i32* %20, align 4
  br label %3507

; <label>:3497:                                   ; preds = %3488
  %3498 = load i32, i32* %17, align 4
  %3499 = icmp eq i32 %3498, 1
  br i1 %3499, label %3500, label %3506

; <label>:3500:                                   ; preds = %3497
  %pgocount170 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 216)
  %3501 = add i64 %pgocount170, 1
  store i64 %3501, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 216)
  %3502 = load i32, i32* %20, align 4
  %3503 = load i32, i32* %21, align 4
  %3504 = mul nsw i32 2, %3503
  %3505 = add nsw i32 %3502, %3504
  store i32 %3505, i32* %20, align 4
  br label %3506

; <label>:3506:                                   ; preds = %3500, %3497
  br label %3507

; <label>:3507:                                   ; preds = %3506, %3491
  %3508 = load i32, i32* %21, align 4
  %3509 = mul nsw i32 %3508, 2
  store i32 %3509, i32* %21, align 4
  %3510 = load i32, i32* %16, align 4
  %3511 = icmp eq i32 %3510, 0
  br i1 %3511, label %3512, label %3553

; <label>:3512:                                   ; preds = %3507
  %3513 = load i32, i32* %15, align 4
  %3514 = add nsw i32 %3513, 1
  store i32 %3514, i32* %15, align 4
  %3515 = load i32, i32* %15, align 4
  %3516 = load i32, i32* %13, align 4
  %3517 = icmp sge i32 %3515, %3516
  br i1 %3517, label %3518, label %3520

; <label>:3518:                                   ; preds = %3512
  %pgocount171 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 236)
  %3519 = add i64 %pgocount171, 1
  store i64 %3519, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 236)
  store i32 -4, i32* %4, align 4
  br label %6029

; <label>:3520:                                   ; preds = %3512
  %pgocount172 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 237)
  %3521 = add i64 %pgocount172, 1
  store i64 %3521, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 237)
  store i32 50, i32* %16, align 4
  %3522 = load %struct.DState*, %struct.DState** %2, align 8
  %3523 = getelementptr inbounds %struct.DState, %struct.DState* %3522, i32 0, i32 33
  %3524 = load i32, i32* %15, align 4
  %3525 = sext i32 %3524 to i64
  %3526 = getelementptr inbounds [18002 x i8], [18002 x i8]* %3523, i64 0, i64 %3525
  %3527 = load i8, i8* %3526, align 1
  %3528 = zext i8 %3527 to i32
  store i32 %3528, i32* %27, align 4
  %3529 = load %struct.DState*, %struct.DState** %2, align 8
  %3530 = getelementptr inbounds %struct.DState, %struct.DState* %3529, i32 0, i32 39
  %3531 = load i32, i32* %27, align 4
  %3532 = sext i32 %3531 to i64
  %3533 = getelementptr inbounds [6 x i32], [6 x i32]* %3530, i64 0, i64 %3532
  %3534 = load i32, i32* %3533, align 4
  store i32 %3534, i32* %28, align 4
  %3535 = load %struct.DState*, %struct.DState** %2, align 8
  %3536 = getelementptr inbounds %struct.DState, %struct.DState* %3535, i32 0, i32 36
  %3537 = load i32, i32* %27, align 4
  %3538 = sext i32 %3537 to i64
  %3539 = getelementptr inbounds [6 x [258 x i32]], [6 x [258 x i32]]* %3536, i64 0, i64 %3538
  %3540 = getelementptr inbounds [258 x i32], [258 x i32]* %3539, i64 0, i64 0
  store i32* %3540, i32** %29, align 8
  %3541 = load %struct.DState*, %struct.DState** %2, align 8
  %3542 = getelementptr inbounds %struct.DState, %struct.DState* %3541, i32 0, i32 38
  %3543 = load i32, i32* %27, align 4
  %3544 = sext i32 %3543 to i64
  %3545 = getelementptr inbounds [6 x [258 x i32]], [6 x [258 x i32]]* %3542, i64 0, i64 %3544
  %3546 = getelementptr inbounds [258 x i32], [258 x i32]* %3545, i64 0, i64 0
  store i32* %3546, i32** %31, align 8
  %3547 = load %struct.DState*, %struct.DState** %2, align 8
  %3548 = getelementptr inbounds %struct.DState, %struct.DState* %3547, i32 0, i32 37
  %3549 = load i32, i32* %27, align 4
  %3550 = sext i32 %3549 to i64
  %3551 = getelementptr inbounds [6 x [258 x i32]], [6 x [258 x i32]]* %3548, i64 0, i64 %3550
  %3552 = getelementptr inbounds [258 x i32], [258 x i32]* %3551, i64 0, i64 0
  store i32* %3552, i32** %30, align 8
  br label %3553

; <label>:3553:                                   ; preds = %3520, %3507
  %3554 = load i32, i32* %16, align 4
  %3555 = add nsw i32 %3554, -1
  store i32 %3555, i32* %16, align 4
  %3556 = load i32, i32* %28, align 4
  store i32 %3556, i32* %24, align 4
  br label %3557

; <label>:3557:                                   ; preds = %3553, %145
  %3558 = load %struct.DState*, %struct.DState** %2, align 8
  %3559 = getelementptr inbounds %struct.DState, %struct.DState* %3558, i32 0, i32 1
  store i32 38, i32* %3559, align 8
  br label %3560

; <label>:3560:                                   ; preds = %3646, %3557
  %3561 = load %struct.DState*, %struct.DState** %2, align 8
  %3562 = getelementptr inbounds %struct.DState, %struct.DState* %3561, i32 0, i32 8
  %3563 = load i32, i32* %3562, align 4
  %3564 = load i32, i32* %24, align 4
  %3565 = icmp sge i32 %3563, %3564
  br i1 %3565, label %3566, label %3586

; <label>:3566:                                   ; preds = %3560
  %3567 = load %struct.DState*, %struct.DState** %2, align 8
  %3568 = getelementptr inbounds %struct.DState, %struct.DState* %3567, i32 0, i32 7
  %3569 = load i32, i32* %3568, align 8
  %3570 = load %struct.DState*, %struct.DState** %2, align 8
  %3571 = getelementptr inbounds %struct.DState, %struct.DState* %3570, i32 0, i32 8
  %3572 = load i32, i32* %3571, align 4
  %3573 = load i32, i32* %24, align 4
  %3574 = sub nsw i32 %3572, %3573
  %3575 = lshr i32 %3569, %3574
  %3576 = load i32, i32* %24, align 4
  %3577 = shl i32 1, %3576
  %3578 = sub nsw i32 %3577, 1
  %3579 = and i32 %3575, %3578
  store i32 %3579, i32* %66, align 4
  %3580 = load i32, i32* %24, align 4
  %3581 = load %struct.DState*, %struct.DState** %2, align 8
  %3582 = getelementptr inbounds %struct.DState, %struct.DState* %3581, i32 0, i32 8
  %3583 = load i32, i32* %3582, align 4
  %3584 = sub nsw i32 %3583, %3580
  store i32 %3584, i32* %3582, align 4
  %3585 = load i32, i32* %66, align 4
  store i32 %3585, i32* %25, align 4
  br label %3648

; <label>:3586:                                   ; preds = %3560
  %3587 = load %struct.DState*, %struct.DState** %2, align 8
  %3588 = getelementptr inbounds %struct.DState, %struct.DState* %3587, i32 0, i32 0
  %3589 = load %struct.bz_stream*, %struct.bz_stream** %3588, align 8
  %3590 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3589, i32 0, i32 1
  %3591 = load i32, i32* %3590, align 8
  %3592 = icmp eq i32 %3591, 0
  br i1 %3592, label %3593, label %3595

; <label>:3593:                                   ; preds = %3586
  %pgocount173 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 174)
  %3594 = add i64 %pgocount173, 1
  store i64 %3594, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 174)
  store i32 0, i32* %4, align 4
  br label %6029

; <label>:3595:                                   ; preds = %3586
  %3596 = load %struct.DState*, %struct.DState** %2, align 8
  %3597 = getelementptr inbounds %struct.DState, %struct.DState* %3596, i32 0, i32 7
  %3598 = load i32, i32* %3597, align 8
  %3599 = shl i32 %3598, 8
  %3600 = load %struct.DState*, %struct.DState** %2, align 8
  %3601 = getelementptr inbounds %struct.DState, %struct.DState* %3600, i32 0, i32 0
  %3602 = load %struct.bz_stream*, %struct.bz_stream** %3601, align 8
  %3603 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3602, i32 0, i32 0
  %3604 = load i8*, i8** %3603, align 8
  %3605 = load i8, i8* %3604, align 1
  %3606 = zext i8 %3605 to i32
  %3607 = or i32 %3599, %3606
  %3608 = load %struct.DState*, %struct.DState** %2, align 8
  %3609 = getelementptr inbounds %struct.DState, %struct.DState* %3608, i32 0, i32 7
  store i32 %3607, i32* %3609, align 8
  %3610 = load %struct.DState*, %struct.DState** %2, align 8
  %3611 = getelementptr inbounds %struct.DState, %struct.DState* %3610, i32 0, i32 8
  %3612 = load i32, i32* %3611, align 4
  %3613 = add nsw i32 %3612, 8
  store i32 %3613, i32* %3611, align 4
  %3614 = load %struct.DState*, %struct.DState** %2, align 8
  %3615 = getelementptr inbounds %struct.DState, %struct.DState* %3614, i32 0, i32 0
  %3616 = load %struct.bz_stream*, %struct.bz_stream** %3615, align 8
  %3617 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3616, i32 0, i32 0
  %3618 = load i8*, i8** %3617, align 8
  %3619 = getelementptr inbounds i8, i8* %3618, i32 1
  store i8* %3619, i8** %3617, align 8
  %3620 = load %struct.DState*, %struct.DState** %2, align 8
  %3621 = getelementptr inbounds %struct.DState, %struct.DState* %3620, i32 0, i32 0
  %3622 = load %struct.bz_stream*, %struct.bz_stream** %3621, align 8
  %3623 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3622, i32 0, i32 1
  %3624 = load i32, i32* %3623, align 8
  %3625 = add i32 %3624, -1
  store i32 %3625, i32* %3623, align 8
  %3626 = load %struct.DState*, %struct.DState** %2, align 8
  %3627 = getelementptr inbounds %struct.DState, %struct.DState* %3626, i32 0, i32 0
  %3628 = load %struct.bz_stream*, %struct.bz_stream** %3627, align 8
  %3629 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3628, i32 0, i32 2
  %3630 = load i32, i32* %3629, align 4
  %3631 = add i32 %3630, 1
  store i32 %3631, i32* %3629, align 4
  %3632 = load %struct.DState*, %struct.DState** %2, align 8
  %3633 = getelementptr inbounds %struct.DState, %struct.DState* %3632, i32 0, i32 0
  %3634 = load %struct.bz_stream*, %struct.bz_stream** %3633, align 8
  %3635 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3634, i32 0, i32 2
  %3636 = load i32, i32* %3635, align 4
  %3637 = icmp eq i32 %3636, 0
  br i1 %3637, label %3638, label %3646

; <label>:3638:                                   ; preds = %3595
  %pgocount174 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 90)
  %3639 = add i64 %pgocount174, 1
  store i64 %3639, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 90)
  %3640 = load %struct.DState*, %struct.DState** %2, align 8
  %3641 = getelementptr inbounds %struct.DState, %struct.DState* %3640, i32 0, i32 0
  %3642 = load %struct.bz_stream*, %struct.bz_stream** %3641, align 8
  %3643 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3642, i32 0, i32 3
  %3644 = load i32, i32* %3643, align 8
  %3645 = add i32 %3644, 1
  store i32 %3645, i32* %3643, align 8
  br label %3646

; <label>:3646:                                   ; preds = %3638, %3595
  %pgocount175 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 48)
  %3647 = add i64 %pgocount175, 1
  store i64 %3647, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 48)
  br label %3560

; <label>:3648:                                   ; preds = %3566
  br label %3649

; <label>:3649:                                   ; preds = %3752, %3648
  %3650 = load i32, i32* %24, align 4
  %3651 = icmp sgt i32 %3650, 20
  br i1 %3651, label %3652, label %3654

; <label>:3652:                                   ; preds = %3649
  %pgocount176 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 171)
  %3653 = add i64 %pgocount176, 1
  store i64 %3653, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 171)
  store i32 -4, i32* %4, align 4
  br label %6029

; <label>:3654:                                   ; preds = %3649
  %3655 = load i32, i32* %25, align 4
  %3656 = load i32*, i32** %29, align 8
  %3657 = load i32, i32* %24, align 4
  %3658 = sext i32 %3657 to i64
  %3659 = getelementptr inbounds i32, i32* %3656, i64 %3658
  %3660 = load i32, i32* %3659, align 4
  %3661 = icmp sle i32 %3655, %3660
  br i1 %3661, label %3662, label %3663

; <label>:3662:                                   ; preds = %3654
  br label %3758

; <label>:3663:                                   ; preds = %3654
  %pgocount177 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 226)
  %3664 = add i64 %pgocount177, 1
  store i64 %3664, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 226)
  %3665 = load i32, i32* %24, align 4
  %3666 = add nsw i32 %3665, 1
  store i32 %3666, i32* %24, align 4
  br label %3667

; <label>:3667:                                   ; preds = %3663, %145
  %3668 = load %struct.DState*, %struct.DState** %2, align 8
  %3669 = getelementptr inbounds %struct.DState, %struct.DState* %3668, i32 0, i32 1
  store i32 39, i32* %3669, align 8
  br label %3670

; <label>:3670:                                   ; preds = %3750, %3667
  %3671 = load %struct.DState*, %struct.DState** %2, align 8
  %3672 = getelementptr inbounds %struct.DState, %struct.DState* %3671, i32 0, i32 8
  %3673 = load i32, i32* %3672, align 4
  %3674 = icmp sge i32 %3673, 1
  br i1 %3674, label %3675, label %3690

; <label>:3675:                                   ; preds = %3670
  %3676 = load %struct.DState*, %struct.DState** %2, align 8
  %3677 = getelementptr inbounds %struct.DState, %struct.DState* %3676, i32 0, i32 7
  %3678 = load i32, i32* %3677, align 8
  %3679 = load %struct.DState*, %struct.DState** %2, align 8
  %3680 = getelementptr inbounds %struct.DState, %struct.DState* %3679, i32 0, i32 8
  %3681 = load i32, i32* %3680, align 4
  %3682 = sub nsw i32 %3681, 1
  %3683 = lshr i32 %3678, %3682
  %3684 = and i32 %3683, 1
  store i32 %3684, i32* %67, align 4
  %3685 = load %struct.DState*, %struct.DState** %2, align 8
  %3686 = getelementptr inbounds %struct.DState, %struct.DState* %3685, i32 0, i32 8
  %3687 = load i32, i32* %3686, align 4
  %3688 = sub nsw i32 %3687, 1
  store i32 %3688, i32* %3686, align 4
  %3689 = load i32, i32* %67, align 4
  store i32 %3689, i32* %26, align 4
  br label %3752

; <label>:3690:                                   ; preds = %3670
  %3691 = load %struct.DState*, %struct.DState** %2, align 8
  %3692 = getelementptr inbounds %struct.DState, %struct.DState* %3691, i32 0, i32 0
  %3693 = load %struct.bz_stream*, %struct.bz_stream** %3692, align 8
  %3694 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3693, i32 0, i32 1
  %3695 = load i32, i32* %3694, align 8
  %3696 = icmp eq i32 %3695, 0
  br i1 %3696, label %3697, label %3699

; <label>:3697:                                   ; preds = %3690
  %pgocount178 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 175)
  %3698 = add i64 %pgocount178, 1
  store i64 %3698, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 175)
  store i32 0, i32* %4, align 4
  br label %6029

; <label>:3699:                                   ; preds = %3690
  %3700 = load %struct.DState*, %struct.DState** %2, align 8
  %3701 = getelementptr inbounds %struct.DState, %struct.DState* %3700, i32 0, i32 7
  %3702 = load i32, i32* %3701, align 8
  %3703 = shl i32 %3702, 8
  %3704 = load %struct.DState*, %struct.DState** %2, align 8
  %3705 = getelementptr inbounds %struct.DState, %struct.DState* %3704, i32 0, i32 0
  %3706 = load %struct.bz_stream*, %struct.bz_stream** %3705, align 8
  %3707 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3706, i32 0, i32 0
  %3708 = load i8*, i8** %3707, align 8
  %3709 = load i8, i8* %3708, align 1
  %3710 = zext i8 %3709 to i32
  %3711 = or i32 %3703, %3710
  %3712 = load %struct.DState*, %struct.DState** %2, align 8
  %3713 = getelementptr inbounds %struct.DState, %struct.DState* %3712, i32 0, i32 7
  store i32 %3711, i32* %3713, align 8
  %3714 = load %struct.DState*, %struct.DState** %2, align 8
  %3715 = getelementptr inbounds %struct.DState, %struct.DState* %3714, i32 0, i32 8
  %3716 = load i32, i32* %3715, align 4
  %3717 = add nsw i32 %3716, 8
  store i32 %3717, i32* %3715, align 4
  %3718 = load %struct.DState*, %struct.DState** %2, align 8
  %3719 = getelementptr inbounds %struct.DState, %struct.DState* %3718, i32 0, i32 0
  %3720 = load %struct.bz_stream*, %struct.bz_stream** %3719, align 8
  %3721 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3720, i32 0, i32 0
  %3722 = load i8*, i8** %3721, align 8
  %3723 = getelementptr inbounds i8, i8* %3722, i32 1
  store i8* %3723, i8** %3721, align 8
  %3724 = load %struct.DState*, %struct.DState** %2, align 8
  %3725 = getelementptr inbounds %struct.DState, %struct.DState* %3724, i32 0, i32 0
  %3726 = load %struct.bz_stream*, %struct.bz_stream** %3725, align 8
  %3727 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3726, i32 0, i32 1
  %3728 = load i32, i32* %3727, align 8
  %3729 = add i32 %3728, -1
  store i32 %3729, i32* %3727, align 8
  %3730 = load %struct.DState*, %struct.DState** %2, align 8
  %3731 = getelementptr inbounds %struct.DState, %struct.DState* %3730, i32 0, i32 0
  %3732 = load %struct.bz_stream*, %struct.bz_stream** %3731, align 8
  %3733 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3732, i32 0, i32 2
  %3734 = load i32, i32* %3733, align 4
  %3735 = add i32 %3734, 1
  store i32 %3735, i32* %3733, align 4
  %3736 = load %struct.DState*, %struct.DState** %2, align 8
  %3737 = getelementptr inbounds %struct.DState, %struct.DState* %3736, i32 0, i32 0
  %3738 = load %struct.bz_stream*, %struct.bz_stream** %3737, align 8
  %3739 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3738, i32 0, i32 2
  %3740 = load i32, i32* %3739, align 4
  %3741 = icmp eq i32 %3740, 0
  br i1 %3741, label %3742, label %3750

; <label>:3742:                                   ; preds = %3699
  %pgocount179 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 91)
  %3743 = add i64 %pgocount179, 1
  store i64 %3743, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 91)
  %3744 = load %struct.DState*, %struct.DState** %2, align 8
  %3745 = getelementptr inbounds %struct.DState, %struct.DState* %3744, i32 0, i32 0
  %3746 = load %struct.bz_stream*, %struct.bz_stream** %3745, align 8
  %3747 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %3746, i32 0, i32 3
  %3748 = load i32, i32* %3747, align 8
  %3749 = add i32 %3748, 1
  store i32 %3749, i32* %3747, align 8
  br label %3750

; <label>:3750:                                   ; preds = %3742, %3699
  %pgocount180 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 49)
  %3751 = add i64 %pgocount180, 1
  store i64 %3751, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 49)
  br label %3670

; <label>:3752:                                   ; preds = %3675
  %pgocount181 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 170)
  %3753 = add i64 %pgocount181, 1
  store i64 %3753, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 170)
  %3754 = load i32, i32* %25, align 4
  %3755 = shl i32 %3754, 1
  %3756 = load i32, i32* %26, align 4
  %3757 = or i32 %3755, %3756
  store i32 %3757, i32* %25, align 4
  br label %3649

; <label>:3758:                                   ; preds = %3662
  %3759 = load i32, i32* %25, align 4
  %3760 = load i32*, i32** %30, align 8
  %3761 = load i32, i32* %24, align 4
  %3762 = sext i32 %3761 to i64
  %3763 = getelementptr inbounds i32, i32* %3760, i64 %3762
  %3764 = load i32, i32* %3763, align 4
  %3765 = sub nsw i32 %3759, %3764
  %3766 = icmp slt i32 %3765, 0
  br i1 %3766, label %3777, label %3767

; <label>:3767:                                   ; preds = %3758
  %pgocount182 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 243)
  %3768 = add i64 %pgocount182, 1
  store i64 %3768, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 243)
  %3769 = load i32, i32* %25, align 4
  %3770 = load i32*, i32** %30, align 8
  %3771 = load i32, i32* %24, align 4
  %3772 = sext i32 %3771 to i64
  %3773 = getelementptr inbounds i32, i32* %3770, i64 %3772
  %3774 = load i32, i32* %3773, align 4
  %3775 = sub nsw i32 %3769, %3774
  %3776 = icmp sge i32 %3775, 258
  br i1 %3776, label %3777, label %3779

; <label>:3777:                                   ; preds = %3767, %3758
  %pgocount183 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 240)
  %3778 = add i64 %pgocount183, 1
  store i64 %3778, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 240)
  store i32 -4, i32* %4, align 4
  br label %6029

; <label>:3779:                                   ; preds = %3767
  %pgocount184 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 253)
  %3780 = add i64 %pgocount184, 1
  store i64 %3780, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 253)
  %3781 = load i32*, i32** %31, align 8
  %3782 = load i32, i32* %25, align 4
  %3783 = load i32*, i32** %30, align 8
  %3784 = load i32, i32* %24, align 4
  %3785 = sext i32 %3784 to i64
  %3786 = getelementptr inbounds i32, i32* %3783, i64 %3785
  %3787 = load i32, i32* %3786, align 4
  %3788 = sub nsw i32 %3782, %3787
  %3789 = sext i32 %3788 to i64
  %3790 = getelementptr inbounds i32, i32* %3781, i64 %3789
  %3791 = load i32, i32* %3790, align 4
  store i32 %3791, i32* %17, align 4
  br label %3792

; <label>:3792:                                   ; preds = %3779
  %3793 = load i32, i32* %17, align 4
  %3794 = icmp eq i32 %3793, 0
  br i1 %3794, label %3799, label %3795

; <label>:3795:                                   ; preds = %3792
  %pgocount185 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 258)
  %3796 = add i64 %pgocount185, 1
  store i64 %3796, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 258)
  %3797 = load i32, i32* %17, align 4
  %3798 = icmp eq i32 %3797, 1
  br label %3799

; <label>:3799:                                   ; preds = %3795, %3792
  %3800 = phi i1 [ true, %3792 ], [ %3798, %3795 ]
  br i1 %3800, label %3488, label %3801

; <label>:3801:                                   ; preds = %3799
  %3802 = load i32, i32* %20, align 4
  %3803 = add nsw i32 %3802, 1
  store i32 %3803, i32* %20, align 4
  %3804 = load %struct.DState*, %struct.DState** %2, align 8
  %3805 = getelementptr inbounds %struct.DState, %struct.DState* %3804, i32 0, i32 30
  %3806 = load %struct.DState*, %struct.DState** %2, align 8
  %3807 = getelementptr inbounds %struct.DState, %struct.DState* %3806, i32 0, i32 31
  %3808 = load %struct.DState*, %struct.DState** %2, align 8
  %3809 = getelementptr inbounds %struct.DState, %struct.DState* %3808, i32 0, i32 32
  %3810 = getelementptr inbounds [16 x i32], [16 x i32]* %3809, i64 0, i64 0
  %3811 = load i32, i32* %3810, align 4
  %3812 = sext i32 %3811 to i64
  %3813 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3807, i64 0, i64 %3812
  %3814 = load i8, i8* %3813, align 1
  %3815 = zext i8 %3814 to i64
  %3816 = getelementptr inbounds [256 x i8], [256 x i8]* %3805, i64 0, i64 %3815
  %3817 = load i8, i8* %3816, align 1
  store i8 %3817, i8* %3, align 1
  %3818 = load i32, i32* %20, align 4
  %3819 = load %struct.DState*, %struct.DState** %2, align 8
  %3820 = getelementptr inbounds %struct.DState, %struct.DState* %3819, i32 0, i32 16
  %3821 = load i8, i8* %3, align 1
  %3822 = zext i8 %3821 to i64
  %3823 = getelementptr inbounds [256 x i32], [256 x i32]* %3820, i64 0, i64 %3822
  %3824 = load i32, i32* %3823, align 4
  %3825 = add nsw i32 %3824, %3818
  store i32 %3825, i32* %3823, align 4
  %3826 = load %struct.DState*, %struct.DState** %2, align 8
  %3827 = getelementptr inbounds %struct.DState, %struct.DState* %3826, i32 0, i32 10
  %3828 = load i8, i8* %3827, align 4
  %3829 = icmp ne i8 %3828, 0
  br i1 %3829, label %3830, label %3856

; <label>:3830:                                   ; preds = %3801
  br label %3831

; <label>:3831:                                   ; preds = %3840, %3830
  %3832 = load i32, i32* %20, align 4
  %3833 = icmp sgt i32 %3832, 0
  br i1 %3833, label %3834, label %3854

; <label>:3834:                                   ; preds = %3831
  %3835 = load i32, i32* %19, align 4
  %3836 = load i32, i32* %18, align 4
  %3837 = icmp sge i32 %3835, %3836
  br i1 %3837, label %3838, label %3840

; <label>:3838:                                   ; preds = %3834
  %pgocount186 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 273)
  %3839 = add i64 %pgocount186, 1
  store i64 %3839, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 273)
  store i32 -4, i32* %4, align 4
  br label %6029

; <label>:3840:                                   ; preds = %3834
  %pgocount187 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 185)
  %3841 = add i64 %pgocount187, 1
  store i64 %3841, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 185)
  %3842 = load i8, i8* %3, align 1
  %3843 = zext i8 %3842 to i16
  %3844 = load %struct.DState*, %struct.DState** %2, align 8
  %3845 = getelementptr inbounds %struct.DState, %struct.DState* %3844, i32 0, i32 21
  %3846 = load i16*, i16** %3845, align 8
  %3847 = load i32, i32* %19, align 4
  %3848 = sext i32 %3847 to i64
  %3849 = getelementptr inbounds i16, i16* %3846, i64 %3848
  store i16 %3843, i16* %3849, align 2
  %3850 = load i32, i32* %19, align 4
  %3851 = add nsw i32 %3850, 1
  store i32 %3851, i32* %19, align 4
  %3852 = load i32, i32* %20, align 4
  %3853 = add nsw i32 %3852, -1
  store i32 %3853, i32* %20, align 4
  br label %3831

; <label>:3854:                                   ; preds = %3831
  %pgocount188 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 270)
  %3855 = add i64 %pgocount188, 1
  store i64 %3855, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 270)
  br label %3882

; <label>:3856:                                   ; preds = %3801
  br label %3857

; <label>:3857:                                   ; preds = %3866, %3856
  %3858 = load i32, i32* %20, align 4
  %3859 = icmp sgt i32 %3858, 0
  br i1 %3859, label %3860, label %3880

; <label>:3860:                                   ; preds = %3857
  %3861 = load i32, i32* %19, align 4
  %3862 = load i32, i32* %18, align 4
  %3863 = icmp sge i32 %3861, %3862
  br i1 %3863, label %3864, label %3866

; <label>:3864:                                   ; preds = %3860
  %pgocount189 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 277)
  %3865 = add i64 %pgocount189, 1
  store i64 %3865, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 277)
  store i32 -4, i32* %4, align 4
  br label %6029

; <label>:3866:                                   ; preds = %3860
  %pgocount190 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 232)
  %3867 = add i64 %pgocount190, 1
  store i64 %3867, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 232)
  %3868 = load i8, i8* %3, align 1
  %3869 = zext i8 %3868 to i32
  %3870 = load %struct.DState*, %struct.DState** %2, align 8
  %3871 = getelementptr inbounds %struct.DState, %struct.DState* %3870, i32 0, i32 20
  %3872 = load i32*, i32** %3871, align 8
  %3873 = load i32, i32* %19, align 4
  %3874 = sext i32 %3873 to i64
  %3875 = getelementptr inbounds i32, i32* %3872, i64 %3874
  store i32 %3869, i32* %3875, align 4
  %3876 = load i32, i32* %19, align 4
  %3877 = add nsw i32 %3876, 1
  store i32 %3877, i32* %19, align 4
  %3878 = load i32, i32* %20, align 4
  %3879 = add nsw i32 %3878, -1
  store i32 %3879, i32* %20, align 4
  br label %3857

; <label>:3880:                                   ; preds = %3857
  %pgocount191 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 275)
  %3881 = add i64 %pgocount191, 1
  store i64 %3881, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 275)
  br label %3882

; <label>:3882:                                   ; preds = %3880, %3854
  br label %3473

; <label>:3883:                                   ; preds = %3483
  %3884 = load i32, i32* %19, align 4
  %3885 = load i32, i32* %18, align 4
  %3886 = icmp sge i32 %3884, %3885
  br i1 %3886, label %3887, label %3889

; <label>:3887:                                   ; preds = %3883
  %pgocount192 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 254)
  %3888 = add i64 %pgocount192, 1
  store i64 %3888, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 254)
  store i32 -4, i32* %4, align 4
  br label %6029

; <label>:3889:                                   ; preds = %3883
  %3890 = load i32, i32* %17, align 4
  %3891 = sub nsw i32 %3890, 1
  store i32 %3891, i32* %74, align 4
  %3892 = load i32, i32* %74, align 4
  %3893 = icmp ult i32 %3892, 16
  br i1 %3893, label %3894, label %4000

; <label>:3894:                                   ; preds = %3889
  %3895 = load %struct.DState*, %struct.DState** %2, align 8
  %3896 = getelementptr inbounds %struct.DState, %struct.DState* %3895, i32 0, i32 32
  %3897 = getelementptr inbounds [16 x i32], [16 x i32]* %3896, i64 0, i64 0
  %3898 = load i32, i32* %3897, align 4
  store i32 %3898, i32* %71, align 4
  %3899 = load %struct.DState*, %struct.DState** %2, align 8
  %3900 = getelementptr inbounds %struct.DState, %struct.DState* %3899, i32 0, i32 31
  %3901 = load i32, i32* %71, align 4
  %3902 = load i32, i32* %74, align 4
  %3903 = add i32 %3901, %3902
  %3904 = zext i32 %3903 to i64
  %3905 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3900, i64 0, i64 %3904
  %3906 = load i8, i8* %3905, align 1
  store i8 %3906, i8* %3, align 1
  br label %3907

; <label>:3907:                                   ; preds = %3910, %3894
  %3908 = load i32, i32* %74, align 4
  %3909 = icmp ugt i32 %3908, 3
  br i1 %3909, label %3910, label %3968

; <label>:3910:                                   ; preds = %3907
  %pgocount193 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 100)
  %3911 = add i64 %pgocount193, 1
  store i64 %3911, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 100)
  %3912 = load i32, i32* %71, align 4
  %3913 = load i32, i32* %74, align 4
  %3914 = add i32 %3912, %3913
  store i32 %3914, i32* %75, align 4
  %3915 = load %struct.DState*, %struct.DState** %2, align 8
  %3916 = getelementptr inbounds %struct.DState, %struct.DState* %3915, i32 0, i32 31
  %3917 = load i32, i32* %75, align 4
  %3918 = sub nsw i32 %3917, 1
  %3919 = sext i32 %3918 to i64
  %3920 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3916, i64 0, i64 %3919
  %3921 = load i8, i8* %3920, align 1
  %3922 = load %struct.DState*, %struct.DState** %2, align 8
  %3923 = getelementptr inbounds %struct.DState, %struct.DState* %3922, i32 0, i32 31
  %3924 = load i32, i32* %75, align 4
  %3925 = sext i32 %3924 to i64
  %3926 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3923, i64 0, i64 %3925
  store i8 %3921, i8* %3926, align 1
  %3927 = load %struct.DState*, %struct.DState** %2, align 8
  %3928 = getelementptr inbounds %struct.DState, %struct.DState* %3927, i32 0, i32 31
  %3929 = load i32, i32* %75, align 4
  %3930 = sub nsw i32 %3929, 2
  %3931 = sext i32 %3930 to i64
  %3932 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3928, i64 0, i64 %3931
  %3933 = load i8, i8* %3932, align 1
  %3934 = load %struct.DState*, %struct.DState** %2, align 8
  %3935 = getelementptr inbounds %struct.DState, %struct.DState* %3934, i32 0, i32 31
  %3936 = load i32, i32* %75, align 4
  %3937 = sub nsw i32 %3936, 1
  %3938 = sext i32 %3937 to i64
  %3939 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3935, i64 0, i64 %3938
  store i8 %3933, i8* %3939, align 1
  %3940 = load %struct.DState*, %struct.DState** %2, align 8
  %3941 = getelementptr inbounds %struct.DState, %struct.DState* %3940, i32 0, i32 31
  %3942 = load i32, i32* %75, align 4
  %3943 = sub nsw i32 %3942, 3
  %3944 = sext i32 %3943 to i64
  %3945 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3941, i64 0, i64 %3944
  %3946 = load i8, i8* %3945, align 1
  %3947 = load %struct.DState*, %struct.DState** %2, align 8
  %3948 = getelementptr inbounds %struct.DState, %struct.DState* %3947, i32 0, i32 31
  %3949 = load i32, i32* %75, align 4
  %3950 = sub nsw i32 %3949, 2
  %3951 = sext i32 %3950 to i64
  %3952 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3948, i64 0, i64 %3951
  store i8 %3946, i8* %3952, align 1
  %3953 = load %struct.DState*, %struct.DState** %2, align 8
  %3954 = getelementptr inbounds %struct.DState, %struct.DState* %3953, i32 0, i32 31
  %3955 = load i32, i32* %75, align 4
  %3956 = sub nsw i32 %3955, 4
  %3957 = sext i32 %3956 to i64
  %3958 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3954, i64 0, i64 %3957
  %3959 = load i8, i8* %3958, align 1
  %3960 = load %struct.DState*, %struct.DState** %2, align 8
  %3961 = getelementptr inbounds %struct.DState, %struct.DState* %3960, i32 0, i32 31
  %3962 = load i32, i32* %75, align 4
  %3963 = sub nsw i32 %3962, 3
  %3964 = sext i32 %3963 to i64
  %3965 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3961, i64 0, i64 %3964
  store i8 %3959, i8* %3965, align 1
  %3966 = load i32, i32* %74, align 4
  %3967 = sub i32 %3966, 4
  store i32 %3967, i32* %74, align 4
  br label %3907

; <label>:3968:                                   ; preds = %3907
  br label %3969

; <label>:3969:                                   ; preds = %3972, %3968
  %3970 = load i32, i32* %74, align 4
  %3971 = icmp ugt i32 %3970, 0
  br i1 %3971, label %3972, label %3992

; <label>:3972:                                   ; preds = %3969
  %pgocount194 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 101)
  %3973 = add i64 %pgocount194, 1
  store i64 %3973, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 101)
  %3974 = load %struct.DState*, %struct.DState** %2, align 8
  %3975 = getelementptr inbounds %struct.DState, %struct.DState* %3974, i32 0, i32 31
  %3976 = load i32, i32* %71, align 4
  %3977 = load i32, i32* %74, align 4
  %3978 = add i32 %3976, %3977
  %3979 = sub i32 %3978, 1
  %3980 = zext i32 %3979 to i64
  %3981 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3975, i64 0, i64 %3980
  %3982 = load i8, i8* %3981, align 1
  %3983 = load %struct.DState*, %struct.DState** %2, align 8
  %3984 = getelementptr inbounds %struct.DState, %struct.DState* %3983, i32 0, i32 31
  %3985 = load i32, i32* %71, align 4
  %3986 = load i32, i32* %74, align 4
  %3987 = add i32 %3985, %3986
  %3988 = zext i32 %3987 to i64
  %3989 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3984, i64 0, i64 %3988
  store i8 %3982, i8* %3989, align 1
  %3990 = load i32, i32* %74, align 4
  %3991 = add i32 %3990, -1
  store i32 %3991, i32* %74, align 4
  br label %3969

; <label>:3992:                                   ; preds = %3969
  %pgocount195 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 261)
  %3993 = add i64 %pgocount195, 1
  store i64 %3993, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 261)
  %3994 = load i8, i8* %3, align 1
  %3995 = load %struct.DState*, %struct.DState** %2, align 8
  %3996 = getelementptr inbounds %struct.DState, %struct.DState* %3995, i32 0, i32 31
  %3997 = load i32, i32* %71, align 4
  %3998 = sext i32 %3997 to i64
  %3999 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3996, i64 0, i64 %3998
  store i8 %3994, i8* %3999, align 1
  br label %4159

; <label>:4000:                                   ; preds = %3889
  %4001 = load i32, i32* %74, align 4
  %4002 = udiv i32 %4001, 16
  store i32 %4002, i32* %72, align 4
  %4003 = load i32, i32* %74, align 4
  %4004 = urem i32 %4003, 16
  store i32 %4004, i32* %73, align 4
  %4005 = load %struct.DState*, %struct.DState** %2, align 8
  %4006 = getelementptr inbounds %struct.DState, %struct.DState* %4005, i32 0, i32 32
  %4007 = load i32, i32* %72, align 4
  %4008 = sext i32 %4007 to i64
  %4009 = getelementptr inbounds [16 x i32], [16 x i32]* %4006, i64 0, i64 %4008
  %4010 = load i32, i32* %4009, align 4
  %4011 = load i32, i32* %73, align 4
  %4012 = add nsw i32 %4010, %4011
  store i32 %4012, i32* %71, align 4
  %4013 = load %struct.DState*, %struct.DState** %2, align 8
  %4014 = getelementptr inbounds %struct.DState, %struct.DState* %4013, i32 0, i32 31
  %4015 = load i32, i32* %71, align 4
  %4016 = sext i32 %4015 to i64
  %4017 = getelementptr inbounds [4096 x i8], [4096 x i8]* %4014, i64 0, i64 %4016
  %4018 = load i8, i8* %4017, align 1
  store i8 %4018, i8* %3, align 1
  br label %4019

; <label>:4019:                                   ; preds = %4028, %4000
  %4020 = load i32, i32* %71, align 4
  %4021 = load %struct.DState*, %struct.DState** %2, align 8
  %4022 = getelementptr inbounds %struct.DState, %struct.DState* %4021, i32 0, i32 32
  %4023 = load i32, i32* %72, align 4
  %4024 = sext i32 %4023 to i64
  %4025 = getelementptr inbounds [16 x i32], [16 x i32]* %4022, i64 0, i64 %4024
  %4026 = load i32, i32* %4025, align 4
  %4027 = icmp sgt i32 %4020, %4026
  br i1 %4027, label %4028, label %4044

; <label>:4028:                                   ; preds = %4019
  %pgocount196 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 102)
  %4029 = add i64 %pgocount196, 1
  store i64 %4029, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 102)
  %4030 = load %struct.DState*, %struct.DState** %2, align 8
  %4031 = getelementptr inbounds %struct.DState, %struct.DState* %4030, i32 0, i32 31
  %4032 = load i32, i32* %71, align 4
  %4033 = sub nsw i32 %4032, 1
  %4034 = sext i32 %4033 to i64
  %4035 = getelementptr inbounds [4096 x i8], [4096 x i8]* %4031, i64 0, i64 %4034
  %4036 = load i8, i8* %4035, align 1
  %4037 = load %struct.DState*, %struct.DState** %2, align 8
  %4038 = getelementptr inbounds %struct.DState, %struct.DState* %4037, i32 0, i32 31
  %4039 = load i32, i32* %71, align 4
  %4040 = sext i32 %4039 to i64
  %4041 = getelementptr inbounds [4096 x i8], [4096 x i8]* %4038, i64 0, i64 %4040
  store i8 %4036, i8* %4041, align 1
  %4042 = load i32, i32* %71, align 4
  %4043 = add nsw i32 %4042, -1
  store i32 %4043, i32* %71, align 4
  br label %4019

; <label>:4044:                                   ; preds = %4019
  %4045 = load %struct.DState*, %struct.DState** %2, align 8
  %4046 = getelementptr inbounds %struct.DState, %struct.DState* %4045, i32 0, i32 32
  %4047 = load i32, i32* %72, align 4
  %4048 = sext i32 %4047 to i64
  %4049 = getelementptr inbounds [16 x i32], [16 x i32]* %4046, i64 0, i64 %4048
  %4050 = load i32, i32* %4049, align 4
  %4051 = add nsw i32 %4050, 1
  store i32 %4051, i32* %4049, align 4
  br label %4052

; <label>:4052:                                   ; preds = %4055, %4044
  %4053 = load i32, i32* %72, align 4
  %4054 = icmp sgt i32 %4053, 0
  br i1 %4054, label %4055, label %4090

; <label>:4055:                                   ; preds = %4052
  %pgocount197 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 103)
  %4056 = add i64 %pgocount197, 1
  store i64 %4056, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 103)
  %4057 = load %struct.DState*, %struct.DState** %2, align 8
  %4058 = getelementptr inbounds %struct.DState, %struct.DState* %4057, i32 0, i32 32
  %4059 = load i32, i32* %72, align 4
  %4060 = sext i32 %4059 to i64
  %4061 = getelementptr inbounds [16 x i32], [16 x i32]* %4058, i64 0, i64 %4060
  %4062 = load i32, i32* %4061, align 4
  %4063 = add nsw i32 %4062, -1
  store i32 %4063, i32* %4061, align 4
  %4064 = load %struct.DState*, %struct.DState** %2, align 8
  %4065 = getelementptr inbounds %struct.DState, %struct.DState* %4064, i32 0, i32 31
  %4066 = load %struct.DState*, %struct.DState** %2, align 8
  %4067 = getelementptr inbounds %struct.DState, %struct.DState* %4066, i32 0, i32 32
  %4068 = load i32, i32* %72, align 4
  %4069 = sub nsw i32 %4068, 1
  %4070 = sext i32 %4069 to i64
  %4071 = getelementptr inbounds [16 x i32], [16 x i32]* %4067, i64 0, i64 %4070
  %4072 = load i32, i32* %4071, align 4
  %4073 = add nsw i32 %4072, 16
  %4074 = sub nsw i32 %4073, 1
  %4075 = sext i32 %4074 to i64
  %4076 = getelementptr inbounds [4096 x i8], [4096 x i8]* %4065, i64 0, i64 %4075
  %4077 = load i8, i8* %4076, align 1
  %4078 = load %struct.DState*, %struct.DState** %2, align 8
  %4079 = getelementptr inbounds %struct.DState, %struct.DState* %4078, i32 0, i32 31
  %4080 = load %struct.DState*, %struct.DState** %2, align 8
  %4081 = getelementptr inbounds %struct.DState, %struct.DState* %4080, i32 0, i32 32
  %4082 = load i32, i32* %72, align 4
  %4083 = sext i32 %4082 to i64
  %4084 = getelementptr inbounds [16 x i32], [16 x i32]* %4081, i64 0, i64 %4083
  %4085 = load i32, i32* %4084, align 4
  %4086 = sext i32 %4085 to i64
  %4087 = getelementptr inbounds [4096 x i8], [4096 x i8]* %4079, i64 0, i64 %4086
  store i8 %4077, i8* %4087, align 1
  %4088 = load i32, i32* %72, align 4
  %4089 = add nsw i32 %4088, -1
  store i32 %4089, i32* %72, align 4
  br label %4052

; <label>:4090:                                   ; preds = %4052
  %4091 = load %struct.DState*, %struct.DState** %2, align 8
  %4092 = getelementptr inbounds %struct.DState, %struct.DState* %4091, i32 0, i32 32
  %4093 = getelementptr inbounds [16 x i32], [16 x i32]* %4092, i64 0, i64 0
  %4094 = load i32, i32* %4093, align 4
  %4095 = add nsw i32 %4094, -1
  store i32 %4095, i32* %4093, align 4
  %4096 = load i8, i8* %3, align 1
  %4097 = load %struct.DState*, %struct.DState** %2, align 8
  %4098 = getelementptr inbounds %struct.DState, %struct.DState* %4097, i32 0, i32 31
  %4099 = load %struct.DState*, %struct.DState** %2, align 8
  %4100 = getelementptr inbounds %struct.DState, %struct.DState* %4099, i32 0, i32 32
  %4101 = getelementptr inbounds [16 x i32], [16 x i32]* %4100, i64 0, i64 0
  %4102 = load i32, i32* %4101, align 4
  %4103 = sext i32 %4102 to i64
  %4104 = getelementptr inbounds [4096 x i8], [4096 x i8]* %4098, i64 0, i64 %4103
  store i8 %4096, i8* %4104, align 1
  %4105 = load %struct.DState*, %struct.DState** %2, align 8
  %4106 = getelementptr inbounds %struct.DState, %struct.DState* %4105, i32 0, i32 32
  %4107 = getelementptr inbounds [16 x i32], [16 x i32]* %4106, i64 0, i64 0
  %4108 = load i32, i32* %4107, align 4
  %4109 = icmp eq i32 %4108, 0
  br i1 %4109, label %4110, label %4157

; <label>:4110:                                   ; preds = %4090
  store i32 4095, i32* %70, align 4
  store i32 15, i32* %68, align 4
  br label %4111

; <label>:4111:                                   ; preds = %4152, %4110
  %4112 = load i32, i32* %68, align 4
  %4113 = icmp sge i32 %4112, 0
  br i1 %4113, label %4114, label %4155

; <label>:4114:                                   ; preds = %4111
  %pgocount198 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 178)
  %4115 = add i64 %pgocount198, 1
  store i64 %4115, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 178)
  store i32 15, i32* %69, align 4
  br label %4116

; <label>:4116:                                   ; preds = %4141, %4114
  %4117 = load i32, i32* %69, align 4
  %4118 = icmp sge i32 %4117, 0
  br i1 %4118, label %4119, label %4144

; <label>:4119:                                   ; preds = %4116
  %pgocount199 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 53)
  %4120 = add i64 %pgocount199, 1
  store i64 %4120, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 53)
  %4121 = load %struct.DState*, %struct.DState** %2, align 8
  %4122 = getelementptr inbounds %struct.DState, %struct.DState* %4121, i32 0, i32 31
  %4123 = load %struct.DState*, %struct.DState** %2, align 8
  %4124 = getelementptr inbounds %struct.DState, %struct.DState* %4123, i32 0, i32 32
  %4125 = load i32, i32* %68, align 4
  %4126 = sext i32 %4125 to i64
  %4127 = getelementptr inbounds [16 x i32], [16 x i32]* %4124, i64 0, i64 %4126
  %4128 = load i32, i32* %4127, align 4
  %4129 = load i32, i32* %69, align 4
  %4130 = add nsw i32 %4128, %4129
  %4131 = sext i32 %4130 to i64
  %4132 = getelementptr inbounds [4096 x i8], [4096 x i8]* %4122, i64 0, i64 %4131
  %4133 = load i8, i8* %4132, align 1
  %4134 = load %struct.DState*, %struct.DState** %2, align 8
  %4135 = getelementptr inbounds %struct.DState, %struct.DState* %4134, i32 0, i32 31
  %4136 = load i32, i32* %70, align 4
  %4137 = sext i32 %4136 to i64
  %4138 = getelementptr inbounds [4096 x i8], [4096 x i8]* %4135, i64 0, i64 %4137
  store i8 %4133, i8* %4138, align 1
  %4139 = load i32, i32* %70, align 4
  %4140 = add nsw i32 %4139, -1
  store i32 %4140, i32* %70, align 4
  br label %4141

; <label>:4141:                                   ; preds = %4119
  %4142 = load i32, i32* %69, align 4
  %4143 = add nsw i32 %4142, -1
  store i32 %4143, i32* %69, align 4
  br label %4116

; <label>:4144:                                   ; preds = %4116
  %4145 = load i32, i32* %70, align 4
  %4146 = add nsw i32 %4145, 1
  %4147 = load %struct.DState*, %struct.DState** %2, align 8
  %4148 = getelementptr inbounds %struct.DState, %struct.DState* %4147, i32 0, i32 32
  %4149 = load i32, i32* %68, align 4
  %4150 = sext i32 %4149 to i64
  %4151 = getelementptr inbounds [16 x i32], [16 x i32]* %4148, i64 0, i64 %4150
  store i32 %4146, i32* %4151, align 4
  br label %4152

; <label>:4152:                                   ; preds = %4144
  %4153 = load i32, i32* %68, align 4
  %4154 = add nsw i32 %4153, -1
  store i32 %4154, i32* %68, align 4
  br label %4111

; <label>:4155:                                   ; preds = %4111
  %pgocount200 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 267)
  %4156 = add i64 %pgocount200, 1
  store i64 %4156, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 267)
  br label %4157

; <label>:4157:                                   ; preds = %4155, %4090
  %pgocount201 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 262)
  %4158 = add i64 %pgocount201, 1
  store i64 %4158, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 262)
  br label %4159

; <label>:4159:                                   ; preds = %4157, %3992
  %4160 = load %struct.DState*, %struct.DState** %2, align 8
  %4161 = getelementptr inbounds %struct.DState, %struct.DState* %4160, i32 0, i32 16
  %4162 = load %struct.DState*, %struct.DState** %2, align 8
  %4163 = getelementptr inbounds %struct.DState, %struct.DState* %4162, i32 0, i32 30
  %4164 = load i8, i8* %3, align 1
  %4165 = zext i8 %4164 to i64
  %4166 = getelementptr inbounds [256 x i8], [256 x i8]* %4163, i64 0, i64 %4165
  %4167 = load i8, i8* %4166, align 1
  %4168 = zext i8 %4167 to i64
  %4169 = getelementptr inbounds [256 x i32], [256 x i32]* %4161, i64 0, i64 %4168
  %4170 = load i32, i32* %4169, align 4
  %4171 = add nsw i32 %4170, 1
  store i32 %4171, i32* %4169, align 4
  %4172 = load %struct.DState*, %struct.DState** %2, align 8
  %4173 = getelementptr inbounds %struct.DState, %struct.DState* %4172, i32 0, i32 10
  %4174 = load i8, i8* %4173, align 4
  %4175 = icmp ne i8 %4174, 0
  br i1 %4175, label %4176, label %4190

; <label>:4176:                                   ; preds = %4159
  %4177 = load %struct.DState*, %struct.DState** %2, align 8
  %4178 = getelementptr inbounds %struct.DState, %struct.DState* %4177, i32 0, i32 30
  %4179 = load i8, i8* %3, align 1
  %4180 = zext i8 %4179 to i64
  %4181 = getelementptr inbounds [256 x i8], [256 x i8]* %4178, i64 0, i64 %4180
  %4182 = load i8, i8* %4181, align 1
  %4183 = zext i8 %4182 to i16
  %4184 = load %struct.DState*, %struct.DState** %2, align 8
  %4185 = getelementptr inbounds %struct.DState, %struct.DState* %4184, i32 0, i32 21
  %4186 = load i16*, i16** %4185, align 8
  %4187 = load i32, i32* %19, align 4
  %4188 = sext i32 %4187 to i64
  %4189 = getelementptr inbounds i16, i16* %4186, i64 %4188
  store i16 %4183, i16* %4189, align 2
  br label %4205

; <label>:4190:                                   ; preds = %4159
  %pgocount202 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 263)
  %4191 = add i64 %pgocount202, 1
  store i64 %4191, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 263)
  %4192 = load %struct.DState*, %struct.DState** %2, align 8
  %4193 = getelementptr inbounds %struct.DState, %struct.DState* %4192, i32 0, i32 30
  %4194 = load i8, i8* %3, align 1
  %4195 = zext i8 %4194 to i64
  %4196 = getelementptr inbounds [256 x i8], [256 x i8]* %4193, i64 0, i64 %4195
  %4197 = load i8, i8* %4196, align 1
  %4198 = zext i8 %4197 to i32
  %4199 = load %struct.DState*, %struct.DState** %2, align 8
  %4200 = getelementptr inbounds %struct.DState, %struct.DState* %4199, i32 0, i32 20
  %4201 = load i32*, i32** %4200, align 8
  %4202 = load i32, i32* %19, align 4
  %4203 = sext i32 %4202 to i64
  %4204 = getelementptr inbounds i32, i32* %4201, i64 %4203
  store i32 %4198, i32* %4204, align 4
  br label %4205

; <label>:4205:                                   ; preds = %4190, %4176
  %4206 = load i32, i32* %19, align 4
  %4207 = add nsw i32 %4206, 1
  store i32 %4207, i32* %19, align 4
  %4208 = load i32, i32* %16, align 4
  %4209 = icmp eq i32 %4208, 0
  br i1 %4209, label %4210, label %4251

; <label>:4210:                                   ; preds = %4205
  %4211 = load i32, i32* %15, align 4
  %4212 = add nsw i32 %4211, 1
  store i32 %4212, i32* %15, align 4
  %4213 = load i32, i32* %15, align 4
  %4214 = load i32, i32* %13, align 4
  %4215 = icmp sge i32 %4213, %4214
  br i1 %4215, label %4216, label %4218

; <label>:4216:                                   ; preds = %4210
  %pgocount203 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 268)
  %4217 = add i64 %pgocount203, 1
  store i64 %4217, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 268)
  store i32 -4, i32* %4, align 4
  br label %6029

; <label>:4218:                                   ; preds = %4210
  %pgocount204 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 269)
  %4219 = add i64 %pgocount204, 1
  store i64 %4219, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 269)
  store i32 50, i32* %16, align 4
  %4220 = load %struct.DState*, %struct.DState** %2, align 8
  %4221 = getelementptr inbounds %struct.DState, %struct.DState* %4220, i32 0, i32 33
  %4222 = load i32, i32* %15, align 4
  %4223 = sext i32 %4222 to i64
  %4224 = getelementptr inbounds [18002 x i8], [18002 x i8]* %4221, i64 0, i64 %4223
  %4225 = load i8, i8* %4224, align 1
  %4226 = zext i8 %4225 to i32
  store i32 %4226, i32* %27, align 4
  %4227 = load %struct.DState*, %struct.DState** %2, align 8
  %4228 = getelementptr inbounds %struct.DState, %struct.DState* %4227, i32 0, i32 39
  %4229 = load i32, i32* %27, align 4
  %4230 = sext i32 %4229 to i64
  %4231 = getelementptr inbounds [6 x i32], [6 x i32]* %4228, i64 0, i64 %4230
  %4232 = load i32, i32* %4231, align 4
  store i32 %4232, i32* %28, align 4
  %4233 = load %struct.DState*, %struct.DState** %2, align 8
  %4234 = getelementptr inbounds %struct.DState, %struct.DState* %4233, i32 0, i32 36
  %4235 = load i32, i32* %27, align 4
  %4236 = sext i32 %4235 to i64
  %4237 = getelementptr inbounds [6 x [258 x i32]], [6 x [258 x i32]]* %4234, i64 0, i64 %4236
  %4238 = getelementptr inbounds [258 x i32], [258 x i32]* %4237, i64 0, i64 0
  store i32* %4238, i32** %29, align 8
  %4239 = load %struct.DState*, %struct.DState** %2, align 8
  %4240 = getelementptr inbounds %struct.DState, %struct.DState* %4239, i32 0, i32 38
  %4241 = load i32, i32* %27, align 4
  %4242 = sext i32 %4241 to i64
  %4243 = getelementptr inbounds [6 x [258 x i32]], [6 x [258 x i32]]* %4240, i64 0, i64 %4242
  %4244 = getelementptr inbounds [258 x i32], [258 x i32]* %4243, i64 0, i64 0
  store i32* %4244, i32** %31, align 8
  %4245 = load %struct.DState*, %struct.DState** %2, align 8
  %4246 = getelementptr inbounds %struct.DState, %struct.DState* %4245, i32 0, i32 37
  %4247 = load i32, i32* %27, align 4
  %4248 = sext i32 %4247 to i64
  %4249 = getelementptr inbounds [6 x [258 x i32]], [6 x [258 x i32]]* %4246, i64 0, i64 %4248
  %4250 = getelementptr inbounds [258 x i32], [258 x i32]* %4249, i64 0, i64 0
  store i32* %4250, i32** %30, align 8
  br label %4251

; <label>:4251:                                   ; preds = %4218, %4205
  %4252 = load i32, i32* %16, align 4
  %4253 = add nsw i32 %4252, -1
  store i32 %4253, i32* %16, align 4
  %4254 = load i32, i32* %28, align 4
  store i32 %4254, i32* %24, align 4
  br label %4255

; <label>:4255:                                   ; preds = %4251, %145
  %pgocount205 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 247)
  %4256 = add i64 %pgocount205, 1
  store i64 %4256, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 247)
  %4257 = load %struct.DState*, %struct.DState** %2, align 8
  %4258 = getelementptr inbounds %struct.DState, %struct.DState* %4257, i32 0, i32 1
  store i32 40, i32* %4258, align 8
  br label %4259

; <label>:4259:                                   ; preds = %4345, %4255
  %4260 = load %struct.DState*, %struct.DState** %2, align 8
  %4261 = getelementptr inbounds %struct.DState, %struct.DState* %4260, i32 0, i32 8
  %4262 = load i32, i32* %4261, align 4
  %4263 = load i32, i32* %24, align 4
  %4264 = icmp sge i32 %4262, %4263
  br i1 %4264, label %4265, label %4285

; <label>:4265:                                   ; preds = %4259
  %4266 = load %struct.DState*, %struct.DState** %2, align 8
  %4267 = getelementptr inbounds %struct.DState, %struct.DState* %4266, i32 0, i32 7
  %4268 = load i32, i32* %4267, align 8
  %4269 = load %struct.DState*, %struct.DState** %2, align 8
  %4270 = getelementptr inbounds %struct.DState, %struct.DState* %4269, i32 0, i32 8
  %4271 = load i32, i32* %4270, align 4
  %4272 = load i32, i32* %24, align 4
  %4273 = sub nsw i32 %4271, %4272
  %4274 = lshr i32 %4268, %4273
  %4275 = load i32, i32* %24, align 4
  %4276 = shl i32 1, %4275
  %4277 = sub nsw i32 %4276, 1
  %4278 = and i32 %4274, %4277
  store i32 %4278, i32* %76, align 4
  %4279 = load i32, i32* %24, align 4
  %4280 = load %struct.DState*, %struct.DState** %2, align 8
  %4281 = getelementptr inbounds %struct.DState, %struct.DState* %4280, i32 0, i32 8
  %4282 = load i32, i32* %4281, align 4
  %4283 = sub nsw i32 %4282, %4279
  store i32 %4283, i32* %4281, align 4
  %4284 = load i32, i32* %76, align 4
  store i32 %4284, i32* %25, align 4
  br label %4347

; <label>:4285:                                   ; preds = %4259
  %4286 = load %struct.DState*, %struct.DState** %2, align 8
  %4287 = getelementptr inbounds %struct.DState, %struct.DState* %4286, i32 0, i32 0
  %4288 = load %struct.bz_stream*, %struct.bz_stream** %4287, align 8
  %4289 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %4288, i32 0, i32 1
  %4290 = load i32, i32* %4289, align 8
  %4291 = icmp eq i32 %4290, 0
  br i1 %4291, label %4292, label %4294

; <label>:4292:                                   ; preds = %4285
  %pgocount206 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 176)
  %4293 = add i64 %pgocount206, 1
  store i64 %4293, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 176)
  store i32 0, i32* %4, align 4
  br label %6029

; <label>:4294:                                   ; preds = %4285
  %4295 = load %struct.DState*, %struct.DState** %2, align 8
  %4296 = getelementptr inbounds %struct.DState, %struct.DState* %4295, i32 0, i32 7
  %4297 = load i32, i32* %4296, align 8
  %4298 = shl i32 %4297, 8
  %4299 = load %struct.DState*, %struct.DState** %2, align 8
  %4300 = getelementptr inbounds %struct.DState, %struct.DState* %4299, i32 0, i32 0
  %4301 = load %struct.bz_stream*, %struct.bz_stream** %4300, align 8
  %4302 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %4301, i32 0, i32 0
  %4303 = load i8*, i8** %4302, align 8
  %4304 = load i8, i8* %4303, align 1
  %4305 = zext i8 %4304 to i32
  %4306 = or i32 %4298, %4305
  %4307 = load %struct.DState*, %struct.DState** %2, align 8
  %4308 = getelementptr inbounds %struct.DState, %struct.DState* %4307, i32 0, i32 7
  store i32 %4306, i32* %4308, align 8
  %4309 = load %struct.DState*, %struct.DState** %2, align 8
  %4310 = getelementptr inbounds %struct.DState, %struct.DState* %4309, i32 0, i32 8
  %4311 = load i32, i32* %4310, align 4
  %4312 = add nsw i32 %4311, 8
  store i32 %4312, i32* %4310, align 4
  %4313 = load %struct.DState*, %struct.DState** %2, align 8
  %4314 = getelementptr inbounds %struct.DState, %struct.DState* %4313, i32 0, i32 0
  %4315 = load %struct.bz_stream*, %struct.bz_stream** %4314, align 8
  %4316 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %4315, i32 0, i32 0
  %4317 = load i8*, i8** %4316, align 8
  %4318 = getelementptr inbounds i8, i8* %4317, i32 1
  store i8* %4318, i8** %4316, align 8
  %4319 = load %struct.DState*, %struct.DState** %2, align 8
  %4320 = getelementptr inbounds %struct.DState, %struct.DState* %4319, i32 0, i32 0
  %4321 = load %struct.bz_stream*, %struct.bz_stream** %4320, align 8
  %4322 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %4321, i32 0, i32 1
  %4323 = load i32, i32* %4322, align 8
  %4324 = add i32 %4323, -1
  store i32 %4324, i32* %4322, align 8
  %4325 = load %struct.DState*, %struct.DState** %2, align 8
  %4326 = getelementptr inbounds %struct.DState, %struct.DState* %4325, i32 0, i32 0
  %4327 = load %struct.bz_stream*, %struct.bz_stream** %4326, align 8
  %4328 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %4327, i32 0, i32 2
  %4329 = load i32, i32* %4328, align 4
  %4330 = add i32 %4329, 1
  store i32 %4330, i32* %4328, align 4
  %4331 = load %struct.DState*, %struct.DState** %2, align 8
  %4332 = getelementptr inbounds %struct.DState, %struct.DState* %4331, i32 0, i32 0
  %4333 = load %struct.bz_stream*, %struct.bz_stream** %4332, align 8
  %4334 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %4333, i32 0, i32 2
  %4335 = load i32, i32* %4334, align 4
  %4336 = icmp eq i32 %4335, 0
  br i1 %4336, label %4337, label %4345

; <label>:4337:                                   ; preds = %4294
  %pgocount207 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 92)
  %4338 = add i64 %pgocount207, 1
  store i64 %4338, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 92)
  %4339 = load %struct.DState*, %struct.DState** %2, align 8
  %4340 = getelementptr inbounds %struct.DState, %struct.DState* %4339, i32 0, i32 0
  %4341 = load %struct.bz_stream*, %struct.bz_stream** %4340, align 8
  %4342 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %4341, i32 0, i32 3
  %4343 = load i32, i32* %4342, align 8
  %4344 = add i32 %4343, 1
  store i32 %4344, i32* %4342, align 8
  br label %4345

; <label>:4345:                                   ; preds = %4337, %4294
  %pgocount208 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 50)
  %4346 = add i64 %pgocount208, 1
  store i64 %4346, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 50)
  br label %4259

; <label>:4347:                                   ; preds = %4265
  br label %4348

; <label>:4348:                                   ; preds = %4451, %4347
  %4349 = load i32, i32* %24, align 4
  %4350 = icmp sgt i32 %4349, 20
  br i1 %4350, label %4351, label %4353

; <label>:4351:                                   ; preds = %4348
  %pgocount209 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 172)
  %4352 = add i64 %pgocount209, 1
  store i64 %4352, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 172)
  store i32 -4, i32* %4, align 4
  br label %6029

; <label>:4353:                                   ; preds = %4348
  %4354 = load i32, i32* %25, align 4
  %4355 = load i32*, i32** %29, align 8
  %4356 = load i32, i32* %24, align 4
  %4357 = sext i32 %4356 to i64
  %4358 = getelementptr inbounds i32, i32* %4355, i64 %4357
  %4359 = load i32, i32* %4358, align 4
  %4360 = icmp sle i32 %4354, %4359
  br i1 %4360, label %4361, label %4362

; <label>:4361:                                   ; preds = %4353
  br label %4456

; <label>:4362:                                   ; preds = %4353
  %pgocount210 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 227)
  %4363 = add i64 %pgocount210, 1
  store i64 %4363, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 227)
  %4364 = load i32, i32* %24, align 4
  %4365 = add nsw i32 %4364, 1
  store i32 %4365, i32* %24, align 4
  br label %4366

; <label>:4366:                                   ; preds = %4362, %145
  %4367 = load %struct.DState*, %struct.DState** %2, align 8
  %4368 = getelementptr inbounds %struct.DState, %struct.DState* %4367, i32 0, i32 1
  store i32 41, i32* %4368, align 8
  br label %4369

; <label>:4369:                                   ; preds = %4449, %4366
  %4370 = load %struct.DState*, %struct.DState** %2, align 8
  %4371 = getelementptr inbounds %struct.DState, %struct.DState* %4370, i32 0, i32 8
  %4372 = load i32, i32* %4371, align 4
  %4373 = icmp sge i32 %4372, 1
  br i1 %4373, label %4374, label %4389

; <label>:4374:                                   ; preds = %4369
  %4375 = load %struct.DState*, %struct.DState** %2, align 8
  %4376 = getelementptr inbounds %struct.DState, %struct.DState* %4375, i32 0, i32 7
  %4377 = load i32, i32* %4376, align 8
  %4378 = load %struct.DState*, %struct.DState** %2, align 8
  %4379 = getelementptr inbounds %struct.DState, %struct.DState* %4378, i32 0, i32 8
  %4380 = load i32, i32* %4379, align 4
  %4381 = sub nsw i32 %4380, 1
  %4382 = lshr i32 %4377, %4381
  %4383 = and i32 %4382, 1
  store i32 %4383, i32* %77, align 4
  %4384 = load %struct.DState*, %struct.DState** %2, align 8
  %4385 = getelementptr inbounds %struct.DState, %struct.DState* %4384, i32 0, i32 8
  %4386 = load i32, i32* %4385, align 4
  %4387 = sub nsw i32 %4386, 1
  store i32 %4387, i32* %4385, align 4
  %4388 = load i32, i32* %77, align 4
  store i32 %4388, i32* %26, align 4
  br label %4451

; <label>:4389:                                   ; preds = %4369
  %4390 = load %struct.DState*, %struct.DState** %2, align 8
  %4391 = getelementptr inbounds %struct.DState, %struct.DState* %4390, i32 0, i32 0
  %4392 = load %struct.bz_stream*, %struct.bz_stream** %4391, align 8
  %4393 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %4392, i32 0, i32 1
  %4394 = load i32, i32* %4393, align 8
  %4395 = icmp eq i32 %4394, 0
  br i1 %4395, label %4396, label %4398

; <label>:4396:                                   ; preds = %4389
  %pgocount211 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 177)
  %4397 = add i64 %pgocount211, 1
  store i64 %4397, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 177)
  store i32 0, i32* %4, align 4
  br label %6029

; <label>:4398:                                   ; preds = %4389
  %4399 = load %struct.DState*, %struct.DState** %2, align 8
  %4400 = getelementptr inbounds %struct.DState, %struct.DState* %4399, i32 0, i32 7
  %4401 = load i32, i32* %4400, align 8
  %4402 = shl i32 %4401, 8
  %4403 = load %struct.DState*, %struct.DState** %2, align 8
  %4404 = getelementptr inbounds %struct.DState, %struct.DState* %4403, i32 0, i32 0
  %4405 = load %struct.bz_stream*, %struct.bz_stream** %4404, align 8
  %4406 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %4405, i32 0, i32 0
  %4407 = load i8*, i8** %4406, align 8
  %4408 = load i8, i8* %4407, align 1
  %4409 = zext i8 %4408 to i32
  %4410 = or i32 %4402, %4409
  %4411 = load %struct.DState*, %struct.DState** %2, align 8
  %4412 = getelementptr inbounds %struct.DState, %struct.DState* %4411, i32 0, i32 7
  store i32 %4410, i32* %4412, align 8
  %4413 = load %struct.DState*, %struct.DState** %2, align 8
  %4414 = getelementptr inbounds %struct.DState, %struct.DState* %4413, i32 0, i32 8
  %4415 = load i32, i32* %4414, align 4
  %4416 = add nsw i32 %4415, 8
  store i32 %4416, i32* %4414, align 4
  %4417 = load %struct.DState*, %struct.DState** %2, align 8
  %4418 = getelementptr inbounds %struct.DState, %struct.DState* %4417, i32 0, i32 0
  %4419 = load %struct.bz_stream*, %struct.bz_stream** %4418, align 8
  %4420 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %4419, i32 0, i32 0
  %4421 = load i8*, i8** %4420, align 8
  %4422 = getelementptr inbounds i8, i8* %4421, i32 1
  store i8* %4422, i8** %4420, align 8
  %4423 = load %struct.DState*, %struct.DState** %2, align 8
  %4424 = getelementptr inbounds %struct.DState, %struct.DState* %4423, i32 0, i32 0
  %4425 = load %struct.bz_stream*, %struct.bz_stream** %4424, align 8
  %4426 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %4425, i32 0, i32 1
  %4427 = load i32, i32* %4426, align 8
  %4428 = add i32 %4427, -1
  store i32 %4428, i32* %4426, align 8
  %4429 = load %struct.DState*, %struct.DState** %2, align 8
  %4430 = getelementptr inbounds %struct.DState, %struct.DState* %4429, i32 0, i32 0
  %4431 = load %struct.bz_stream*, %struct.bz_stream** %4430, align 8
  %4432 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %4431, i32 0, i32 2
  %4433 = load i32, i32* %4432, align 4
  %4434 = add i32 %4433, 1
  store i32 %4434, i32* %4432, align 4
  %4435 = load %struct.DState*, %struct.DState** %2, align 8
  %4436 = getelementptr inbounds %struct.DState, %struct.DState* %4435, i32 0, i32 0
  %4437 = load %struct.bz_stream*, %struct.bz_stream** %4436, align 8
  %4438 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %4437, i32 0, i32 2
  %4439 = load i32, i32* %4438, align 4
  %4440 = icmp eq i32 %4439, 0
  br i1 %4440, label %4441, label %4449

; <label>:4441:                                   ; preds = %4398
  %pgocount212 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 93)
  %4442 = add i64 %pgocount212, 1
  store i64 %4442, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 93)
  %4443 = load %struct.DState*, %struct.DState** %2, align 8
  %4444 = getelementptr inbounds %struct.DState, %struct.DState* %4443, i32 0, i32 0
  %4445 = load %struct.bz_stream*, %struct.bz_stream** %4444, align 8
  %4446 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %4445, i32 0, i32 3
  %4447 = load i32, i32* %4446, align 8
  %4448 = add i32 %4447, 1
  store i32 %4448, i32* %4446, align 8
  br label %4449

; <label>:4449:                                   ; preds = %4441, %4398
  %pgocount213 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 51)
  %4450 = add i64 %pgocount213, 1
  store i64 %4450, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 51)
  br label %4369

; <label>:4451:                                   ; preds = %4374
  %4452 = load i32, i32* %25, align 4
  %4453 = shl i32 %4452, 1
  %4454 = load i32, i32* %26, align 4
  %4455 = or i32 %4453, %4454
  store i32 %4455, i32* %25, align 4
  br label %4348

; <label>:4456:                                   ; preds = %4361
  %4457 = load i32, i32* %25, align 4
  %4458 = load i32*, i32** %30, align 8
  %4459 = load i32, i32* %24, align 4
  %4460 = sext i32 %4459 to i64
  %4461 = getelementptr inbounds i32, i32* %4458, i64 %4460
  %4462 = load i32, i32* %4461, align 4
  %4463 = sub nsw i32 %4457, %4462
  %4464 = icmp slt i32 %4463, 0
  br i1 %4464, label %4475, label %4465

; <label>:4465:                                   ; preds = %4456
  %pgocount214 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 244)
  %4466 = add i64 %pgocount214, 1
  store i64 %4466, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 244)
  %4467 = load i32, i32* %25, align 4
  %4468 = load i32*, i32** %30, align 8
  %4469 = load i32, i32* %24, align 4
  %4470 = sext i32 %4469 to i64
  %4471 = getelementptr inbounds i32, i32* %4468, i64 %4470
  %4472 = load i32, i32* %4471, align 4
  %4473 = sub nsw i32 %4467, %4472
  %4474 = icmp sge i32 %4473, 258
  br i1 %4474, label %4475, label %4477

; <label>:4475:                                   ; preds = %4465, %4456
  %pgocount215 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 241)
  %4476 = add i64 %pgocount215, 1
  store i64 %4476, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 241)
  store i32 -4, i32* %4, align 4
  br label %6029

; <label>:4477:                                   ; preds = %4465
  %pgocount216 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 255)
  %4478 = add i64 %pgocount216, 1
  store i64 %4478, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 255)
  %4479 = load i32*, i32** %31, align 8
  %4480 = load i32, i32* %25, align 4
  %4481 = load i32*, i32** %30, align 8
  %4482 = load i32, i32* %24, align 4
  %4483 = sext i32 %4482 to i64
  %4484 = getelementptr inbounds i32, i32* %4481, i64 %4483
  %4485 = load i32, i32* %4484, align 4
  %4486 = sub nsw i32 %4480, %4485
  %4487 = sext i32 %4486 to i64
  %4488 = getelementptr inbounds i32, i32* %4479, i64 %4487
  %4489 = load i32, i32* %4488, align 4
  store i32 %4489, i32* %17, align 4
  br label %3473

; <label>:4490:                                   ; preds = %3477
  %4491 = load %struct.DState*, %struct.DState** %2, align 8
  %4492 = getelementptr inbounds %struct.DState, %struct.DState* %4491, i32 0, i32 13
  %4493 = load i32, i32* %4492, align 8
  %4494 = icmp slt i32 %4493, 0
  br i1 %4494, label %4502, label %4495

; <label>:4495:                                   ; preds = %4490
  %pgocount217 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 217)
  %4496 = add i64 %pgocount217, 1
  store i64 %4496, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 217)
  %4497 = load %struct.DState*, %struct.DState** %2, align 8
  %4498 = getelementptr inbounds %struct.DState, %struct.DState* %4497, i32 0, i32 13
  %4499 = load i32, i32* %4498, align 8
  %4500 = load i32, i32* %19, align 4
  %4501 = icmp sge i32 %4499, %4500
  br i1 %4501, label %4502, label %4503

; <label>:4502:                                   ; preds = %4495, %4490
  store i32 -4, i32* %4, align 4
  br label %6029

; <label>:4503:                                   ; preds = %4495
  %4504 = load %struct.DState*, %struct.DState** %2, align 8
  %4505 = getelementptr inbounds %struct.DState, %struct.DState* %4504, i32 0, i32 18
  %4506 = getelementptr inbounds [257 x i32], [257 x i32]* %4505, i64 0, i64 0
  store i32 0, i32* %4506, align 8
  store i32 1, i32* %8, align 4
  br label %4507

; <label>:4507:                                   ; preds = %4524, %4503
  %4508 = load i32, i32* %8, align 4
  %4509 = icmp sle i32 %4508, 256
  br i1 %4509, label %4510, label %4527

; <label>:4510:                                   ; preds = %4507
  %pgocount218 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 95)
  %4511 = add i64 %pgocount218, 1
  store i64 %4511, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 95)
  %4512 = load %struct.DState*, %struct.DState** %2, align 8
  %4513 = getelementptr inbounds %struct.DState, %struct.DState* %4512, i32 0, i32 16
  %4514 = load i32, i32* %8, align 4
  %4515 = sub nsw i32 %4514, 1
  %4516 = sext i32 %4515 to i64
  %4517 = getelementptr inbounds [256 x i32], [256 x i32]* %4513, i64 0, i64 %4516
  %4518 = load i32, i32* %4517, align 4
  %4519 = load %struct.DState*, %struct.DState** %2, align 8
  %4520 = getelementptr inbounds %struct.DState, %struct.DState* %4519, i32 0, i32 18
  %4521 = load i32, i32* %8, align 4
  %4522 = sext i32 %4521 to i64
  %4523 = getelementptr inbounds [257 x i32], [257 x i32]* %4520, i64 0, i64 %4522
  store i32 %4518, i32* %4523, align 4
  br label %4524

; <label>:4524:                                   ; preds = %4510
  %4525 = load i32, i32* %8, align 4
  %4526 = add nsw i32 %4525, 1
  store i32 %4526, i32* %8, align 4
  br label %4507

; <label>:4527:                                   ; preds = %4507
  store i32 1, i32* %8, align 4
  br label %4528

; <label>:4528:                                   ; preds = %4547, %4527
  %4529 = load i32, i32* %8, align 4
  %4530 = icmp sle i32 %4529, 256
  br i1 %4530, label %4531, label %4550

; <label>:4531:                                   ; preds = %4528
  %pgocount219 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 96)
  %4532 = add i64 %pgocount219, 1
  store i64 %4532, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 96)
  %4533 = load %struct.DState*, %struct.DState** %2, align 8
  %4534 = getelementptr inbounds %struct.DState, %struct.DState* %4533, i32 0, i32 18
  %4535 = load i32, i32* %8, align 4
  %4536 = sub nsw i32 %4535, 1
  %4537 = sext i32 %4536 to i64
  %4538 = getelementptr inbounds [257 x i32], [257 x i32]* %4534, i64 0, i64 %4537
  %4539 = load i32, i32* %4538, align 4
  %4540 = load %struct.DState*, %struct.DState** %2, align 8
  %4541 = getelementptr inbounds %struct.DState, %struct.DState* %4540, i32 0, i32 18
  %4542 = load i32, i32* %8, align 4
  %4543 = sext i32 %4542 to i64
  %4544 = getelementptr inbounds [257 x i32], [257 x i32]* %4541, i64 0, i64 %4543
  %4545 = load i32, i32* %4544, align 4
  %4546 = add nsw i32 %4545, %4539
  store i32 %4546, i32* %4544, align 4
  br label %4547

; <label>:4547:                                   ; preds = %4531
  %4548 = load i32, i32* %8, align 4
  %4549 = add nsw i32 %4548, 1
  store i32 %4549, i32* %8, align 4
  br label %4528

; <label>:4550:                                   ; preds = %4528
  store i32 0, i32* %8, align 4
  br label %4551

; <label>:4551:                                   ; preds = %4575, %4550
  %4552 = load i32, i32* %8, align 4
  %4553 = icmp sle i32 %4552, 256
  br i1 %4553, label %4554, label %4579

; <label>:4554:                                   ; preds = %4551
  %4555 = load %struct.DState*, %struct.DState** %2, align 8
  %4556 = getelementptr inbounds %struct.DState, %struct.DState* %4555, i32 0, i32 18
  %4557 = load i32, i32* %8, align 4
  %4558 = sext i32 %4557 to i64
  %4559 = getelementptr inbounds [257 x i32], [257 x i32]* %4556, i64 0, i64 %4558
  %4560 = load i32, i32* %4559, align 4
  %4561 = icmp slt i32 %4560, 0
  br i1 %4561, label %4572, label %4562

; <label>:4562:                                   ; preds = %4554
  %pgocount220 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 97)
  %4563 = add i64 %pgocount220, 1
  store i64 %4563, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 97)
  %4564 = load %struct.DState*, %struct.DState** %2, align 8
  %4565 = getelementptr inbounds %struct.DState, %struct.DState* %4564, i32 0, i32 18
  %4566 = load i32, i32* %8, align 4
  %4567 = sext i32 %4566 to i64
  %4568 = getelementptr inbounds [257 x i32], [257 x i32]* %4565, i64 0, i64 %4567
  %4569 = load i32, i32* %4568, align 4
  %4570 = load i32, i32* %19, align 4
  %4571 = icmp sgt i32 %4569, %4570
  br i1 %4571, label %4572, label %4574

; <label>:4572:                                   ; preds = %4562, %4554
  %pgocount221 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 250)
  %4573 = add i64 %pgocount221, 1
  store i64 %4573, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 250)
  store i32 -4, i32* %4, align 4
  br label %6029

; <label>:4574:                                   ; preds = %4562
  br label %4575

; <label>:4575:                                   ; preds = %4574
  %pgocount222 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 98)
  %4576 = add i64 %pgocount222, 1
  store i64 %4576, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 98)
  %4577 = load i32, i32* %8, align 4
  %4578 = add nsw i32 %4577, 1
  store i32 %4578, i32* %8, align 4
  br label %4551

; <label>:4579:                                   ; preds = %4551
  %4580 = load %struct.DState*, %struct.DState** %2, align 8
  %4581 = getelementptr inbounds %struct.DState, %struct.DState* %4580, i32 0, i32 3
  store i32 0, i32* %4581, align 8
  %4582 = load %struct.DState*, %struct.DState** %2, align 8
  %4583 = getelementptr inbounds %struct.DState, %struct.DState* %4582, i32 0, i32 2
  store i8 0, i8* %4583, align 4
  %4584 = load %struct.DState*, %struct.DState** %2, align 8
  %4585 = getelementptr inbounds %struct.DState, %struct.DState* %4584, i32 0, i32 25
  store i32 -1, i32* %4585, align 8
  %4586 = load %struct.DState*, %struct.DState** %2, align 8
  %4587 = getelementptr inbounds %struct.DState, %struct.DState* %4586, i32 0, i32 1
  store i32 2, i32* %4587, align 8
  %4588 = load %struct.DState*, %struct.DState** %2, align 8
  %4589 = getelementptr inbounds %struct.DState, %struct.DState* %4588, i32 0, i32 12
  %4590 = load i32, i32* %4589, align 4
  %4591 = icmp sge i32 %4590, 2
  br i1 %4591, label %4592, label %4596

; <label>:4592:                                   ; preds = %4579
  %pgocount223 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 264)
  %4593 = add i64 %pgocount223, 1
  store i64 %4593, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 264)
  %4594 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4595 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4594, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i32 0, i32 0))
  br label %4596

; <label>:4596:                                   ; preds = %4592, %4579
  %4597 = load %struct.DState*, %struct.DState** %2, align 8
  %4598 = getelementptr inbounds %struct.DState, %struct.DState* %4597, i32 0, i32 10
  %4599 = load i8, i8* %4598, align 4
  %4600 = icmp ne i8 %4599, 0
  br i1 %4600, label %4601, label %4995

; <label>:4601:                                   ; preds = %4596
  store i32 0, i32* %8, align 4
  br label %4602

; <label>:4602:                                   ; preds = %4618, %4601
  %4603 = load i32, i32* %8, align 4
  %4604 = icmp sle i32 %4603, 256
  br i1 %4604, label %4605, label %4621

; <label>:4605:                                   ; preds = %4602
  %pgocount224 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 104)
  %4606 = add i64 %pgocount224, 1
  store i64 %4606, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 104)
  %4607 = load %struct.DState*, %struct.DState** %2, align 8
  %4608 = getelementptr inbounds %struct.DState, %struct.DState* %4607, i32 0, i32 18
  %4609 = load i32, i32* %8, align 4
  %4610 = sext i32 %4609 to i64
  %4611 = getelementptr inbounds [257 x i32], [257 x i32]* %4608, i64 0, i64 %4610
  %4612 = load i32, i32* %4611, align 4
  %4613 = load %struct.DState*, %struct.DState** %2, align 8
  %4614 = getelementptr inbounds %struct.DState, %struct.DState* %4613, i32 0, i32 19
  %4615 = load i32, i32* %8, align 4
  %4616 = sext i32 %4615 to i64
  %4617 = getelementptr inbounds [257 x i32], [257 x i32]* %4614, i64 0, i64 %4616
  store i32 %4612, i32* %4617, align 4
  br label %4618

; <label>:4618:                                   ; preds = %4605
  %4619 = load i32, i32* %8, align 4
  %4620 = add nsw i32 %4619, 1
  store i32 %4620, i32* %8, align 4
  br label %4602

; <label>:4621:                                   ; preds = %4602
  store i32 0, i32* %8, align 4
  br label %4622

; <label>:4622:                                   ; preds = %4717, %4621
  %4623 = load i32, i32* %8, align 4
  %4624 = load i32, i32* %19, align 4
  %4625 = icmp slt i32 %4623, %4624
  br i1 %4625, label %4626, label %4720

; <label>:4626:                                   ; preds = %4622
  %4627 = load %struct.DState*, %struct.DState** %2, align 8
  %4628 = getelementptr inbounds %struct.DState, %struct.DState* %4627, i32 0, i32 21
  %4629 = load i16*, i16** %4628, align 8
  %4630 = load i32, i32* %8, align 4
  %4631 = sext i32 %4630 to i64
  %4632 = getelementptr inbounds i16, i16* %4629, i64 %4631
  %4633 = load i16, i16* %4632, align 2
  %4634 = trunc i16 %4633 to i8
  store i8 %4634, i8* %3, align 1
  %4635 = load %struct.DState*, %struct.DState** %2, align 8
  %4636 = getelementptr inbounds %struct.DState, %struct.DState* %4635, i32 0, i32 19
  %4637 = load i8, i8* %3, align 1
  %4638 = zext i8 %4637 to i64
  %4639 = getelementptr inbounds [257 x i32], [257 x i32]* %4636, i64 0, i64 %4638
  %4640 = load i32, i32* %4639, align 4
  %4641 = and i32 %4640, 65535
  %4642 = trunc i32 %4641 to i16
  %4643 = load %struct.DState*, %struct.DState** %2, align 8
  %4644 = getelementptr inbounds %struct.DState, %struct.DState* %4643, i32 0, i32 21
  %4645 = load i16*, i16** %4644, align 8
  %4646 = load i32, i32* %8, align 4
  %4647 = sext i32 %4646 to i64
  %4648 = getelementptr inbounds i16, i16* %4645, i64 %4647
  store i16 %4642, i16* %4648, align 2
  %4649 = load i32, i32* %8, align 4
  %4650 = and i32 %4649, 1
  %4651 = icmp eq i32 %4650, 0
  br i1 %4651, label %4652, label %4680

; <label>:4652:                                   ; preds = %4626
  %pgocount225 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 167)
  %4653 = add i64 %pgocount225, 1
  store i64 %4653, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 167)
  %4654 = load %struct.DState*, %struct.DState** %2, align 8
  %4655 = getelementptr inbounds %struct.DState, %struct.DState* %4654, i32 0, i32 22
  %4656 = load i8*, i8** %4655, align 8
  %4657 = load i32, i32* %8, align 4
  %4658 = ashr i32 %4657, 1
  %4659 = sext i32 %4658 to i64
  %4660 = getelementptr inbounds i8, i8* %4656, i64 %4659
  %4661 = load i8, i8* %4660, align 1
  %4662 = zext i8 %4661 to i32
  %4663 = and i32 %4662, 240
  %4664 = load %struct.DState*, %struct.DState** %2, align 8
  %4665 = getelementptr inbounds %struct.DState, %struct.DState* %4664, i32 0, i32 19
  %4666 = load i8, i8* %3, align 1
  %4667 = zext i8 %4666 to i64
  %4668 = getelementptr inbounds [257 x i32], [257 x i32]* %4665, i64 0, i64 %4667
  %4669 = load i32, i32* %4668, align 4
  %4670 = ashr i32 %4669, 16
  %4671 = or i32 %4663, %4670
  %4672 = trunc i32 %4671 to i8
  %4673 = load %struct.DState*, %struct.DState** %2, align 8
  %4674 = getelementptr inbounds %struct.DState, %struct.DState* %4673, i32 0, i32 22
  %4675 = load i8*, i8** %4674, align 8
  %4676 = load i32, i32* %8, align 4
  %4677 = ashr i32 %4676, 1
  %4678 = sext i32 %4677 to i64
  %4679 = getelementptr inbounds i8, i8* %4675, i64 %4678
  store i8 %4672, i8* %4679, align 1
  br label %4709

; <label>:4680:                                   ; preds = %4626
  %pgocount226 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 168)
  %4681 = add i64 %pgocount226, 1
  store i64 %4681, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 168)
  %4682 = load %struct.DState*, %struct.DState** %2, align 8
  %4683 = getelementptr inbounds %struct.DState, %struct.DState* %4682, i32 0, i32 22
  %4684 = load i8*, i8** %4683, align 8
  %4685 = load i32, i32* %8, align 4
  %4686 = ashr i32 %4685, 1
  %4687 = sext i32 %4686 to i64
  %4688 = getelementptr inbounds i8, i8* %4684, i64 %4687
  %4689 = load i8, i8* %4688, align 1
  %4690 = zext i8 %4689 to i32
  %4691 = and i32 %4690, 15
  %4692 = load %struct.DState*, %struct.DState** %2, align 8
  %4693 = getelementptr inbounds %struct.DState, %struct.DState* %4692, i32 0, i32 19
  %4694 = load i8, i8* %3, align 1
  %4695 = zext i8 %4694 to i64
  %4696 = getelementptr inbounds [257 x i32], [257 x i32]* %4693, i64 0, i64 %4695
  %4697 = load i32, i32* %4696, align 4
  %4698 = ashr i32 %4697, 16
  %4699 = shl i32 %4698, 4
  %4700 = or i32 %4691, %4699
  %4701 = trunc i32 %4700 to i8
  %4702 = load %struct.DState*, %struct.DState** %2, align 8
  %4703 = getelementptr inbounds %struct.DState, %struct.DState* %4702, i32 0, i32 22
  %4704 = load i8*, i8** %4703, align 8
  %4705 = load i32, i32* %8, align 4
  %4706 = ashr i32 %4705, 1
  %4707 = sext i32 %4706 to i64
  %4708 = getelementptr inbounds i8, i8* %4704, i64 %4707
  store i8 %4701, i8* %4708, align 1
  br label %4709

; <label>:4709:                                   ; preds = %4680, %4652
  %4710 = load %struct.DState*, %struct.DState** %2, align 8
  %4711 = getelementptr inbounds %struct.DState, %struct.DState* %4710, i32 0, i32 19
  %4712 = load i8, i8* %3, align 1
  %4713 = zext i8 %4712 to i64
  %4714 = getelementptr inbounds [257 x i32], [257 x i32]* %4711, i64 0, i64 %4713
  %4715 = load i32, i32* %4714, align 4
  %4716 = add nsw i32 %4715, 1
  store i32 %4716, i32* %4714, align 4
  br label %4717

; <label>:4717:                                   ; preds = %4709
  %4718 = load i32, i32* %8, align 4
  %4719 = add nsw i32 %4718, 1
  store i32 %4719, i32* %8, align 4
  br label %4622

; <label>:4720:                                   ; preds = %4622
  %4721 = load %struct.DState*, %struct.DState** %2, align 8
  %4722 = getelementptr inbounds %struct.DState, %struct.DState* %4721, i32 0, i32 13
  %4723 = load i32, i32* %4722, align 8
  store i32 %4723, i32* %8, align 4
  %4724 = load %struct.DState*, %struct.DState** %2, align 8
  %4725 = getelementptr inbounds %struct.DState, %struct.DState* %4724, i32 0, i32 21
  %4726 = load i16*, i16** %4725, align 8
  %4727 = load i32, i32* %8, align 4
  %4728 = sext i32 %4727 to i64
  %4729 = getelementptr inbounds i16, i16* %4726, i64 %4728
  %4730 = load i16, i16* %4729, align 2
  %4731 = zext i16 %4730 to i32
  %4732 = load %struct.DState*, %struct.DState** %2, align 8
  %4733 = getelementptr inbounds %struct.DState, %struct.DState* %4732, i32 0, i32 22
  %4734 = load i8*, i8** %4733, align 8
  %4735 = load i32, i32* %8, align 4
  %4736 = ashr i32 %4735, 1
  %4737 = sext i32 %4736 to i64
  %4738 = getelementptr inbounds i8, i8* %4734, i64 %4737
  %4739 = load i8, i8* %4738, align 1
  %4740 = zext i8 %4739 to i32
  %4741 = load i32, i32* %8, align 4
  %4742 = shl i32 %4741, 2
  %4743 = and i32 %4742, 4
  %4744 = lshr i32 %4740, %4743
  %4745 = and i32 %4744, 15
  %4746 = shl i32 %4745, 16
  %4747 = or i32 %4731, %4746
  store i32 %4747, i32* %9, align 4
  br label %4748

; <label>:4748:                                   ; preds = %4835, %4720
  %4749 = load %struct.DState*, %struct.DState** %2, align 8
  %4750 = getelementptr inbounds %struct.DState, %struct.DState* %4749, i32 0, i32 21
  %4751 = load i16*, i16** %4750, align 8
  %4752 = load i32, i32* %9, align 4
  %4753 = sext i32 %4752 to i64
  %4754 = getelementptr inbounds i16, i16* %4751, i64 %4753
  %4755 = load i16, i16* %4754, align 2
  %4756 = zext i16 %4755 to i32
  %4757 = load %struct.DState*, %struct.DState** %2, align 8
  %4758 = getelementptr inbounds %struct.DState, %struct.DState* %4757, i32 0, i32 22
  %4759 = load i8*, i8** %4758, align 8
  %4760 = load i32, i32* %9, align 4
  %4761 = ashr i32 %4760, 1
  %4762 = sext i32 %4761 to i64
  %4763 = getelementptr inbounds i8, i8* %4759, i64 %4762
  %4764 = load i8, i8* %4763, align 1
  %4765 = zext i8 %4764 to i32
  %4766 = load i32, i32* %9, align 4
  %4767 = shl i32 %4766, 2
  %4768 = and i32 %4767, 4
  %4769 = lshr i32 %4765, %4768
  %4770 = and i32 %4769, 15
  %4771 = shl i32 %4770, 16
  %4772 = or i32 %4756, %4771
  store i32 %4772, i32* %78, align 4
  %4773 = load i32, i32* %8, align 4
  %4774 = and i32 %4773, 65535
  %4775 = trunc i32 %4774 to i16
  %4776 = load %struct.DState*, %struct.DState** %2, align 8
  %4777 = getelementptr inbounds %struct.DState, %struct.DState* %4776, i32 0, i32 21
  %4778 = load i16*, i16** %4777, align 8
  %4779 = load i32, i32* %9, align 4
  %4780 = sext i32 %4779 to i64
  %4781 = getelementptr inbounds i16, i16* %4778, i64 %4780
  store i16 %4775, i16* %4781, align 2
  %4782 = load i32, i32* %9, align 4
  %4783 = and i32 %4782, 1
  %4784 = icmp eq i32 %4783, 0
  br i1 %4784, label %4785, label %4808

; <label>:4785:                                   ; preds = %4748
  %pgocount227 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 162)
  %4786 = add i64 %pgocount227, 1
  store i64 %4786, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 162)
  %4787 = load %struct.DState*, %struct.DState** %2, align 8
  %4788 = getelementptr inbounds %struct.DState, %struct.DState* %4787, i32 0, i32 22
  %4789 = load i8*, i8** %4788, align 8
  %4790 = load i32, i32* %9, align 4
  %4791 = ashr i32 %4790, 1
  %4792 = sext i32 %4791 to i64
  %4793 = getelementptr inbounds i8, i8* %4789, i64 %4792
  %4794 = load i8, i8* %4793, align 1
  %4795 = zext i8 %4794 to i32
  %4796 = and i32 %4795, 240
  %4797 = load i32, i32* %8, align 4
  %4798 = ashr i32 %4797, 16
  %4799 = or i32 %4796, %4798
  %4800 = trunc i32 %4799 to i8
  %4801 = load %struct.DState*, %struct.DState** %2, align 8
  %4802 = getelementptr inbounds %struct.DState, %struct.DState* %4801, i32 0, i32 22
  %4803 = load i8*, i8** %4802, align 8
  %4804 = load i32, i32* %9, align 4
  %4805 = ashr i32 %4804, 1
  %4806 = sext i32 %4805 to i64
  %4807 = getelementptr inbounds i8, i8* %4803, i64 %4806
  store i8 %4800, i8* %4807, align 1
  br label %4832

; <label>:4808:                                   ; preds = %4748
  %pgocount228 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 163)
  %4809 = add i64 %pgocount228, 1
  store i64 %4809, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 163)
  %4810 = load %struct.DState*, %struct.DState** %2, align 8
  %4811 = getelementptr inbounds %struct.DState, %struct.DState* %4810, i32 0, i32 22
  %4812 = load i8*, i8** %4811, align 8
  %4813 = load i32, i32* %9, align 4
  %4814 = ashr i32 %4813, 1
  %4815 = sext i32 %4814 to i64
  %4816 = getelementptr inbounds i8, i8* %4812, i64 %4815
  %4817 = load i8, i8* %4816, align 1
  %4818 = zext i8 %4817 to i32
  %4819 = and i32 %4818, 15
  %4820 = load i32, i32* %8, align 4
  %4821 = ashr i32 %4820, 16
  %4822 = shl i32 %4821, 4
  %4823 = or i32 %4819, %4822
  %4824 = trunc i32 %4823 to i8
  %4825 = load %struct.DState*, %struct.DState** %2, align 8
  %4826 = getelementptr inbounds %struct.DState, %struct.DState* %4825, i32 0, i32 22
  %4827 = load i8*, i8** %4826, align 8
  %4828 = load i32, i32* %9, align 4
  %4829 = ashr i32 %4828, 1
  %4830 = sext i32 %4829 to i64
  %4831 = getelementptr inbounds i8, i8* %4827, i64 %4830
  store i8 %4824, i8* %4831, align 1
  br label %4832

; <label>:4832:                                   ; preds = %4808, %4785
  %4833 = load i32, i32* %9, align 4
  store i32 %4833, i32* %8, align 4
  %4834 = load i32, i32* %78, align 4
  store i32 %4834, i32* %9, align 4
  br label %4835

; <label>:4835:                                   ; preds = %4832
  %4836 = load i32, i32* %8, align 4
  %4837 = load %struct.DState*, %struct.DState** %2, align 8
  %4838 = getelementptr inbounds %struct.DState, %struct.DState* %4837, i32 0, i32 13
  %4839 = load i32, i32* %4838, align 8
  %4840 = icmp ne i32 %4836, %4839
  br i1 %4840, label %4748, label %4841

; <label>:4841:                                   ; preds = %4835
  %4842 = load %struct.DState*, %struct.DState** %2, align 8
  %4843 = getelementptr inbounds %struct.DState, %struct.DState* %4842, i32 0, i32 13
  %4844 = load i32, i32* %4843, align 8
  %4845 = load %struct.DState*, %struct.DState** %2, align 8
  %4846 = getelementptr inbounds %struct.DState, %struct.DState* %4845, i32 0, i32 14
  store i32 %4844, i32* %4846, align 4
  %4847 = load %struct.DState*, %struct.DState** %2, align 8
  %4848 = getelementptr inbounds %struct.DState, %struct.DState* %4847, i32 0, i32 17
  store i32 0, i32* %4848, align 4
  %4849 = load %struct.DState*, %struct.DState** %2, align 8
  %4850 = getelementptr inbounds %struct.DState, %struct.DState* %4849, i32 0, i32 4
  %4851 = load i8, i8* %4850, align 4
  %4852 = icmp ne i8 %4851, 0
  br i1 %4852, label %4853, label %4947

; <label>:4853:                                   ; preds = %4841
  %pgocount229 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 266)
  %4854 = add i64 %pgocount229, 1
  store i64 %4854, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 266)
  %4855 = load %struct.DState*, %struct.DState** %2, align 8
  %4856 = getelementptr inbounds %struct.DState, %struct.DState* %4855, i32 0, i32 5
  store i32 0, i32* %4856, align 8
  %4857 = load %struct.DState*, %struct.DState** %2, align 8
  %4858 = getelementptr inbounds %struct.DState, %struct.DState* %4857, i32 0, i32 6
  store i32 0, i32* %4858, align 4
  %4859 = load %struct.DState*, %struct.DState** %2, align 8
  %4860 = getelementptr inbounds %struct.DState, %struct.DState* %4859, i32 0, i32 14
  %4861 = load i32, i32* %4860, align 4
  %4862 = load %struct.DState*, %struct.DState** %2, align 8
  %4863 = getelementptr inbounds %struct.DState, %struct.DState* %4862, i32 0, i32 18
  %4864 = getelementptr inbounds [257 x i32], [257 x i32]* %4863, i32 0, i32 0
  %4865 = call i32 @BZ2_indexIntoF(i32 %4861, i32* %4864)
  %4866 = load %struct.DState*, %struct.DState** %2, align 8
  %4867 = getelementptr inbounds %struct.DState, %struct.DState* %4866, i32 0, i32 15
  store i32 %4865, i32* %4867, align 8
  %4868 = load %struct.DState*, %struct.DState** %2, align 8
  %4869 = getelementptr inbounds %struct.DState, %struct.DState* %4868, i32 0, i32 21
  %4870 = load i16*, i16** %4869, align 8
  %4871 = load %struct.DState*, %struct.DState** %2, align 8
  %4872 = getelementptr inbounds %struct.DState, %struct.DState* %4871, i32 0, i32 14
  %4873 = load i32, i32* %4872, align 4
  %4874 = zext i32 %4873 to i64
  %4875 = getelementptr inbounds i16, i16* %4870, i64 %4874
  %4876 = load i16, i16* %4875, align 2
  %4877 = zext i16 %4876 to i32
  %4878 = load %struct.DState*, %struct.DState** %2, align 8
  %4879 = getelementptr inbounds %struct.DState, %struct.DState* %4878, i32 0, i32 22
  %4880 = load i8*, i8** %4879, align 8
  %4881 = load %struct.DState*, %struct.DState** %2, align 8
  %4882 = getelementptr inbounds %struct.DState, %struct.DState* %4881, i32 0, i32 14
  %4883 = load i32, i32* %4882, align 4
  %4884 = lshr i32 %4883, 1
  %4885 = zext i32 %4884 to i64
  %4886 = getelementptr inbounds i8, i8* %4880, i64 %4885
  %4887 = load i8, i8* %4886, align 1
  %4888 = zext i8 %4887 to i32
  %4889 = load %struct.DState*, %struct.DState** %2, align 8
  %4890 = getelementptr inbounds %struct.DState, %struct.DState* %4889, i32 0, i32 14
  %4891 = load i32, i32* %4890, align 4
  %4892 = shl i32 %4891, 2
  %4893 = and i32 %4892, 4
  %4894 = lshr i32 %4888, %4893
  %4895 = and i32 %4894, 15
  %4896 = shl i32 %4895, 16
  %4897 = or i32 %4877, %4896
  %4898 = load %struct.DState*, %struct.DState** %2, align 8
  %4899 = getelementptr inbounds %struct.DState, %struct.DState* %4898, i32 0, i32 14
  store i32 %4897, i32* %4899, align 4
  %4900 = load %struct.DState*, %struct.DState** %2, align 8
  %4901 = getelementptr inbounds %struct.DState, %struct.DState* %4900, i32 0, i32 17
  %4902 = load i32, i32* %4901, align 4
  %4903 = add nsw i32 %4902, 1
  store i32 %4903, i32* %4901, align 4
  %4904 = load %struct.DState*, %struct.DState** %2, align 8
  %4905 = getelementptr inbounds %struct.DState, %struct.DState* %4904, i32 0, i32 5
  %4906 = load i32, i32* %4905, align 8
  %4907 = icmp eq i32 %4906, 0
  br i1 %4907, label %4908, label %4931

; <label>:4908:                                   ; preds = %4853
  %4909 = load %struct.DState*, %struct.DState** %2, align 8
  %4910 = getelementptr inbounds %struct.DState, %struct.DState* %4909, i32 0, i32 6
  %4911 = load i32, i32* %4910, align 4
  %4912 = sext i32 %4911 to i64
  %4913 = getelementptr inbounds [512 x i32], [512 x i32]* @BZ2_rNums, i64 0, i64 %4912
  %4914 = load i32, i32* %4913, align 4
  %4915 = load %struct.DState*, %struct.DState** %2, align 8
  %4916 = getelementptr inbounds %struct.DState, %struct.DState* %4915, i32 0, i32 5
  store i32 %4914, i32* %4916, align 8
  %4917 = load %struct.DState*, %struct.DState** %2, align 8
  %4918 = getelementptr inbounds %struct.DState, %struct.DState* %4917, i32 0, i32 6
  %4919 = load i32, i32* %4918, align 4
  %4920 = add nsw i32 %4919, 1
  store i32 %4920, i32* %4918, align 4
  %4921 = load %struct.DState*, %struct.DState** %2, align 8
  %4922 = getelementptr inbounds %struct.DState, %struct.DState* %4921, i32 0, i32 6
  %4923 = load i32, i32* %4922, align 4
  %4924 = icmp eq i32 %4923, 512
  br i1 %4924, label %4925, label %4929

; <label>:4925:                                   ; preds = %4908
  %pgocount230 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 279)
  %4926 = add i64 %pgocount230, 1
  store i64 %4926, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 279)
  %4927 = load %struct.DState*, %struct.DState** %2, align 8
  %4928 = getelementptr inbounds %struct.DState, %struct.DState* %4927, i32 0, i32 6
  store i32 0, i32* %4928, align 4
  br label %4929

; <label>:4929:                                   ; preds = %4925, %4908
  %pgocount231 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 274)
  %4930 = add i64 %pgocount231, 1
  store i64 %4930, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 274)
  br label %4931

; <label>:4931:                                   ; preds = %4929, %4853
  %4932 = load %struct.DState*, %struct.DState** %2, align 8
  %4933 = getelementptr inbounds %struct.DState, %struct.DState* %4932, i32 0, i32 5
  %4934 = load i32, i32* %4933, align 8
  %4935 = add nsw i32 %4934, -1
  store i32 %4935, i32* %4933, align 8
  %4936 = load %struct.DState*, %struct.DState** %2, align 8
  %4937 = getelementptr inbounds %struct.DState, %struct.DState* %4936, i32 0, i32 5
  %4938 = load i32, i32* %4937, align 8
  %4939 = icmp eq i32 %4938, 1
  %4940 = zext i1 %4939 to i64
  %pgocount232 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 281)
  %4941 = add i64 %pgocount232, %4940
  store i64 %4941, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 281)
  %4942 = select i1 %4939, i32 1, i32 0
  %4943 = load %struct.DState*, %struct.DState** %2, align 8
  %4944 = getelementptr inbounds %struct.DState, %struct.DState* %4943, i32 0, i32 15
  %4945 = load i32, i32* %4944, align 8
  %4946 = xor i32 %4945, %4942
  store i32 %4946, i32* %4944, align 8
  br label %4994

; <label>:4947:                                   ; preds = %4841
  %pgocount233 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 271)
  %4948 = add i64 %pgocount233, 1
  store i64 %4948, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 271)
  %4949 = load %struct.DState*, %struct.DState** %2, align 8
  %4950 = getelementptr inbounds %struct.DState, %struct.DState* %4949, i32 0, i32 14
  %4951 = load i32, i32* %4950, align 4
  %4952 = load %struct.DState*, %struct.DState** %2, align 8
  %4953 = getelementptr inbounds %struct.DState, %struct.DState* %4952, i32 0, i32 18
  %4954 = getelementptr inbounds [257 x i32], [257 x i32]* %4953, i32 0, i32 0
  %4955 = call i32 @BZ2_indexIntoF(i32 %4951, i32* %4954)
  %4956 = load %struct.DState*, %struct.DState** %2, align 8
  %4957 = getelementptr inbounds %struct.DState, %struct.DState* %4956, i32 0, i32 15
  store i32 %4955, i32* %4957, align 8
  %4958 = load %struct.DState*, %struct.DState** %2, align 8
  %4959 = getelementptr inbounds %struct.DState, %struct.DState* %4958, i32 0, i32 21
  %4960 = load i16*, i16** %4959, align 8
  %4961 = load %struct.DState*, %struct.DState** %2, align 8
  %4962 = getelementptr inbounds %struct.DState, %struct.DState* %4961, i32 0, i32 14
  %4963 = load i32, i32* %4962, align 4
  %4964 = zext i32 %4963 to i64
  %4965 = getelementptr inbounds i16, i16* %4960, i64 %4964
  %4966 = load i16, i16* %4965, align 2
  %4967 = zext i16 %4966 to i32
  %4968 = load %struct.DState*, %struct.DState** %2, align 8
  %4969 = getelementptr inbounds %struct.DState, %struct.DState* %4968, i32 0, i32 22
  %4970 = load i8*, i8** %4969, align 8
  %4971 = load %struct.DState*, %struct.DState** %2, align 8
  %4972 = getelementptr inbounds %struct.DState, %struct.DState* %4971, i32 0, i32 14
  %4973 = load i32, i32* %4972, align 4
  %4974 = lshr i32 %4973, 1
  %4975 = zext i32 %4974 to i64
  %4976 = getelementptr inbounds i8, i8* %4970, i64 %4975
  %4977 = load i8, i8* %4976, align 1
  %4978 = zext i8 %4977 to i32
  %4979 = load %struct.DState*, %struct.DState** %2, align 8
  %4980 = getelementptr inbounds %struct.DState, %struct.DState* %4979, i32 0, i32 14
  %4981 = load i32, i32* %4980, align 4
  %4982 = shl i32 %4981, 2
  %4983 = and i32 %4982, 4
  %4984 = lshr i32 %4978, %4983
  %4985 = and i32 %4984, 15
  %4986 = shl i32 %4985, 16
  %4987 = or i32 %4967, %4986
  %4988 = load %struct.DState*, %struct.DState** %2, align 8
  %4989 = getelementptr inbounds %struct.DState, %struct.DState* %4988, i32 0, i32 14
  store i32 %4987, i32* %4989, align 4
  %4990 = load %struct.DState*, %struct.DState** %2, align 8
  %4991 = getelementptr inbounds %struct.DState, %struct.DState* %4990, i32 0, i32 17
  %4992 = load i32, i32* %4991, align 4
  %4993 = add nsw i32 %4992, 1
  store i32 %4993, i32* %4991, align 4
  br label %4994

; <label>:4994:                                   ; preds = %4947, %4931
  br label %5161

; <label>:4995:                                   ; preds = %4596
  store i32 0, i32* %8, align 4
  br label %4996

; <label>:4996:                                   ; preds = %5033, %4995
  %4997 = load i32, i32* %8, align 4
  %4998 = load i32, i32* %19, align 4
  %4999 = icmp slt i32 %4997, %4998
  br i1 %4999, label %5000, label %5036

; <label>:5000:                                   ; preds = %4996
  %pgocount234 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 154)
  %5001 = add i64 %pgocount234, 1
  store i64 %5001, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 154)
  %5002 = load %struct.DState*, %struct.DState** %2, align 8
  %5003 = getelementptr inbounds %struct.DState, %struct.DState* %5002, i32 0, i32 20
  %5004 = load i32*, i32** %5003, align 8
  %5005 = load i32, i32* %8, align 4
  %5006 = sext i32 %5005 to i64
  %5007 = getelementptr inbounds i32, i32* %5004, i64 %5006
  %5008 = load i32, i32* %5007, align 4
  %5009 = and i32 %5008, 255
  %5010 = trunc i32 %5009 to i8
  store i8 %5010, i8* %3, align 1
  %5011 = load i32, i32* %8, align 4
  %5012 = shl i32 %5011, 8
  %5013 = load %struct.DState*, %struct.DState** %2, align 8
  %5014 = getelementptr inbounds %struct.DState, %struct.DState* %5013, i32 0, i32 20
  %5015 = load i32*, i32** %5014, align 8
  %5016 = load %struct.DState*, %struct.DState** %2, align 8
  %5017 = getelementptr inbounds %struct.DState, %struct.DState* %5016, i32 0, i32 18
  %5018 = load i8, i8* %3, align 1
  %5019 = zext i8 %5018 to i64
  %5020 = getelementptr inbounds [257 x i32], [257 x i32]* %5017, i64 0, i64 %5019
  %5021 = load i32, i32* %5020, align 4
  %5022 = sext i32 %5021 to i64
  %5023 = getelementptr inbounds i32, i32* %5015, i64 %5022
  %5024 = load i32, i32* %5023, align 4
  %5025 = or i32 %5024, %5012
  store i32 %5025, i32* %5023, align 4
  %5026 = load %struct.DState*, %struct.DState** %2, align 8
  %5027 = getelementptr inbounds %struct.DState, %struct.DState* %5026, i32 0, i32 18
  %5028 = load i8, i8* %3, align 1
  %5029 = zext i8 %5028 to i64
  %5030 = getelementptr inbounds [257 x i32], [257 x i32]* %5027, i64 0, i64 %5029
  %5031 = load i32, i32* %5030, align 4
  %5032 = add nsw i32 %5031, 1
  store i32 %5032, i32* %5030, align 4
  br label %5033

; <label>:5033:                                   ; preds = %5000
  %5034 = load i32, i32* %8, align 4
  %5035 = add nsw i32 %5034, 1
  store i32 %5035, i32* %8, align 4
  br label %4996

; <label>:5036:                                   ; preds = %4996
  %5037 = load %struct.DState*, %struct.DState** %2, align 8
  %5038 = getelementptr inbounds %struct.DState, %struct.DState* %5037, i32 0, i32 20
  %5039 = load i32*, i32** %5038, align 8
  %5040 = load %struct.DState*, %struct.DState** %2, align 8
  %5041 = getelementptr inbounds %struct.DState, %struct.DState* %5040, i32 0, i32 13
  %5042 = load i32, i32* %5041, align 8
  %5043 = sext i32 %5042 to i64
  %5044 = getelementptr inbounds i32, i32* %5039, i64 %5043
  %5045 = load i32, i32* %5044, align 4
  %5046 = lshr i32 %5045, 8
  %5047 = load %struct.DState*, %struct.DState** %2, align 8
  %5048 = getelementptr inbounds %struct.DState, %struct.DState* %5047, i32 0, i32 14
  store i32 %5046, i32* %5048, align 4
  %5049 = load %struct.DState*, %struct.DState** %2, align 8
  %5050 = getelementptr inbounds %struct.DState, %struct.DState* %5049, i32 0, i32 17
  store i32 0, i32* %5050, align 4
  %5051 = load %struct.DState*, %struct.DState** %2, align 8
  %5052 = getelementptr inbounds %struct.DState, %struct.DState* %5051, i32 0, i32 4
  %5053 = load i8, i8* %5052, align 4
  %5054 = icmp ne i8 %5053, 0
  br i1 %5054, label %5055, label %5131

; <label>:5055:                                   ; preds = %5036
  %5056 = load %struct.DState*, %struct.DState** %2, align 8
  %5057 = getelementptr inbounds %struct.DState, %struct.DState* %5056, i32 0, i32 5
  store i32 0, i32* %5057, align 8
  %5058 = load %struct.DState*, %struct.DState** %2, align 8
  %5059 = getelementptr inbounds %struct.DState, %struct.DState* %5058, i32 0, i32 6
  store i32 0, i32* %5059, align 4
  %5060 = load %struct.DState*, %struct.DState** %2, align 8
  %5061 = getelementptr inbounds %struct.DState, %struct.DState* %5060, i32 0, i32 20
  %5062 = load i32*, i32** %5061, align 8
  %5063 = load %struct.DState*, %struct.DState** %2, align 8
  %5064 = getelementptr inbounds %struct.DState, %struct.DState* %5063, i32 0, i32 14
  %5065 = load i32, i32* %5064, align 4
  %5066 = zext i32 %5065 to i64
  %5067 = getelementptr inbounds i32, i32* %5062, i64 %5066
  %5068 = load i32, i32* %5067, align 4
  %5069 = load %struct.DState*, %struct.DState** %2, align 8
  %5070 = getelementptr inbounds %struct.DState, %struct.DState* %5069, i32 0, i32 14
  store i32 %5068, i32* %5070, align 4
  %5071 = load %struct.DState*, %struct.DState** %2, align 8
  %5072 = getelementptr inbounds %struct.DState, %struct.DState* %5071, i32 0, i32 14
  %5073 = load i32, i32* %5072, align 4
  %5074 = and i32 %5073, 255
  %5075 = trunc i32 %5074 to i8
  %5076 = zext i8 %5075 to i32
  %5077 = load %struct.DState*, %struct.DState** %2, align 8
  %5078 = getelementptr inbounds %struct.DState, %struct.DState* %5077, i32 0, i32 15
  store i32 %5076, i32* %5078, align 8
  %5079 = load %struct.DState*, %struct.DState** %2, align 8
  %5080 = getelementptr inbounds %struct.DState, %struct.DState* %5079, i32 0, i32 14
  %5081 = load i32, i32* %5080, align 4
  %5082 = lshr i32 %5081, 8
  store i32 %5082, i32* %5080, align 4
  %5083 = load %struct.DState*, %struct.DState** %2, align 8
  %5084 = getelementptr inbounds %struct.DState, %struct.DState* %5083, i32 0, i32 17
  %5085 = load i32, i32* %5084, align 4
  %5086 = add nsw i32 %5085, 1
  store i32 %5086, i32* %5084, align 4
  %5087 = load %struct.DState*, %struct.DState** %2, align 8
  %5088 = getelementptr inbounds %struct.DState, %struct.DState* %5087, i32 0, i32 5
  %5089 = load i32, i32* %5088, align 8
  %5090 = icmp eq i32 %5089, 0
  br i1 %5090, label %5091, label %5114

; <label>:5091:                                   ; preds = %5055
  %pgocount235 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 278)
  %5092 = add i64 %pgocount235, 1
  store i64 %5092, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 278)
  %5093 = load %struct.DState*, %struct.DState** %2, align 8
  %5094 = getelementptr inbounds %struct.DState, %struct.DState* %5093, i32 0, i32 6
  %5095 = load i32, i32* %5094, align 4
  %5096 = sext i32 %5095 to i64
  %5097 = getelementptr inbounds [512 x i32], [512 x i32]* @BZ2_rNums, i64 0, i64 %5096
  %5098 = load i32, i32* %5097, align 4
  %5099 = load %struct.DState*, %struct.DState** %2, align 8
  %5100 = getelementptr inbounds %struct.DState, %struct.DState* %5099, i32 0, i32 5
  store i32 %5098, i32* %5100, align 8
  %5101 = load %struct.DState*, %struct.DState** %2, align 8
  %5102 = getelementptr inbounds %struct.DState, %struct.DState* %5101, i32 0, i32 6
  %5103 = load i32, i32* %5102, align 4
  %5104 = add nsw i32 %5103, 1
  store i32 %5104, i32* %5102, align 4
  %5105 = load %struct.DState*, %struct.DState** %2, align 8
  %5106 = getelementptr inbounds %struct.DState, %struct.DState* %5105, i32 0, i32 6
  %5107 = load i32, i32* %5106, align 4
  %5108 = icmp eq i32 %5107, 512
  br i1 %5108, label %5109, label %5113

; <label>:5109:                                   ; preds = %5091
  %pgocount236 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 280)
  %5110 = add i64 %pgocount236, 1
  store i64 %5110, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 280)
  %5111 = load %struct.DState*, %struct.DState** %2, align 8
  %5112 = getelementptr inbounds %struct.DState, %struct.DState* %5111, i32 0, i32 6
  store i32 0, i32* %5112, align 4
  br label %5113

; <label>:5113:                                   ; preds = %5109, %5091
  br label %5114

; <label>:5114:                                   ; preds = %5113, %5055
  %pgocount237 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 272)
  %5115 = add i64 %pgocount237, 1
  store i64 %5115, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 272)
  %5116 = load %struct.DState*, %struct.DState** %2, align 8
  %5117 = getelementptr inbounds %struct.DState, %struct.DState* %5116, i32 0, i32 5
  %5118 = load i32, i32* %5117, align 8
  %5119 = add nsw i32 %5118, -1
  store i32 %5119, i32* %5117, align 8
  %5120 = load %struct.DState*, %struct.DState** %2, align 8
  %5121 = getelementptr inbounds %struct.DState, %struct.DState* %5120, i32 0, i32 5
  %5122 = load i32, i32* %5121, align 8
  %5123 = icmp eq i32 %5122, 1
  %5124 = zext i1 %5123 to i64
  %pgocount238 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 282)
  %5125 = add i64 %pgocount238, %5124
  store i64 %5125, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 282)
  %5126 = select i1 %5123, i32 1, i32 0
  %5127 = load %struct.DState*, %struct.DState** %2, align 8
  %5128 = getelementptr inbounds %struct.DState, %struct.DState* %5127, i32 0, i32 15
  %5129 = load i32, i32* %5128, align 8
  %5130 = xor i32 %5129, %5126
  store i32 %5130, i32* %5128, align 8
  br label %5160

; <label>:5131:                                   ; preds = %5036
  %pgocount239 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 276)
  %5132 = add i64 %pgocount239, 1
  store i64 %5132, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 276)
  %5133 = load %struct.DState*, %struct.DState** %2, align 8
  %5134 = getelementptr inbounds %struct.DState, %struct.DState* %5133, i32 0, i32 20
  %5135 = load i32*, i32** %5134, align 8
  %5136 = load %struct.DState*, %struct.DState** %2, align 8
  %5137 = getelementptr inbounds %struct.DState, %struct.DState* %5136, i32 0, i32 14
  %5138 = load i32, i32* %5137, align 4
  %5139 = zext i32 %5138 to i64
  %5140 = getelementptr inbounds i32, i32* %5135, i64 %5139
  %5141 = load i32, i32* %5140, align 4
  %5142 = load %struct.DState*, %struct.DState** %2, align 8
  %5143 = getelementptr inbounds %struct.DState, %struct.DState* %5142, i32 0, i32 14
  store i32 %5141, i32* %5143, align 4
  %5144 = load %struct.DState*, %struct.DState** %2, align 8
  %5145 = getelementptr inbounds %struct.DState, %struct.DState* %5144, i32 0, i32 14
  %5146 = load i32, i32* %5145, align 4
  %5147 = and i32 %5146, 255
  %5148 = trunc i32 %5147 to i8
  %5149 = zext i8 %5148 to i32
  %5150 = load %struct.DState*, %struct.DState** %2, align 8
  %5151 = getelementptr inbounds %struct.DState, %struct.DState* %5150, i32 0, i32 15
  store i32 %5149, i32* %5151, align 8
  %5152 = load %struct.DState*, %struct.DState** %2, align 8
  %5153 = getelementptr inbounds %struct.DState, %struct.DState* %5152, i32 0, i32 14
  %5154 = load i32, i32* %5153, align 4
  %5155 = lshr i32 %5154, 8
  store i32 %5155, i32* %5153, align 4
  %5156 = load %struct.DState*, %struct.DState** %2, align 8
  %5157 = getelementptr inbounds %struct.DState, %struct.DState* %5156, i32 0, i32 17
  %5158 = load i32, i32* %5157, align 4
  %5159 = add nsw i32 %5158, 1
  store i32 %5159, i32* %5157, align 4
  br label %5160

; <label>:5160:                                   ; preds = %5131, %5114
  br label %5161

; <label>:5161:                                   ; preds = %5160, %4994
  store i32 0, i32* %4, align 4
  br label %6029

; <label>:5162:                                   ; preds = %782
  %pgocount240 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 221)
  %5163 = add i64 %pgocount240, 1
  store i64 %5163, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 221)
  br label %5164

; <label>:5164:                                   ; preds = %5162, %145
  %5165 = load %struct.DState*, %struct.DState** %2, align 8
  %5166 = getelementptr inbounds %struct.DState, %struct.DState* %5165, i32 0, i32 1
  store i32 42, i32* %5166, align 8
  br label %5167

; <label>:5167:                                   ; preds = %5248, %5164
  %5168 = load %struct.DState*, %struct.DState** %2, align 8
  %5169 = getelementptr inbounds %struct.DState, %struct.DState* %5168, i32 0, i32 8
  %5170 = load i32, i32* %5169, align 4
  %5171 = icmp sge i32 %5170, 8
  br i1 %5171, label %5172, label %5188

; <label>:5172:                                   ; preds = %5167
  %5173 = load %struct.DState*, %struct.DState** %2, align 8
  %5174 = getelementptr inbounds %struct.DState, %struct.DState* %5173, i32 0, i32 7
  %5175 = load i32, i32* %5174, align 8
  %5176 = load %struct.DState*, %struct.DState** %2, align 8
  %5177 = getelementptr inbounds %struct.DState, %struct.DState* %5176, i32 0, i32 8
  %5178 = load i32, i32* %5177, align 4
  %5179 = sub nsw i32 %5178, 8
  %5180 = lshr i32 %5175, %5179
  %5181 = and i32 %5180, 255
  store i32 %5181, i32* %79, align 4
  %5182 = load %struct.DState*, %struct.DState** %2, align 8
  %5183 = getelementptr inbounds %struct.DState, %struct.DState* %5182, i32 0, i32 8
  %5184 = load i32, i32* %5183, align 4
  %5185 = sub nsw i32 %5184, 8
  store i32 %5185, i32* %5183, align 4
  %5186 = load i32, i32* %79, align 4
  %5187 = trunc i32 %5186 to i8
  store i8 %5187, i8* %3, align 1
  br label %5250

; <label>:5188:                                   ; preds = %5167
  %5189 = load %struct.DState*, %struct.DState** %2, align 8
  %5190 = getelementptr inbounds %struct.DState, %struct.DState* %5189, i32 0, i32 0
  %5191 = load %struct.bz_stream*, %struct.bz_stream** %5190, align 8
  %5192 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5191, i32 0, i32 1
  %5193 = load i32, i32* %5192, align 8
  %5194 = icmp eq i32 %5193, 0
  br i1 %5194, label %5195, label %5197

; <label>:5195:                                   ; preds = %5188
  %pgocount241 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 153)
  %5196 = add i64 %pgocount241, 1
  store i64 %5196, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 153)
  store i32 0, i32* %4, align 4
  br label %6029

; <label>:5197:                                   ; preds = %5188
  %5198 = load %struct.DState*, %struct.DState** %2, align 8
  %5199 = getelementptr inbounds %struct.DState, %struct.DState* %5198, i32 0, i32 7
  %5200 = load i32, i32* %5199, align 8
  %5201 = shl i32 %5200, 8
  %5202 = load %struct.DState*, %struct.DState** %2, align 8
  %5203 = getelementptr inbounds %struct.DState, %struct.DState* %5202, i32 0, i32 0
  %5204 = load %struct.bz_stream*, %struct.bz_stream** %5203, align 8
  %5205 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5204, i32 0, i32 0
  %5206 = load i8*, i8** %5205, align 8
  %5207 = load i8, i8* %5206, align 1
  %5208 = zext i8 %5207 to i32
  %5209 = or i32 %5201, %5208
  %5210 = load %struct.DState*, %struct.DState** %2, align 8
  %5211 = getelementptr inbounds %struct.DState, %struct.DState* %5210, i32 0, i32 7
  store i32 %5209, i32* %5211, align 8
  %5212 = load %struct.DState*, %struct.DState** %2, align 8
  %5213 = getelementptr inbounds %struct.DState, %struct.DState* %5212, i32 0, i32 8
  %5214 = load i32, i32* %5213, align 4
  %5215 = add nsw i32 %5214, 8
  store i32 %5215, i32* %5213, align 4
  %5216 = load %struct.DState*, %struct.DState** %2, align 8
  %5217 = getelementptr inbounds %struct.DState, %struct.DState* %5216, i32 0, i32 0
  %5218 = load %struct.bz_stream*, %struct.bz_stream** %5217, align 8
  %5219 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5218, i32 0, i32 0
  %5220 = load i8*, i8** %5219, align 8
  %5221 = getelementptr inbounds i8, i8* %5220, i32 1
  store i8* %5221, i8** %5219, align 8
  %5222 = load %struct.DState*, %struct.DState** %2, align 8
  %5223 = getelementptr inbounds %struct.DState, %struct.DState* %5222, i32 0, i32 0
  %5224 = load %struct.bz_stream*, %struct.bz_stream** %5223, align 8
  %5225 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5224, i32 0, i32 1
  %5226 = load i32, i32* %5225, align 8
  %5227 = add i32 %5226, -1
  store i32 %5227, i32* %5225, align 8
  %5228 = load %struct.DState*, %struct.DState** %2, align 8
  %5229 = getelementptr inbounds %struct.DState, %struct.DState* %5228, i32 0, i32 0
  %5230 = load %struct.bz_stream*, %struct.bz_stream** %5229, align 8
  %5231 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5230, i32 0, i32 2
  %5232 = load i32, i32* %5231, align 4
  %5233 = add i32 %5232, 1
  store i32 %5233, i32* %5231, align 4
  %5234 = load %struct.DState*, %struct.DState** %2, align 8
  %5235 = getelementptr inbounds %struct.DState, %struct.DState* %5234, i32 0, i32 0
  %5236 = load %struct.bz_stream*, %struct.bz_stream** %5235, align 8
  %5237 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5236, i32 0, i32 2
  %5238 = load i32, i32* %5237, align 4
  %5239 = icmp eq i32 %5238, 0
  br i1 %5239, label %5240, label %5248

; <label>:5240:                                   ; preds = %5197
  %pgocount242 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 84)
  %5241 = add i64 %pgocount242, 1
  store i64 %5241, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 84)
  %5242 = load %struct.DState*, %struct.DState** %2, align 8
  %5243 = getelementptr inbounds %struct.DState, %struct.DState* %5242, i32 0, i32 0
  %5244 = load %struct.bz_stream*, %struct.bz_stream** %5243, align 8
  %5245 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5244, i32 0, i32 3
  %5246 = load i32, i32* %5245, align 8
  %5247 = add i32 %5246, 1
  store i32 %5247, i32* %5245, align 8
  br label %5248

; <label>:5248:                                   ; preds = %5240, %5197
  %pgocount243 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 40)
  %5249 = add i64 %pgocount243, 1
  store i64 %5249, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 40)
  br label %5167

; <label>:5250:                                   ; preds = %5172
  %5251 = load i8, i8* %3, align 1
  %5252 = zext i8 %5251 to i32
  %5253 = icmp ne i32 %5252, 114
  br i1 %5253, label %5254, label %5256

; <label>:5254:                                   ; preds = %5250
  %pgocount244 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 208)
  %5255 = add i64 %pgocount244, 1
  store i64 %5255, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 208)
  store i32 -4, i32* %4, align 4
  br label %6029

; <label>:5256:                                   ; preds = %5250
  %pgocount245 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 209)
  %5257 = add i64 %pgocount245, 1
  store i64 %5257, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 209)
  br label %5258

; <label>:5258:                                   ; preds = %5256, %145
  %5259 = load %struct.DState*, %struct.DState** %2, align 8
  %5260 = getelementptr inbounds %struct.DState, %struct.DState* %5259, i32 0, i32 1
  store i32 43, i32* %5260, align 8
  br label %5261

; <label>:5261:                                   ; preds = %5342, %5258
  %5262 = load %struct.DState*, %struct.DState** %2, align 8
  %5263 = getelementptr inbounds %struct.DState, %struct.DState* %5262, i32 0, i32 8
  %5264 = load i32, i32* %5263, align 4
  %5265 = icmp sge i32 %5264, 8
  br i1 %5265, label %5266, label %5282

; <label>:5266:                                   ; preds = %5261
  %5267 = load %struct.DState*, %struct.DState** %2, align 8
  %5268 = getelementptr inbounds %struct.DState, %struct.DState* %5267, i32 0, i32 7
  %5269 = load i32, i32* %5268, align 8
  %5270 = load %struct.DState*, %struct.DState** %2, align 8
  %5271 = getelementptr inbounds %struct.DState, %struct.DState* %5270, i32 0, i32 8
  %5272 = load i32, i32* %5271, align 4
  %5273 = sub nsw i32 %5272, 8
  %5274 = lshr i32 %5269, %5273
  %5275 = and i32 %5274, 255
  store i32 %5275, i32* %80, align 4
  %5276 = load %struct.DState*, %struct.DState** %2, align 8
  %5277 = getelementptr inbounds %struct.DState, %struct.DState* %5276, i32 0, i32 8
  %5278 = load i32, i32* %5277, align 4
  %5279 = sub nsw i32 %5278, 8
  store i32 %5279, i32* %5277, align 4
  %5280 = load i32, i32* %80, align 4
  %5281 = trunc i32 %5280 to i8
  store i8 %5281, i8* %3, align 1
  br label %5344

; <label>:5282:                                   ; preds = %5261
  %5283 = load %struct.DState*, %struct.DState** %2, align 8
  %5284 = getelementptr inbounds %struct.DState, %struct.DState* %5283, i32 0, i32 0
  %5285 = load %struct.bz_stream*, %struct.bz_stream** %5284, align 8
  %5286 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5285, i32 0, i32 1
  %5287 = load i32, i32* %5286, align 8
  %5288 = icmp eq i32 %5287, 0
  br i1 %5288, label %5289, label %5291

; <label>:5289:                                   ; preds = %5282
  %pgocount246 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 150)
  %5290 = add i64 %pgocount246, 1
  store i64 %5290, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 150)
  store i32 0, i32* %4, align 4
  br label %6029

; <label>:5291:                                   ; preds = %5282
  %5292 = load %struct.DState*, %struct.DState** %2, align 8
  %5293 = getelementptr inbounds %struct.DState, %struct.DState* %5292, i32 0, i32 7
  %5294 = load i32, i32* %5293, align 8
  %5295 = shl i32 %5294, 8
  %5296 = load %struct.DState*, %struct.DState** %2, align 8
  %5297 = getelementptr inbounds %struct.DState, %struct.DState* %5296, i32 0, i32 0
  %5298 = load %struct.bz_stream*, %struct.bz_stream** %5297, align 8
  %5299 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5298, i32 0, i32 0
  %5300 = load i8*, i8** %5299, align 8
  %5301 = load i8, i8* %5300, align 1
  %5302 = zext i8 %5301 to i32
  %5303 = or i32 %5295, %5302
  %5304 = load %struct.DState*, %struct.DState** %2, align 8
  %5305 = getelementptr inbounds %struct.DState, %struct.DState* %5304, i32 0, i32 7
  store i32 %5303, i32* %5305, align 8
  %5306 = load %struct.DState*, %struct.DState** %2, align 8
  %5307 = getelementptr inbounds %struct.DState, %struct.DState* %5306, i32 0, i32 8
  %5308 = load i32, i32* %5307, align 4
  %5309 = add nsw i32 %5308, 8
  store i32 %5309, i32* %5307, align 4
  %5310 = load %struct.DState*, %struct.DState** %2, align 8
  %5311 = getelementptr inbounds %struct.DState, %struct.DState* %5310, i32 0, i32 0
  %5312 = load %struct.bz_stream*, %struct.bz_stream** %5311, align 8
  %5313 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5312, i32 0, i32 0
  %5314 = load i8*, i8** %5313, align 8
  %5315 = getelementptr inbounds i8, i8* %5314, i32 1
  store i8* %5315, i8** %5313, align 8
  %5316 = load %struct.DState*, %struct.DState** %2, align 8
  %5317 = getelementptr inbounds %struct.DState, %struct.DState* %5316, i32 0, i32 0
  %5318 = load %struct.bz_stream*, %struct.bz_stream** %5317, align 8
  %5319 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5318, i32 0, i32 1
  %5320 = load i32, i32* %5319, align 8
  %5321 = add i32 %5320, -1
  store i32 %5321, i32* %5319, align 8
  %5322 = load %struct.DState*, %struct.DState** %2, align 8
  %5323 = getelementptr inbounds %struct.DState, %struct.DState* %5322, i32 0, i32 0
  %5324 = load %struct.bz_stream*, %struct.bz_stream** %5323, align 8
  %5325 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5324, i32 0, i32 2
  %5326 = load i32, i32* %5325, align 4
  %5327 = add i32 %5326, 1
  store i32 %5327, i32* %5325, align 4
  %5328 = load %struct.DState*, %struct.DState** %2, align 8
  %5329 = getelementptr inbounds %struct.DState, %struct.DState* %5328, i32 0, i32 0
  %5330 = load %struct.bz_stream*, %struct.bz_stream** %5329, align 8
  %5331 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5330, i32 0, i32 2
  %5332 = load i32, i32* %5331, align 4
  %5333 = icmp eq i32 %5332, 0
  br i1 %5333, label %5334, label %5342

; <label>:5334:                                   ; preds = %5291
  %pgocount247 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 81)
  %5335 = add i64 %pgocount247, 1
  store i64 %5335, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 81)
  %5336 = load %struct.DState*, %struct.DState** %2, align 8
  %5337 = getelementptr inbounds %struct.DState, %struct.DState* %5336, i32 0, i32 0
  %5338 = load %struct.bz_stream*, %struct.bz_stream** %5337, align 8
  %5339 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5338, i32 0, i32 3
  %5340 = load i32, i32* %5339, align 8
  %5341 = add i32 %5340, 1
  store i32 %5341, i32* %5339, align 8
  br label %5342

; <label>:5342:                                   ; preds = %5334, %5291
  %pgocount248 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 37)
  %5343 = add i64 %pgocount248, 1
  store i64 %5343, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 37)
  br label %5261

; <label>:5344:                                   ; preds = %5266
  %5345 = load i8, i8* %3, align 1
  %5346 = zext i8 %5345 to i32
  %5347 = icmp ne i32 %5346, 69
  br i1 %5347, label %5348, label %5350

; <label>:5348:                                   ; preds = %5344
  %pgocount249 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 202)
  %5349 = add i64 %pgocount249, 1
  store i64 %5349, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 202)
  store i32 -4, i32* %4, align 4
  br label %6029

; <label>:5350:                                   ; preds = %5344
  %pgocount250 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 203)
  %5351 = add i64 %pgocount250, 1
  store i64 %5351, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 203)
  br label %5352

; <label>:5352:                                   ; preds = %5350, %145
  %5353 = load %struct.DState*, %struct.DState** %2, align 8
  %5354 = getelementptr inbounds %struct.DState, %struct.DState* %5353, i32 0, i32 1
  store i32 44, i32* %5354, align 8
  br label %5355

; <label>:5355:                                   ; preds = %5437, %5352
  %5356 = load %struct.DState*, %struct.DState** %2, align 8
  %5357 = getelementptr inbounds %struct.DState, %struct.DState* %5356, i32 0, i32 8
  %5358 = load i32, i32* %5357, align 4
  %5359 = icmp sge i32 %5358, 8
  br i1 %5359, label %5360, label %5376

; <label>:5360:                                   ; preds = %5355
  %5361 = load %struct.DState*, %struct.DState** %2, align 8
  %5362 = getelementptr inbounds %struct.DState, %struct.DState* %5361, i32 0, i32 7
  %5363 = load i32, i32* %5362, align 8
  %5364 = load %struct.DState*, %struct.DState** %2, align 8
  %5365 = getelementptr inbounds %struct.DState, %struct.DState* %5364, i32 0, i32 8
  %5366 = load i32, i32* %5365, align 4
  %5367 = sub nsw i32 %5366, 8
  %5368 = lshr i32 %5363, %5367
  %5369 = and i32 %5368, 255
  store i32 %5369, i32* %81, align 4
  %5370 = load %struct.DState*, %struct.DState** %2, align 8
  %5371 = getelementptr inbounds %struct.DState, %struct.DState* %5370, i32 0, i32 8
  %5372 = load i32, i32* %5371, align 4
  %5373 = sub nsw i32 %5372, 8
  store i32 %5373, i32* %5371, align 4
  %5374 = load i32, i32* %81, align 4
  %5375 = trunc i32 %5374 to i8
  store i8 %5375, i8* %3, align 1
  br label %5438

; <label>:5376:                                   ; preds = %5355
  %5377 = load %struct.DState*, %struct.DState** %2, align 8
  %5378 = getelementptr inbounds %struct.DState, %struct.DState* %5377, i32 0, i32 0
  %5379 = load %struct.bz_stream*, %struct.bz_stream** %5378, align 8
  %5380 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5379, i32 0, i32 1
  %5381 = load i32, i32* %5380, align 8
  %5382 = icmp eq i32 %5381, 0
  br i1 %5382, label %5383, label %5385

; <label>:5383:                                   ; preds = %5376
  %pgocount251 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 146)
  %5384 = add i64 %pgocount251, 1
  store i64 %5384, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 146)
  store i32 0, i32* %4, align 4
  br label %6029

; <label>:5385:                                   ; preds = %5376
  %pgocount252 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 33)
  %5386 = add i64 %pgocount252, 1
  store i64 %5386, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 33)
  %5387 = load %struct.DState*, %struct.DState** %2, align 8
  %5388 = getelementptr inbounds %struct.DState, %struct.DState* %5387, i32 0, i32 7
  %5389 = load i32, i32* %5388, align 8
  %5390 = shl i32 %5389, 8
  %5391 = load %struct.DState*, %struct.DState** %2, align 8
  %5392 = getelementptr inbounds %struct.DState, %struct.DState* %5391, i32 0, i32 0
  %5393 = load %struct.bz_stream*, %struct.bz_stream** %5392, align 8
  %5394 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5393, i32 0, i32 0
  %5395 = load i8*, i8** %5394, align 8
  %5396 = load i8, i8* %5395, align 1
  %5397 = zext i8 %5396 to i32
  %5398 = or i32 %5390, %5397
  %5399 = load %struct.DState*, %struct.DState** %2, align 8
  %5400 = getelementptr inbounds %struct.DState, %struct.DState* %5399, i32 0, i32 7
  store i32 %5398, i32* %5400, align 8
  %5401 = load %struct.DState*, %struct.DState** %2, align 8
  %5402 = getelementptr inbounds %struct.DState, %struct.DState* %5401, i32 0, i32 8
  %5403 = load i32, i32* %5402, align 4
  %5404 = add nsw i32 %5403, 8
  store i32 %5404, i32* %5402, align 4
  %5405 = load %struct.DState*, %struct.DState** %2, align 8
  %5406 = getelementptr inbounds %struct.DState, %struct.DState* %5405, i32 0, i32 0
  %5407 = load %struct.bz_stream*, %struct.bz_stream** %5406, align 8
  %5408 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5407, i32 0, i32 0
  %5409 = load i8*, i8** %5408, align 8
  %5410 = getelementptr inbounds i8, i8* %5409, i32 1
  store i8* %5410, i8** %5408, align 8
  %5411 = load %struct.DState*, %struct.DState** %2, align 8
  %5412 = getelementptr inbounds %struct.DState, %struct.DState* %5411, i32 0, i32 0
  %5413 = load %struct.bz_stream*, %struct.bz_stream** %5412, align 8
  %5414 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5413, i32 0, i32 1
  %5415 = load i32, i32* %5414, align 8
  %5416 = add i32 %5415, -1
  store i32 %5416, i32* %5414, align 8
  %5417 = load %struct.DState*, %struct.DState** %2, align 8
  %5418 = getelementptr inbounds %struct.DState, %struct.DState* %5417, i32 0, i32 0
  %5419 = load %struct.bz_stream*, %struct.bz_stream** %5418, align 8
  %5420 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5419, i32 0, i32 2
  %5421 = load i32, i32* %5420, align 4
  %5422 = add i32 %5421, 1
  store i32 %5422, i32* %5420, align 4
  %5423 = load %struct.DState*, %struct.DState** %2, align 8
  %5424 = getelementptr inbounds %struct.DState, %struct.DState* %5423, i32 0, i32 0
  %5425 = load %struct.bz_stream*, %struct.bz_stream** %5424, align 8
  %5426 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5425, i32 0, i32 2
  %5427 = load i32, i32* %5426, align 4
  %5428 = icmp eq i32 %5427, 0
  br i1 %5428, label %5429, label %5437

; <label>:5429:                                   ; preds = %5385
  %pgocount253 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 77)
  %5430 = add i64 %pgocount253, 1
  store i64 %5430, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 77)
  %5431 = load %struct.DState*, %struct.DState** %2, align 8
  %5432 = getelementptr inbounds %struct.DState, %struct.DState* %5431, i32 0, i32 0
  %5433 = load %struct.bz_stream*, %struct.bz_stream** %5432, align 8
  %5434 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5433, i32 0, i32 3
  %5435 = load i32, i32* %5434, align 8
  %5436 = add i32 %5435, 1
  store i32 %5436, i32* %5434, align 8
  br label %5437

; <label>:5437:                                   ; preds = %5429, %5385
  br label %5355

; <label>:5438:                                   ; preds = %5360
  %5439 = load i8, i8* %3, align 1
  %5440 = zext i8 %5439 to i32
  %5441 = icmp ne i32 %5440, 56
  br i1 %5441, label %5442, label %5444

; <label>:5442:                                   ; preds = %5438
  %pgocount254 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 195)
  %5443 = add i64 %pgocount254, 1
  store i64 %5443, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 195)
  store i32 -4, i32* %4, align 4
  br label %6029

; <label>:5444:                                   ; preds = %5438
  %pgocount255 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 196)
  %5445 = add i64 %pgocount255, 1
  store i64 %5445, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 196)
  br label %5446

; <label>:5446:                                   ; preds = %5444, %145
  %5447 = load %struct.DState*, %struct.DState** %2, align 8
  %5448 = getelementptr inbounds %struct.DState, %struct.DState* %5447, i32 0, i32 1
  store i32 45, i32* %5448, align 8
  br label %5449

; <label>:5449:                                   ; preds = %5531, %5446
  %5450 = load %struct.DState*, %struct.DState** %2, align 8
  %5451 = getelementptr inbounds %struct.DState, %struct.DState* %5450, i32 0, i32 8
  %5452 = load i32, i32* %5451, align 4
  %5453 = icmp sge i32 %5452, 8
  br i1 %5453, label %5454, label %5470

; <label>:5454:                                   ; preds = %5449
  %5455 = load %struct.DState*, %struct.DState** %2, align 8
  %5456 = getelementptr inbounds %struct.DState, %struct.DState* %5455, i32 0, i32 7
  %5457 = load i32, i32* %5456, align 8
  %5458 = load %struct.DState*, %struct.DState** %2, align 8
  %5459 = getelementptr inbounds %struct.DState, %struct.DState* %5458, i32 0, i32 8
  %5460 = load i32, i32* %5459, align 4
  %5461 = sub nsw i32 %5460, 8
  %5462 = lshr i32 %5457, %5461
  %5463 = and i32 %5462, 255
  store i32 %5463, i32* %82, align 4
  %5464 = load %struct.DState*, %struct.DState** %2, align 8
  %5465 = getelementptr inbounds %struct.DState, %struct.DState* %5464, i32 0, i32 8
  %5466 = load i32, i32* %5465, align 4
  %5467 = sub nsw i32 %5466, 8
  store i32 %5467, i32* %5465, align 4
  %5468 = load i32, i32* %82, align 4
  %5469 = trunc i32 %5468 to i8
  store i8 %5469, i8* %3, align 1
  br label %5532

; <label>:5470:                                   ; preds = %5449
  %5471 = load %struct.DState*, %struct.DState** %2, align 8
  %5472 = getelementptr inbounds %struct.DState, %struct.DState* %5471, i32 0, i32 0
  %5473 = load %struct.bz_stream*, %struct.bz_stream** %5472, align 8
  %5474 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5473, i32 0, i32 1
  %5475 = load i32, i32* %5474, align 8
  %5476 = icmp eq i32 %5475, 0
  br i1 %5476, label %5477, label %5479

; <label>:5477:                                   ; preds = %5470
  %pgocount256 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 144)
  %5478 = add i64 %pgocount256, 1
  store i64 %5478, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 144)
  store i32 0, i32* %4, align 4
  br label %6029

; <label>:5479:                                   ; preds = %5470
  %pgocount257 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 31)
  %5480 = add i64 %pgocount257, 1
  store i64 %5480, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 31)
  %5481 = load %struct.DState*, %struct.DState** %2, align 8
  %5482 = getelementptr inbounds %struct.DState, %struct.DState* %5481, i32 0, i32 7
  %5483 = load i32, i32* %5482, align 8
  %5484 = shl i32 %5483, 8
  %5485 = load %struct.DState*, %struct.DState** %2, align 8
  %5486 = getelementptr inbounds %struct.DState, %struct.DState* %5485, i32 0, i32 0
  %5487 = load %struct.bz_stream*, %struct.bz_stream** %5486, align 8
  %5488 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5487, i32 0, i32 0
  %5489 = load i8*, i8** %5488, align 8
  %5490 = load i8, i8* %5489, align 1
  %5491 = zext i8 %5490 to i32
  %5492 = or i32 %5484, %5491
  %5493 = load %struct.DState*, %struct.DState** %2, align 8
  %5494 = getelementptr inbounds %struct.DState, %struct.DState* %5493, i32 0, i32 7
  store i32 %5492, i32* %5494, align 8
  %5495 = load %struct.DState*, %struct.DState** %2, align 8
  %5496 = getelementptr inbounds %struct.DState, %struct.DState* %5495, i32 0, i32 8
  %5497 = load i32, i32* %5496, align 4
  %5498 = add nsw i32 %5497, 8
  store i32 %5498, i32* %5496, align 4
  %5499 = load %struct.DState*, %struct.DState** %2, align 8
  %5500 = getelementptr inbounds %struct.DState, %struct.DState* %5499, i32 0, i32 0
  %5501 = load %struct.bz_stream*, %struct.bz_stream** %5500, align 8
  %5502 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5501, i32 0, i32 0
  %5503 = load i8*, i8** %5502, align 8
  %5504 = getelementptr inbounds i8, i8* %5503, i32 1
  store i8* %5504, i8** %5502, align 8
  %5505 = load %struct.DState*, %struct.DState** %2, align 8
  %5506 = getelementptr inbounds %struct.DState, %struct.DState* %5505, i32 0, i32 0
  %5507 = load %struct.bz_stream*, %struct.bz_stream** %5506, align 8
  %5508 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5507, i32 0, i32 1
  %5509 = load i32, i32* %5508, align 8
  %5510 = add i32 %5509, -1
  store i32 %5510, i32* %5508, align 8
  %5511 = load %struct.DState*, %struct.DState** %2, align 8
  %5512 = getelementptr inbounds %struct.DState, %struct.DState* %5511, i32 0, i32 0
  %5513 = load %struct.bz_stream*, %struct.bz_stream** %5512, align 8
  %5514 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5513, i32 0, i32 2
  %5515 = load i32, i32* %5514, align 4
  %5516 = add i32 %5515, 1
  store i32 %5516, i32* %5514, align 4
  %5517 = load %struct.DState*, %struct.DState** %2, align 8
  %5518 = getelementptr inbounds %struct.DState, %struct.DState* %5517, i32 0, i32 0
  %5519 = load %struct.bz_stream*, %struct.bz_stream** %5518, align 8
  %5520 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5519, i32 0, i32 2
  %5521 = load i32, i32* %5520, align 4
  %5522 = icmp eq i32 %5521, 0
  br i1 %5522, label %5523, label %5531

; <label>:5523:                                   ; preds = %5479
  %pgocount258 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 75)
  %5524 = add i64 %pgocount258, 1
  store i64 %5524, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 75)
  %5525 = load %struct.DState*, %struct.DState** %2, align 8
  %5526 = getelementptr inbounds %struct.DState, %struct.DState* %5525, i32 0, i32 0
  %5527 = load %struct.bz_stream*, %struct.bz_stream** %5526, align 8
  %5528 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5527, i32 0, i32 3
  %5529 = load i32, i32* %5528, align 8
  %5530 = add i32 %5529, 1
  store i32 %5530, i32* %5528, align 8
  br label %5531

; <label>:5531:                                   ; preds = %5523, %5479
  br label %5449

; <label>:5532:                                   ; preds = %5454
  %5533 = load i8, i8* %3, align 1
  %5534 = zext i8 %5533 to i32
  %5535 = icmp ne i32 %5534, 80
  br i1 %5535, label %5536, label %5538

; <label>:5536:                                   ; preds = %5532
  %pgocount259 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 191)
  %5537 = add i64 %pgocount259, 1
  store i64 %5537, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 191)
  store i32 -4, i32* %4, align 4
  br label %6029

; <label>:5538:                                   ; preds = %5532
  %pgocount260 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 192)
  %5539 = add i64 %pgocount260, 1
  store i64 %5539, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 192)
  br label %5540

; <label>:5540:                                   ; preds = %5538, %145
  %5541 = load %struct.DState*, %struct.DState** %2, align 8
  %5542 = getelementptr inbounds %struct.DState, %struct.DState* %5541, i32 0, i32 1
  store i32 46, i32* %5542, align 8
  br label %5543

; <label>:5543:                                   ; preds = %5625, %5540
  %5544 = load %struct.DState*, %struct.DState** %2, align 8
  %5545 = getelementptr inbounds %struct.DState, %struct.DState* %5544, i32 0, i32 8
  %5546 = load i32, i32* %5545, align 4
  %5547 = icmp sge i32 %5546, 8
  br i1 %5547, label %5548, label %5564

; <label>:5548:                                   ; preds = %5543
  %5549 = load %struct.DState*, %struct.DState** %2, align 8
  %5550 = getelementptr inbounds %struct.DState, %struct.DState* %5549, i32 0, i32 7
  %5551 = load i32, i32* %5550, align 8
  %5552 = load %struct.DState*, %struct.DState** %2, align 8
  %5553 = getelementptr inbounds %struct.DState, %struct.DState* %5552, i32 0, i32 8
  %5554 = load i32, i32* %5553, align 4
  %5555 = sub nsw i32 %5554, 8
  %5556 = lshr i32 %5551, %5555
  %5557 = and i32 %5556, 255
  store i32 %5557, i32* %83, align 4
  %5558 = load %struct.DState*, %struct.DState** %2, align 8
  %5559 = getelementptr inbounds %struct.DState, %struct.DState* %5558, i32 0, i32 8
  %5560 = load i32, i32* %5559, align 4
  %5561 = sub nsw i32 %5560, 8
  store i32 %5561, i32* %5559, align 4
  %5562 = load i32, i32* %83, align 4
  %5563 = trunc i32 %5562 to i8
  store i8 %5563, i8* %3, align 1
  br label %5626

; <label>:5564:                                   ; preds = %5543
  %5565 = load %struct.DState*, %struct.DState** %2, align 8
  %5566 = getelementptr inbounds %struct.DState, %struct.DState* %5565, i32 0, i32 0
  %5567 = load %struct.bz_stream*, %struct.bz_stream** %5566, align 8
  %5568 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5567, i32 0, i32 1
  %5569 = load i32, i32* %5568, align 8
  %5570 = icmp eq i32 %5569, 0
  br i1 %5570, label %5571, label %5573

; <label>:5571:                                   ; preds = %5564
  %pgocount261 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 141)
  %5572 = add i64 %pgocount261, 1
  store i64 %5572, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 141)
  store i32 0, i32* %4, align 4
  br label %6029

; <label>:5573:                                   ; preds = %5564
  %pgocount262 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 29)
  %5574 = add i64 %pgocount262, 1
  store i64 %5574, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 29)
  %5575 = load %struct.DState*, %struct.DState** %2, align 8
  %5576 = getelementptr inbounds %struct.DState, %struct.DState* %5575, i32 0, i32 7
  %5577 = load i32, i32* %5576, align 8
  %5578 = shl i32 %5577, 8
  %5579 = load %struct.DState*, %struct.DState** %2, align 8
  %5580 = getelementptr inbounds %struct.DState, %struct.DState* %5579, i32 0, i32 0
  %5581 = load %struct.bz_stream*, %struct.bz_stream** %5580, align 8
  %5582 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5581, i32 0, i32 0
  %5583 = load i8*, i8** %5582, align 8
  %5584 = load i8, i8* %5583, align 1
  %5585 = zext i8 %5584 to i32
  %5586 = or i32 %5578, %5585
  %5587 = load %struct.DState*, %struct.DState** %2, align 8
  %5588 = getelementptr inbounds %struct.DState, %struct.DState* %5587, i32 0, i32 7
  store i32 %5586, i32* %5588, align 8
  %5589 = load %struct.DState*, %struct.DState** %2, align 8
  %5590 = getelementptr inbounds %struct.DState, %struct.DState* %5589, i32 0, i32 8
  %5591 = load i32, i32* %5590, align 4
  %5592 = add nsw i32 %5591, 8
  store i32 %5592, i32* %5590, align 4
  %5593 = load %struct.DState*, %struct.DState** %2, align 8
  %5594 = getelementptr inbounds %struct.DState, %struct.DState* %5593, i32 0, i32 0
  %5595 = load %struct.bz_stream*, %struct.bz_stream** %5594, align 8
  %5596 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5595, i32 0, i32 0
  %5597 = load i8*, i8** %5596, align 8
  %5598 = getelementptr inbounds i8, i8* %5597, i32 1
  store i8* %5598, i8** %5596, align 8
  %5599 = load %struct.DState*, %struct.DState** %2, align 8
  %5600 = getelementptr inbounds %struct.DState, %struct.DState* %5599, i32 0, i32 0
  %5601 = load %struct.bz_stream*, %struct.bz_stream** %5600, align 8
  %5602 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5601, i32 0, i32 1
  %5603 = load i32, i32* %5602, align 8
  %5604 = add i32 %5603, -1
  store i32 %5604, i32* %5602, align 8
  %5605 = load %struct.DState*, %struct.DState** %2, align 8
  %5606 = getelementptr inbounds %struct.DState, %struct.DState* %5605, i32 0, i32 0
  %5607 = load %struct.bz_stream*, %struct.bz_stream** %5606, align 8
  %5608 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5607, i32 0, i32 2
  %5609 = load i32, i32* %5608, align 4
  %5610 = add i32 %5609, 1
  store i32 %5610, i32* %5608, align 4
  %5611 = load %struct.DState*, %struct.DState** %2, align 8
  %5612 = getelementptr inbounds %struct.DState, %struct.DState* %5611, i32 0, i32 0
  %5613 = load %struct.bz_stream*, %struct.bz_stream** %5612, align 8
  %5614 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5613, i32 0, i32 2
  %5615 = load i32, i32* %5614, align 4
  %5616 = icmp eq i32 %5615, 0
  br i1 %5616, label %5617, label %5625

; <label>:5617:                                   ; preds = %5573
  %pgocount263 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 73)
  %5618 = add i64 %pgocount263, 1
  store i64 %5618, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 73)
  %5619 = load %struct.DState*, %struct.DState** %2, align 8
  %5620 = getelementptr inbounds %struct.DState, %struct.DState* %5619, i32 0, i32 0
  %5621 = load %struct.bz_stream*, %struct.bz_stream** %5620, align 8
  %5622 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5621, i32 0, i32 3
  %5623 = load i32, i32* %5622, align 8
  %5624 = add i32 %5623, 1
  store i32 %5624, i32* %5622, align 8
  br label %5625

; <label>:5625:                                   ; preds = %5617, %5573
  br label %5543

; <label>:5626:                                   ; preds = %5548
  %5627 = load i8, i8* %3, align 1
  %5628 = zext i8 %5627 to i32
  %5629 = icmp ne i32 %5628, 144
  br i1 %5629, label %5630, label %5632

; <label>:5630:                                   ; preds = %5626
  %pgocount264 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 189)
  %5631 = add i64 %pgocount264, 1
  store i64 %5631, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 189)
  store i32 -4, i32* %4, align 4
  br label %6029

; <label>:5632:                                   ; preds = %5626
  %pgocount265 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 190)
  %5633 = add i64 %pgocount265, 1
  store i64 %5633, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 190)
  %5634 = load %struct.DState*, %struct.DState** %2, align 8
  %5635 = getelementptr inbounds %struct.DState, %struct.DState* %5634, i32 0, i32 24
  store i32 0, i32* %5635, align 4
  br label %5636

; <label>:5636:                                   ; preds = %5632, %145
  %5637 = load %struct.DState*, %struct.DState** %2, align 8
  %5638 = getelementptr inbounds %struct.DState, %struct.DState* %5637, i32 0, i32 1
  store i32 47, i32* %5638, align 8
  br label %5639

; <label>:5639:                                   ; preds = %5721, %5636
  %5640 = load %struct.DState*, %struct.DState** %2, align 8
  %5641 = getelementptr inbounds %struct.DState, %struct.DState* %5640, i32 0, i32 8
  %5642 = load i32, i32* %5641, align 4
  %5643 = icmp sge i32 %5642, 8
  br i1 %5643, label %5644, label %5660

; <label>:5644:                                   ; preds = %5639
  %5645 = load %struct.DState*, %struct.DState** %2, align 8
  %5646 = getelementptr inbounds %struct.DState, %struct.DState* %5645, i32 0, i32 7
  %5647 = load i32, i32* %5646, align 8
  %5648 = load %struct.DState*, %struct.DState** %2, align 8
  %5649 = getelementptr inbounds %struct.DState, %struct.DState* %5648, i32 0, i32 8
  %5650 = load i32, i32* %5649, align 4
  %5651 = sub nsw i32 %5650, 8
  %5652 = lshr i32 %5647, %5651
  %5653 = and i32 %5652, 255
  store i32 %5653, i32* %84, align 4
  %5654 = load %struct.DState*, %struct.DState** %2, align 8
  %5655 = getelementptr inbounds %struct.DState, %struct.DState* %5654, i32 0, i32 8
  %5656 = load i32, i32* %5655, align 4
  %5657 = sub nsw i32 %5656, 8
  store i32 %5657, i32* %5655, align 4
  %5658 = load i32, i32* %84, align 4
  %5659 = trunc i32 %5658 to i8
  store i8 %5659, i8* %3, align 1
  br label %5722

; <label>:5660:                                   ; preds = %5639
  %5661 = load %struct.DState*, %struct.DState** %2, align 8
  %5662 = getelementptr inbounds %struct.DState, %struct.DState* %5661, i32 0, i32 0
  %5663 = load %struct.bz_stream*, %struct.bz_stream** %5662, align 8
  %5664 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5663, i32 0, i32 1
  %5665 = load i32, i32* %5664, align 8
  %5666 = icmp eq i32 %5665, 0
  br i1 %5666, label %5667, label %5669

; <label>:5667:                                   ; preds = %5660
  %pgocount266 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 142)
  %5668 = add i64 %pgocount266, 1
  store i64 %5668, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 142)
  store i32 0, i32* %4, align 4
  br label %6029

; <label>:5669:                                   ; preds = %5660
  %pgocount267 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 27)
  %5670 = add i64 %pgocount267, 1
  store i64 %5670, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 27)
  %5671 = load %struct.DState*, %struct.DState** %2, align 8
  %5672 = getelementptr inbounds %struct.DState, %struct.DState* %5671, i32 0, i32 7
  %5673 = load i32, i32* %5672, align 8
  %5674 = shl i32 %5673, 8
  %5675 = load %struct.DState*, %struct.DState** %2, align 8
  %5676 = getelementptr inbounds %struct.DState, %struct.DState* %5675, i32 0, i32 0
  %5677 = load %struct.bz_stream*, %struct.bz_stream** %5676, align 8
  %5678 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5677, i32 0, i32 0
  %5679 = load i8*, i8** %5678, align 8
  %5680 = load i8, i8* %5679, align 1
  %5681 = zext i8 %5680 to i32
  %5682 = or i32 %5674, %5681
  %5683 = load %struct.DState*, %struct.DState** %2, align 8
  %5684 = getelementptr inbounds %struct.DState, %struct.DState* %5683, i32 0, i32 7
  store i32 %5682, i32* %5684, align 8
  %5685 = load %struct.DState*, %struct.DState** %2, align 8
  %5686 = getelementptr inbounds %struct.DState, %struct.DState* %5685, i32 0, i32 8
  %5687 = load i32, i32* %5686, align 4
  %5688 = add nsw i32 %5687, 8
  store i32 %5688, i32* %5686, align 4
  %5689 = load %struct.DState*, %struct.DState** %2, align 8
  %5690 = getelementptr inbounds %struct.DState, %struct.DState* %5689, i32 0, i32 0
  %5691 = load %struct.bz_stream*, %struct.bz_stream** %5690, align 8
  %5692 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5691, i32 0, i32 0
  %5693 = load i8*, i8** %5692, align 8
  %5694 = getelementptr inbounds i8, i8* %5693, i32 1
  store i8* %5694, i8** %5692, align 8
  %5695 = load %struct.DState*, %struct.DState** %2, align 8
  %5696 = getelementptr inbounds %struct.DState, %struct.DState* %5695, i32 0, i32 0
  %5697 = load %struct.bz_stream*, %struct.bz_stream** %5696, align 8
  %5698 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5697, i32 0, i32 1
  %5699 = load i32, i32* %5698, align 8
  %5700 = add i32 %5699, -1
  store i32 %5700, i32* %5698, align 8
  %5701 = load %struct.DState*, %struct.DState** %2, align 8
  %5702 = getelementptr inbounds %struct.DState, %struct.DState* %5701, i32 0, i32 0
  %5703 = load %struct.bz_stream*, %struct.bz_stream** %5702, align 8
  %5704 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5703, i32 0, i32 2
  %5705 = load i32, i32* %5704, align 4
  %5706 = add i32 %5705, 1
  store i32 %5706, i32* %5704, align 4
  %5707 = load %struct.DState*, %struct.DState** %2, align 8
  %5708 = getelementptr inbounds %struct.DState, %struct.DState* %5707, i32 0, i32 0
  %5709 = load %struct.bz_stream*, %struct.bz_stream** %5708, align 8
  %5710 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5709, i32 0, i32 2
  %5711 = load i32, i32* %5710, align 4
  %5712 = icmp eq i32 %5711, 0
  br i1 %5712, label %5713, label %5721

; <label>:5713:                                   ; preds = %5669
  %pgocount268 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 71)
  %5714 = add i64 %pgocount268, 1
  store i64 %5714, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 71)
  %5715 = load %struct.DState*, %struct.DState** %2, align 8
  %5716 = getelementptr inbounds %struct.DState, %struct.DState* %5715, i32 0, i32 0
  %5717 = load %struct.bz_stream*, %struct.bz_stream** %5716, align 8
  %5718 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5717, i32 0, i32 3
  %5719 = load i32, i32* %5718, align 8
  %5720 = add i32 %5719, 1
  store i32 %5720, i32* %5718, align 8
  br label %5721

; <label>:5721:                                   ; preds = %5713, %5669
  br label %5639

; <label>:5722:                                   ; preds = %5644
  %pgocount269 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 134)
  %5723 = add i64 %pgocount269, 1
  store i64 %5723, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 134)
  %5724 = load %struct.DState*, %struct.DState** %2, align 8
  %5725 = getelementptr inbounds %struct.DState, %struct.DState* %5724, i32 0, i32 24
  %5726 = load i32, i32* %5725, align 4
  %5727 = shl i32 %5726, 8
  %5728 = load i8, i8* %3, align 1
  %5729 = zext i8 %5728 to i32
  %5730 = or i32 %5727, %5729
  %5731 = load %struct.DState*, %struct.DState** %2, align 8
  %5732 = getelementptr inbounds %struct.DState, %struct.DState* %5731, i32 0, i32 24
  store i32 %5730, i32* %5732, align 4
  br label %5733

; <label>:5733:                                   ; preds = %5722, %145
  %5734 = load %struct.DState*, %struct.DState** %2, align 8
  %5735 = getelementptr inbounds %struct.DState, %struct.DState* %5734, i32 0, i32 1
  store i32 48, i32* %5735, align 8
  br label %5736

; <label>:5736:                                   ; preds = %5818, %5733
  %5737 = load %struct.DState*, %struct.DState** %2, align 8
  %5738 = getelementptr inbounds %struct.DState, %struct.DState* %5737, i32 0, i32 8
  %5739 = load i32, i32* %5738, align 4
  %5740 = icmp sge i32 %5739, 8
  br i1 %5740, label %5741, label %5757

; <label>:5741:                                   ; preds = %5736
  %5742 = load %struct.DState*, %struct.DState** %2, align 8
  %5743 = getelementptr inbounds %struct.DState, %struct.DState* %5742, i32 0, i32 7
  %5744 = load i32, i32* %5743, align 8
  %5745 = load %struct.DState*, %struct.DState** %2, align 8
  %5746 = getelementptr inbounds %struct.DState, %struct.DState* %5745, i32 0, i32 8
  %5747 = load i32, i32* %5746, align 4
  %5748 = sub nsw i32 %5747, 8
  %5749 = lshr i32 %5744, %5748
  %5750 = and i32 %5749, 255
  store i32 %5750, i32* %85, align 4
  %5751 = load %struct.DState*, %struct.DState** %2, align 8
  %5752 = getelementptr inbounds %struct.DState, %struct.DState* %5751, i32 0, i32 8
  %5753 = load i32, i32* %5752, align 4
  %5754 = sub nsw i32 %5753, 8
  store i32 %5754, i32* %5752, align 4
  %5755 = load i32, i32* %85, align 4
  %5756 = trunc i32 %5755 to i8
  store i8 %5756, i8* %3, align 1
  br label %5819

; <label>:5757:                                   ; preds = %5736
  %5758 = load %struct.DState*, %struct.DState** %2, align 8
  %5759 = getelementptr inbounds %struct.DState, %struct.DState* %5758, i32 0, i32 0
  %5760 = load %struct.bz_stream*, %struct.bz_stream** %5759, align 8
  %5761 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5760, i32 0, i32 1
  %5762 = load i32, i32* %5761, align 8
  %5763 = icmp eq i32 %5762, 0
  br i1 %5763, label %5764, label %5766

; <label>:5764:                                   ; preds = %5757
  %pgocount270 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 126)
  %5765 = add i64 %pgocount270, 1
  store i64 %5765, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 126)
  store i32 0, i32* %4, align 4
  br label %6029

; <label>:5766:                                   ; preds = %5757
  %pgocount271 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 13)
  %5767 = add i64 %pgocount271, 1
  store i64 %5767, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 13)
  %5768 = load %struct.DState*, %struct.DState** %2, align 8
  %5769 = getelementptr inbounds %struct.DState, %struct.DState* %5768, i32 0, i32 7
  %5770 = load i32, i32* %5769, align 8
  %5771 = shl i32 %5770, 8
  %5772 = load %struct.DState*, %struct.DState** %2, align 8
  %5773 = getelementptr inbounds %struct.DState, %struct.DState* %5772, i32 0, i32 0
  %5774 = load %struct.bz_stream*, %struct.bz_stream** %5773, align 8
  %5775 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5774, i32 0, i32 0
  %5776 = load i8*, i8** %5775, align 8
  %5777 = load i8, i8* %5776, align 1
  %5778 = zext i8 %5777 to i32
  %5779 = or i32 %5771, %5778
  %5780 = load %struct.DState*, %struct.DState** %2, align 8
  %5781 = getelementptr inbounds %struct.DState, %struct.DState* %5780, i32 0, i32 7
  store i32 %5779, i32* %5781, align 8
  %5782 = load %struct.DState*, %struct.DState** %2, align 8
  %5783 = getelementptr inbounds %struct.DState, %struct.DState* %5782, i32 0, i32 8
  %5784 = load i32, i32* %5783, align 4
  %5785 = add nsw i32 %5784, 8
  store i32 %5785, i32* %5783, align 4
  %5786 = load %struct.DState*, %struct.DState** %2, align 8
  %5787 = getelementptr inbounds %struct.DState, %struct.DState* %5786, i32 0, i32 0
  %5788 = load %struct.bz_stream*, %struct.bz_stream** %5787, align 8
  %5789 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5788, i32 0, i32 0
  %5790 = load i8*, i8** %5789, align 8
  %5791 = getelementptr inbounds i8, i8* %5790, i32 1
  store i8* %5791, i8** %5789, align 8
  %5792 = load %struct.DState*, %struct.DState** %2, align 8
  %5793 = getelementptr inbounds %struct.DState, %struct.DState* %5792, i32 0, i32 0
  %5794 = load %struct.bz_stream*, %struct.bz_stream** %5793, align 8
  %5795 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5794, i32 0, i32 1
  %5796 = load i32, i32* %5795, align 8
  %5797 = add i32 %5796, -1
  store i32 %5797, i32* %5795, align 8
  %5798 = load %struct.DState*, %struct.DState** %2, align 8
  %5799 = getelementptr inbounds %struct.DState, %struct.DState* %5798, i32 0, i32 0
  %5800 = load %struct.bz_stream*, %struct.bz_stream** %5799, align 8
  %5801 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5800, i32 0, i32 2
  %5802 = load i32, i32* %5801, align 4
  %5803 = add i32 %5802, 1
  store i32 %5803, i32* %5801, align 4
  %5804 = load %struct.DState*, %struct.DState** %2, align 8
  %5805 = getelementptr inbounds %struct.DState, %struct.DState* %5804, i32 0, i32 0
  %5806 = load %struct.bz_stream*, %struct.bz_stream** %5805, align 8
  %5807 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5806, i32 0, i32 2
  %5808 = load i32, i32* %5807, align 4
  %5809 = icmp eq i32 %5808, 0
  br i1 %5809, label %5810, label %5818

; <label>:5810:                                   ; preds = %5766
  %pgocount272 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 62)
  %5811 = add i64 %pgocount272, 1
  store i64 %5811, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 62)
  %5812 = load %struct.DState*, %struct.DState** %2, align 8
  %5813 = getelementptr inbounds %struct.DState, %struct.DState* %5812, i32 0, i32 0
  %5814 = load %struct.bz_stream*, %struct.bz_stream** %5813, align 8
  %5815 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5814, i32 0, i32 3
  %5816 = load i32, i32* %5815, align 8
  %5817 = add i32 %5816, 1
  store i32 %5817, i32* %5815, align 8
  br label %5818

; <label>:5818:                                   ; preds = %5810, %5766
  br label %5736

; <label>:5819:                                   ; preds = %5741
  %pgocount273 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 123)
  %5820 = add i64 %pgocount273, 1
  store i64 %5820, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 123)
  %5821 = load %struct.DState*, %struct.DState** %2, align 8
  %5822 = getelementptr inbounds %struct.DState, %struct.DState* %5821, i32 0, i32 24
  %5823 = load i32, i32* %5822, align 4
  %5824 = shl i32 %5823, 8
  %5825 = load i8, i8* %3, align 1
  %5826 = zext i8 %5825 to i32
  %5827 = or i32 %5824, %5826
  %5828 = load %struct.DState*, %struct.DState** %2, align 8
  %5829 = getelementptr inbounds %struct.DState, %struct.DState* %5828, i32 0, i32 24
  store i32 %5827, i32* %5829, align 4
  br label %5830

; <label>:5830:                                   ; preds = %5819, %145
  %5831 = load %struct.DState*, %struct.DState** %2, align 8
  %5832 = getelementptr inbounds %struct.DState, %struct.DState* %5831, i32 0, i32 1
  store i32 49, i32* %5832, align 8
  br label %5833

; <label>:5833:                                   ; preds = %5914, %5830
  %5834 = load %struct.DState*, %struct.DState** %2, align 8
  %5835 = getelementptr inbounds %struct.DState, %struct.DState* %5834, i32 0, i32 8
  %5836 = load i32, i32* %5835, align 4
  %5837 = icmp sge i32 %5836, 8
  br i1 %5837, label %5838, label %5854

; <label>:5838:                                   ; preds = %5833
  %5839 = load %struct.DState*, %struct.DState** %2, align 8
  %5840 = getelementptr inbounds %struct.DState, %struct.DState* %5839, i32 0, i32 7
  %5841 = load i32, i32* %5840, align 8
  %5842 = load %struct.DState*, %struct.DState** %2, align 8
  %5843 = getelementptr inbounds %struct.DState, %struct.DState* %5842, i32 0, i32 8
  %5844 = load i32, i32* %5843, align 4
  %5845 = sub nsw i32 %5844, 8
  %5846 = lshr i32 %5841, %5845
  %5847 = and i32 %5846, 255
  store i32 %5847, i32* %86, align 4
  %5848 = load %struct.DState*, %struct.DState** %2, align 8
  %5849 = getelementptr inbounds %struct.DState, %struct.DState* %5848, i32 0, i32 8
  %5850 = load i32, i32* %5849, align 4
  %5851 = sub nsw i32 %5850, 8
  store i32 %5851, i32* %5849, align 4
  %5852 = load i32, i32* %86, align 4
  %5853 = trunc i32 %5852 to i8
  store i8 %5853, i8* %3, align 1
  br label %5916

; <label>:5854:                                   ; preds = %5833
  %5855 = load %struct.DState*, %struct.DState** %2, align 8
  %5856 = getelementptr inbounds %struct.DState, %struct.DState* %5855, i32 0, i32 0
  %5857 = load %struct.bz_stream*, %struct.bz_stream** %5856, align 8
  %5858 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5857, i32 0, i32 1
  %5859 = load i32, i32* %5858, align 8
  %5860 = icmp eq i32 %5859, 0
  br i1 %5860, label %5861, label %5863

; <label>:5861:                                   ; preds = %5854
  %pgocount274 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 120)
  %5862 = add i64 %pgocount274, 1
  store i64 %5862, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 120)
  store i32 0, i32* %4, align 4
  br label %6029

; <label>:5863:                                   ; preds = %5854
  %5864 = load %struct.DState*, %struct.DState** %2, align 8
  %5865 = getelementptr inbounds %struct.DState, %struct.DState* %5864, i32 0, i32 7
  %5866 = load i32, i32* %5865, align 8
  %5867 = shl i32 %5866, 8
  %5868 = load %struct.DState*, %struct.DState** %2, align 8
  %5869 = getelementptr inbounds %struct.DState, %struct.DState* %5868, i32 0, i32 0
  %5870 = load %struct.bz_stream*, %struct.bz_stream** %5869, align 8
  %5871 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5870, i32 0, i32 0
  %5872 = load i8*, i8** %5871, align 8
  %5873 = load i8, i8* %5872, align 1
  %5874 = zext i8 %5873 to i32
  %5875 = or i32 %5867, %5874
  %5876 = load %struct.DState*, %struct.DState** %2, align 8
  %5877 = getelementptr inbounds %struct.DState, %struct.DState* %5876, i32 0, i32 7
  store i32 %5875, i32* %5877, align 8
  %5878 = load %struct.DState*, %struct.DState** %2, align 8
  %5879 = getelementptr inbounds %struct.DState, %struct.DState* %5878, i32 0, i32 8
  %5880 = load i32, i32* %5879, align 4
  %5881 = add nsw i32 %5880, 8
  store i32 %5881, i32* %5879, align 4
  %5882 = load %struct.DState*, %struct.DState** %2, align 8
  %5883 = getelementptr inbounds %struct.DState, %struct.DState* %5882, i32 0, i32 0
  %5884 = load %struct.bz_stream*, %struct.bz_stream** %5883, align 8
  %5885 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5884, i32 0, i32 0
  %5886 = load i8*, i8** %5885, align 8
  %5887 = getelementptr inbounds i8, i8* %5886, i32 1
  store i8* %5887, i8** %5885, align 8
  %5888 = load %struct.DState*, %struct.DState** %2, align 8
  %5889 = getelementptr inbounds %struct.DState, %struct.DState* %5888, i32 0, i32 0
  %5890 = load %struct.bz_stream*, %struct.bz_stream** %5889, align 8
  %5891 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5890, i32 0, i32 1
  %5892 = load i32, i32* %5891, align 8
  %5893 = add i32 %5892, -1
  store i32 %5893, i32* %5891, align 8
  %5894 = load %struct.DState*, %struct.DState** %2, align 8
  %5895 = getelementptr inbounds %struct.DState, %struct.DState* %5894, i32 0, i32 0
  %5896 = load %struct.bz_stream*, %struct.bz_stream** %5895, align 8
  %5897 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5896, i32 0, i32 2
  %5898 = load i32, i32* %5897, align 4
  %5899 = add i32 %5898, 1
  store i32 %5899, i32* %5897, align 4
  %5900 = load %struct.DState*, %struct.DState** %2, align 8
  %5901 = getelementptr inbounds %struct.DState, %struct.DState* %5900, i32 0, i32 0
  %5902 = load %struct.bz_stream*, %struct.bz_stream** %5901, align 8
  %5903 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5902, i32 0, i32 2
  %5904 = load i32, i32* %5903, align 4
  %5905 = icmp eq i32 %5904, 0
  br i1 %5905, label %5906, label %5914

; <label>:5906:                                   ; preds = %5863
  %pgocount275 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 60)
  %5907 = add i64 %pgocount275, 1
  store i64 %5907, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 60)
  %5908 = load %struct.DState*, %struct.DState** %2, align 8
  %5909 = getelementptr inbounds %struct.DState, %struct.DState* %5908, i32 0, i32 0
  %5910 = load %struct.bz_stream*, %struct.bz_stream** %5909, align 8
  %5911 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5910, i32 0, i32 3
  %5912 = load i32, i32* %5911, align 8
  %5913 = add i32 %5912, 1
  store i32 %5913, i32* %5911, align 8
  br label %5914

; <label>:5914:                                   ; preds = %5906, %5863
  %pgocount276 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 11)
  %5915 = add i64 %pgocount276, 1
  store i64 %5915, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 11)
  br label %5833

; <label>:5916:                                   ; preds = %5838
  %pgocount277 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 118)
  %5917 = add i64 %pgocount277, 1
  store i64 %5917, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 118)
  %5918 = load %struct.DState*, %struct.DState** %2, align 8
  %5919 = getelementptr inbounds %struct.DState, %struct.DState* %5918, i32 0, i32 24
  %5920 = load i32, i32* %5919, align 4
  %5921 = shl i32 %5920, 8
  %5922 = load i8, i8* %3, align 1
  %5923 = zext i8 %5922 to i32
  %5924 = or i32 %5921, %5923
  %5925 = load %struct.DState*, %struct.DState** %2, align 8
  %5926 = getelementptr inbounds %struct.DState, %struct.DState* %5925, i32 0, i32 24
  store i32 %5924, i32* %5926, align 4
  br label %5927

; <label>:5927:                                   ; preds = %5916, %145
  %5928 = load %struct.DState*, %struct.DState** %2, align 8
  %5929 = getelementptr inbounds %struct.DState, %struct.DState* %5928, i32 0, i32 1
  store i32 50, i32* %5929, align 8
  br label %5930

; <label>:5930:                                   ; preds = %6012, %5927
  %5931 = load %struct.DState*, %struct.DState** %2, align 8
  %5932 = getelementptr inbounds %struct.DState, %struct.DState* %5931, i32 0, i32 8
  %5933 = load i32, i32* %5932, align 4
  %5934 = icmp sge i32 %5933, 8
  br i1 %5934, label %5935, label %5951

; <label>:5935:                                   ; preds = %5930
  %5936 = load %struct.DState*, %struct.DState** %2, align 8
  %5937 = getelementptr inbounds %struct.DState, %struct.DState* %5936, i32 0, i32 7
  %5938 = load i32, i32* %5937, align 8
  %5939 = load %struct.DState*, %struct.DState** %2, align 8
  %5940 = getelementptr inbounds %struct.DState, %struct.DState* %5939, i32 0, i32 8
  %5941 = load i32, i32* %5940, align 4
  %5942 = sub nsw i32 %5941, 8
  %5943 = lshr i32 %5938, %5942
  %5944 = and i32 %5943, 255
  store i32 %5944, i32* %87, align 4
  %5945 = load %struct.DState*, %struct.DState** %2, align 8
  %5946 = getelementptr inbounds %struct.DState, %struct.DState* %5945, i32 0, i32 8
  %5947 = load i32, i32* %5946, align 4
  %5948 = sub nsw i32 %5947, 8
  store i32 %5948, i32* %5946, align 4
  %5949 = load i32, i32* %87, align 4
  %5950 = trunc i32 %5949 to i8
  store i8 %5950, i8* %3, align 1
  br label %6013

; <label>:5951:                                   ; preds = %5930
  %5952 = load %struct.DState*, %struct.DState** %2, align 8
  %5953 = getelementptr inbounds %struct.DState, %struct.DState* %5952, i32 0, i32 0
  %5954 = load %struct.bz_stream*, %struct.bz_stream** %5953, align 8
  %5955 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5954, i32 0, i32 1
  %5956 = load i32, i32* %5955, align 8
  %5957 = icmp eq i32 %5956, 0
  br i1 %5957, label %5958, label %5960

; <label>:5958:                                   ; preds = %5951
  %pgocount278 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 116)
  %5959 = add i64 %pgocount278, 1
  store i64 %5959, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 116)
  store i32 0, i32* %4, align 4
  br label %6029

; <label>:5960:                                   ; preds = %5951
  %pgocount279 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 9)
  %5961 = add i64 %pgocount279, 1
  store i64 %5961, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 9)
  %5962 = load %struct.DState*, %struct.DState** %2, align 8
  %5963 = getelementptr inbounds %struct.DState, %struct.DState* %5962, i32 0, i32 7
  %5964 = load i32, i32* %5963, align 8
  %5965 = shl i32 %5964, 8
  %5966 = load %struct.DState*, %struct.DState** %2, align 8
  %5967 = getelementptr inbounds %struct.DState, %struct.DState* %5966, i32 0, i32 0
  %5968 = load %struct.bz_stream*, %struct.bz_stream** %5967, align 8
  %5969 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5968, i32 0, i32 0
  %5970 = load i8*, i8** %5969, align 8
  %5971 = load i8, i8* %5970, align 1
  %5972 = zext i8 %5971 to i32
  %5973 = or i32 %5965, %5972
  %5974 = load %struct.DState*, %struct.DState** %2, align 8
  %5975 = getelementptr inbounds %struct.DState, %struct.DState* %5974, i32 0, i32 7
  store i32 %5973, i32* %5975, align 8
  %5976 = load %struct.DState*, %struct.DState** %2, align 8
  %5977 = getelementptr inbounds %struct.DState, %struct.DState* %5976, i32 0, i32 8
  %5978 = load i32, i32* %5977, align 4
  %5979 = add nsw i32 %5978, 8
  store i32 %5979, i32* %5977, align 4
  %5980 = load %struct.DState*, %struct.DState** %2, align 8
  %5981 = getelementptr inbounds %struct.DState, %struct.DState* %5980, i32 0, i32 0
  %5982 = load %struct.bz_stream*, %struct.bz_stream** %5981, align 8
  %5983 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5982, i32 0, i32 0
  %5984 = load i8*, i8** %5983, align 8
  %5985 = getelementptr inbounds i8, i8* %5984, i32 1
  store i8* %5985, i8** %5983, align 8
  %5986 = load %struct.DState*, %struct.DState** %2, align 8
  %5987 = getelementptr inbounds %struct.DState, %struct.DState* %5986, i32 0, i32 0
  %5988 = load %struct.bz_stream*, %struct.bz_stream** %5987, align 8
  %5989 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5988, i32 0, i32 1
  %5990 = load i32, i32* %5989, align 8
  %5991 = add i32 %5990, -1
  store i32 %5991, i32* %5989, align 8
  %5992 = load %struct.DState*, %struct.DState** %2, align 8
  %5993 = getelementptr inbounds %struct.DState, %struct.DState* %5992, i32 0, i32 0
  %5994 = load %struct.bz_stream*, %struct.bz_stream** %5993, align 8
  %5995 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %5994, i32 0, i32 2
  %5996 = load i32, i32* %5995, align 4
  %5997 = add i32 %5996, 1
  store i32 %5997, i32* %5995, align 4
  %5998 = load %struct.DState*, %struct.DState** %2, align 8
  %5999 = getelementptr inbounds %struct.DState, %struct.DState* %5998, i32 0, i32 0
  %6000 = load %struct.bz_stream*, %struct.bz_stream** %5999, align 8
  %6001 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %6000, i32 0, i32 2
  %6002 = load i32, i32* %6001, align 4
  %6003 = icmp eq i32 %6002, 0
  br i1 %6003, label %6004, label %6012

; <label>:6004:                                   ; preds = %5960
  %pgocount280 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 59)
  %6005 = add i64 %pgocount280, 1
  store i64 %6005, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 59)
  %6006 = load %struct.DState*, %struct.DState** %2, align 8
  %6007 = getelementptr inbounds %struct.DState, %struct.DState* %6006, i32 0, i32 0
  %6008 = load %struct.bz_stream*, %struct.bz_stream** %6007, align 8
  %6009 = getelementptr inbounds %struct.bz_stream, %struct.bz_stream* %6008, i32 0, i32 3
  %6010 = load i32, i32* %6009, align 8
  %6011 = add i32 %6010, 1
  store i32 %6011, i32* %6009, align 8
  br label %6012

; <label>:6012:                                   ; preds = %6004, %5960
  br label %5930

; <label>:6013:                                   ; preds = %5935
  %pgocount281 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 113)
  %6014 = add i64 %pgocount281, 1
  store i64 %6014, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 113)
  %6015 = load %struct.DState*, %struct.DState** %2, align 8
  %6016 = getelementptr inbounds %struct.DState, %struct.DState* %6015, i32 0, i32 24
  %6017 = load i32, i32* %6016, align 4
  %6018 = shl i32 %6017, 8
  %6019 = load i8, i8* %3, align 1
  %6020 = zext i8 %6019 to i32
  %6021 = or i32 %6018, %6020
  %6022 = load %struct.DState*, %struct.DState** %2, align 8
  %6023 = getelementptr inbounds %struct.DState, %struct.DState* %6022, i32 0, i32 24
  store i32 %6021, i32* %6023, align 4
  %6024 = load %struct.DState*, %struct.DState** %2, align 8
  %6025 = getelementptr inbounds %struct.DState, %struct.DState* %6024, i32 0, i32 1
  store i32 1, i32* %6025, align 8
  store i32 4, i32* %4, align 4
  br label %6029

; <label>:6026:                                   ; preds = %145
  call void @BZ2_bz__AssertH__fail(i32 4001)
  br label %6027

; <label>:6027:                                   ; preds = %6026
  %pgocount282 = load i64, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 108)
  %6028 = add i64 %pgocount282, 1
  store i64 %6028, i64* getelementptr inbounds ([283 x i64], [283 x i64]* @__profc_BZ2_decompress, i64 0, i64 108)
  call void @BZ2_bz__AssertH__fail(i32 4002)
  br label %6029

; <label>:6029:                                   ; preds = %6027, %6013, %5958, %5861, %5764, %5667, %5630, %5571, %5536, %5477, %5442, %5383, %5348, %5289, %5254, %5195, %5161, %4572, %4502, %4475, %4396, %4351, %4292, %4216, %3887, %3864, %3838, %3777, %3697, %3652, %3593, %3518, %3459, %3379, %3334, %3275, %3199, %2941, %2848, %2814, %2745, %2630, %2564, %2523, %2465, %2431, %2369, %2331, %2247, %2104, %2065, %2053, %1984, %1887, %1790, %1700, %1601, %1504, %1407, %1310, %1257, %1198, %1163, %1104, %1069, %1010, %975, %916, %881, %822, %787, %723, %687, %660, %601, %535, %499, %440, %405, %346, %311, %252
  %6030 = load i32, i32* %8, align 4
  %6031 = load %struct.DState*, %struct.DState** %2, align 8
  %6032 = getelementptr inbounds %struct.DState, %struct.DState* %6031, i32 0, i32 40
  store i32 %6030, i32* %6032, align 4
  %6033 = load i32, i32* %9, align 4
  %6034 = load %struct.DState*, %struct.DState** %2, align 8
  %6035 = getelementptr inbounds %struct.DState, %struct.DState* %6034, i32 0, i32 41
  store i32 %6033, i32* %6035, align 8
  %6036 = load i32, i32* %10, align 4
  %6037 = load %struct.DState*, %struct.DState** %2, align 8
  %6038 = getelementptr inbounds %struct.DState, %struct.DState* %6037, i32 0, i32 42
  store i32 %6036, i32* %6038, align 4
  %6039 = load i32, i32* %11, align 4
  %6040 = load %struct.DState*, %struct.DState** %2, align 8
  %6041 = getelementptr inbounds %struct.DState, %struct.DState* %6040, i32 0, i32 43
  store i32 %6039, i32* %6041, align 8
  %6042 = load i32, i32* %12, align 4
  %6043 = load %struct.DState*, %struct.DState** %2, align 8
  %6044 = getelementptr inbounds %struct.DState, %struct.DState* %6043, i32 0, i32 44
  store i32 %6042, i32* %6044, align 4
  %6045 = load i32, i32* %13, align 4
  %6046 = load %struct.DState*, %struct.DState** %2, align 8
  %6047 = getelementptr inbounds %struct.DState, %struct.DState* %6046, i32 0, i32 45
  store i32 %6045, i32* %6047, align 8
  %6048 = load i32, i32* %14, align 4
  %6049 = load %struct.DState*, %struct.DState** %2, align 8
  %6050 = getelementptr inbounds %struct.DState, %struct.DState* %6049, i32 0, i32 46
  store i32 %6048, i32* %6050, align 4
  %6051 = load i32, i32* %15, align 4
  %6052 = load %struct.DState*, %struct.DState** %2, align 8
  %6053 = getelementptr inbounds %struct.DState, %struct.DState* %6052, i32 0, i32 47
  store i32 %6051, i32* %6053, align 8
  %6054 = load i32, i32* %16, align 4
  %6055 = load %struct.DState*, %struct.DState** %2, align 8
  %6056 = getelementptr inbounds %struct.DState, %struct.DState* %6055, i32 0, i32 48
  store i32 %6054, i32* %6056, align 4
  %6057 = load i32, i32* %17, align 4
  %6058 = load %struct.DState*, %struct.DState** %2, align 8
  %6059 = getelementptr inbounds %struct.DState, %struct.DState* %6058, i32 0, i32 49
  store i32 %6057, i32* %6059, align 8
  %6060 = load i32, i32* %18, align 4
  %6061 = load %struct.DState*, %struct.DState** %2, align 8
  %6062 = getelementptr inbounds %struct.DState, %struct.DState* %6061, i32 0, i32 50
  store i32 %6060, i32* %6062, align 4
  %6063 = load i32, i32* %19, align 4
  %6064 = load %struct.DState*, %struct.DState** %2, align 8
  %6065 = getelementptr inbounds %struct.DState, %struct.DState* %6064, i32 0, i32 51
  store i32 %6063, i32* %6065, align 8
  %6066 = load i32, i32* %20, align 4
  %6067 = load %struct.DState*, %struct.DState** %2, align 8
  %6068 = getelementptr inbounds %struct.DState, %struct.DState* %6067, i32 0, i32 52
  store i32 %6066, i32* %6068, align 4
  %6069 = load i32, i32* %21, align 4
  %6070 = load %struct.DState*, %struct.DState** %2, align 8
  %6071 = getelementptr inbounds %struct.DState, %struct.DState* %6070, i32 0, i32 53
  store i32 %6069, i32* %6071, align 8
  %6072 = load i32, i32* %22, align 4
  %6073 = load %struct.DState*, %struct.DState** %2, align 8
  %6074 = getelementptr inbounds %struct.DState, %struct.DState* %6073, i32 0, i32 54
  store i32 %6072, i32* %6074, align 4
  %6075 = load i32, i32* %23, align 4
  %6076 = load %struct.DState*, %struct.DState** %2, align 8
  %6077 = getelementptr inbounds %struct.DState, %struct.DState* %6076, i32 0, i32 55
  store i32 %6075, i32* %6077, align 8
  %6078 = load i32, i32* %24, align 4
  %6079 = load %struct.DState*, %struct.DState** %2, align 8
  %6080 = getelementptr inbounds %struct.DState, %struct.DState* %6079, i32 0, i32 56
  store i32 %6078, i32* %6080, align 4
  %6081 = load i32, i32* %25, align 4
  %6082 = load %struct.DState*, %struct.DState** %2, align 8
  %6083 = getelementptr inbounds %struct.DState, %struct.DState* %6082, i32 0, i32 57
  store i32 %6081, i32* %6083, align 8
  %6084 = load i32, i32* %26, align 4
  %6085 = load %struct.DState*, %struct.DState** %2, align 8
  %6086 = getelementptr inbounds %struct.DState, %struct.DState* %6085, i32 0, i32 58
  store i32 %6084, i32* %6086, align 4
  %6087 = load i32, i32* %27, align 4
  %6088 = load %struct.DState*, %struct.DState** %2, align 8
  %6089 = getelementptr inbounds %struct.DState, %struct.DState* %6088, i32 0, i32 59
  store i32 %6087, i32* %6089, align 8
  %6090 = load i32, i32* %28, align 4
  %6091 = load %struct.DState*, %struct.DState** %2, align 8
  %6092 = getelementptr inbounds %struct.DState, %struct.DState* %6091, i32 0, i32 60
  store i32 %6090, i32* %6092, align 4
  %6093 = load i32*, i32** %29, align 8
  %6094 = load %struct.DState*, %struct.DState** %2, align 8
  %6095 = getelementptr inbounds %struct.DState, %struct.DState* %6094, i32 0, i32 61
  store i32* %6093, i32** %6095, align 8
  %6096 = load i32*, i32** %30, align 8
  %6097 = load %struct.DState*, %struct.DState** %2, align 8
  %6098 = getelementptr inbounds %struct.DState, %struct.DState* %6097, i32 0, i32 62
  store i32* %6096, i32** %6098, align 8
  %6099 = load i32*, i32** %31, align 8
  %6100 = load %struct.DState*, %struct.DState** %2, align 8
  %6101 = getelementptr inbounds %struct.DState, %struct.DState* %6100, i32 0, i32 63
  store i32* %6099, i32** %6101, align 8
  %6102 = load i32, i32* %4, align 4
  ret i32 %6102
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind uwtable
define internal void @makeMaps_d(%struct.DState*) #0 {
  %2 = alloca %struct.DState*, align 8
  %3 = alloca i32, align 4
  store %struct.DState* %0, %struct.DState** %2, align 8
  %4 = load %struct.DState*, %struct.DState** %2, align 8
  %5 = getelementptr inbounds %struct.DState, %struct.DState* %4, i32 0, i32 27
  store i32 0, i32* %5, align 8
  store i32 0, i32* %3, align 4
  br label %6

; <label>:6:                                      ; preds = %33, %1
  %7 = load i32, i32* %3, align 4
  %8 = icmp slt i32 %7, 256
  br i1 %8, label %9, label %37

; <label>:9:                                      ; preds = %6
  %10 = load %struct.DState*, %struct.DState** %2, align 8
  %11 = getelementptr inbounds %struct.DState, %struct.DState* %10, i32 0, i32 28
  %12 = load i32, i32* %3, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [256 x i8], [256 x i8]* %11, i64 0, i64 %13
  %15 = load i8, i8* %14, align 1
  %16 = icmp ne i8 %15, 0
  br i1 %16, label %17, label %32

; <label>:17:                                     ; preds = %9
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_makeMaps_d, i64 0, i64 1)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_makeMaps_d, i64 0, i64 1)
  %19 = load i32, i32* %3, align 4
  %20 = trunc i32 %19 to i8
  %21 = load %struct.DState*, %struct.DState** %2, align 8
  %22 = getelementptr inbounds %struct.DState, %struct.DState* %21, i32 0, i32 30
  %23 = load %struct.DState*, %struct.DState** %2, align 8
  %24 = getelementptr inbounds %struct.DState, %struct.DState* %23, i32 0, i32 27
  %25 = load i32, i32* %24, align 8
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [256 x i8], [256 x i8]* %22, i64 0, i64 %26
  store i8 %20, i8* %27, align 1
  %28 = load %struct.DState*, %struct.DState** %2, align 8
  %29 = getelementptr inbounds %struct.DState, %struct.DState* %28, i32 0, i32 27
  %30 = load i32, i32* %29, align 8
  %31 = add nsw i32 %30, 1
  store i32 %31, i32* %29, align 8
  br label %32

; <label>:32:                                     ; preds = %17, %9
  br label %33

; <label>:33:                                     ; preds = %32
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_makeMaps_d, i64 0, i64 0)
  %34 = add i64 %pgocount1, 1
  store i64 %34, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_makeMaps_d, i64 0, i64 0)
  %35 = load i32, i32* %3, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, i32* %3, align 4
  br label %6

; <label>:37:                                     ; preds = %6
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_makeMaps_d, i64 0, i64 2)
  %38 = add i64 %pgocount2, 1
  store i64 %38, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_makeMaps_d, i64 0, i64 2)
  ret void
}

declare void @BZ2_hbCreateDecodeTables(i32*, i32*, i32*, i8*, i32, i32, i32) #1

declare i32 @BZ2_indexIntoF(i32, i32*) #1

declare void @BZ2_bz__AssertH__fail(i32) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #2

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
