; ModuleID = 'A.ll'
source_filename = "symm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %7 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1200 x double]*
  call void @init_array(i32 1000, i32 1200, double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
  call void (...) @polybench_timer_start() #3
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  %13 = bitcast i8* %7 to [1200 x double]*
  call void @kernel_symm(i32 1000, i32 1200, double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %13)
  call void (...) @polybench_timer_stop() #3
  call void (...) @polybench_timer_print() #3
  %14 = icmp sgt i32 %0, 42
  br i1 %14, label %15, label %19

; <label>:15:                                     ; preds = %2
  %16 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %16, align 1
  %17 = icmp eq i8 %strcmpload, 0
  br i1 %17, label %18, label %19

; <label>:18:                                     ; preds = %15
  call void @print_array(i32 1000, i32 1200, [1200 x double]* %8)
  br label %19

; <label>:19:                                     ; preds = %15, %18, %2
  call void @free(i8* %5) #3
  call void @free(i8* %6) #3
  call void @free(i8* %7) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32, i32, double*, double*, [1200 x double]*, [1000 x double]*, [1200 x double]*) #0 {
.preheader7.lr.ph:
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %.preheader7.lr.ph, %._crit_edge22.us
  %indvars.iv44 = phi i64 [ 0, %.preheader7.lr.ph ], [ %indvars.iv.next45, %._crit_edge22.us ]
  %7 = add i64 %indvars.iv44, 1200
  %8 = trunc i64 %7 to i32
  br label %9

; <label>:9:                                      ; preds = %.preheader7.us, %9
  %indvars.iv42 = phi i64 [ 0, %.preheader7.us ], [ %indvars.iv.next43, %9 ]
  %10 = add nsw i64 %indvars.iv44, %indvars.iv42
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 100
  %13 = sitofp i32 %12 to double
  %14 = fdiv double %13, 1.000000e+03
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv44, i64 %indvars.iv42
  store double %14, double* %15, align 8
  %16 = trunc i64 %indvars.iv42 to i32
  %17 = sub i32 %8, %16
  %18 = srem i32 %17, 100
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, 1.000000e+03
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv44, i64 %indvars.iv42
  store double %20, double* %21, align 8
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %22 = icmp slt i64 %indvars.iv.next43, 1200
  br i1 %22, label %9, label %._crit_edge22.us

._crit_edge22.us:                                 ; preds = %9
  %indvars.iv.next45 = add nsw i64 %indvars.iv44, 1
  %23 = icmp slt i64 %indvars.iv.next45, 1000
  br i1 %23, label %.preheader7.us, label %.preheader5.preheader

.preheader5.preheader:                            ; preds = %._crit_edge22.us
  br label %.preheader5

.preheader5:                                      ; preds = %.preheader5.preheader, %._crit_edge
  %indvars.iv40 = phi i64 [ %indvars.iv.next41, %._crit_edge ], [ 0, %.preheader5.preheader ]
  %indvar = phi i32 [ %indvar.next, %._crit_edge ], [ 0, %.preheader5.preheader ]
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %._crit_edge ], [ 1, %.preheader5.preheader ]
  %indvars.iv33 = phi i32 [ %indvars.iv.next34, %._crit_edge ], [ 1, %.preheader5.preheader ]
  %24 = sub i32 1007, %indvar
  %25 = sub i32 998, %indvar
  %26 = icmp slt i64 %indvars.iv40, 0
  br i1 %26, label %.preheader, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader5
  %wide.trip.count = zext i32 %indvars.iv33 to i64
  %27 = and i64 %indvars.iv40, 1
  %lcmp.mod47 = icmp eq i64 %27, 0
  br i1 %lcmp.mod47, label %.lr.ph.prol.preheader, label %.lr.ph.prol.loopexit.unr-lcssa

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader
  %28 = trunc i64 %indvars.iv40 to i32
  %29 = srem i32 %28, 100
  %30 = sitofp i32 %29 to double
  %31 = fdiv double %30, 1.000000e+03
  %32 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv40, i64 0
  store double %31, double* %32, align 8
  br label %.lr.ph.prol.loopexit.unr-lcssa

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.preheader, %.lr.ph.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %.lr.ph.prol ], [ 0, %.lr.ph.preheader ]
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.unr-lcssa
  %33 = icmp eq i64 %indvars.iv40, 0
  br i1 %33, label %.preheader.loopexit, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.preheader.loopexit.unr-lcssa:                    ; preds = %.lr.ph
  br label %.preheader.loopexit

