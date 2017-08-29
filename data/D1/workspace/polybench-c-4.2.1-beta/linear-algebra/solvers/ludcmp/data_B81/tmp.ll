; ModuleID = 'A.ll'
source_filename = "ludcmp.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %7 = bitcast i8* %3 to [2000 x double]*
  %8 = bitcast i8* %4 to double*
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  tail call fastcc void @init_array([2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_ludcmp([2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array(double* %9)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %4
  %indvars.iv47 = phi i64 [ 0, %4 ], [ %indvars.iv.next48.1, %._crit_edge ]
  %5 = getelementptr inbounds double, double* %2, i64 %indvars.iv47
  %6 = bitcast double* %5 to <2 x double>*
  %7 = getelementptr inbounds double, double* %3, i64 %indvars.iv47
  %8 = bitcast double* %7 to <2 x double>*
  %indvars.iv.next48 = or i64 %indvars.iv47, 1
  %9 = trunc i64 %indvars.iv.next48 to i32
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds double, double* %1, i64 %indvars.iv47
  store <2 x double> zeroinitializer, <2 x double>* %6, align 8
  store <2 x double> zeroinitializer, <2 x double>* %8, align 8
  %indvars.iv.next48.1 = add nsw i64 %indvars.iv47, 2
  %12 = trunc i64 %indvars.iv.next48.1 to i32
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %10, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fdiv <2 x double> %15, <double 2.000000e+03, double 2.000000e+03>
  %17 = fmul <2 x double> %16, <double 5.000000e-01, double 5.000000e-01>
  %18 = fadd <2 x double> %17, <double 4.000000e+00, double 4.000000e+00>
  %19 = bitcast double* %11 to <2 x double>*
  store <2 x double> %18, <2 x double>* %19, align 8
  %exitcond49.1 = icmp eq i64 %indvars.iv.next48, 1999
  br i1 %exitcond49.1, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %._crit_edge
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %._crit_edge10.._crit_edge81_crit_edge
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %._crit_edge10.._crit_edge81_crit_edge ], [ 0, %.lr.ph.preheader ]
  %20 = shl i64 %indvars.iv45, 32
  %sext = add i64 %20, 4294967296
  %21 = ashr exact i64 %sext, 32
  %22 = sub i64 1998, %indvars.iv45
  %23 = shl i64 %22, 3
  %24 = and i64 %23, 34359738360
  br label %26

._crit_edge82:                                    ; preds = %26
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %25 = icmp slt i64 %indvars.iv.next46, 2000
  br i1 %25, label %._crit_edge10.._crit_edge81_crit_edge, label %37

; <label>:26:                                     ; preds = %26, %.lr.ph
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %26 ], [ 0, %.lr.ph ]
  %27 = sub nsw i64 0, %indvars.iv32
  %28 = trunc i64 %27 to i32
  %29 = srem i32 %28, 2000
  %30 = sitofp i32 %29 to double
  %31 = fdiv double %30, 2.000000e+03
  %32 = fadd double %31, 1.000000e+00
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv45, i64 %indvars.iv32
  store double %32, double* %33, align 8
  %exitcond36 = icmp eq i64 %indvars.iv32, %indvars.iv45
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  br i1 %exitcond36, label %._crit_edge82, label %26

._crit_edge10.._crit_edge81_crit_edge:            ; preds = %._crit_edge82
  %34 = add nuw nsw i64 %24, 8
  %scevgep43 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv45, i64 %21
  %35 = bitcast double* %scevgep43 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %35, i8 0, i64 %34, i32 8, i1 false)
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv45, i64 %indvars.iv45
  store double 1.000000e+00, double* %36, align 8
  br label %.lr.ph

; <label>:37:                                     ; preds = %._crit_edge82
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv45, i64 %indvars.iv45
  store double 1.000000e+00, double* %38, align 8
  %39 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %40

; <label>:40:                                     ; preds = %40, %37
  %indvars.iv30 = phi i64 [ 0, %37 ], [ %indvars.iv.next31.7, %40 ]
  %41 = mul nuw nsw i64 %indvars.iv30, 16000
  %scevgep = getelementptr i8, i8* %39, i64 %41
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next31 = or i64 %indvars.iv30, 1
  %42 = mul nuw nsw i64 %indvars.iv.next31, 16000
  %scevgep.1 = getelementptr i8, i8* %39, i64 %42
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next31.1 = or i64 %indvars.iv30, 2
  %43 = mul nuw nsw i64 %indvars.iv.next31.1, 16000
  %scevgep.2 = getelementptr i8, i8* %39, i64 %43
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next31.2 = or i64 %indvars.iv30, 3
  %44 = mul nuw nsw i64 %indvars.iv.next31.2, 16000
  %scevgep.3 = getelementptr i8, i8* %39, i64 %44
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next31.3 = or i64 %indvars.iv30, 4
  %45 = mul nuw nsw i64 %indvars.iv.next31.3, 16000
  %scevgep.4 = getelementptr i8, i8* %39, i64 %45
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next31.4 = or i64 %indvars.iv30, 5
  %46 = mul nuw nsw i64 %indvars.iv.next31.4, 16000
  %scevgep.5 = getelementptr i8, i8* %39, i64 %46
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next31.5 = or i64 %indvars.iv30, 6
  %47 = mul nuw nsw i64 %indvars.iv.next31.5, 16000
  %scevgep.6 = getelementptr i8, i8* %39, i64 %47
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next31.6 = or i64 %indvars.iv30, 7
  %48 = mul nuw nsw i64 %indvars.iv.next31.6, 16000
  %scevgep.7 = getelementptr i8, i8* %39, i64 %48
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %exitcond50.7 = icmp eq i64 %indvars.iv.next31.6, 1999
  %indvars.iv.next31.7 = add nsw i64 %indvars.iv30, 8
  br i1 %exitcond50.7, label %._crit_edge85.preheader, label %40

._crit_edge85.preheader:                          ; preds = %40
  %49 = bitcast i8* %39 to [2000 x [2000 x double]]*
  %50 = bitcast i8* %39 to [2000 x [2000 x double]]*
  %51 = bitcast i8* %39 to [2000 x [2000 x double]]*
  br label %._crit_edge85

._crit_edge85:                                    ; preds = %._crit_edge85.preheader, %97
  %indvars.iv25 = phi i64 [ %52, %97 ], [ 0, %._crit_edge85.preheader ]
  %scevgep56 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv25
  %scevgep5657 = bitcast double* %scevgep56 to i8*
  %52 = add i64 %indvars.iv25, 1
  %scevgep58 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %52
  %scevgep5859 = bitcast double* %scevgep58 to i8*
  br label %._crit_edge87

._crit_edge87:                                    ; preds = %middle.block, %._crit_edge85
  %indvars.iv23 = phi i64 [ 0, %._crit_edge85 ], [ %indvars.iv.next24, %middle.block ]
  %53 = mul i64 %indvars.iv23, 16000
  %scevgep54 = getelementptr i8, i8* %39, i64 %53
  %54 = add i64 %53, 16000
  %scevgep55 = getelementptr i8, i8* %39, i64 %54
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv23, i64 %indvars.iv25
  %bound0 = icmp ult i8* %scevgep54, %scevgep5859
  %bound1 = icmp ult i8* %scevgep5657, %scevgep55
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %55 to i8*
  %bound061 = icmp ult i8* %scevgep54, %bc
  %bound162 = icmp ult i8* %bc, %scevgep55
  %found.conflict63 = and i1 %bound061, %bound162
  %conflict.rdx = or i1 %found.conflict, %found.conflict63
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %._crit_edge87
  br label %vector.body

scalar.ph.preheader:                              ; preds = %._crit_edge87
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %56 = or i64 %index, 1
  %57 = or i64 %index, 2
  %58 = or i64 %index, 3
  %59 = load double, double* %55, align 8, !alias.scope !1
  %60 = insertelement <2 x double> undef, double %59, i32 0
  %61 = shufflevector <2 x double> %60, <2 x double> undef, <2 x i32> zeroinitializer
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index, i64 %indvars.iv25
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %56, i64 %indvars.iv25
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %57, i64 %indvars.iv25
  %65 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %58, i64 %indvars.iv25
  %66 = load double, double* %62, align 8, !alias.scope !4
  %67 = load double, double* %63, align 8, !alias.scope !4
  %68 = load double, double* %64, align 8, !alias.scope !4
  %69 = load double, double* %65, align 8, !alias.scope !4
  %70 = insertelement <2 x double> undef, double %66, i32 0
  %71 = insertelement <2 x double> %70, double %67, i32 1
  %72 = insertelement <2 x double> undef, double %68, i32 0
  %73 = insertelement <2 x double> %72, double %69, i32 1
  %74 = fmul <2 x double> %61, %71
  %75 = fmul <2 x double> %61, %73
  %76 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv23, i64 %index
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !6, !noalias !8
  %78 = getelementptr double, double* %76, i64 2
  %79 = bitcast double* %78 to <2 x double>*
  %wide.load65 = load <2 x double>, <2 x double>* %79, align 8, !alias.scope !6, !noalias !8
  %80 = fadd <2 x double> %wide.load, %74
  %81 = fadd <2 x double> %wide.load65, %75
  store <2 x double> %80, <2 x double>* %77, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %81, <2 x double>* %79, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %82 = icmp eq i64 %index.next, 2000
  br i1 %82, label %middle.block.loopexit95, label %vector.body, !llvm.loop !9

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv20 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next21.1, %scalar.ph ]
  %83 = load double, double* %55, align 8
  %84 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv20, i64 %indvars.iv25
  %85 = load double, double* %84, align 8
  %86 = fmul double %83, %85
  %87 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv23, i64 %indvars.iv20
  %88 = load double, double* %87, align 8
  %89 = fadd double %88, %86
  store double %89, double* %87, align 8
  %indvars.iv.next21 = or i64 %indvars.iv20, 1
  %90 = load double, double* %55, align 8
  %91 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next21, i64 %indvars.iv25
  %92 = load double, double* %91, align 8
  %93 = fmul double %90, %92
  %94 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv23, i64 %indvars.iv.next21
  %95 = load double, double* %94, align 8
  %96 = fadd double %95, %93
  store double %96, double* %94, align 8
  %exitcond22.1 = icmp eq i64 %indvars.iv.next21, 1999
  %indvars.iv.next21.1 = add nsw i64 %indvars.iv20, 2
  br i1 %exitcond22.1, label %middle.block.loopexit, label %scalar.ph, !llvm.loop !12

