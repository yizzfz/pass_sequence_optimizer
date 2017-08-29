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
  br i1 %11, label %12, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %.._crit_edge_crit_edge19

.._crit_edge_crit_edge19:                         ; preds = %12
  br label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array(double* %9)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge19, %.._crit_edge_crit_edge, %15
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

._crit_edge:                                      ; preds = %._crit_edge.._crit_edge_crit_edge, %4
  %indvars.iv57 = phi i64 [ 0, %4 ], [ %indvars.iv.next58.1, %._crit_edge.._crit_edge_crit_edge ]
  %5 = getelementptr inbounds double, double* %2, i64 %indvars.iv57
  %6 = bitcast double* %5 to <2 x double>*
  %7 = getelementptr inbounds double, double* %3, i64 %indvars.iv57
  %8 = bitcast double* %7 to <2 x double>*
  %indvars.iv.next58 = or i64 %indvars.iv57, 1
  %9 = trunc i64 %indvars.iv.next58 to i32
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds double, double* %1, i64 %indvars.iv57
  store <2 x double> zeroinitializer, <2 x double>* %6, align 8
  store <2 x double> zeroinitializer, <2 x double>* %8, align 8
  %indvars.iv.next58.1 = add nsw i64 %indvars.iv57, 2
  %12 = trunc i64 %indvars.iv.next58.1 to i32
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %10, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fdiv <2 x double> %15, <double 2.000000e+03, double 2.000000e+03>
  %17 = fmul <2 x double> %16, <double 5.000000e-01, double 5.000000e-01>
  %18 = fadd <2 x double> %17, <double 4.000000e+00, double 4.000000e+00>
  %19 = bitcast double* %11 to <2 x double>*
  store <2 x double> %18, <2 x double>* %19, align 8
  %exitcond59.1 = icmp eq i64 %indvars.iv.next58, 1999
  br i1 %exitcond59.1, label %.lr.ph.preheader, label %._crit_edge.._crit_edge_crit_edge

._crit_edge.._crit_edge_crit_edge:                ; preds = %._crit_edge
  br label %._crit_edge

.lr.ph.preheader:                                 ; preds = %._crit_edge
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %._crit_edge20.._crit_edge1_crit_edge
  %indvars.iv55 = phi i64 [ %indvars.iv.next56, %._crit_edge20.._crit_edge1_crit_edge ], [ 0, %.lr.ph.preheader ]
  %20 = shl i64 %indvars.iv55, 32
  %sext = add i64 %20, 4294967296
  %21 = ashr exact i64 %sext, 32
  %scevgep53 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv55, i64 %21
  %22 = sub i64 1998, %indvars.iv55
  %23 = shl i64 %22, 3
  %24 = and i64 %23, 34359738360
  %25 = add nuw nsw i64 %24, 8
  br label %27

._crit_edge2:                                     ; preds = %27
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %26 = icmp slt i64 %indvars.iv.next56, 2000
  br i1 %26, label %._crit_edge20.._crit_edge1_crit_edge, label %37

; <label>:27:                                     ; preds = %._crit_edge72, %.lr.ph
  %indvars.iv42 = phi i64 [ %indvars.iv.next43, %._crit_edge72 ], [ 0, %.lr.ph ]
  %28 = sub nsw i64 0, %indvars.iv42
  %29 = trunc i64 %28 to i32
  %30 = srem i32 %29, 2000
  %31 = sitofp i32 %30 to double
  %32 = fdiv double %31, 2.000000e+03
  %33 = fadd double %32, 1.000000e+00
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv55, i64 %indvars.iv42
  store double %33, double* %34, align 8
  %exitcond46 = icmp eq i64 %indvars.iv42, %indvars.iv55
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  br i1 %exitcond46, label %._crit_edge2, label %._crit_edge72

._crit_edge72:                                    ; preds = %27
  br label %27

._crit_edge20.._crit_edge1_crit_edge:             ; preds = %._crit_edge2
  %35 = bitcast double* %scevgep53 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %35, i8 0, i64 %25, i32 8, i1 false)
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv55, i64 %indvars.iv55
  store double 1.000000e+00, double* %36, align 8
  br label %.lr.ph

; <label>:37:                                     ; preds = %._crit_edge2
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv55, i64 %indvars.iv55
  store double 1.000000e+00, double* %38, align 8
  %39 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %40

; <label>:40:                                     ; preds = %._crit_edge73, %37
  %indvars.iv40 = phi i64 [ 0, %37 ], [ %indvars.iv.next41.7, %._crit_edge73 ]
  %41 = mul nuw nsw i64 %indvars.iv40, 16000
  %scevgep = getelementptr i8, i8* %39, i64 %41
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next41 = or i64 %indvars.iv40, 1
  %42 = mul nuw nsw i64 %indvars.iv.next41, 16000
  %scevgep.1 = getelementptr i8, i8* %39, i64 %42
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next41.1 = or i64 %indvars.iv40, 2
  %43 = mul nuw nsw i64 %indvars.iv.next41.1, 16000
  %scevgep.2 = getelementptr i8, i8* %39, i64 %43
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next41.2 = or i64 %indvars.iv40, 3
  %44 = mul nuw nsw i64 %indvars.iv.next41.2, 16000
  %scevgep.3 = getelementptr i8, i8* %39, i64 %44
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next41.3 = or i64 %indvars.iv40, 4
  %45 = mul nuw nsw i64 %indvars.iv.next41.3, 16000
  %scevgep.4 = getelementptr i8, i8* %39, i64 %45
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next41.4 = or i64 %indvars.iv40, 5
  %46 = mul nuw nsw i64 %indvars.iv.next41.4, 16000
  %scevgep.5 = getelementptr i8, i8* %39, i64 %46
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next41.5 = or i64 %indvars.iv40, 6
  %47 = mul nuw nsw i64 %indvars.iv.next41.5, 16000
  %scevgep.6 = getelementptr i8, i8* %39, i64 %47
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next41.6 = or i64 %indvars.iv40, 7
  %48 = mul nuw nsw i64 %indvars.iv.next41.6, 16000
  %scevgep.7 = getelementptr i8, i8* %39, i64 %48
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %exitcond60.7 = icmp eq i64 %indvars.iv.next41.6, 1999
  %indvars.iv.next41.7 = add nsw i64 %indvars.iv40, 8
  br i1 %exitcond60.7, label %._crit_edge5.preheader, label %._crit_edge73