.preheader.loopexit:                              ; preds = %.lr.ph.prol.loopexit, %.preheader.loopexit.unr-lcssa
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %.preheader5
  %indvars.iv.next41 = add nsw i64 %indvars.iv40, 1
  %34 = icmp slt i64 %indvars.iv.next41, 1000
  br i1 %34, label %.lr.ph13, label %._crit_edge

.lr.ph13:                                         ; preds = %.preheader
  %xtraiter = and i32 %24, 7
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph13
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv37.prol = phi i64 [ %indvars.iv.next38.prol, %.prol.preheader ], [ %indvars.iv35, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %35 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv40, i64 %indvars.iv37.prol
  store double -9.990000e+02, double* %35, align 8
  %indvars.iv.next38.prol = add nsw i64 %indvars.iv37.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !1

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph13
  %indvars.iv37.unr = phi i64 [ %indvars.iv35, %.lr.ph13 ], [ %indvars.iv.next38.prol, %.prol.loopexit.loopexit ]
  %36 = icmp ult i32 %25, 7
  br i1 %36, label %._crit_edge, label %.lr.ph13.new.preheader

.lr.ph13.new.preheader:                           ; preds = %.prol.loopexit
  br label %.lr.ph13.new

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.preheader.new ], [ %indvars.iv.next.1, %.lr.ph ]
  %37 = add nsw i64 %indvars.iv40, %indvars.iv
  %38 = trunc i64 %37 to i32
  %39 = srem i32 %38, 100
  %40 = sitofp i32 %39 to double
  %41 = fdiv double %40, 1.000000e+03
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv40, i64 %indvars.iv
  store double %41, double* %42, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %43 = add nsw i64 %indvars.iv40, %indvars.iv.next
  %44 = trunc i64 %43 to i32
  %45 = srem i32 %44, 100
  %46 = sitofp i32 %45 to double
  %47 = fdiv double %46, 1.000000e+03
  %48 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv40, i64 %indvars.iv.next
  store double %47, double* %48, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.1, label %.preheader.loopexit.unr-lcssa, label %.lr.ph

.lr.ph13.new:                                     ; preds = %.lr.ph13.new.preheader, %.lr.ph13.new
  %indvars.iv37 = phi i64 [ %indvars.iv.next38.7, %.lr.ph13.new ], [ %indvars.iv37.unr, %.lr.ph13.new.preheader ]
  %49 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv40, i64 %indvars.iv37
  store double -9.990000e+02, double* %49, align 8
  %indvars.iv.next38 = add nsw i64 %indvars.iv37, 1
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv40, i64 %indvars.iv.next38
  store double -9.990000e+02, double* %50, align 8
  %indvars.iv.next38.1 = add nsw i64 %indvars.iv37, 2
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv40, i64 %indvars.iv.next38.1
  store double -9.990000e+02, double* %51, align 8
  %indvars.iv.next38.2 = add nsw i64 %indvars.iv37, 3
  %52 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv40, i64 %indvars.iv.next38.2
  store double -9.990000e+02, double* %52, align 8
  %indvars.iv.next38.3 = add nsw i64 %indvars.iv37, 4
  %53 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv40, i64 %indvars.iv.next38.3
  store double -9.990000e+02, double* %53, align 8
  %indvars.iv.next38.4 = add nsw i64 %indvars.iv37, 5
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv40, i64 %indvars.iv.next38.4
  store double -9.990000e+02, double* %54, align 8
  %indvars.iv.next38.5 = add nsw i64 %indvars.iv37, 6
  %55 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv40, i64 %indvars.iv.next38.5
  store double -9.990000e+02, double* %55, align 8
  %indvars.iv.next38.6 = add nsw i64 %indvars.iv37, 7
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv40, i64 %indvars.iv.next38.6
  store double -9.990000e+02, double* %56, align 8
  %indvars.iv.next38.7 = add nsw i64 %indvars.iv37, 8
  %lftr.wideiv.7 = trunc i64 %indvars.iv.next38.7 to i32
  %exitcond39.7 = icmp eq i32 %lftr.wideiv.7, 1000
  br i1 %exitcond39.7, label %._crit_edge.loopexit, label %.lr.ph13.new

._crit_edge.loopexit:                             ; preds = %.lr.ph13.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %.preheader
  %indvars.iv.next34 = add i32 %indvars.iv33, 1
  %indvars.iv.next36 = add nsw i64 %indvars.iv35, 1
  %indvar.next = add i32 %indvar, 1
  br i1 %34, label %.preheader5, label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_symm(i32, i32, double, double, [1200 x double]*, [1000 x double]*, [1200 x double]*) #0 {