middle.block.loopexit:                            ; preds = %scalar.ph
  br label %middle.block

middle.block.loopexit95:                          ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit95, %middle.block.loopexit
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next24, 2000
  br i1 %exitcond52, label %97, label %._crit_edge87

; <label>:97:                                     ; preds = %middle.block
  %exitcond53 = icmp eq i64 %52, 2000
  br i1 %exitcond53, label %._crit_edge88.preheader, label %._crit_edge85

._crit_edge88.preheader:                          ; preds = %97
  %98 = bitcast i8* %39 to [2000 x [2000 x double]]*
  %99 = bitcast i8* %39 to [2000 x [2000 x double]]*
  %100 = bitcast i8* %39 to [2000 x [2000 x double]]*
  %101 = bitcast i8* %39 to [2000 x [2000 x double]]*
  %102 = bitcast i8* %39 to [2000 x [2000 x double]]*
  %103 = bitcast i8* %39 to [2000 x [2000 x double]]*
  %104 = bitcast i8* %39 to [2000 x [2000 x double]]*
  br label %._crit_edge88

._crit_edge88:                                    ; preds = %._crit_edge88.preheader, %middle.block67
  %indvars.iv18 = phi i64 [ %105, %middle.block67 ], [ 0, %._crit_edge88.preheader ]
  %scevgep71 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv18, i64 0
  %scevgep7172 = bitcast double* %scevgep71 to i8*
  %105 = add i64 %indvars.iv18, 1
  %scevgep73 = getelementptr [2000 x double], [2000 x double]* %0, i64 %105, i64 0
  %scevgep7374 = bitcast double* %scevgep73 to i8*
  %106 = mul i64 %indvars.iv18, 16000
  %scevgep75 = getelementptr i8, i8* %39, i64 %106
  %107 = add i64 %106, 16000
  %scevgep76 = getelementptr i8, i8* %39, i64 %107
  %bound077 = icmp ult i8* %scevgep7172, %scevgep76
  %bound178 = icmp ult i8* %scevgep75, %scevgep7374
  %memcheck.conflict80 = and i1 %bound077, %bound178
  br i1 %memcheck.conflict80, label %scalar.ph68.preheader, label %vector.body66.preheader

