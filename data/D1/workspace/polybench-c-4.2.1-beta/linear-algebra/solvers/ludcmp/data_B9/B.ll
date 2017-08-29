; ModuleID = 'A.ll'
source_filename = "ludcmp.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %7 = bitcast i8* %3 to [2000 x double]*
  %8 = bitcast i8* %4 to double*
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  tail call void @init_array([2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_start() #3
  tail call void @kernel_ludcmp([2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %5 to double*
  tail call void @print_array(double* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* %5) #3
  tail call void @free(i8* %6) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array([2000 x double]*, double*, double*, double*) #0 {
.lr.ph26.preheader:
  br label %.lr.ph26

.lr.ph26:                                         ; preds = %.lr.ph26, %.lr.ph26.preheader
  %indvars.iv61 = phi i64 [ 0, %.lr.ph26.preheader ], [ %indvars.iv.next62.1, %.lr.ph26 ]
  %4 = getelementptr inbounds double, double* %2, i64 %indvars.iv61
  store double 0.000000e+00, double* %4, align 8
  %5 = getelementptr inbounds double, double* %3, i64 %indvars.iv61
  store double 0.000000e+00, double* %5, align 8
  %indvars.iv.next62 = or i64 %indvars.iv61, 1
  %6 = trunc i64 %indvars.iv.next62 to i32
  %7 = sitofp i32 %6 to double
  %8 = fdiv double %7, 2.000000e+03
  %9 = fmul double %8, 5.000000e-01
  %10 = fadd double %9, 4.000000e+00
  %11 = getelementptr inbounds double, double* %1, i64 %indvars.iv61
  store double %10, double* %11, align 8
  %12 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next62
  store double 0.000000e+00, double* %12, align 8
  %13 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next62
  store double 0.000000e+00, double* %13, align 8
  %indvars.iv.next62.1 = add nsw i64 %indvars.iv61, 2
  %14 = trunc i64 %indvars.iv.next62.1 to i32
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, 2.000000e+03
  %17 = fmul double %16, 5.000000e-01
  %18 = fadd double %17, 4.000000e+00
  %19 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next62
  store double %18, double* %19, align 8
  %exitcond64.1 = icmp eq i64 %indvars.iv.next62, 1999
  br i1 %exitcond64.1, label %.lr.ph19.preheader, label %.lr.ph26

.lr.ph19.preheader:                               ; preds = %.lr.ph26
  br label %.lr.ph19

.lr.ph19:                                         ; preds = %.lr.ph19.preheader, %._crit_edge23..preheader6_crit_edge
  %indvars.iv59 = phi i64 [ %20, %._crit_edge23..preheader6_crit_edge ], [ 0, %.lr.ph19.preheader ]
  %20 = add i64 %indvars.iv59, 1
  %sext = shl i64 %20, 32
  %21 = ashr exact i64 %sext, 32
  %22 = sub nsw i64 2000, %21
  br label %23

; <label>:23:                                     ; preds = %23, %.lr.ph19
  %indvars.iv47 = phi i64 [ %indvars.iv.next48, %23 ], [ 0, %.lr.ph19 ]
  %24 = sub nsw i64 0, %indvars.iv47
  %25 = trunc i64 %24 to i32
  %26 = srem i32 %25, 2000
  %27 = sitofp i32 %26 to double
  %28 = fdiv double %27, 2.000000e+03
  %29 = fadd double %28, 1.000000e+00
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv59, i64 %indvars.iv47
  store double %29, double* %30, align 8
  %exitcond52 = icmp eq i64 %indvars.iv47, %indvars.iv59
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  br i1 %exitcond52, label %._crit_edge20, label %23

._crit_edge20:                                    ; preds = %23
  %31 = icmp slt i64 %20, 2000
  br i1 %31, label %._crit_edge23..preheader6_crit_edge, label %._crit_edge24

._crit_edge23..preheader6_crit_edge:              ; preds = %._crit_edge20
  %32 = shl nsw i64 %22, 3
  %scevgep67 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv59, i64 %21
  %33 = bitcast double* %scevgep67 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %33, i8 0, i64 %32, i32 8, i1 false)
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv59, i64 %indvars.iv59
  store double 1.000000e+00, double* %34, align 8
  br label %.lr.ph19

._crit_edge24:                                    ; preds = %._crit_edge20
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv59, i64 %indvars.iv59
  store double 1.000000e+00, double* %35, align 8
  %36 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %.preheader5.us, %._crit_edge24
  %indvars.iv45 = phi i64 [ 0, %._crit_edge24 ], [ %indvars.iv.next46.7, %.preheader5.us ]
  %37 = mul nuw nsw i64 %indvars.iv45, 16000
  %scevgep = getelementptr i8, i8* %36, i64 %37
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next46 = or i64 %indvars.iv45, 1
  %38 = mul nuw nsw i64 %indvars.iv.next46, 16000
  %scevgep.1 = getelementptr i8, i8* %36, i64 %38
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next46.1 = or i64 %indvars.iv45, 2
  %39 = mul nuw nsw i64 %indvars.iv.next46.1, 16000
  %scevgep.2 = getelementptr i8, i8* %36, i64 %39
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next46.2 = or i64 %indvars.iv45, 3
  %40 = mul nuw nsw i64 %indvars.iv.next46.2, 16000
  %scevgep.3 = getelementptr i8, i8* %36, i64 %40
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next46.3 = or i64 %indvars.iv45, 4
  %41 = mul nuw nsw i64 %indvars.iv.next46.3, 16000
  %scevgep.4 = getelementptr i8, i8* %36, i64 %41
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next46.4 = or i64 %indvars.iv45, 5
  %42 = mul nuw nsw i64 %indvars.iv.next46.4, 16000
  %scevgep.5 = getelementptr i8, i8* %36, i64 %42
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next46.5 = or i64 %indvars.iv45, 6
  %43 = mul nuw nsw i64 %indvars.iv.next46.5, 16000
  %scevgep.6 = getelementptr i8, i8* %36, i64 %43
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next46.6 = or i64 %indvars.iv45, 7
  %44 = mul nuw nsw i64 %indvars.iv.next46.6, 16000
  %scevgep.7 = getelementptr i8, i8* %36, i64 %44
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next46.7 = add nsw i64 %indvars.iv45, 8
  %exitcond6.7 = icmp eq i64 %indvars.iv.next46.7, 2000
  br i1 %exitcond6.7, label %.preheader2.us.us.preheader.preheader, label %.preheader5.us

.preheader2.us.us.preheader.preheader:            ; preds = %.preheader5.us
  %45 = bitcast i8* %36 to [2000 x [2000 x double]]*
  %46 = bitcast i8* %36 to [2000 x [2000 x double]]*
  %47 = bitcast i8* %36 to [2000 x [2000 x double]]*
  br label %.preheader2.us.us.preheader

.preheader2.us.us.preheader:                      ; preds = %._crit_edge11.us, %.preheader2.us.us.preheader.preheader
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %._crit_edge11.us ], [ 0, %.preheader2.us.us.preheader.preheader ]
  %scevgep75 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv39
  %48 = add nuw nsw i64 %indvars.iv39, 1
  %scevgep77 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %48
  %49 = bitcast double* %scevgep77 to i8*
  %50 = bitcast double* %scevgep75 to i8*
  br label %.preheader2.us.us

._crit_edge11.us:                                 ; preds = %._crit_edge10.us.us
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next40, 2000
  br i1 %exitcond5, label %.preheader.us.preheader, label %.preheader2.us.us.preheader

.preheader.us.preheader:                          ; preds = %._crit_edge11.us
  %51 = bitcast i8* %36 to [2000 x [2000 x double]]*
  %52 = bitcast i8* %36 to [2000 x [2000 x double]]*
  %53 = bitcast i8* %36 to [2000 x [2000 x double]]*
  %54 = bitcast i8* %36 to [2000 x [2000 x double]]*
  %55 = bitcast i8* %36 to [2000 x [2000 x double]]*
  %56 = bitcast i8* %36 to [2000 x [2000 x double]]*
  %57 = bitcast i8* %36 to [2000 x [2000 x double]]*
  br label %.preheader.us

.preheader2.us.us:                                ; preds = %._crit_edge10.us.us, %.preheader2.us.us.preheader
  %indvars.iv37 = phi i64 [ 0, %.preheader2.us.us.preheader ], [ %indvars.iv.next38, %._crit_edge10.us.us ]
  %58 = mul nuw nsw i64 %indvars.iv37, 16000
  %scevgep73 = getelementptr i8, i8* %36, i64 %58
  %59 = add nuw nsw i64 %58, 16000
  %scevgep74 = getelementptr i8, i8* %36, i64 %59
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv37, i64 %indvars.iv39
  %bound0 = icmp ult i8* %scevgep73, %49
  %bound1 = icmp ult i8* %50, %scevgep74
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %60 to i8*
  %bc79 = bitcast double* %60 to i8*
  %bound080 = icmp ult i8* %scevgep73, %bc79
  %bound181 = icmp ult i8* %bc, %scevgep74
  %found.conflict82 = and i1 %bound080, %bound181
  %conflict.rdx = or i1 %found.conflict, %found.conflict82
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader2.us.us
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.preheader2.us.us
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %61 = or i64 %index, 1
  %62 = or i64 %index, 2
  %63 = or i64 %index, 3
  %64 = load double, double* %60, align 8, !alias.scope !1
  %65 = insertelement <2 x double> undef, double %64, i32 0
  %66 = shufflevector <2 x double> %65, <2 x double> undef, <2 x i32> zeroinitializer
  %67 = insertelement <2 x double> undef, double %64, i32 0
  %68 = shufflevector <2 x double> %67, <2 x double> undef, <2 x i32> zeroinitializer
  %69 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index, i64 %indvars.iv39
  %70 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %61, i64 %indvars.iv39
  %71 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %62, i64 %indvars.iv39
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %63, i64 %indvars.iv39
  %73 = load double, double* %69, align 8, !alias.scope !4
  %74 = load double, double* %70, align 8, !alias.scope !4
  %75 = load double, double* %71, align 8, !alias.scope !4
  %76 = load double, double* %72, align 8, !alias.scope !4
  %77 = insertelement <2 x double> undef, double %73, i32 0
  %78 = insertelement <2 x double> %77, double %74, i32 1
  %79 = insertelement <2 x double> undef, double %75, i32 0
  %80 = insertelement <2 x double> %79, double %76, i32 1
  %81 = fmul <2 x double> %66, %78
  %82 = fmul <2 x double> %68, %80
  %83 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv37, i64 %index
  %84 = bitcast double* %83 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %84, align 8, !alias.scope !6, !noalias !8
  %85 = getelementptr double, double* %83, i64 2
  %86 = bitcast double* %85 to <2 x double>*
  %wide.load84 = load <2 x double>, <2 x double>* %86, align 8, !alias.scope !6, !noalias !8
  %87 = fadd <2 x double> %wide.load, %81
  %88 = fadd <2 x double> %wide.load84, %82
  %89 = bitcast double* %83 to <2 x double>*
  store <2 x double> %87, <2 x double>* %89, align 8, !alias.scope !6, !noalias !8
  %90 = bitcast double* %85 to <2 x double>*
  store <2 x double> %88, <2 x double>* %90, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %91 = icmp eq i64 %index.next, 2000
  br i1 %91, label %._crit_edge10.us.us.loopexit2, label %vector.body, !llvm.loop !9

._crit_edge10.us.us.loopexit:                     ; preds = %scalar.ph
  br label %._crit_edge10.us.us

._crit_edge10.us.us.loopexit2:                    ; preds = %vector.body
  br label %._crit_edge10.us.us

._crit_edge10.us.us:                              ; preds = %._crit_edge10.us.us.loopexit2, %._crit_edge10.us.us.loopexit
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next38, 2000
  br i1 %exitcond4, label %._crit_edge11.us, label %.preheader2.us.us

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv33 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next34.1, %scalar.ph ]
  %92 = load double, double* %60, align 8
  %93 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv33, i64 %indvars.iv39
  %94 = load double, double* %93, align 8
  %95 = fmul double %92, %94
  %96 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %45, i64 0, i64 %indvars.iv37, i64 %indvars.iv33
  %97 = load double, double* %96, align 8
  %98 = fadd double %97, %95
  store double %98, double* %96, align 8
  %indvars.iv.next34 = or i64 %indvars.iv33, 1
  %99 = load double, double* %60, align 8
  %100 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next34, i64 %indvars.iv39
  %101 = load double, double* %100, align 8
  %102 = fmul double %99, %101
  %103 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %46, i64 0, i64 %indvars.iv37, i64 %indvars.iv.next34
  %104 = load double, double* %103, align 8
  %105 = fadd double %104, %102
  store double %105, double* %103, align 8
  %exitcond36.1 = icmp eq i64 %indvars.iv.next34, 1999
  %indvars.iv.next34.1 = add nsw i64 %indvars.iv33, 2
  br i1 %exitcond36.1, label %._crit_edge10.us.us.loopexit, label %scalar.ph, !llvm.loop !12

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %scevgep90 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv31, i64 0
  %scevgep9091 = bitcast double* %scevgep90 to i8*
  %106 = add nuw nsw i64 %indvars.iv31, 1
  %scevgep92 = getelementptr [2000 x double], [2000 x double]* %0, i64 %106, i64 0
  %scevgep9293 = bitcast double* %scevgep92 to i8*
  %107 = mul nuw nsw i64 %indvars.iv31, 16000
  %scevgep94 = getelementptr i8, i8* %36, i64 %107
  %108 = add nuw nsw i64 %107, 16000
  %scevgep95 = getelementptr i8, i8* %36, i64 %108
  %bound096 = icmp ult i8* %scevgep9091, %scevgep95
  %bound197 = icmp ult i8* %scevgep94, %scevgep9293
  %memcheck.conflict99 = and i1 %bound096, %bound197
  br i1 %memcheck.conflict99, label %scalar.ph87.preheader, label %vector.body85.preheader

vector.body85.preheader:                          ; preds = %.preheader.us
  br label %vector.body85

scalar.ph87.preheader:                            ; preds = %.preheader.us
  br label %scalar.ph87

vector.body85:                                    ; preds = %vector.body85, %vector.body85.preheader
  %index102 = phi i64 [ 0, %vector.body85.preheader ], [ %index.next103.1, %vector.body85 ]
  %109 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %56, i64 0, i64 %indvars.iv31, i64 %index102
  %110 = bitcast double* %109 to <2 x i64>*
  %wide.load110 = load <2 x i64>, <2 x i64>* %110, align 8, !alias.scope !13
  %111 = getelementptr double, double* %109, i64 2
  %112 = bitcast double* %111 to <2 x i64>*
  %wide.load111 = load <2 x i64>, <2 x i64>* %112, align 8, !alias.scope !13
  %113 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv31, i64 %index102
  %114 = bitcast double* %113 to <2 x i64>*
  store <2 x i64> %wide.load110, <2 x i64>* %114, align 8, !alias.scope !16, !noalias !13
  %115 = getelementptr double, double* %113, i64 2
  %116 = bitcast double* %115 to <2 x i64>*
  store <2 x i64> %wide.load111, <2 x i64>* %116, align 8, !alias.scope !16, !noalias !13
  %index.next103 = or i64 %index102, 4
  %117 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %57, i64 0, i64 %indvars.iv31, i64 %index.next103
  %118 = bitcast double* %117 to <2 x i64>*
  %wide.load110.1 = load <2 x i64>, <2 x i64>* %118, align 8, !alias.scope !13
  %119 = getelementptr double, double* %117, i64 2
  %120 = bitcast double* %119 to <2 x i64>*
  %wide.load111.1 = load <2 x i64>, <2 x i64>* %120, align 8, !alias.scope !13
  %121 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv31, i64 %index.next103
  %122 = bitcast double* %121 to <2 x i64>*
  store <2 x i64> %wide.load110.1, <2 x i64>* %122, align 8, !alias.scope !16, !noalias !13
  %123 = getelementptr double, double* %121, i64 2
  %124 = bitcast double* %123 to <2 x i64>*
  store <2 x i64> %wide.load111.1, <2 x i64>* %124, align 8, !alias.scope !16, !noalias !13
  %index.next103.1 = add nsw i64 %index102, 8
  %125 = icmp eq i64 %index.next103.1, 2000
  br i1 %125, label %._crit_edge.us.loopexit1, label %vector.body85, !llvm.loop !18

scalar.ph87:                                      ; preds = %scalar.ph87, %scalar.ph87.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph87.preheader ], [ %indvars.iv.next.4, %scalar.ph87 ]
  %126 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv31, i64 %indvars.iv
  %127 = bitcast double* %126 to i64*
  %128 = load i64, i64* %127, align 8
  %129 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv31, i64 %indvars.iv
  %130 = bitcast double* %129 to i64*
  store i64 %128, i64* %130, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %131 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %52, i64 0, i64 %indvars.iv31, i64 %indvars.iv.next
  %132 = bitcast double* %131 to i64*
  %133 = load i64, i64* %132, align 8
  %134 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv31, i64 %indvars.iv.next
  %135 = bitcast double* %134 to i64*
  store i64 %133, i64* %135, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %136 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %53, i64 0, i64 %indvars.iv31, i64 %indvars.iv.next.1
  %137 = bitcast double* %136 to i64*
  %138 = load i64, i64* %137, align 8
  %139 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv31, i64 %indvars.iv.next.1
  %140 = bitcast double* %139 to i64*
  store i64 %138, i64* %140, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %141 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %54, i64 0, i64 %indvars.iv31, i64 %indvars.iv.next.2
  %142 = bitcast double* %141 to i64*
  %143 = load i64, i64* %142, align 8
  %144 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv31, i64 %indvars.iv.next.2
  %145 = bitcast double* %144 to i64*
  store i64 %143, i64* %145, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %146 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %55, i64 0, i64 %indvars.iv31, i64 %indvars.iv.next.3
  %147 = bitcast double* %146 to i64*
  %148 = load i64, i64* %147, align 8
  %149 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv31, i64 %indvars.iv.next.3
  %150 = bitcast double* %149 to i64*
  store i64 %148, i64* %150, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond.4, label %._crit_edge.us.loopexit, label %scalar.ph87, !llvm.loop !19