.preheader.lr.ph:
  %7 = fmul double %2, 0.000000e+00
  %broadcast.splatinsert53 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat54 = shufflevector <2 x double> %broadcast.splatinsert53, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert57 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat58 = shufflevector <2 x double> %broadcast.splatinsert57, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert59 = insertelement <2 x double> undef, double %7, i32 0
  %broadcast.splat60 = shufflevector <2 x double> %broadcast.splatinsert59, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader

.preheader:                                       ; preds = %.preheader.lr.ph, %._crit_edge8
  %indvars.iv36 = phi i64 [ 0, %.preheader.lr.ph ], [ %8, %._crit_edge8 ]
  %indvars.iv34 = phi i32 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next35, %._crit_edge8 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv36, i64 0
  %8 = add i64 %indvars.iv36, 1
  %scevgep41 = getelementptr [1200 x double], [1200 x double]* %4, i64 %8, i64 0
  %9 = icmp sgt i64 %indvars.iv36, 0
  br i1 %9, label %.lr.ph7.split.us.preheader, label %.lr.ph7.split.preheader

.lr.ph7.split.preheader:                          ; preds = %.preheader
  %scevgep45 = getelementptr [1200 x double], [1200 x double]* %6, i64 %8, i64 0
  %scevgep43 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvars.iv36, i64 0
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv36, i64 %indvars.iv36
  %bound0 = icmp ult double* %scevgep, %scevgep45
  %bound1 = icmp ult double* %scevgep43, %scevgep41
  %found.conflict = and i1 %bound0, %bound1
  %bound048 = icmp ult double* %scevgep, %10
  %bound149 = icmp ult double* %10, %scevgep41
  %found.conflict50 = and i1 %bound048, %bound149
  %conflict.rdx = or i1 %found.conflict, %found.conflict50
  br i1 %conflict.rdx, label %.lr.ph7.split.preheader61, label %vector.ph

.lr.ph7.split.preheader61:                        ; preds = %.lr.ph7.split.preheader
  br label %.lr.ph7.split

vector.ph:                                        ; preds = %.lr.ph7.split.preheader
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv36, i64 %index
  %12 = bitcast double* %11 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %12, align 8, !alias.scope !3, !noalias !6
  %13 = getelementptr double, double* %11, i64 2
  %14 = bitcast double* %13 to <2 x double>*
  %wide.load52 = load <2 x double>, <2 x double>* %14, align 8, !alias.scope !3, !noalias !6
  %15 = fmul <2 x double> %broadcast.splat54, %wide.load
  %16 = fmul <2 x double> %broadcast.splat54, %wide.load52
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv36, i64 %index
  %18 = bitcast double* %17 to <2 x double>*
  %wide.load55 = load <2 x double>, <2 x double>* %18, align 8, !alias.scope !9
  %19 = getelementptr double, double* %17, i64 2
  %20 = bitcast double* %19 to <2 x double>*
  %wide.load56 = load <2 x double>, <2 x double>* %20, align 8, !alias.scope !9
  %21 = fmul <2 x double> %broadcast.splat58, %wide.load55
  %22 = fmul <2 x double> %broadcast.splat58, %wide.load56
  %23 = load double, double* %10, align 8, !alias.scope !10
  %24 = insertelement <2 x double> undef, double %23, i32 0
  %25 = shufflevector <2 x double> %24, <2 x double> undef, <2 x i32> zeroinitializer
  %26 = fmul <2 x double> %21, %25
  %27 = fmul <2 x double> %22, %25
  %28 = fadd <2 x double> %15, %26
  %29 = fadd <2 x double> %16, %27
  %30 = fadd <2 x double> %28, %broadcast.splat60
  %31 = fadd <2 x double> %29, %broadcast.splat60
  store <2 x double> %30, <2 x double>* %12, align 8, !alias.scope !3, !noalias !6
  store <2 x double> %31, <2 x double>* %14, align 8, !alias.scope !3, !noalias !6
  %index.next = add i64 %index, 4
  %32 = icmp eq i64 %index.next, 1200
  br i1 %32, label %._crit_edge8.loopexit63, label %vector.body, !llvm.loop !11

.lr.ph7.split.us.preheader:                       ; preds = %.preheader
  %wide.trip.count = zext i32 %indvars.iv34 to i64
  %33 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv36, i64 %indvars.iv36
  br label %.lr.ph7.split.us

.lr.ph7.split.us:                                 ; preds = %.lr.ph7.split.us.preheader, %._crit_edge.us
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %._crit_edge.us ], [ 0, %.lr.ph7.split.us.preheader ]
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv36, i64 %indvars.iv32
  br label %35