vector.body66.preheader:                          ; preds = %._crit_edge88
  br label %vector.body66

scalar.ph68.preheader:                            ; preds = %._crit_edge88
  br label %scalar.ph68

vector.body66:                                    ; preds = %vector.body66, %vector.body66.preheader
  %index83 = phi i64 [ 0, %vector.body66.preheader ], [ %index.next84.1, %vector.body66 ]
  %108 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %103, i64 0, i64 %indvars.iv18, i64 %index83
  %109 = bitcast double* %108 to <2 x i64>*
  %wide.load91 = load <2 x i64>, <2 x i64>* %109, align 8, !alias.scope !13
  %110 = getelementptr double, double* %108, i64 2
  %111 = bitcast double* %110 to <2 x i64>*
  %wide.load92 = load <2 x i64>, <2 x i64>* %111, align 8, !alias.scope !13
  %112 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv18, i64 %index83
  %113 = bitcast double* %112 to <2 x i64>*
  store <2 x i64> %wide.load91, <2 x i64>* %113, align 8, !alias.scope !16, !noalias !13
  %114 = getelementptr double, double* %112, i64 2
  %115 = bitcast double* %114 to <2 x i64>*
  store <2 x i64> %wide.load92, <2 x i64>* %115, align 8, !alias.scope !16, !noalias !13
  %index.next84 = or i64 %index83, 4
  %116 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %104, i64 0, i64 %indvars.iv18, i64 %index.next84
  %117 = bitcast double* %116 to <2 x i64>*
  %wide.load91.1 = load <2 x i64>, <2 x i64>* %117, align 8, !alias.scope !13
  %118 = getelementptr double, double* %116, i64 2
  %119 = bitcast double* %118 to <2 x i64>*
  %wide.load92.1 = load <2 x i64>, <2 x i64>* %119, align 8, !alias.scope !13
  %120 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv18, i64 %index.next84
  %121 = bitcast double* %120 to <2 x i64>*
  store <2 x i64> %wide.load91.1, <2 x i64>* %121, align 8, !alias.scope !16, !noalias !13
  %122 = getelementptr double, double* %120, i64 2
  %123 = bitcast double* %122 to <2 x i64>*
  store <2 x i64> %wide.load92.1, <2 x i64>* %123, align 8, !alias.scope !16, !noalias !13
  %index.next84.1 = add nsw i64 %index83, 8
  %124 = icmp eq i64 %index.next84.1, 2000
  br i1 %124, label %middle.block67.loopexit94, label %vector.body66, !llvm.loop !18

scalar.ph68:                                      ; preds = %scalar.ph68, %scalar.ph68.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph68.preheader ], [ %indvars.iv.next.4, %scalar.ph68 ]
  %125 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %98, i64 0, i64 %indvars.iv18, i64 %indvars.iv
  %126 = bitcast double* %125 to i64*
  %127 = load i64, i64* %126, align 8
  %128 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv18, i64 %indvars.iv
  %129 = bitcast double* %128 to i64*
  store i64 %127, i64* %129, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %130 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %99, i64 0, i64 %indvars.iv18, i64 %indvars.iv.next
  %131 = bitcast double* %130 to i64*
  %132 = load i64, i64* %131, align 8
  %133 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv18, i64 %indvars.iv.next
  %134 = bitcast double* %133 to i64*
  store i64 %132, i64* %134, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %135 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %100, i64 0, i64 %indvars.iv18, i64 %indvars.iv.next.1
  %136 = bitcast double* %135 to i64*
  %137 = load i64, i64* %136, align 8
  %138 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv18, i64 %indvars.iv.next.1
  %139 = bitcast double* %138 to i64*
  store i64 %137, i64* %139, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %140 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %101, i64 0, i64 %indvars.iv18, i64 %indvars.iv.next.2
  %141 = bitcast double* %140 to i64*
  %142 = load i64, i64* %141, align 8
  %143 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv18, i64 %indvars.iv.next.2
  %144 = bitcast double* %143 to i64*
  store i64 %142, i64* %144, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %145 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %102, i64 0, i64 %indvars.iv18, i64 %indvars.iv.next.3
  %146 = bitcast double* %145 to i64*
  %147 = load i64, i64* %146, align 8
  %148 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv18, i64 %indvars.iv.next.3
  %149 = bitcast double* %148 to i64*
  store i64 %147, i64* %149, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond.4, label %middle.block67.loopexit, label %scalar.ph68, !llvm.loop !19