._crit_edge73:                                    ; preds = %40
  br label %40

._crit_edge5.preheader:                           ; preds = %40
  %49 = bitcast i8* %39 to [2000 x [2000 x double]]*
  %50 = bitcast i8* %39 to [2000 x [2000 x double]]*
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %.._crit_edge5_crit_edge, %._crit_edge5.preheader
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %.._crit_edge5_crit_edge ], [ 0, %._crit_edge5.preheader ]
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %.._crit_edge7_crit_edge, %._crit_edge5
  %indvars.iv33 = phi i64 [ 0, %._crit_edge5 ], [ %indvars.iv.next34, %.._crit_edge7_crit_edge ]
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv33, i64 %indvars.iv35
  br label %52

; <label>:52:                                     ; preds = %._crit_edge74, %._crit_edge7
  %indvars.iv30 = phi i64 [ 0, %._crit_edge7 ], [ %indvars.iv.next31.1, %._crit_edge74 ]
  %53 = load double, double* %51, align 8
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv30, i64 %indvars.iv35
  %55 = load double, double* %54, align 8
  %56 = fmul double %53, %55
  %57 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv33, i64 %indvars.iv30
  %58 = load double, double* %57, align 8
  %59 = fadd double %58, %56
  store double %59, double* %57, align 8
  %indvars.iv.next31 = or i64 %indvars.iv30, 1
  %60 = load double, double* %51, align 8
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next31, i64 %indvars.iv35
  %62 = load double, double* %61, align 8
  %63 = fmul double %60, %62
  %64 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv33, i64 %indvars.iv.next31
  %65 = load double, double* %64, align 8
  %66 = fadd double %65, %63
  store double %66, double* %64, align 8
  %exitcond32.1 = icmp eq i64 %indvars.iv.next31, 1999
  %indvars.iv.next31.1 = add nsw i64 %indvars.iv30, 2
  br i1 %exitcond32.1, label %67, label %._crit_edge74

._crit_edge74:                                    ; preds = %52
  br label %52

; <label>:67:                                     ; preds = %52
  %indvars.iv.next34 = add nuw i64 %indvars.iv33, 1
  %68 = icmp slt i64 %indvars.iv.next34, 2000
  br i1 %68, label %.._crit_edge7_crit_edge, label %69

.._crit_edge7_crit_edge:                          ; preds = %67
  br label %._crit_edge7

; <label>:69:                                     ; preds = %67
  %indvars.iv.next36 = add nuw i64 %indvars.iv35, 1
  %70 = icmp slt i64 %indvars.iv.next36, 2000
  br i1 %70, label %.._crit_edge5_crit_edge, label %._crit_edge8.preheader

.._crit_edge5_crit_edge:                          ; preds = %69
  br label %._crit_edge5

._crit_edge8.preheader:                           ; preds = %69
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %middle.block.._crit_edge8_crit_edge, %._crit_edge8.preheader
  %indvars.iv28 = phi i64 [ %71, %middle.block.._crit_edge8_crit_edge ], [ 0, %._crit_edge8.preheader ]
  %scevgep61 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 0
  %71 = add i64 %indvars.iv28, 1
  %scevgep63 = getelementptr [2000 x double], [2000 x double]* %0, i64 %71, i64 0
  %scevgep65 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv28, i64 0
  %scevgep67 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %71, i64 0
  %bound0 = icmp ult double* %scevgep61, %scevgep67
  %bound1 = icmp ult double* %scevgep65, %scevgep63
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %._crit_edge8
  br label %vector.body

scalar.ph.preheader:                              ; preds = %._crit_edge8
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next.1, %vector.body.vector.body_crit_edge ]
  %72 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv28, i64 %index
  %73 = bitcast double* %72 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %73, align 8, !alias.scope !1
  %74 = getelementptr double, double* %72, i64 2
  %75 = bitcast double* %74 to <2 x i64>*
  %wide.load70 = load <2 x i64>, <2 x i64>* %75, align 8, !alias.scope !1
  %76 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 %index
  %77 = bitcast double* %76 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %77, align 8, !alias.scope !4, !noalias !1
  %78 = getelementptr double, double* %76, i64 2
  %79 = bitcast double* %78 to <2 x i64>*
  store <2 x i64> %wide.load70, <2 x i64>* %79, align 8, !alias.scope !4, !noalias !1
  %index.next = or i64 %index, 4
  %80 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv28, i64 %index.next
  %81 = bitcast double* %80 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %81, align 8, !alias.scope !1
  %82 = getelementptr double, double* %80, i64 2
  %83 = bitcast double* %82 to <2 x i64>*
  %wide.load70.1 = load <2 x i64>, <2 x i64>* %83, align 8, !alias.scope !1
  %84 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 %index.next
  %85 = bitcast double* %84 to <2 x i64>*
  store <2 x i64> %wide.load.1, <2 x i64>* %85, align 8, !alias.scope !4, !noalias !1
  %86 = getelementptr double, double* %84, i64 2
  %87 = bitcast double* %86 to <2 x i64>*
  store <2 x i64> %wide.load70.1, <2 x i64>* %87, align 8, !alias.scope !4, !noalias !1
  %index.next.1 = add nsw i64 %index, 8
  %88 = icmp eq i64 %index.next.1, 2000
  br i1 %88, label %middle.block.loopexit71, label %vector.body.vector.body_crit_edge, !llvm.loop !6

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

scalar.ph:                                        ; preds = %scalar.ph.scalar.ph_crit_edge, %scalar.ph.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next.4, %scalar.ph.scalar.ph_crit_edge ]
  %89 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv28, i64 %indvars.iv
  %90 = bitcast double* %89 to i64*
  %91 = load i64, i64* %90, align 8
  %92 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 %indvars.iv
  %93 = bitcast double* %92 to i64*
  store i64 %91, i64* %93, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %94 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv28, i64 %indvars.iv.next
  %95 = bitcast double* %94 to i64*
  %96 = load i64, i64* %95, align 8
  %97 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 %indvars.iv.next
  %98 = bitcast double* %97 to i64*
  store i64 %96, i64* %98, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %99 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv28, i64 %indvars.iv.next.1
  %100 = bitcast double* %99 to i64*
  %101 = load i64, i64* %100, align 8
  %102 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 %indvars.iv.next.1
  %103 = bitcast double* %102 to i64*
  store i64 %101, i64* %103, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %104 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv28, i64 %indvars.iv.next.2
  %105 = bitcast double* %104 to i64*
  %106 = load i64, i64* %105, align 8
  %107 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 %indvars.iv.next.2
  %108 = bitcast double* %107 to i64*
  store i64 %106, i64* %108, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %109 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv28, i64 %indvars.iv.next.3
  %110 = bitcast double* %109 to i64*
  %111 = load i64, i64* %110, align 8
  %112 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 %indvars.iv.next.3
  %113 = bitcast double* %112 to i64*
  store i64 %111, i64* %113, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond.4, label %middle.block.loopexit, label %scalar.ph.scalar.ph_crit_edge, !llvm.loop !9