._crit_edge.us.loopexit:                          ; preds = %scalar.ph87
  br label %._crit_edge.us

._crit_edge.us.loopexit1:                         ; preds = %vector.body85
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit1, %._crit_edge.us.loopexit
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next32, 2000
  br i1 %exitcond3, label %._crit_edge8, label %.preheader.us

._crit_edge8:                                     ; preds = %._crit_edge.us
  tail call void @free(i8* %36) #3
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_ludcmp([2000 x double]*, double*, double*, double*) #0 {
.preheader3.preheader:
  br label %.preheader3

.preheader3:                                      ; preds = %._crit_edge24, %.preheader3.preheader
  %indvars.iv8 = phi i64 [ %indvars.iv.next9, %._crit_edge24 ], [ 0, %.preheader3.preheader ]
  %indvars.iv52 = phi i32 [ %indvars.iv.next53, %._crit_edge24 ], [ -1, %.preheader3.preheader ]
  %4 = add i64 %indvars.iv8, 4294967295
  %5 = and i64 %4, 4294967295
  %6 = icmp sgt i64 %indvars.iv8, 0
  br i1 %6, label %.lr.ph18.preheader, label %._crit_edge24

.lr.ph18.preheader:                               ; preds = %.preheader3
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv8, i64 0
  br label %.lr.ph18