middle.block67.loopexit:                          ; preds = %scalar.ph68
  br label %middle.block67

middle.block67.loopexit94:                        ; preds = %vector.body66
  br label %middle.block67

middle.block67:                                   ; preds = %middle.block67.loopexit94, %middle.block67.loopexit
  %exitcond51 = icmp eq i64 %105, 2000
  br i1 %exitcond51, label %150, label %._crit_edge88

; <label>:150:                                    ; preds = %middle.block67
  tail call void @free(i8* nonnull %39) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge33, %4
  %indvars.iv87 = phi i64 [ %indvars.iv.next88, %._crit_edge33 ], [ 4294967295, %4 ]
  %indvars.iv79 = phi i64 [ %indvars.iv.next80, %._crit_edge33 ], [ 0, %4 ]
  %5 = sub i64 2000, %indvars.iv79
  %6 = add i64 %5, -4
  %7 = lshr i64 %6, 2
  %8 = sub i64 2000, %indvars.iv79
  %9 = and i64 %indvars.iv87, 4294967295
  %10 = icmp sgt i64 %indvars.iv79, 0
  br i1 %10, label %.lr.ph23.preheader, label %.lr.ph32.split.preheader

.lr.ph23.preheader:                               ; preds = %._crit_edge
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv79, i64 0
  br label %.lr.ph23

.lr.ph32.split.preheader:                         ; preds = %.lr.ph32..lr.ph32.split.preheader_crit_edge, %._crit_edge
  %min.iters.check = icmp ult i64 %8, 4
  br i1 %min.iters.check, label %.lr.ph32.split.preheader103, label %min.iters.checked

.lr.ph32.split.preheader103:                      ; preds = %middle.block, %min.iters.checked, %.lr.ph32.split.preheader
  %indvars.iv65.ph = phi i64 [ %indvars.iv79, %min.iters.checked ], [ %indvars.iv79, %.lr.ph32.split.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph32.split

min.iters.checked:                                ; preds = %.lr.ph32.split.preheader
  %n.vec = and i64 %8, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add i64 %indvars.iv79, %n.vec
  br i1 %cmp.zero, label %.lr.ph32.split.preheader103, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %12 = and i64 %7, 1
  %lcmp.mod117 = icmp eq i64 %12, 0
  br i1 %lcmp.mod117, label %vector.body.prol.preheader, label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv79, i64 %indvars.iv79
  %14 = bitcast double* %13 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %14, align 8
  %15 = getelementptr double, double* %13, i64 2
  %16 = bitcast double* %15 to <2 x i64>*
  %wide.load102.prol = load <2 x i64>, <2 x i64>* %16, align 8
  store <2 x i64> %wide.load.prol, <2 x i64>* %14, align 8
  store <2 x i64> %wide.load102.prol, <2 x i64>* %16, align 8
  br label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.preheader, %vector.body.prol
  %index.unr.ph = phi i64 [ 4, %vector.body.prol ], [ 0, %vector.body.preheader ]
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.unr-lcssa
  %17 = icmp eq i64 %7, 0
  br i1 %17, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr.ph, %vector.body.preheader.new ], [ %index.next.1, %vector.body ]
  %18 = add i64 %indvars.iv79, %index
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv79, i64 %18
  %20 = bitcast double* %19 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %20, align 8
  %21 = getelementptr double, double* %19, i64 2
  %22 = bitcast double* %21 to <2 x i64>*
  %wide.load102 = load <2 x i64>, <2 x i64>* %22, align 8
  store <2 x i64> %wide.load, <2 x i64>* %20, align 8
  store <2 x i64> %wide.load102, <2 x i64>* %22, align 8
  %index.next = add i64 %index, 4
  %23 = add i64 %indvars.iv79, %index.next
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv79, i64 %23
  %25 = bitcast double* %24 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %25, align 8
  %26 = getelementptr double, double* %24, i64 2
  %27 = bitcast double* %26 to <2 x i64>*
  %wide.load102.1 = load <2 x i64>, <2 x i64>* %27, align 8
  store <2 x i64> %wide.load.1, <2 x i64>* %25, align 8
  store <2 x i64> %wide.load102.1, <2 x i64>* %27, align 8
  %index.next.1 = add i64 %index, 8
  %28 = icmp eq i64 %index.next.1, %n.vec
  br i1 %28, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !20

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %8, %n.vec
  br i1 %cmp.n, label %._crit_edge33, label %.lr.ph32.split.preheader103

.lr.ph32:                                         ; preds = %._crit_edge20
  br i1 true, label %.lr.ph32.split.us.preheader, label %.lr.ph32..lr.ph32.split.preheader_crit_edge

.lr.ph32..lr.ph32.split.preheader_crit_edge:      ; preds = %.lr.ph32
  br label %.lr.ph32.split.preheader

.lr.ph32.split.us.preheader:                      ; preds = %.lr.ph32
  %29 = and i64 %indvars.iv87, 1
  %lcmp.mod119 = icmp eq i64 %29, 0
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv79, i64 0
  %31 = icmp eq i64 %9, 0
  br label %.lr.ph32.split.us

.lr.ph32.split.us:                                ; preds = %.lr.ph32.split.us.preheader, %._crit_edge28.us
  %indvars.iv77 = phi i64 [ %indvars.iv.next78, %._crit_edge28.us ], [ %indvars.iv79, %.lr.ph32.split.us.preheader ]
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv79, i64 %indvars.iv77
  %33 = load double, double* %32, align 8
  br i1 %lcmp.mod119, label %.prol.preheader, label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.lr.ph32.split.us
  br label %34