scalar.ph.scalar.ph_crit_edge:                    ; preds = %scalar.ph
  br label %scalar.ph

middle.block.loopexit:                            ; preds = %scalar.ph
  br label %middle.block

middle.block.loopexit71:                          ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit71, %middle.block.loopexit
  %114 = icmp slt i64 %71, 2000
  br i1 %114, label %middle.block.._crit_edge8_crit_edge, label %115

middle.block.._crit_edge8_crit_edge:              ; preds = %middle.block
  br label %._crit_edge8

; <label>:115:                                    ; preds = %middle.block
  tail call void @free(i8* nonnull %39) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge38.._crit_edge_crit_edge, %4
  %indvars.iv90 = phi i32 [ %indvars.iv.next91, %._crit_edge38.._crit_edge_crit_edge ], [ -1, %4 ]
  %indvars.iv82 = phi i64 [ %indvars.iv.next83, %._crit_edge38.._crit_edge_crit_edge ], [ 0, %4 ]
  %5 = add i64 %indvars.iv82, 4294967295
  %6 = and i64 %5, 4294967295
  %7 = sub i64 2000, %indvars.iv82
  %8 = add i64 %7, -4
  %9 = lshr i64 %8, 2
  %10 = sub i64 2000, %indvars.iv82
  %11 = zext i32 %indvars.iv90 to i64
  %12 = icmp sgt i64 %indvars.iv82, 0
  br i1 %12, label %.lr.ph28.preheader, label %.lr.ph37.split.preheader

.lr.ph28.preheader:                               ; preds = %._crit_edge
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv82, i64 0
  br label %.lr.ph28

.lr.ph37.split.preheader:                         ; preds = %._crit_edge
  %min.iters.check = icmp ult i64 %10, 4
  br i1 %min.iters.check, label %.lr.ph37.split.preheader..lr.ph37.split.preheader105_crit_edge, label %min.iters.checked

.lr.ph37.split.preheader..lr.ph37.split.preheader105_crit_edge: ; preds = %.lr.ph37.split.preheader
  br label %.lr.ph37.split.preheader105

.lr.ph37.split.preheader105:                      ; preds = %middle.block..lr.ph37.split.preheader105_crit_edge, %min.iters.checked..lr.ph37.split.preheader105_crit_edge, %.lr.ph37.split.preheader..lr.ph37.split.preheader105_crit_edge
  %indvars.iv68.ph = phi i64 [ %indvars.iv82, %min.iters.checked..lr.ph37.split.preheader105_crit_edge ], [ %indvars.iv82, %.lr.ph37.split.preheader..lr.ph37.split.preheader105_crit_edge ], [ %ind.end, %middle.block..lr.ph37.split.preheader105_crit_edge ]
  br label %.lr.ph37.split

min.iters.checked:                                ; preds = %.lr.ph37.split.preheader
  %n.vec = and i64 %10, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add i64 %indvars.iv82, %n.vec
  br i1 %cmp.zero, label %min.iters.checked..lr.ph37.split.preheader105_crit_edge, label %vector.body.preheader

min.iters.checked..lr.ph37.split.preheader105_crit_edge: ; preds = %min.iters.checked
  br label %.lr.ph37.split.preheader105

vector.body.preheader:                            ; preds = %min.iters.checked
  %14 = and i64 %9, 1
  %lcmp.mod117 = icmp eq i64 %14, 0
  br i1 %lcmp.mod117, label %vector.body.prol.preheader, label %vector.body.preheader.vector.body.prol.loopexit.unr-lcssa_crit_edge

vector.body.preheader.vector.body.prol.loopexit.unr-lcssa_crit_edge: ; preds = %vector.body.preheader
  br label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv82, i64 %indvars.iv82
  %16 = bitcast double* %15 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %16, align 8
  %17 = getelementptr double, double* %15, i64 2
  %18 = bitcast double* %17 to <2 x i64>*
  %wide.load104.prol = load <2 x i64>, <2 x i64>* %18, align 8
  store <2 x i64> %wide.load.prol, <2 x i64>* %16, align 8
  store <2 x i64> %wide.load104.prol, <2 x i64>* %18, align 8
  br label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.preheader.vector.body.prol.loopexit.unr-lcssa_crit_edge, %vector.body.prol
  %index.unr.ph = phi i64 [ 4, %vector.body.prol ], [ 0, %vector.body.preheader.vector.body.prol.loopexit.unr-lcssa_crit_edge ]
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.unr-lcssa
  %19 = icmp eq i64 %9, 0
  br i1 %19, label %vector.body.prol.loopexit.middle.block_crit_edge, label %vector.body.preheader.new

vector.body.prol.loopexit.middle.block_crit_edge: ; preds = %vector.body.prol.loopexit
  br label %middle.block

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader.new
  %index = phi i64 [ %index.unr.ph, %vector.body.preheader.new ], [ %index.next.1, %vector.body.vector.body_crit_edge ]
  %20 = add i64 %indvars.iv82, %index
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv82, i64 %20
  %22 = bitcast double* %21 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %22, align 8
  %23 = getelementptr double, double* %21, i64 2
  %24 = bitcast double* %23 to <2 x i64>*
  %wide.load104 = load <2 x i64>, <2 x i64>* %24, align 8
  store <2 x i64> %wide.load, <2 x i64>* %22, align 8
  store <2 x i64> %wide.load104, <2 x i64>* %24, align 8
  %index.next = add i64 %index, 4
  %25 = add i64 %indvars.iv82, %index.next
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv82, i64 %25
  %27 = bitcast double* %26 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %27, align 8
  %28 = getelementptr double, double* %26, i64 2
  %29 = bitcast double* %28 to <2 x i64>*
  %wide.load104.1 = load <2 x i64>, <2 x i64>* %29, align 8
  store <2 x i64> %wide.load.1, <2 x i64>* %27, align 8
  store <2 x i64> %wide.load104.1, <2 x i64>* %29, align 8
  %index.next.1 = add i64 %index, 8
  %30 = icmp eq i64 %index.next.1, %n.vec
  br i1 %30, label %middle.block.unr-lcssa, label %vector.body.vector.body_crit_edge, !llvm.loop !10

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit.middle.block_crit_edge, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %10, %n.vec
  br i1 %cmp.n, label %middle.block.._crit_edge38_crit_edge, label %middle.block..lr.ph37.split.preheader105_crit_edge