.lr.ph23:                                         ; preds = %._crit_edge16
  %8 = icmp sgt i64 %indvars.iv8, 0
  br i1 %8, label %.lr.ph23.split.us.preheader, label %._crit_edge24

.lr.ph23.split.us.preheader:                      ; preds = %.lr.ph23
  %wide.trip.count54 = zext i32 %indvars.iv52 to i64
  %9 = and i64 %4, 1
  %lcmp.mod21 = icmp eq i64 %9, 0
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv8, i64 0
  %11 = icmp eq i64 %5, 0
  br label %.lr.ph23.split.us

.lr.ph23.split.us:                                ; preds = %._crit_edge21.us, %.lr.ph23.split.us.preheader
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %._crit_edge21.us ], [ %indvars.iv8, %.lr.ph23.split.us.preheader ]
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv8, i64 %indvars.iv58
  %13 = load double, double* %12, align 8
  br i1 %lcmp.mod21, label %.prol.preheader, label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.lr.ph23.split.us
  br label %14

; <label>:14:                                     ; preds = %.prol.preheader
  %15 = load double, double* %10, align 8
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv58
  %17 = load double, double* %16, align 8
  %18 = fmul double %15, %17
  %19 = fsub double %13, %18
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph23.split.us, %14
  %.lcssa6.unr.ph = phi double [ %19, %14 ], [ undef, %.lr.ph23.split.us ]
  %indvars.iv50.unr.ph = phi i64 [ 1, %14 ], [ 0, %.lr.ph23.split.us ]
  %.unr22.ph = phi double [ %19, %14 ], [ %13, %.lr.ph23.split.us ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  br i1 %11, label %._crit_edge21.us, label %.lr.ph23.split.us.new

.lr.ph23.split.us.new:                            ; preds = %.prol.loopexit
  br label %20

; <label>:20:                                     ; preds = %20, %.lr.ph23.split.us.new
  %indvars.iv50 = phi i64 [ %indvars.iv50.unr.ph, %.lr.ph23.split.us.new ], [ %indvars.iv.next51.1, %20 ]
  %21 = phi double [ %.unr22.ph, %.lr.ph23.split.us.new ], [ %33, %20 ]
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv8, i64 %indvars.iv50
  %23 = load double, double* %22, align 8
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv50, i64 %indvars.iv58
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = fsub double %21, %26
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv8, i64 %indvars.iv.next51
  %29 = load double, double* %28, align 8
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next51, i64 %indvars.iv58
  %31 = load double, double* %30, align 8
  %32 = fmul double %29, %31
  %33 = fsub double %27, %32
  %exitcond55.1 = icmp eq i64 %indvars.iv.next51, %wide.trip.count54
  %indvars.iv.next51.1 = add nsw i64 %indvars.iv50, 2
  br i1 %exitcond55.1, label %._crit_edge21.us.unr-lcssa, label %20

._crit_edge21.us.unr-lcssa:                       ; preds = %20
  br label %._crit_edge21.us

._crit_edge21.us:                                 ; preds = %.prol.loopexit, %._crit_edge21.us.unr-lcssa
  %.lcssa6 = phi double [ %.lcssa6.unr.ph, %.prol.loopexit ], [ %33, %._crit_edge21.us.unr-lcssa ]
  store double %.lcssa6, double* %12, align 8
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next59, 2000
  br i1 %exitcond11, label %._crit_edge24.loopexit, label %.lr.ph23.split.us

.lr.ph18:                                         ; preds = %._crit_edge16, %.lr.ph18.preheader
  %indvars.iv47 = phi i64 [ %indvars.iv.next48, %._crit_edge16 ], [ 0, %.lr.ph18.preheader ]
  %indvars.iv43 = phi i32 [ %indvars.iv.next44, %._crit_edge16 ], [ -1, %.lr.ph18.preheader ]
  %34 = add i64 %indvars.iv47, 4294967295
  %35 = and i64 %34, 4294967295
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv8, i64 %indvars.iv47
  %37 = load double, double* %36, align 8
  %38 = icmp sgt i64 %indvars.iv47, 0
  br i1 %38, label %.lr.ph15.preheader, label %._crit_edge16

.lr.ph15.preheader:                               ; preds = %.lr.ph18
  %wide.trip.count45 = zext i32 %indvars.iv43 to i64
  %39 = and i64 %34, 1
  %lcmp.mod18 = icmp eq i64 %39, 0
  br i1 %lcmp.mod18, label %.lr.ph15.prol.preheader, label %.lr.ph15.prol.loopexit.unr-lcssa

.lr.ph15.prol.preheader:                          ; preds = %.lr.ph15.preheader
  br label %.lr.ph15.prol

.lr.ph15.prol:                                    ; preds = %.lr.ph15.prol.preheader
  %40 = load double, double* %7, align 8
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv47
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = fsub double %37, %43
  br label %.lr.ph15.prol.loopexit.unr-lcssa

.lr.ph15.prol.loopexit.unr-lcssa:                 ; preds = %.lr.ph15.preheader, %.lr.ph15.prol
  %.lcssa3.unr.ph = phi double [ %44, %.lr.ph15.prol ], [ undef, %.lr.ph15.preheader ]
  %indvars.iv41.unr.ph = phi i64 [ 1, %.lr.ph15.prol ], [ 0, %.lr.ph15.preheader ]
  %.unr19.ph = phi double [ %44, %.lr.ph15.prol ], [ %37, %.lr.ph15.preheader ]
  br label %.lr.ph15.prol.loopexit

.lr.ph15.prol.loopexit:                           ; preds = %.lr.ph15.prol.loopexit.unr-lcssa
  %45 = icmp eq i64 %35, 0
  br i1 %45, label %._crit_edge16.loopexit, label %.lr.ph15.preheader.new

.lr.ph15.preheader.new:                           ; preds = %.lr.ph15.prol.loopexit
  br label %.lr.ph15

.lr.ph15:                                         ; preds = %.lr.ph15, %.lr.ph15.preheader.new
  %indvars.iv41 = phi i64 [ %indvars.iv41.unr.ph, %.lr.ph15.preheader.new ], [ %indvars.iv.next42.1, %.lr.ph15 ]
  %46 = phi double [ %.unr19.ph, %.lr.ph15.preheader.new ], [ %58, %.lr.ph15 ]
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv8, i64 %indvars.iv41
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv41, i64 %indvars.iv47
  %50 = load double, double* %49, align 8
  %51 = fmul double %48, %50
  %52 = fsub double %46, %51
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv8, i64 %indvars.iv.next42
  %54 = load double, double* %53, align 8
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next42, i64 %indvars.iv47
  %56 = load double, double* %55, align 8
  %57 = fmul double %54, %56
  %58 = fsub double %52, %57
  %exitcond46.1 = icmp eq i64 %indvars.iv.next42, %wide.trip.count45
  %indvars.iv.next42.1 = add nsw i64 %indvars.iv41, 2
  br i1 %exitcond46.1, label %._crit_edge16.loopexit.unr-lcssa, label %.lr.ph15

._crit_edge16.loopexit.unr-lcssa:                 ; preds = %.lr.ph15
  br label %._crit_edge16.loopexit

._crit_edge16.loopexit:                           ; preds = %.lr.ph15.prol.loopexit, %._crit_edge16.loopexit.unr-lcssa
  %.lcssa3 = phi double [ %.lcssa3.unr.ph, %.lr.ph15.prol.loopexit ], [ %58, %._crit_edge16.loopexit.unr-lcssa ]
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16.loopexit, %.lr.ph18
  %.lcssa5 = phi double [ %37, %.lr.ph18 ], [ %.lcssa3, %._crit_edge16.loopexit ]
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv47, i64 %indvars.iv47
  %60 = load double, double* %59, align 8
  %61 = fdiv double %.lcssa5, %60
  store double %61, double* %36, align 8
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %indvars.iv.next44 = add nsw i32 %indvars.iv43, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next48, %indvars.iv8
  br i1 %exitcond10, label %.lr.ph23, label %.lr.ph18

._crit_edge24.loopexit:                           ; preds = %._crit_edge21.us
  br label %._crit_edge24

._crit_edge24:                                    ; preds = %._crit_edge24.loopexit, %.preheader3, %.lr.ph23
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %indvars.iv.next53 = add nsw i32 %indvars.iv52, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next9, 2000
  br i1 %exitcond12, label %.lr.ph13.preheader, label %.preheader3

.lr.ph13.preheader:                               ; preds = %._crit_edge24
  br label %.lr.ph13

.lr.ph13:                                         ; preds = %._crit_edge11, %.lr.ph13.preheader
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %._crit_edge11 ], [ 0, %.lr.ph13.preheader ]
  %indvars.iv35 = phi i32 [ %indvars.iv.next36, %._crit_edge11 ], [ -1, %.lr.ph13.preheader ]
  %62 = add i64 %indvars.iv39, 4294967295
  %63 = and i64 %62, 4294967295
  %64 = getelementptr inbounds double, double* %1, i64 %indvars.iv39
  %65 = load double, double* %64, align 8
  %66 = icmp sgt i64 %indvars.iv39, 0
  br i1 %66, label %.lr.ph10.preheader, label %._crit_edge11