; <label>:34:                                     ; preds = %.prol.preheader
  %35 = load double, double* %30, align 8
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv77
  %37 = load double, double* %36, align 8
  %38 = fmul double %35, %37
  %39 = fsub double %33, %38
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph32.split.us, %34
  %.lcssa110.unr.ph = phi double [ %39, %34 ], [ undef, %.lr.ph32.split.us ]
  %indvars.iv69.unr.ph = phi i64 [ 1, %34 ], [ 0, %.lr.ph32.split.us ]
  %.125.us.unr.ph = phi double [ %39, %34 ], [ %33, %.lr.ph32.split.us ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  br i1 %31, label %._crit_edge28.us, label %.lr.ph32.split.us.new

.lr.ph32.split.us.new:                            ; preds = %.prol.loopexit
  br label %40

; <label>:40:                                     ; preds = %40, %.lr.ph32.split.us.new
  %indvars.iv69 = phi i64 [ %indvars.iv69.unr.ph, %.lr.ph32.split.us.new ], [ %indvars.iv.next70.1, %40 ]
  %.125.us = phi double [ %.125.us.unr.ph, %.lr.ph32.split.us.new ], [ %54, %40 ]
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv79, i64 %indvars.iv69
  %42 = bitcast double* %41 to <2 x double>*
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv69, i64 %indvars.iv77
  %44 = load double, double* %43, align 8
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %45 = load <2 x double>, <2 x double>* %42, align 8
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next70, i64 %indvars.iv77
  %47 = load double, double* %46, align 8
  %48 = insertelement <2 x double> undef, double %44, i32 0
  %49 = insertelement <2 x double> %48, double %47, i32 1
  %50 = fmul <2 x double> %45, %49
  %51 = extractelement <2 x double> %50, i32 0
  %52 = extractelement <2 x double> %50, i32 1
  %53 = fsub double %.125.us, %51
  %54 = fsub double %53, %52
  %exitcond89.1 = icmp eq i64 %indvars.iv.next70, %9
  %indvars.iv.next70.1 = add nsw i64 %indvars.iv69, 2
  br i1 %exitcond89.1, label %._crit_edge28.us.unr-lcssa, label %40

._crit_edge28.us.unr-lcssa:                       ; preds = %40
  br label %._crit_edge28.us

._crit_edge28.us:                                 ; preds = %.prol.loopexit, %._crit_edge28.us.unr-lcssa
  %.lcssa110 = phi double [ %.lcssa110.unr.ph, %.prol.loopexit ], [ %54, %._crit_edge28.us.unr-lcssa ]
  store double %.lcssa110, double* %32, align 8
  %indvars.iv.next78 = add nuw i64 %indvars.iv77, 1
  %exitcond98 = icmp eq i64 %indvars.iv.next78, 2000
  br i1 %exitcond98, label %._crit_edge33.loopexit, label %.lr.ph32.split.us

.lr.ph23:                                         ; preds = %.lr.ph23.preheader, %._crit_edge20
  %indvars.iv84 = phi i64 [ %indvars.iv.next85, %._crit_edge20 ], [ 4294967295, %.lr.ph23.preheader ]
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %._crit_edge20 ], [ 0, %.lr.ph23.preheader ]
  %55 = and i64 %indvars.iv84, 4294967295
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv79, i64 %indvars.iv61
  %57 = load double, double* %56, align 8
  %58 = icmp sgt i64 %indvars.iv61, 0
  br i1 %58, label %.lr.ph19.preheader, label %._crit_edge20

.lr.ph19.preheader:                               ; preds = %.lr.ph23
  %59 = and i64 %indvars.iv84, 1
  %lcmp.mod115 = icmp eq i64 %59, 0
  br i1 %lcmp.mod115, label %.lr.ph19.prol.preheader, label %.lr.ph19.prol.loopexit.unr-lcssa

.lr.ph19.prol.preheader:                          ; preds = %.lr.ph19.preheader
  br label %.lr.ph19.prol

.lr.ph19.prol:                                    ; preds = %.lr.ph19.prol.preheader
  %60 = load double, double* %11, align 8
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv61
  %62 = load double, double* %61, align 8
  %63 = fmul double %60, %62
  %64 = fsub double %57, %63
  br label %.lr.ph19.prol.loopexit.unr-lcssa

.lr.ph19.prol.loopexit.unr-lcssa:                 ; preds = %.lr.ph19.preheader, %.lr.ph19.prol
  %.lcssa109.unr.ph = phi double [ %64, %.lr.ph19.prol ], [ undef, %.lr.ph19.preheader ]
  %indvars.iv55.unr.ph = phi i64 [ 1, %.lr.ph19.prol ], [ 0, %.lr.ph19.preheader ]
  %.017.unr.ph = phi double [ %64, %.lr.ph19.prol ], [ %57, %.lr.ph19.preheader ]
  br label %.lr.ph19.prol.loopexit

.lr.ph19.prol.loopexit:                           ; preds = %.lr.ph19.prol.loopexit.unr-lcssa
  %65 = icmp eq i64 %55, 0
  br i1 %65, label %._crit_edge20.loopexit, label %.lr.ph19.preheader.new

.lr.ph19.preheader.new:                           ; preds = %.lr.ph19.prol.loopexit
  br label %.lr.ph19