middle.block..lr.ph37.split.preheader105_crit_edge: ; preds = %middle.block
  br label %.lr.ph37.split.preheader105

middle.block.._crit_edge38_crit_edge:             ; preds = %middle.block
  br label %._crit_edge38

.lr.ph37.split.us:                                ; preds = %._crit_edge33.us..lr.ph37.split.us_crit_edge, %.lr.ph37.split.us.preheader
  %indvars.iv80 = phi i64 [ %indvars.iv.next81, %._crit_edge33.us..lr.ph37.split.us_crit_edge ], [ %indvars.iv82, %.lr.ph37.split.us.preheader ]
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv82, i64 %indvars.iv80
  %32 = load double, double* %31, align 8
  br i1 %lcmp.mod121, label %.prol.preheader, label %.lr.ph37.split.us..prol.loopexit.unr-lcssa_crit_edge

.lr.ph37.split.us..prol.loopexit.unr-lcssa_crit_edge: ; preds = %.lr.ph37.split.us
  br label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.lr.ph37.split.us
  br label %33

; <label>:33:                                     ; preds = %.prol.preheader
  %34 = load double, double* %87, align 8
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv80
  %36 = load double, double* %35, align 8
  %37 = fmul double %34, %36
  %38 = fsub double %32, %37
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph37.split.us..prol.loopexit.unr-lcssa_crit_edge, %33
  %.lcssa112.unr.ph = phi double [ %38, %33 ], [ undef, %.lr.ph37.split.us..prol.loopexit.unr-lcssa_crit_edge ]
  %indvars.iv72.unr.ph = phi i64 [ 1, %33 ], [ 0, %.lr.ph37.split.us..prol.loopexit.unr-lcssa_crit_edge ]
  %.130.us.unr.ph = phi double [ %38, %33 ], [ %32, %.lr.ph37.split.us..prol.loopexit.unr-lcssa_crit_edge ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  br i1 %88, label %.prol.loopexit.._crit_edge33.us_crit_edge, label %.lr.ph37.split.us.new

.prol.loopexit.._crit_edge33.us_crit_edge:        ; preds = %.prol.loopexit
  br label %._crit_edge33.us

.lr.ph37.split.us.new:                            ; preds = %.prol.loopexit
  br label %39

; <label>:39:                                     ; preds = %._crit_edge122, %.lr.ph37.split.us.new
  %indvars.iv72 = phi i64 [ %indvars.iv72.unr.ph, %.lr.ph37.split.us.new ], [ %indvars.iv.next73.1, %._crit_edge122 ]
  %.130.us = phi double [ %.130.us.unr.ph, %.lr.ph37.split.us.new ], [ %53, %._crit_edge122 ]
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv82, i64 %indvars.iv72
  %41 = bitcast double* %40 to <2 x double>*
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv72, i64 %indvars.iv80
  %43 = load double, double* %42, align 8
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %44 = load <2 x double>, <2 x double>* %41, align 8
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next73, i64 %indvars.iv80
  %46 = load double, double* %45, align 8
  %47 = insertelement <2 x double> undef, double %43, i32 0
  %48 = insertelement <2 x double> %47, double %46, i32 1
  %49 = fmul <2 x double> %44, %48
  %50 = extractelement <2 x double> %49, i32 0
  %51 = extractelement <2 x double> %49, i32 1
  %52 = fsub double %.130.us, %50
  %53 = fsub double %52, %51
  %exitcond92.1 = icmp eq i64 %indvars.iv.next73, %11
  %indvars.iv.next73.1 = add nsw i64 %indvars.iv72, 2
  br i1 %exitcond92.1, label %._crit_edge33.us.unr-lcssa, label %._crit_edge122

._crit_edge122:                                   ; preds = %39
  br label %39

._crit_edge33.us.unr-lcssa:                       ; preds = %39
  br label %._crit_edge33.us

._crit_edge33.us:                                 ; preds = %.prol.loopexit.._crit_edge33.us_crit_edge, %._crit_edge33.us.unr-lcssa
  %.lcssa112 = phi double [ %.lcssa112.unr.ph, %.prol.loopexit.._crit_edge33.us_crit_edge ], [ %53, %._crit_edge33.us.unr-lcssa ]
  store double %.lcssa112, double* %31, align 8
  %indvars.iv.next81 = add nuw i64 %indvars.iv80, 1
  %54 = icmp slt i64 %indvars.iv.next81, 2000
  br i1 %54, label %._crit_edge33.us..lr.ph37.split.us_crit_edge, label %._crit_edge38.loopexit

._crit_edge33.us..lr.ph37.split.us_crit_edge:     ; preds = %._crit_edge33.us
  br label %.lr.ph37.split.us

.lr.ph28:                                         ; preds = %._crit_edge25..lr.ph28_crit_edge, %.lr.ph28.preheader
  %indvars.iv87 = phi i32 [ %indvars.iv.next88, %._crit_edge25..lr.ph28_crit_edge ], [ -1, %.lr.ph28.preheader ]
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %._crit_edge25..lr.ph28_crit_edge ], [ 0, %.lr.ph28.preheader ]
  %55 = add i64 %indvars.iv64, 4294967295
  %56 = and i64 %55, 4294967295
  %57 = zext i32 %indvars.iv87 to i64
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv82, i64 %indvars.iv64
  %59 = load double, double* %58, align 8
  %60 = icmp sgt i64 %indvars.iv64, 0
  br i1 %60, label %.lr.ph24.preheader, label %.lr.ph28.._crit_edge25_crit_edge

.lr.ph28.._crit_edge25_crit_edge:                 ; preds = %.lr.ph28
  br label %._crit_edge25