.lr.ph10.preheader:                               ; preds = %.lr.ph13
  %wide.trip.count37 = zext i32 %indvars.iv35 to i64
  %xtraiter13 = and i64 %indvars.iv39, 3
  %lcmp.mod14 = icmp eq i64 %xtraiter13, 0
  br i1 %lcmp.mod14, label %.lr.ph10.prol.loopexit, label %.lr.ph10.prol.preheader

.lr.ph10.prol.preheader:                          ; preds = %.lr.ph10.preheader
  br label %.lr.ph10.prol

.lr.ph10.prol:                                    ; preds = %.lr.ph10.prol, %.lr.ph10.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.lr.ph10.prol ], [ 0, %.lr.ph10.prol.preheader ]
  %67 = phi double [ %73, %.lr.ph10.prol ], [ %65, %.lr.ph10.prol.preheader ]
  %prol.iter15 = phi i64 [ %prol.iter15.sub, %.lr.ph10.prol ], [ %xtraiter13, %.lr.ph10.prol.preheader ]
  %68 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv39, i64 %indvars.iv.prol
  %69 = load double, double* %68, align 8
  %70 = getelementptr inbounds double, double* %3, i64 %indvars.iv.prol
  %71 = load double, double* %70, align 8
  %72 = fmul double %69, %71
  %73 = fsub double %67, %72
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter15.sub = add i64 %prol.iter15, -1
  %prol.iter15.cmp = icmp eq i64 %prol.iter15.sub, 0
  br i1 %prol.iter15.cmp, label %.lr.ph10.prol.loopexit.unr-lcssa, label %.lr.ph10.prol, !llvm.loop !20