.lr.ph19:                                         ; preds = %.lr.ph19, %.lr.ph19.preheader.new
  %indvars.iv55 = phi i64 [ %indvars.iv55.unr.ph, %.lr.ph19.preheader.new ], [ %indvars.iv.next56.1, %.lr.ph19 ]
  %.017 = phi double [ %.017.unr.ph, %.lr.ph19.preheader.new ], [ %79, %.lr.ph19 ]
  %66 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv79, i64 %indvars.iv55
  %67 = bitcast double* %66 to <2 x double>*
  %68 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv55, i64 %indvars.iv61
  %69 = load double, double* %68, align 8
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %70 = load <2 x double>, <2 x double>* %67, align 8
  %71 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next56, i64 %indvars.iv61
  %72 = load double, double* %71, align 8
  %73 = insertelement <2 x double> undef, double %69, i32 0
  %74 = insertelement <2 x double> %73, double %72, i32 1
  %75 = fmul <2 x double> %70, %74
  %76 = extractelement <2 x double> %75, i32 0
  %77 = extractelement <2 x double> %75, i32 1
  %78 = fsub double %.017, %76
  %79 = fsub double %78, %77
  %exitcond86.1 = icmp eq i64 %indvars.iv.next56, %55
  %indvars.iv.next56.1 = add nsw i64 %indvars.iv55, 2
  br i1 %exitcond86.1, label %._crit_edge20.loopexit.unr-lcssa, label %.lr.ph19

._crit_edge20.loopexit.unr-lcssa:                 ; preds = %.lr.ph19
  br label %._crit_edge20.loopexit

._crit_edge20.loopexit:                           ; preds = %.lr.ph19.prol.loopexit, %._crit_edge20.loopexit.unr-lcssa
  %.lcssa109 = phi double [ %.lcssa109.unr.ph, %.lr.ph19.prol.loopexit ], [ %79, %._crit_edge20.loopexit.unr-lcssa ]
  br label %._crit_edge20

._crit_edge20:                                    ; preds = %._crit_edge20.loopexit, %.lr.ph23
  %.0.lcssa = phi double [ %57, %.lr.ph23 ], [ %.lcssa109, %._crit_edge20.loopexit ]
  %80 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv61, i64 %indvars.iv61
  %81 = load double, double* %80, align 8
  %82 = fdiv double %.0.lcssa, %81
  store double %82, double* %56, align 8
  %indvars.iv.next62 = add nuw i64 %indvars.iv61, 1
  %83 = icmp slt i64 %indvars.iv.next62, %indvars.iv79
  %indvars.iv.next85 = add nuw nsw i64 %55, 1
  br i1 %83, label %.lr.ph23, label %.lr.ph32

.lr.ph32.split:                                   ; preds = %.lr.ph32.split.preheader103, %.lr.ph32.split
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %.lr.ph32.split ], [ %indvars.iv65.ph, %.lr.ph32.split.preheader103 ]
  %exitcond67 = icmp eq i64 %indvars.iv65, 1999
  %indvars.iv.next66 = add nuw i64 %indvars.iv65, 1
  br i1 %exitcond67, label %._crit_edge33.loopexit104, label %.lr.ph32.split, !llvm.loop !21

._crit_edge33.loopexit:                           ; preds = %._crit_edge28.us
  br label %._crit_edge33

._crit_edge33.loopexit104:                        ; preds = %.lr.ph32.split
  br label %._crit_edge33

._crit_edge33:                                    ; preds = %._crit_edge33.loopexit104, %._crit_edge33.loopexit, %middle.block
  %indvars.iv.next80 = add nuw i64 %indvars.iv79, 1
  %84 = icmp slt i64 %indvars.iv.next80, 2000
  %indvars.iv.next88 = add nuw nsw i64 %9, 1
  br i1 %84, label %._crit_edge, label %._crit_edge93.preheader

._crit_edge93.preheader:                          ; preds = %._crit_edge33
  br label %._crit_edge93

._crit_edge93:                                    ; preds = %._crit_edge93.preheader, %._crit_edge12
  %indvars.iv81 = phi i64 [ %indvars.iv.next82, %._crit_edge12 ], [ 4294967295, %._crit_edge93.preheader ]
  %indvars.iv53 = phi i64 [ %indvars.iv.next54, %._crit_edge12 ], [ 0, %._crit_edge93.preheader ]
  %85 = and i64 %indvars.iv81, 4294967295
  %86 = getelementptr inbounds double, double* %1, i64 %indvars.iv53
  %87 = load double, double* %86, align 8
  %88 = icmp sgt i64 %indvars.iv53, 0
  br i1 %88, label %.lr.ph11.preheader, label %._crit_edge12

.lr.ph11.preheader:                               ; preds = %._crit_edge93
  %89 = add nsw i64 %indvars.iv81, 1
  %xtraiter111 = and i64 %89, 3
  %lcmp.mod112 = icmp eq i64 %xtraiter111, 0
  br i1 %lcmp.mod112, label %.lr.ph11.prol.loopexit, label %.lr.ph11.prol.preheader

.lr.ph11.prol.preheader:                          ; preds = %.lr.ph11.preheader
  br label %.lr.ph11.prol

.lr.ph11.prol:                                    ; preds = %.lr.ph11.prol, %.lr.ph11.prol.preheader
  %indvars.iv48.prol = phi i64 [ %indvars.iv.next49.prol, %.lr.ph11.prol ], [ 0, %.lr.ph11.prol.preheader ]
  %.29.prol = phi double [ %95, %.lr.ph11.prol ], [ %87, %.lr.ph11.prol.preheader ]
  %prol.iter113 = phi i64 [ %prol.iter113.sub, %.lr.ph11.prol ], [ %xtraiter111, %.lr.ph11.prol.preheader ]
  %90 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv53, i64 %indvars.iv48.prol
  %91 = load double, double* %90, align 8
  %92 = getelementptr inbounds double, double* %3, i64 %indvars.iv48.prol
  %93 = load double, double* %92, align 8
  %94 = fmul double %91, %93
  %95 = fsub double %.29.prol, %94
  %indvars.iv.next49.prol = add nuw nsw i64 %indvars.iv48.prol, 1
  %prol.iter113.sub = add i64 %prol.iter113, -1
  %prol.iter113.cmp = icmp eq i64 %prol.iter113.sub, 0
  br i1 %prol.iter113.cmp, label %.lr.ph11.prol.loopexit.unr-lcssa, label %.lr.ph11.prol, !llvm.loop !23