.lr.ph24.preheader:                               ; preds = %.lr.ph28
  %61 = and i64 %55, 1
  %lcmp.mod119 = icmp eq i64 %61, 0
  br i1 %lcmp.mod119, label %.lr.ph24.prol.preheader, label %.lr.ph24.preheader..lr.ph24.prol.loopexit.unr-lcssa_crit_edge

.lr.ph24.preheader..lr.ph24.prol.loopexit.unr-lcssa_crit_edge: ; preds = %.lr.ph24.preheader
  br label %.lr.ph24.prol.loopexit.unr-lcssa

.lr.ph24.prol.preheader:                          ; preds = %.lr.ph24.preheader
  br label %.lr.ph24.prol

.lr.ph24.prol:                                    ; preds = %.lr.ph24.prol.preheader
  %62 = load double, double* %13, align 8
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv64
  %64 = load double, double* %63, align 8
  %65 = fmul double %62, %64
  %66 = fsub double %59, %65
  br label %.lr.ph24.prol.loopexit.unr-lcssa

.lr.ph24.prol.loopexit.unr-lcssa:                 ; preds = %.lr.ph24.preheader..lr.ph24.prol.loopexit.unr-lcssa_crit_edge, %.lr.ph24.prol
  %.lcssa111.unr.ph = phi double [ %66, %.lr.ph24.prol ], [ undef, %.lr.ph24.preheader..lr.ph24.prol.loopexit.unr-lcssa_crit_edge ]
  %indvars.iv58.unr.ph = phi i64 [ 1, %.lr.ph24.prol ], [ 0, %.lr.ph24.preheader..lr.ph24.prol.loopexit.unr-lcssa_crit_edge ]
  %.022.unr.ph = phi double [ %66, %.lr.ph24.prol ], [ %59, %.lr.ph24.preheader..lr.ph24.prol.loopexit.unr-lcssa_crit_edge ]
  br label %.lr.ph24.prol.loopexit

.lr.ph24.prol.loopexit:                           ; preds = %.lr.ph24.prol.loopexit.unr-lcssa
  %67 = icmp eq i64 %56, 0
  br i1 %67, label %.lr.ph24.prol.loopexit.._crit_edge25.loopexit_crit_edge, label %.lr.ph24.preheader.new

.lr.ph24.prol.loopexit.._crit_edge25.loopexit_crit_edge: ; preds = %.lr.ph24.prol.loopexit
  br label %._crit_edge25.loopexit

.lr.ph24.preheader.new:                           ; preds = %.lr.ph24.prol.loopexit
  br label %.lr.ph24

.lr.ph24:                                         ; preds = %.lr.ph24..lr.ph24_crit_edge, %.lr.ph24.preheader.new
  %indvars.iv58 = phi i64 [ %indvars.iv58.unr.ph, %.lr.ph24.preheader.new ], [ %indvars.iv.next59.1, %.lr.ph24..lr.ph24_crit_edge ]
  %.022 = phi double [ %.022.unr.ph, %.lr.ph24.preheader.new ], [ %81, %.lr.ph24..lr.ph24_crit_edge ]
  %68 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv82, i64 %indvars.iv58
  %69 = bitcast double* %68 to <2 x double>*
  %70 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv58, i64 %indvars.iv64
  %71 = load double, double* %70, align 8
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %72 = load <2 x double>, <2 x double>* %69, align 8
  %73 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next59, i64 %indvars.iv64
  %74 = load double, double* %73, align 8
  %75 = insertelement <2 x double> undef, double %71, i32 0
  %76 = insertelement <2 x double> %75, double %74, i32 1
  %77 = fmul <2 x double> %72, %76
  %78 = extractelement <2 x double> %77, i32 0
  %79 = extractelement <2 x double> %77, i32 1
  %80 = fsub double %.022, %78
  %81 = fsub double %80, %79
  %exitcond89.1 = icmp eq i64 %indvars.iv.next59, %57
  %indvars.iv.next59.1 = add nsw i64 %indvars.iv58, 2
  br i1 %exitcond89.1, label %._crit_edge25.loopexit.unr-lcssa, label %.lr.ph24..lr.ph24_crit_edge

.lr.ph24..lr.ph24_crit_edge:                      ; preds = %.lr.ph24
  br label %.lr.ph24

._crit_edge25.loopexit.unr-lcssa:                 ; preds = %.lr.ph24
  br label %._crit_edge25.loopexit

._crit_edge25.loopexit:                           ; preds = %.lr.ph24.prol.loopexit.._crit_edge25.loopexit_crit_edge, %._crit_edge25.loopexit.unr-lcssa
  %.lcssa111 = phi double [ %.lcssa111.unr.ph, %.lr.ph24.prol.loopexit.._crit_edge25.loopexit_crit_edge ], [ %81, %._crit_edge25.loopexit.unr-lcssa ]
  br label %._crit_edge25

._crit_edge25:                                    ; preds = %.lr.ph28.._crit_edge25_crit_edge, %._crit_edge25.loopexit
  %.0.lcssa = phi double [ %59, %.lr.ph28.._crit_edge25_crit_edge ], [ %.lcssa111, %._crit_edge25.loopexit ]
  %82 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv64, i64 %indvars.iv64
  %83 = load double, double* %82, align 8
  %84 = fdiv double %.0.lcssa, %83
  store double %84, double* %58, align 8
  %indvars.iv.next65 = add nuw i64 %indvars.iv64, 1
  %85 = icmp slt i64 %indvars.iv.next65, %indvars.iv82
  %indvars.iv.next88 = add i32 %indvars.iv87, 1
  br i1 %85, label %._crit_edge25..lr.ph28_crit_edge, label %.lr.ph37.split.us.preheader

._crit_edge25..lr.ph28_crit_edge:                 ; preds = %._crit_edge25
  br label %.lr.ph28

.lr.ph37.split.us.preheader:                      ; preds = %._crit_edge25
  %86 = and i64 %5, 1
  %lcmp.mod121 = icmp eq i64 %86, 0
  %87 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv82, i64 0
  %88 = icmp eq i64 %6, 0
  br label %.lr.ph37.split.us

.lr.ph37.split:                                   ; preds = %.lr.ph37.split..lr.ph37.split_crit_edge, %.lr.ph37.split.preheader105
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %.lr.ph37.split..lr.ph37.split_crit_edge ], [ %indvars.iv68.ph, %.lr.ph37.split.preheader105 ]
  %exitcond70 = icmp eq i64 %indvars.iv68, 1999
  %indvars.iv.next69 = add nuw i64 %indvars.iv68, 1
  br i1 %exitcond70, label %._crit_edge38.loopexit106, label %.lr.ph37.split..lr.ph37.split_crit_edge, !llvm.loop !11