.lr.ph10.prol.loopexit.unr-lcssa:                 ; preds = %.lr.ph10.prol
  br label %.lr.ph10.prol.loopexit

.lr.ph10.prol.loopexit:                           ; preds = %.lr.ph10.preheader, %.lr.ph10.prol.loopexit.unr-lcssa
  %.lcssa2.unr = phi double [ undef, %.lr.ph10.preheader ], [ %73, %.lr.ph10.prol.loopexit.unr-lcssa ]
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph10.preheader ], [ %indvars.iv.next.prol, %.lr.ph10.prol.loopexit.unr-lcssa ]
  %.unr16 = phi double [ %65, %.lr.ph10.preheader ], [ %73, %.lr.ph10.prol.loopexit.unr-lcssa ]
  %74 = icmp ult i64 %63, 3
  br i1 %74, label %._crit_edge11.loopexit, label %.lr.ph10.preheader.new

.lr.ph10.preheader.new:                           ; preds = %.lr.ph10.prol.loopexit
  br label %.lr.ph10

.lr.ph10:                                         ; preds = %.lr.ph10, %.lr.ph10.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %.lr.ph10.preheader.new ], [ %indvars.iv.next.3, %.lr.ph10 ]
  %75 = phi double [ %.unr16, %.lr.ph10.preheader.new ], [ %99, %.lr.ph10 ]
  %76 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv39, i64 %indvars.iv
  %77 = load double, double* %76, align 8
  %78 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  %79 = load double, double* %78, align 8
  %80 = fmul double %77, %79
  %81 = fsub double %75, %80
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %82 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv39, i64 %indvars.iv.next
  %83 = load double, double* %82, align 8
  %84 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next
  %85 = load double, double* %84, align 8
  %86 = fmul double %83, %85
  %87 = fsub double %81, %86
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %88 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv39, i64 %indvars.iv.next.1
  %89 = load double, double* %88, align 8
  %90 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next.1
  %91 = load double, double* %90, align 8
  %92 = fmul double %89, %91
  %93 = fsub double %87, %92
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %94 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv39, i64 %indvars.iv.next.2
  %95 = load double, double* %94, align 8
  %96 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next.2
  %97 = load double, double* %96, align 8
  %98 = fmul double %95, %97
  %99 = fsub double %93, %98
  %exitcond38.3 = icmp eq i64 %indvars.iv.next.2, %wide.trip.count37
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  br i1 %exitcond38.3, label %._crit_edge11.loopexit.unr-lcssa, label %.lr.ph10