; <label>:35:                                     ; preds = %35, %.lr.ph7.split.us
  %indvars.iv26 = phi i64 [ 0, %.lr.ph7.split.us ], [ %indvars.iv.next27, %35 ]
  %36 = phi double [ 0.000000e+00, %.lr.ph7.split.us ], [ %49, %35 ]
  %37 = load double, double* %34, align 8
  %38 = fmul double %37, %2
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv36, i64 %indvars.iv26
  %40 = load double, double* %39, align 8
  %41 = fmul double %38, %40
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv26, i64 %indvars.iv32
  %43 = load double, double* %42, align 8
  %44 = fadd double %41, %43
  store double %44, double* %42, align 8
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv26, i64 %indvars.iv32
  %46 = load double, double* %45, align 8
  %47 = load double, double* %39, align 8
  %48 = fmul double %46, %47
  %49 = fadd double %36, %48
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond = icmp eq i64 %indvars.iv.next27, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %35

._crit_edge.us:                                   ; preds = %35
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv36, i64 %indvars.iv32
  %51 = load double, double* %50, align 8
  %52 = fmul double %51, %3
  %53 = load double, double* %34, align 8
  %54 = fmul double %53, %2
  %55 = load double, double* %33, align 8
  %56 = fmul double %54, %55
  %57 = fadd double %52, %56
  %58 = fmul double %49, %2
  %59 = fadd double %57, %58
  store double %59, double* %50, align 8
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %60 = icmp slt i64 %indvars.iv.next33, 1200
  br i1 %60, label %.lr.ph7.split.us, label %._crit_edge8.loopexit

.lr.ph7.split:                                    ; preds = %.lr.ph7.split, %.lr.ph7.split.preheader61
  %indvars.iv = phi i64 [ 0, %.lr.ph7.split.preheader61 ], [ %indvars.iv.next.1, %.lr.ph7.split ]
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv36, i64 %indvars.iv
  %62 = load double, double* %61, align 8
  %63 = fmul double %62, %3
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv36, i64 %indvars.iv
  %65 = load double, double* %64, align 8
  %66 = fmul double %65, %2
  %67 = load double, double* %10, align 8
  %68 = fmul double %66, %67
  %69 = fadd double %63, %68
  %70 = fadd double %69, %7
  store double %70, double* %61, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv36, i64 %indvars.iv.next
  %72 = load double, double* %71, align 8
  %73 = fmul double %72, %3
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv36, i64 %indvars.iv.next
  %75 = load double, double* %74, align 8
  %76 = fmul double %75, %2
  %77 = load double, double* %10, align 8
  %78 = fmul double %76, %77
  %79 = fadd double %73, %78
  %80 = fadd double %79, %7
  store double %80, double* %71, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %81 = icmp slt i64 %indvars.iv.next.1, 1200
  br i1 %81, label %.lr.ph7.split, label %._crit_edge8.loopexit62, !llvm.loop !14

._crit_edge8.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge8

._crit_edge8.loopexit62:                          ; preds = %.lr.ph7.split
  br label %._crit_edge8

._crit_edge8.loopexit63:                          ; preds = %vector.body
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit63, %._crit_edge8.loopexit62, %._crit_edge8.loopexit
  %indvars.iv.next35 = add i32 %indvars.iv34, 1
  %82 = icmp slt i64 %8, 1000
  br i1 %82, label %.preheader, label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge8
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [1200 x double]*) #0 {
.preheader.lr.ph:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #4
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.lr.ph, %._crit_edge.us
  %indvars.iv11 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next12, %._crit_edge.us ]
  %7 = mul nsw i64 %indvars.iv11, 1000
  br label %8

; <label>:8:                                      ; preds = %15, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %15 ]
  %9 = add nsw i64 %7, %indvars.iv
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #4
  br label %15

; <label>:15:                                     ; preds = %13, %8
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv11, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %8

._crit_edge.us:                                   ; preds = %15
  %indvars.iv.next12 = add nsw i64 %indvars.iv11, 1
  %20 = icmp slt i64 %indvars.iv.next12, 1000
  br i1 %20, label %.preheader.us, label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge.us
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = !{!4}
!4 = distinct !{!4, !5}
!5 = distinct !{!5, !"LVerDomain"}
!6 = !{!7, !8}
!7 = distinct !{!7, !5}
!8 = distinct !{!8, !5}
!9 = !{!7}
!10 = !{!8}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.vectorize.width", i32 1}
!13 = !{!"llvm.loop.interleave.count", i32 1}
!14 = distinct !{!14, !12, !13}