.lr.ph37.split..lr.ph37.split_crit_edge:          ; preds = %.lr.ph37.split
  br label %.lr.ph37.split

._crit_edge38.loopexit:                           ; preds = %._crit_edge33.us
  br label %._crit_edge38

._crit_edge38.loopexit106:                        ; preds = %.lr.ph37.split
  br label %._crit_edge38

._crit_edge38:                                    ; preds = %middle.block.._crit_edge38_crit_edge, %._crit_edge38.loopexit106, %._crit_edge38.loopexit
  %indvars.iv.next83 = add nuw i64 %indvars.iv82, 1
  %89 = icmp slt i64 %indvars.iv.next83, 2000
  %indvars.iv.next91 = add i32 %indvars.iv90, 1
  br i1 %89, label %._crit_edge38.._crit_edge_crit_edge, label %._crit_edge1.preheader

._crit_edge38.._crit_edge_crit_edge:              ; preds = %._crit_edge38
  br label %._crit_edge

._crit_edge1.preheader:                           ; preds = %._crit_edge38
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge17.._crit_edge1_crit_edge, %._crit_edge1.preheader
  %indvars.iv84 = phi i32 [ %indvars.iv.next85, %._crit_edge17.._crit_edge1_crit_edge ], [ -1, %._crit_edge1.preheader ]
  %indvars.iv56 = phi i64 [ %indvars.iv.next57, %._crit_edge17.._crit_edge1_crit_edge ], [ 0, %._crit_edge1.preheader ]
  %90 = add i64 %indvars.iv56, 4294967295
  %91 = and i64 %90, 4294967295
  %92 = zext i32 %indvars.iv84 to i64
  %93 = getelementptr inbounds double, double* %1, i64 %indvars.iv56
  %94 = load double, double* %93, align 8
  %95 = icmp sgt i64 %indvars.iv56, 0
  br i1 %95, label %.lr.ph16.preheader, label %._crit_edge1.._crit_edge17_crit_edge

._crit_edge1.._crit_edge17_crit_edge:             ; preds = %._crit_edge1
  br label %._crit_edge17

.lr.ph16.preheader:                               ; preds = %._crit_edge1
  %xtraiter113 = and i64 %indvars.iv56, 3
  %lcmp.mod114 = icmp eq i64 %xtraiter113, 0
  br i1 %lcmp.mod114, label %.lr.ph16.preheader..lr.ph16.prol.loopexit_crit_edge, label %.lr.ph16.prol.preheader

.lr.ph16.preheader..lr.ph16.prol.loopexit_crit_edge: ; preds = %.lr.ph16.preheader
  br label %.lr.ph16.prol.loopexit

.lr.ph16.prol.preheader:                          ; preds = %.lr.ph16.preheader
  br label %.lr.ph16.prol

.lr.ph16.prol:                                    ; preds = %.lr.ph16.prol..lr.ph16.prol_crit_edge, %.lr.ph16.prol.preheader
  %indvars.iv51.prol = phi i64 [ %indvars.iv.next52.prol, %.lr.ph16.prol..lr.ph16.prol_crit_edge ], [ 0, %.lr.ph16.prol.preheader ]
  %.214.prol = phi double [ %101, %.lr.ph16.prol..lr.ph16.prol_crit_edge ], [ %94, %.lr.ph16.prol.preheader ]
  %prol.iter115 = phi i64 [ %prol.iter115.sub, %.lr.ph16.prol..lr.ph16.prol_crit_edge ], [ %xtraiter113, %.lr.ph16.prol.preheader ]
  %96 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv56, i64 %indvars.iv51.prol
  %97 = load double, double* %96, align 8
  %98 = getelementptr inbounds double, double* %3, i64 %indvars.iv51.prol
  %99 = load double, double* %98, align 8
  %100 = fmul double %97, %99
  %101 = fsub double %.214.prol, %100
  %indvars.iv.next52.prol = add nuw nsw i64 %indvars.iv51.prol, 1
  %prol.iter115.sub = add i64 %prol.iter115, -1
  %prol.iter115.cmp = icmp eq i64 %prol.iter115.sub, 0
  br i1 %prol.iter115.cmp, label %.lr.ph16.prol.loopexit.unr-lcssa, label %.lr.ph16.prol..lr.ph16.prol_crit_edge, !llvm.loop !13

.lr.ph16.prol..lr.ph16.prol_crit_edge:            ; preds = %.lr.ph16.prol
  br label %.lr.ph16.prol

.lr.ph16.prol.loopexit.unr-lcssa:                 ; preds = %.lr.ph16.prol
  br label %.lr.ph16.prol.loopexit

.lr.ph16.prol.loopexit:                           ; preds = %.lr.ph16.preheader..lr.ph16.prol.loopexit_crit_edge, %.lr.ph16.prol.loopexit.unr-lcssa
  %.lcssa110.unr = phi double [ undef, %.lr.ph16.preheader..lr.ph16.prol.loopexit_crit_edge ], [ %101, %.lr.ph16.prol.loopexit.unr-lcssa ]
  %indvars.iv51.unr = phi i64 [ 0, %.lr.ph16.preheader..lr.ph16.prol.loopexit_crit_edge ], [ %indvars.iv.next52.prol, %.lr.ph16.prol.loopexit.unr-lcssa ]
  %.214.unr = phi double [ %94, %.lr.ph16.preheader..lr.ph16.prol.loopexit_crit_edge ], [ %101, %.lr.ph16.prol.loopexit.unr-lcssa ]
  %102 = icmp ult i64 %91, 3
  br i1 %102, label %.lr.ph16.prol.loopexit.._crit_edge17.loopexit_crit_edge, label %.lr.ph16.preheader.new

.lr.ph16.prol.loopexit.._crit_edge17.loopexit_crit_edge: ; preds = %.lr.ph16.prol.loopexit
  br label %._crit_edge17.loopexit

.lr.ph16.preheader.new:                           ; preds = %.lr.ph16.prol.loopexit
  br label %.lr.ph16