._crit_edge11.loopexit.unr-lcssa:                 ; preds = %.lr.ph10
  br label %._crit_edge11.loopexit

._crit_edge11.loopexit:                           ; preds = %.lr.ph10.prol.loopexit, %._crit_edge11.loopexit.unr-lcssa
  %.lcssa2 = phi double [ %.lcssa2.unr, %.lr.ph10.prol.loopexit ], [ %99, %._crit_edge11.loopexit.unr-lcssa ]
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.loopexit, %.lr.ph13
  %.lcssa4 = phi double [ %65, %.lr.ph13 ], [ %.lcssa2, %._crit_edge11.loopexit ]
  %100 = getelementptr inbounds double, double* %3, i64 %indvars.iv39
  store double %.lcssa4, double* %100, align 8
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %indvars.iv.next36 = add nsw i32 %indvars.iv35, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next40, 2000
  br i1 %exitcond7, label %.lr.ph7.preheader, label %.lr.ph13

.lr.ph7.preheader:                                ; preds = %._crit_edge11
  %sunkaddr = ptrtoint double* %2 to i64
  br label %.lr.ph7

.lr.ph7:                                          ; preds = %.lr.ph7.preheader, %._crit_edge
  %indvar = phi i64 [ 0, %.lr.ph7.preheader ], [ %indvar.next, %._crit_edge ]
  %indvars.iv33 = phi i64 [ 2000, %.lr.ph7.preheader ], [ %indvars.iv.next34, %._crit_edge ]
  %101 = add i64 %indvar, -1
  %indvars.iv.next34 = add nsw i64 %indvars.iv33, -1
  %102 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next34
  %103 = load double, double* %102, align 8
  %104 = icmp slt i64 %indvars.iv33, 2000
  br i1 %104, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.lr.ph7
  %xtraiter = and i64 %indvar, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol, %.lr.ph.prol.preheader
  %indvars.iv31.prol = phi i64 [ %indvars.iv.next32.prol, %.lr.ph.prol ], [ %indvars.iv33, %.lr.ph.prol.preheader ]
  %105 = phi double [ %111, %.lr.ph.prol ], [ %103, %.lr.ph.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %106 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next34, i64 %indvars.iv31.prol
  %107 = load double, double* %106, align 8
  %108 = getelementptr inbounds double, double* %2, i64 %indvars.iv31.prol
  %109 = load double, double* %108, align 8
  %110 = fmul double %107, %109
  %111 = fsub double %105, %110
  %indvars.iv.next32.prol = add i64 %indvars.iv31.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.unr-lcssa, label %.lr.ph.prol, !llvm.loop !22

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.preheader, %.lr.ph.prol.loopexit.unr-lcssa
  %.lcssa1.unr = phi double [ undef, %.lr.ph.preheader ], [ %111, %.lr.ph.prol.loopexit.unr-lcssa ]
  %indvars.iv31.unr = phi i64 [ %indvars.iv33, %.lr.ph.preheader ], [ %indvars.iv.next32.prol, %.lr.ph.prol.loopexit.unr-lcssa ]
  %.unr = phi double [ %103, %.lr.ph.preheader ], [ %111, %.lr.ph.prol.loopexit.unr-lcssa ]
  %112 = icmp ult i64 %101, 3
  br i1 %112, label %._crit_edge.loopexit, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %indvars.iv31 = phi i64 [ %indvars.iv31.unr, %.lr.ph.preheader.new ], [ %indvars.iv.next32.3, %.lr.ph ]
  %113 = phi double [ %.unr, %.lr.ph.preheader.new ], [ %137, %.lr.ph ]
  %114 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next34, i64 %indvars.iv31
  %115 = load double, double* %114, align 8
  %116 = getelementptr inbounds double, double* %2, i64 %indvars.iv31
  %117 = load double, double* %116, align 8
  %118 = fmul double %115, %117
  %119 = fsub double %113, %118
  %indvars.iv.next32 = add i64 %indvars.iv31, 1
  %120 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next34, i64 %indvars.iv.next32
  %121 = load double, double* %120, align 8
  %122 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next32
  %123 = load double, double* %122, align 8
  %124 = fmul double %121, %123
  %125 = fsub double %119, %124
  %indvars.iv.next32.1 = add i64 %indvars.iv31, 2
  %126 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next34, i64 %indvars.iv.next32.1
  %127 = load double, double* %126, align 8
  %128 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next32.1
  %129 = load double, double* %128, align 8
  %130 = fmul double %127, %129
  %131 = fsub double %125, %130
  %indvars.iv.next32.2 = add i64 %indvars.iv31, 3
  %132 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next34, i64 %indvars.iv.next32.2
  %133 = load double, double* %132, align 8
  %134 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next32.2
  %135 = load double, double* %134, align 8
  %136 = fmul double %133, %135
  %137 = fsub double %131, %136
  %exitcond.3 = icmp eq i64 %indvars.iv.next32.2, 1999
  %indvars.iv.next32.3 = add i64 %indvars.iv31, 4
  br i1 %exitcond.3, label %._crit_edge.loopexit.unr-lcssa, label %.lr.ph

._crit_edge.loopexit.unr-lcssa:                   ; preds = %.lr.ph
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa1 = phi double [ %.lcssa1.unr, %.lr.ph.prol.loopexit ], [ %137, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph7
  %.lcssa = phi double [ %103, %.lr.ph7 ], [ %.lcssa1, %._crit_edge.loopexit ]
  %138 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next34, i64 %indvars.iv.next34
  %139 = load double, double* %138, align 8
  %140 = fdiv double %.lcssa, %139
  %sunkaddr70 = shl i64 %indvars.iv33, 3
  %sunkaddr71 = add i64 %sunkaddr, %sunkaddr70
  %sunkaddr72 = add i64 %sunkaddr71, -8
  %sunkaddr73 = inttoptr i64 %sunkaddr72 to double*
  store double %140, double* %sunkaddr73, align 8
  %141 = icmp sgt i64 %indvars.iv33, 1
  %indvar.next = add i64 %indvar, 1
  br i1 %141, label %.lr.ph7, label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(double*) #0 {
.lr.ph.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph._crit_edge, %.lr.ph.preheader
  %indvars.iv = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next, %.lr.ph._crit_edge ]
  %5 = trunc i64 %indvars.iv to i32
  %6 = srem i32 %5, 20
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %.lr.ph._crit_edge

; <label>:8:                                      ; preds = %.lr.ph
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %9) #5
  br label %.lr.ph._crit_edge

.lr.ph._crit_edge:                                ; preds = %.lr.ph, %8
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %12 = load double, double* %11, align 8
  %13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %12) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %.lr.ph._crit_edge
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %16) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { argmemonly nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = !{!7}
!7 = distinct !{!7, !3}
!8 = !{!5, !2}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.vectorize.width", i32 1}
!11 = !{!"llvm.loop.interleave.count", i32 1}
!12 = distinct !{!12, !10, !11}
!13 = !{!14}
!14 = distinct !{!14, !15}
!15 = distinct !{!15, !"LVerDomain"}
!16 = !{!17}
!17 = distinct !{!17, !15}
!18 = distinct !{!18, !10, !11}
!19 = distinct !{!19, !10, !11}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.unroll.disable"}
!22 = distinct !{!22, !21}