.lr.ph11.prol.loopexit.unr-lcssa:                 ; preds = %.lr.ph11.prol
  br label %.lr.ph11.prol.loopexit

.lr.ph11.prol.loopexit:                           ; preds = %.lr.ph11.preheader, %.lr.ph11.prol.loopexit.unr-lcssa
  %.lcssa108.unr = phi double [ undef, %.lr.ph11.preheader ], [ %95, %.lr.ph11.prol.loopexit.unr-lcssa ]
  %indvars.iv48.unr = phi i64 [ 0, %.lr.ph11.preheader ], [ %indvars.iv.next49.prol, %.lr.ph11.prol.loopexit.unr-lcssa ]
  %.29.unr = phi double [ %87, %.lr.ph11.preheader ], [ %95, %.lr.ph11.prol.loopexit.unr-lcssa ]
  %96 = icmp ult i64 %85, 3
  br i1 %96, label %._crit_edge12.loopexit, label %.lr.ph11.preheader.new

.lr.ph11.preheader.new:                           ; preds = %.lr.ph11.prol.loopexit
  br label %.lr.ph11

.lr.ph11:                                         ; preds = %.lr.ph11, %.lr.ph11.preheader.new
  %indvars.iv48 = phi i64 [ %indvars.iv48.unr, %.lr.ph11.preheader.new ], [ %indvars.iv.next49.3, %.lr.ph11 ]
  %.29 = phi double [ %.29.unr, %.lr.ph11.preheader.new ], [ %118, %.lr.ph11 ]
  %97 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv53, i64 %indvars.iv48
  %98 = bitcast double* %97 to <2 x double>*
  %99 = getelementptr inbounds double, double* %3, i64 %indvars.iv48
  %100 = bitcast double* %99 to <2 x double>*
  %101 = load <2 x double>, <2 x double>* %98, align 8
  %102 = load <2 x double>, <2 x double>* %100, align 8
  %103 = fmul <2 x double> %101, %102
  %104 = extractelement <2 x double> %103, i32 0
  %105 = extractelement <2 x double> %103, i32 1
  %106 = fsub double %.29, %104
  %107 = fsub double %106, %105
  %indvars.iv.next49.1 = add nsw i64 %indvars.iv48, 2
  %108 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv53, i64 %indvars.iv.next49.1
  %109 = bitcast double* %108 to <2 x double>*
  %110 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next49.1
  %111 = bitcast double* %110 to <2 x double>*
  %indvars.iv.next49.2 = add nsw i64 %indvars.iv48, 3
  %112 = load <2 x double>, <2 x double>* %109, align 8
  %113 = load <2 x double>, <2 x double>* %111, align 8
  %114 = fmul <2 x double> %112, %113
  %115 = extractelement <2 x double> %114, i32 0
  %116 = extractelement <2 x double> %114, i32 1
  %117 = fsub double %107, %115
  %118 = fsub double %117, %116
  %exitcond83.3 = icmp eq i64 %indvars.iv.next49.2, %85
  %indvars.iv.next49.3 = add nsw i64 %indvars.iv48, 4
  br i1 %exitcond83.3, label %._crit_edge12.loopexit.unr-lcssa, label %.lr.ph11

._crit_edge12.loopexit.unr-lcssa:                 ; preds = %.lr.ph11
  br label %._crit_edge12.loopexit

._crit_edge12.loopexit:                           ; preds = %.lr.ph11.prol.loopexit, %._crit_edge12.loopexit.unr-lcssa
  %.lcssa108 = phi double [ %.lcssa108.unr, %.lr.ph11.prol.loopexit ], [ %118, %._crit_edge12.loopexit.unr-lcssa ]
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %._crit_edge93
  %.2.lcssa = phi double [ %87, %._crit_edge93 ], [ %.lcssa108, %._crit_edge12.loopexit ]
  %119 = getelementptr inbounds double, double* %3, i64 %indvars.iv53
  store double %.2.lcssa, double* %119, align 8
  %indvars.iv.next54 = add nuw i64 %indvars.iv53, 1
  %120 = icmp slt i64 %indvars.iv.next54, 2000
  %indvars.iv.next82 = add nuw nsw i64 %85, 1
  br i1 %120, label %._crit_edge93, label %._crit_edge12._crit_edge.preheader

._crit_edge12._crit_edge.preheader:               ; preds = %._crit_edge12
  br label %._crit_edge12._crit_edge

._crit_edge12._crit_edge:                         ; preds = %._crit_edge12._crit_edge.preheader, %._crit_edge5._crit_edge
  %indvar = phi i32 [ 0, %._crit_edge12._crit_edge.preheader ], [ %indvar.next, %._crit_edge5._crit_edge ]
  %indvars.iv46 = phi i64 [ 1999, %._crit_edge12._crit_edge.preheader ], [ %indvars.iv.next47, %._crit_edge5._crit_edge ]
  %indvars.iv = phi i32 [ 2000, %._crit_edge12._crit_edge.preheader ], [ %indvars.iv.next, %._crit_edge5._crit_edge ]
  %121 = sub i32 2000, %indvar
  %122 = sext i32 %121 to i64
  %123 = sub nsw i64 1999, %122
  %124 = getelementptr inbounds double, double* %3, i64 %indvars.iv46
  %125 = load double, double* %124, align 8
  %126 = add nsw i64 %indvars.iv46, 1
  %127 = icmp slt i64 %126, 2000
  br i1 %127, label %..lr.ph_crit_edge, label %._crit_edge5.thread