.lr.ph16:                                         ; preds = %.lr.ph16..lr.ph16_crit_edge, %.lr.ph16.preheader.new
  %indvars.iv51 = phi i64 [ %indvars.iv51.unr, %.lr.ph16.preheader.new ], [ %indvars.iv.next52.3, %.lr.ph16..lr.ph16_crit_edge ]
  %.214 = phi double [ %.214.unr, %.lr.ph16.preheader.new ], [ %124, %.lr.ph16..lr.ph16_crit_edge ]
  %103 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv56, i64 %indvars.iv51
  %104 = bitcast double* %103 to <2 x double>*
  %105 = getelementptr inbounds double, double* %3, i64 %indvars.iv51
  %106 = bitcast double* %105 to <2 x double>*
  %107 = load <2 x double>, <2 x double>* %104, align 8
  %108 = load <2 x double>, <2 x double>* %106, align 8
  %109 = fmul <2 x double> %107, %108
  %110 = extractelement <2 x double> %109, i32 0
  %111 = extractelement <2 x double> %109, i32 1
  %112 = fsub double %.214, %110
  %113 = fsub double %112, %111
  %indvars.iv.next52.1 = add nsw i64 %indvars.iv51, 2
  %114 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv56, i64 %indvars.iv.next52.1
  %115 = bitcast double* %114 to <2 x double>*
  %116 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next52.1
  %117 = bitcast double* %116 to <2 x double>*
  %indvars.iv.next52.2 = add nsw i64 %indvars.iv51, 3
  %118 = load <2 x double>, <2 x double>* %115, align 8
  %119 = load <2 x double>, <2 x double>* %117, align 8
  %120 = fmul <2 x double> %118, %119
  %121 = extractelement <2 x double> %120, i32 0
  %122 = extractelement <2 x double> %120, i32 1
  %123 = fsub double %113, %121
  %124 = fsub double %123, %122
  %exitcond86.3 = icmp eq i64 %indvars.iv.next52.2, %92
  %indvars.iv.next52.3 = add nsw i64 %indvars.iv51, 4
  br i1 %exitcond86.3, label %._crit_edge17.loopexit.unr-lcssa, label %.lr.ph16..lr.ph16_crit_edge

.lr.ph16..lr.ph16_crit_edge:                      ; preds = %.lr.ph16
  br label %.lr.ph16

._crit_edge17.loopexit.unr-lcssa:                 ; preds = %.lr.ph16
  br label %._crit_edge17.loopexit

._crit_edge17.loopexit:                           ; preds = %.lr.ph16.prol.loopexit.._crit_edge17.loopexit_crit_edge, %._crit_edge17.loopexit.unr-lcssa
  %.lcssa110 = phi double [ %.lcssa110.unr, %.lr.ph16.prol.loopexit.._crit_edge17.loopexit_crit_edge ], [ %124, %._crit_edge17.loopexit.unr-lcssa ]
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge1.._crit_edge17_crit_edge, %._crit_edge17.loopexit
  %.2.lcssa = phi double [ %94, %._crit_edge1.._crit_edge17_crit_edge ], [ %.lcssa110, %._crit_edge17.loopexit ]
  %125 = getelementptr inbounds double, double* %3, i64 %indvars.iv56
  store double %.2.lcssa, double* %125, align 8
  %indvars.iv.next57 = add nuw i64 %indvars.iv56, 1
  %126 = icmp slt i64 %indvars.iv.next57, 2000
  %indvars.iv.next85 = add i32 %indvars.iv84, 1
  br i1 %126, label %._crit_edge17.._crit_edge1_crit_edge, label %._crit_edge3.preheader

._crit_edge17.._crit_edge1_crit_edge:             ; preds = %._crit_edge17
  br label %._crit_edge1

._crit_edge3.preheader:                           ; preds = %._crit_edge17
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.preheader, %._crit_edge10.._crit_edge3_crit_edge
  %indvar = phi i32 [ 0, %._crit_edge3.preheader ], [ %indvar.next, %._crit_edge10.._crit_edge3_crit_edge ]
  %indvars.iv48 = phi i64 [ 1999, %._crit_edge3.preheader ], [ %indvars.iv.next49, %._crit_edge10.._crit_edge3_crit_edge ]
  %indvars.iv = phi i32 [ 2000, %._crit_edge3.preheader ], [ %indvars.iv.next, %._crit_edge10.._crit_edge3_crit_edge ]
  %127 = sub i32 2000, %indvar
  %128 = sext i32 %127 to i64
  %129 = sub nsw i64 1999, %128
  %130 = getelementptr inbounds double, double* %3, i64 %indvars.iv48
  %131 = load double, double* %130, align 8
  %132 = add nsw i64 %indvars.iv48, 1
  %133 = icmp slt i64 %132, 2000
  br i1 %133, label %._crit_edge3..lr.ph_crit_edge, label %._crit_edge10.thread

._crit_edge10.thread:                             ; preds = %._crit_edge3
  %134 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv48, i64 %indvars.iv48
  %135 = load double, double* %134, align 8
  %136 = fdiv double %131, %135
  %137 = getelementptr inbounds double, double* %2, i64 %indvars.iv48
  store double %136, double* %137, align 8
  br label %._crit_edge10.._crit_edge3_crit_edge

._crit_edge3..lr.ph_crit_edge:                    ; preds = %._crit_edge3
  %138 = sext i32 %indvars.iv to i64
  %139 = sub nsw i64 0, %128
  %xtraiter = and i64 %139, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge3..lr.ph_crit_edge..lr.ph.prol.loopexit_crit_edge, label %.lr.ph.prol.preheader

._crit_edge3..lr.ph_crit_edge..lr.ph.prol.loopexit_crit_edge: ; preds = %._crit_edge3..lr.ph_crit_edge
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.preheader:                            ; preds = %._crit_edge3..lr.ph_crit_edge
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol..lr.ph.prol_crit_edge, %.lr.ph.prol.preheader
  %indvars.iv46.prol = phi i64 [ %indvars.iv.next47.prol, %.lr.ph.prol..lr.ph.prol_crit_edge ], [ %138, %.lr.ph.prol.preheader ]
  %.37.prol = phi double [ %145, %.lr.ph.prol..lr.ph.prol_crit_edge ], [ %131, %.lr.ph.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.prol..lr.ph.prol_crit_edge ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %140 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv48, i64 %indvars.iv46.prol
  %141 = load double, double* %140, align 8
  %142 = getelementptr inbounds double, double* %2, i64 %indvars.iv46.prol
  %143 = load double, double* %142, align 8
  %144 = fmul double %141, %143
  %145 = fsub double %.37.prol, %144
  %indvars.iv.next47.prol = add nsw i64 %indvars.iv46.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.unr-lcssa, label %.lr.ph.prol..lr.ph.prol_crit_edge, !llvm.loop !15

.lr.ph.prol..lr.ph.prol_crit_edge:                ; preds = %.lr.ph.prol
  br label %.lr.ph.prol

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %._crit_edge3..lr.ph_crit_edge..lr.ph.prol.loopexit_crit_edge, %.lr.ph.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %._crit_edge3..lr.ph_crit_edge..lr.ph.prol.loopexit_crit_edge ], [ %145, %.lr.ph.prol.loopexit.unr-lcssa ]
  %indvars.iv46.unr = phi i64 [ %138, %._crit_edge3..lr.ph_crit_edge..lr.ph.prol.loopexit_crit_edge ], [ %indvars.iv.next47.prol, %.lr.ph.prol.loopexit.unr-lcssa ]
  %.37.unr = phi double [ %131, %._crit_edge3..lr.ph_crit_edge..lr.ph.prol.loopexit_crit_edge ], [ %145, %.lr.ph.prol.loopexit.unr-lcssa ]
  %146 = icmp ult i64 %129, 3
  br i1 %146, label %.lr.ph.prol.loopexit.._crit_edge10_crit_edge, label %._crit_edge3..lr.ph_crit_edge.new

.lr.ph.prol.loopexit.._crit_edge10_crit_edge:     ; preds = %.lr.ph.prol.loopexit
  br label %._crit_edge10

._crit_edge3..lr.ph_crit_edge.new:                ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph..lr.ph_crit_edge, %._crit_edge3..lr.ph_crit_edge.new
  %indvars.iv46 = phi i64 [ %indvars.iv46.unr, %._crit_edge3..lr.ph_crit_edge.new ], [ %indvars.iv.next47.3, %.lr.ph..lr.ph_crit_edge ]
  %.37 = phi double [ %.37.unr, %._crit_edge3..lr.ph_crit_edge.new ], [ %168, %.lr.ph..lr.ph_crit_edge ]
  %147 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv48, i64 %indvars.iv46
  %148 = bitcast double* %147 to <2 x double>*
  %149 = getelementptr inbounds double, double* %2, i64 %indvars.iv46
  %150 = bitcast double* %149 to <2 x double>*
  %151 = load <2 x double>, <2 x double>* %148, align 8
  %152 = load <2 x double>, <2 x double>* %150, align 8
  %153 = fmul <2 x double> %151, %152
  %154 = extractelement <2 x double> %153, i32 0
  %155 = extractelement <2 x double> %153, i32 1
  %156 = fsub double %.37, %154
  %157 = fsub double %156, %155
  %indvars.iv.next47.1 = add nsw i64 %indvars.iv46, 2
  %158 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv48, i64 %indvars.iv.next47.1
  %159 = bitcast double* %158 to <2 x double>*
  %160 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next47.1
  %161 = bitcast double* %160 to <2 x double>*
  %indvars.iv.next47.2 = add nsw i64 %indvars.iv46, 3
  %162 = load <2 x double>, <2 x double>* %159, align 8
  %163 = load <2 x double>, <2 x double>* %161, align 8
  %164 = fmul <2 x double> %162, %163
  %165 = extractelement <2 x double> %164, i32 0
  %166 = extractelement <2 x double> %164, i32 1
  %167 = fsub double %157, %165
  %168 = fsub double %167, %166
  %exitcond.3 = icmp eq i64 %indvars.iv.next47.2, 1999
  %indvars.iv.next47.3 = add nsw i64 %indvars.iv46, 4
  br i1 %exitcond.3, label %._crit_edge10.unr-lcssa, label %.lr.ph..lr.ph_crit_edge

.lr.ph..lr.ph_crit_edge:                          ; preds = %.lr.ph
  br label %.lr.ph

._crit_edge10.unr-lcssa:                          ; preds = %.lr.ph
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %.lr.ph.prol.loopexit.._crit_edge10_crit_edge, %._crit_edge10.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %.lr.ph.prol.loopexit.._crit_edge10_crit_edge ], [ %168, %._crit_edge10.unr-lcssa ]
  %169 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv48, i64 %indvars.iv48
  %170 = load double, double* %169, align 8
  %171 = fdiv double %.lcssa, %170
  %172 = getelementptr inbounds double, double* %2, i64 %indvars.iv48
  store double %171, double* %172, align 8
  %173 = icmp sgt i64 %indvars.iv48, 0
  br i1 %173, label %._crit_edge10.._crit_edge10.._crit_edge3_crit_edge_crit_edge, label %174

._crit_edge10.._crit_edge10.._crit_edge3_crit_edge_crit_edge: ; preds = %._crit_edge10
  br label %._crit_edge10.._crit_edge3_crit_edge

._crit_edge10.._crit_edge3_crit_edge:             ; preds = %._crit_edge10.._crit_edge10.._crit_edge3_crit_edge_crit_edge, %._crit_edge10.thread
  %indvars.iv.next49 = add i64 %indvars.iv48, -1
  %indvars.iv.next = add i32 %indvars.iv, -1
  %indvar.next = add i32 %indvar, 1
  br label %._crit_edge3

; <label>:174:                                    ; preds = %._crit_edge10
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge.._crit_edge2_crit_edge, %1
  %indvars.iv = phi i64 [ 0, %1 ], [ %indvars.iv.next, %._crit_edge.._crit_edge2_crit_edge ]
  %6 = trunc i64 %indvars.iv to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %._crit_edge2.._crit_edge_crit_edge

._crit_edge2.._crit_edge_crit_edge:               ; preds = %._crit_edge2
  br label %._crit_edge

; <label>:9:                                      ; preds = %._crit_edge2
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge2.._crit_edge_crit_edge, %9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #7
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %15 = icmp slt i64 %indvars.iv.next, 2000
  br i1 %15, label %._crit_edge.._crit_edge2_crit_edge, label %16

._crit_edge.._crit_edge2_crit_edge:               ; preds = %._crit_edge
  br label %._crit_edge2

; <label>:16:                                     ; preds = %._crit_edge
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #6
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
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
!10 = distinct !{!10, !7, !8}
!11 = distinct !{!11, !12, !7, !8}
!12 = !{!"llvm.loop.unroll.runtime.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !14}