._crit_edge5.thread:                              ; preds = %._crit_edge12._crit_edge
  %128 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv46, i64 %indvars.iv46
  %129 = load double, double* %128, align 8
  %130 = fdiv double %125, %129
  %131 = getelementptr inbounds double, double* %2, i64 %indvars.iv46
  store double %130, double* %131, align 8
  br label %._crit_edge5._crit_edge

..lr.ph_crit_edge:                                ; preds = %._crit_edge12._crit_edge
  %132 = sext i32 %indvars.iv to i64
  %133 = sub nsw i64 0, %122
  %xtraiter = and i64 %133, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %..lr.ph_crit_edge
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol, %.lr.ph.prol.preheader
  %indvars.iv44.prol = phi i64 [ %indvars.iv.next45.prol, %.lr.ph.prol ], [ %132, %.lr.ph.prol.preheader ]
  %.33.prol = phi double [ %139, %.lr.ph.prol ], [ %125, %.lr.ph.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %134 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv46, i64 %indvars.iv44.prol
  %135 = load double, double* %134, align 8
  %136 = getelementptr inbounds double, double* %2, i64 %indvars.iv44.prol
  %137 = load double, double* %136, align 8
  %138 = fmul double %135, %137
  %139 = fsub double %.33.prol, %138
  %indvars.iv.next45.prol = add nsw i64 %indvars.iv44.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.unr-lcssa, label %.lr.ph.prol, !llvm.loop !25

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %..lr.ph_crit_edge, %.lr.ph.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %..lr.ph_crit_edge ], [ %139, %.lr.ph.prol.loopexit.unr-lcssa ]
  %indvars.iv44.unr = phi i64 [ %132, %..lr.ph_crit_edge ], [ %indvars.iv.next45.prol, %.lr.ph.prol.loopexit.unr-lcssa ]
  %.33.unr = phi double [ %125, %..lr.ph_crit_edge ], [ %139, %.lr.ph.prol.loopexit.unr-lcssa ]
  %140 = icmp ult i64 %123, 3
  br i1 %140, label %._crit_edge5, label %..lr.ph_crit_edge.new

..lr.ph_crit_edge.new:                            ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %..lr.ph_crit_edge.new
  %indvars.iv44 = phi i64 [ %indvars.iv44.unr, %..lr.ph_crit_edge.new ], [ %indvars.iv.next45.3, %.lr.ph ]
  %.33 = phi double [ %.33.unr, %..lr.ph_crit_edge.new ], [ %162, %.lr.ph ]
  %141 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv46, i64 %indvars.iv44
  %142 = bitcast double* %141 to <2 x double>*
  %143 = getelementptr inbounds double, double* %2, i64 %indvars.iv44
  %144 = bitcast double* %143 to <2 x double>*
  %145 = load <2 x double>, <2 x double>* %142, align 8
  %146 = load <2 x double>, <2 x double>* %144, align 8
  %147 = fmul <2 x double> %145, %146
  %148 = extractelement <2 x double> %147, i32 0
  %149 = extractelement <2 x double> %147, i32 1
  %150 = fsub double %.33, %148
  %151 = fsub double %150, %149
  %indvars.iv.next45.1 = add nsw i64 %indvars.iv44, 2
  %152 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv46, i64 %indvars.iv.next45.1
  %153 = bitcast double* %152 to <2 x double>*
  %154 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next45.1
  %155 = bitcast double* %154 to <2 x double>*
  %indvars.iv.next45.2 = add nsw i64 %indvars.iv44, 3
  %156 = load <2 x double>, <2 x double>* %153, align 8
  %157 = load <2 x double>, <2 x double>* %155, align 8
  %158 = fmul <2 x double> %156, %157
  %159 = extractelement <2 x double> %158, i32 0
  %160 = extractelement <2 x double> %158, i32 1
  %161 = fsub double %151, %159
  %162 = fsub double %161, %160
  %exitcond.3 = icmp eq i64 %indvars.iv.next45.2, 1999
  %indvars.iv.next45.3 = add nsw i64 %indvars.iv44, 4
  br i1 %exitcond.3, label %._crit_edge5.unr-lcssa, label %.lr.ph

._crit_edge5.unr-lcssa:                           ; preds = %.lr.ph
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %.lr.ph.prol.loopexit, %._crit_edge5.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %162, %._crit_edge5.unr-lcssa ]
  %163 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv46, i64 %indvars.iv46
  %164 = load double, double* %163, align 8
  %165 = fdiv double %.lcssa, %164
  %166 = getelementptr inbounds double, double* %2, i64 %indvars.iv46
  store double %165, double* %166, align 8
  %167 = icmp sgt i64 %indvars.iv46, 0
  br i1 %167, label %._crit_edge5._crit_edge, label %168

._crit_edge5._crit_edge:                          ; preds = %._crit_edge5.thread, %._crit_edge5
  %indvars.iv.next47 = add i64 %indvars.iv46, -1
  %indvars.iv.next = add i32 %indvars.iv, -1
  %indvar.next = add i32 %indvar, 1
  br label %._crit_edge12._crit_edge

; <label>:168:                                    ; preds = %._crit_edge5
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge, %1
  %indvars.iv = phi i64 [ 0, %1 ], [ %indvars.iv.next, %._crit_edge ]
  %6 = trunc i64 %indvars.iv to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %._crit_edge2
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %10) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge2, %9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %15, label %._crit_edge2

; <label>:15:                                     ; preds = %._crit_edge
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

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
!20 = distinct !{!20, !10, !11}
!21 = distinct !{!21, !22, !10, !11}
!22 = !{!"llvm.loop.unroll.runtime.disable"}
!23 = distinct !{!23, !24}
!24 = !{!"llvm.loop.unroll.disable"}
!25 = distinct !{!25, !24}
