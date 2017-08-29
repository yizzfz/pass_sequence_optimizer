; ModuleID = 'A.ll'
source_filename = "trmm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"B\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = bitcast i8* %4 to [1000 x double]*
  %7 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @init_array(i32 1000, i32 1200, double* nonnull %3, [1000 x double]* %6, [1200 x double]* %7)
  call void (...) @polybench_timer_start() #4
  %8 = load double, double* %3, align 8
  call fastcc void @kernel_trmm(i32 1000, i32 1200, double %8, [1000 x double]* %6, [1200 x double]* %7)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %.._crit_edge_crit_edge16

.._crit_edge_crit_edge16:                         ; preds = %10
  br label %._crit_edge

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %14)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge16, %.._crit_edge_crit_edge, %13
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, [1000 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %2, align 8
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader.lr.ph, label %.._crit_edge35_crit_edge

.._crit_edge35_crit_edge:                         ; preds = %5
  br label %._crit_edge35

.preheader.lr.ph:                                 ; preds = %5
  %7 = icmp sgt i32 %1, 0
  %8 = sitofp i32 %1 to double
  %9 = sitofp i32 %0 to double
  br i1 %7, label %.preheader.us.preheader, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  %wide.trip.count57 = zext i32 %0 to i64
  br label %.preheader

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %10 = zext i32 %1 to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge32.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv49 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next50, %._crit_edge32.us..preheader.us_crit_edge ]
  %11 = icmp sgt i64 %indvars.iv49, 0
  br i1 %11, label %.lr.ph.us, label %.preheader.us.._crit_edge.us_crit_edge

.preheader.us.._crit_edge.us_crit_edge:           ; preds = %.preheader.us
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %.prol.loopexit.._crit_edge.us_crit_edge, %.lr.ph.us.new.._crit_edge.us_crit_edge, %.preheader.us.._crit_edge.us_crit_edge
  %12 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv49, i64 %indvars.iv49
  store double 1.000000e+00, double* %12, align 8
  %13 = trunc i64 %indvars.iv49 to i32
  %14 = add i32 %13, %1
  br label %._crit_edge68

._crit_edge68:                                    ; preds = %._crit_edge68.._crit_edge68_crit_edge, %._crit_edge.us
  %indvars.iv37 = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next38, %._crit_edge68.._crit_edge68_crit_edge ]
  %15 = sub nsw i64 0, %indvars.iv37
  %16 = trunc i64 %15 to i32
  %17 = add i32 %14, %16
  %18 = srem i32 %17, %1
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, %8
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %indvars.iv37
  store double %20, double* %21, align 8
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond = icmp eq i64 %indvars.iv.next38, %10
  br i1 %exitcond, label %._crit_edge32.us, label %._crit_edge68.._crit_edge68_crit_edge

._crit_edge68.._crit_edge68_crit_edge:            ; preds = %._crit_edge68
  br label %._crit_edge68

.lr.ph.us.new:                                    ; preds = %.prol.loopexit..lr.ph.us.new_crit_edge, %.lr.ph.us.new..lr.ph.us.new_crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.new..lr.ph.us.new_crit_edge ], [ %indvars.iv.unr.ph, %.prol.loopexit..lr.ph.us.new_crit_edge ]
  %22 = add nuw nsw i64 %indvars.iv, %indvars.iv49
  %23 = trunc i64 %22 to i32
  %24 = srem i32 %23, %0
  %25 = sitofp i32 %24 to double
  %26 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv49, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %27 = add nuw nsw i64 %indvars.iv.next, %indvars.iv49
  %28 = trunc i64 %27 to i32
  %29 = srem i32 %28, %0
  %30 = sitofp i32 %29 to double
  %31 = insertelement <2 x double> undef, double %9, i32 0
  %32 = insertelement <2 x double> %31, double %9, i32 1
  %33 = insertelement <2 x double> undef, double %25, i32 0
  %34 = insertelement <2 x double> %33, double %30, i32 1
  %35 = fdiv <2 x double> %34, %32
  %36 = bitcast double* %26 to <2 x double>*
  store <2 x double> %35, <2 x double>* %36, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond48.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv49
  br i1 %exitcond48.1, label %.lr.ph.us.new.._crit_edge.us_crit_edge, label %.lr.ph.us.new..lr.ph.us.new_crit_edge

.lr.ph.us.new..lr.ph.us.new_crit_edge:            ; preds = %.lr.ph.us.new
  br label %.lr.ph.us.new

.lr.ph.us.new.._crit_edge.us_crit_edge:           ; preds = %.lr.ph.us.new
  br label %._crit_edge.us

.lr.ph.us:                                        ; preds = %.preheader.us
  %xtraiter = and i64 %indvars.iv49, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.us..prol.loopexit_crit_edge, label %.prol.preheader

.lr.ph.us..prol.loopexit_crit_edge:               ; preds = %.lr.ph.us
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.lr.ph.us
  %37 = trunc i64 %indvars.iv49 to i32
  %38 = srem i32 %37, %0
  %39 = sitofp i32 %38 to double
  %40 = fdiv double %39, %9
  %41 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv49, i64 0
  store double %40, double* %41, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us..prol.loopexit_crit_edge, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us..prol.loopexit_crit_edge ]
  %42 = icmp eq i64 %indvars.iv49, 1
  br i1 %42, label %.prol.loopexit.._crit_edge.us_crit_edge, label %.prol.loopexit..lr.ph.us.new_crit_edge

.prol.loopexit..lr.ph.us.new_crit_edge:           ; preds = %.prol.loopexit
  br label %.lr.ph.us.new

.prol.loopexit.._crit_edge.us_crit_edge:          ; preds = %.prol.loopexit
  br label %._crit_edge.us

._crit_edge32.us:                                 ; preds = %._crit_edge68
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond51 = icmp eq i64 %indvars.iv.next50, %wide.trip.count
  br i1 %exitcond51, label %._crit_edge32.us.._crit_edge35_crit_edge, label %._crit_edge32.us..preheader.us_crit_edge

._crit_edge32.us..preheader.us_crit_edge:         ; preds = %._crit_edge32.us
  br label %.preheader.us

._crit_edge32.us.._crit_edge35_crit_edge:         ; preds = %._crit_edge32.us
  br label %._crit_edge35

.preheader:                                       ; preds = %._crit_edge..preheader_crit_edge, %.preheader.preheader
  %indvars.iv55 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next56, %._crit_edge..preheader_crit_edge ]
  %43 = icmp sgt i64 %indvars.iv55, 0
  br i1 %43, label %.lr.ph, label %.preheader.._crit_edge_crit_edge

.preheader.._crit_edge_crit_edge:                 ; preds = %.preheader
  br label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %xtraiter62 = and i64 %indvars.iv55, 1
  %lcmp.mod63 = icmp eq i64 %xtraiter62, 0
  br i1 %lcmp.mod63, label %.lr.ph..prol.loopexit61_crit_edge, label %.prol.preheader60

.lr.ph..prol.loopexit61_crit_edge:                ; preds = %.lr.ph
  br label %.prol.loopexit61

.prol.preheader60:                                ; preds = %.lr.ph
  %44 = trunc i64 %indvars.iv55 to i32
  %45 = srem i32 %44, %0
  %46 = sitofp i32 %45 to double
  %47 = fdiv double %46, %9
  %48 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv55, i64 0
  store double %47, double* %48, align 8
  br label %.prol.loopexit61

.prol.loopexit61:                                 ; preds = %.lr.ph..prol.loopexit61_crit_edge, %.prol.preheader60
  %indvars.iv42.unr.ph = phi i64 [ 1, %.prol.preheader60 ], [ 0, %.lr.ph..prol.loopexit61_crit_edge ]
  %49 = icmp eq i64 %indvars.iv55, 1
  br i1 %49, label %.prol.loopexit61.._crit_edge_crit_edge, label %.prol.loopexit61..lr.ph.new_crit_edge

.prol.loopexit61..lr.ph.new_crit_edge:            ; preds = %.prol.loopexit61
  br label %.lr.ph.new

.prol.loopexit61.._crit_edge_crit_edge:           ; preds = %.prol.loopexit61
  br label %._crit_edge

.lr.ph.new:                                       ; preds = %.lr.ph.new..lr.ph.new_crit_edge, %.prol.loopexit61..lr.ph.new_crit_edge
  %indvars.iv42 = phi i64 [ %indvars.iv42.unr.ph, %.prol.loopexit61..lr.ph.new_crit_edge ], [ %indvars.iv.next43.1, %.lr.ph.new..lr.ph.new_crit_edge ]
  %50 = add nuw nsw i64 %indvars.iv42, %indvars.iv55
  %51 = trunc i64 %50 to i32
  %52 = srem i32 %51, %0
  %53 = sitofp i32 %52 to double
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv55, i64 %indvars.iv42
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %55 = add nuw nsw i64 %indvars.iv.next43, %indvars.iv55
  %56 = trunc i64 %55 to i32
  %57 = srem i32 %56, %0
  %58 = sitofp i32 %57 to double
  %59 = insertelement <2 x double> undef, double %9, i32 0
  %60 = insertelement <2 x double> %59, double %9, i32 1
  %61 = insertelement <2 x double> undef, double %53, i32 0
  %62 = insertelement <2 x double> %61, double %58, i32 1
  %63 = fdiv <2 x double> %62, %60
  %64 = bitcast double* %54 to <2 x double>*
  store <2 x double> %63, <2 x double>* %64, align 8
  %indvars.iv.next43.1 = add nsw i64 %indvars.iv42, 2
  %exitcond54.1 = icmp eq i64 %indvars.iv.next43.1, %indvars.iv55
  br i1 %exitcond54.1, label %.lr.ph.new.._crit_edge_crit_edge, label %.lr.ph.new..lr.ph.new_crit_edge

.lr.ph.new..lr.ph.new_crit_edge:                  ; preds = %.lr.ph.new
  br label %.lr.ph.new

.lr.ph.new.._crit_edge_crit_edge:                 ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph.new.._crit_edge_crit_edge, %.prol.loopexit61.._crit_edge_crit_edge, %.preheader.._crit_edge_crit_edge
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv55, i64 %indvars.iv55
  store double 1.000000e+00, double* %65, align 8
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond58 = icmp eq i64 %indvars.iv.next56, %wide.trip.count57
  br i1 %exitcond58, label %._crit_edge.._crit_edge35_crit_edge, label %._crit_edge..preheader_crit_edge

._crit_edge..preheader_crit_edge:                 ; preds = %._crit_edge
  br label %.preheader

._crit_edge.._crit_edge35_crit_edge:              ; preds = %._crit_edge
  br label %._crit_edge35

._crit_edge35:                                    ; preds = %._crit_edge.._crit_edge35_crit_edge, %._crit_edge32.us.._crit_edge35_crit_edge, %.._crit_edge35_crit_edge
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trmm(i32, i32, double, [1000 x double]* nocapture readonly, [1200 x double]* nocapture) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  %7 = icmp sgt i32 %1, 0
  %or.cond = and i1 %6, %7
  br i1 %or.cond, label %.preheader27.us.preheader, label %.._crit_edge31_crit_edge

.._crit_edge31_crit_edge:                         ; preds = %5
  br label %._crit_edge31

.preheader27.us.preheader:                        ; preds = %5
  %8 = zext i32 %1 to i64
  %9 = sext i32 %0 to i64
  %10 = add nsw i64 %8, -1
  %11 = add i32 %0, 1
  %12 = zext i32 %11 to i64
  %13 = add i32 %0, -2
  %14 = zext i32 %13 to i64
  %wide.trip.count = zext i32 %0 to i64
  %xtraiter = and i64 %8, 3
  %15 = icmp eq i64 %xtraiter, 0
  %16 = icmp ult i64 %10, 3
  br label %.preheader27.us

.preheader27.us:                                  ; preds = %..loopexit_crit_edge.us..preheader27.us_crit_edge, %.preheader27.us.preheader
  %indvars.iv53 = phi i64 [ 0, %.preheader27.us.preheader ], [ %indvars.iv.next54, %..loopexit_crit_edge.us..preheader27.us_crit_edge ]
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %17 = icmp slt i64 %indvars.iv.next54, %9
  br i1 %17, label %.preheader.us.us.preheader, label %.preheader.us32.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader27.us
  %18 = sub i64 %14, %indvars.iv53
  %19 = trunc i64 %18 to i32
  %20 = sub i64 %12, %indvars.iv53
  %xtraiter5860 = and i64 %20, 1
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next54, i64 %indvars.iv53
  %indvars.iv.next43.prol = add nuw nsw i64 %indvars.iv53, 2
  %22 = icmp eq i64 %xtraiter5860, 0
  %23 = icmp eq i32 %19, 0
  br label %.preheader.us.us

.preheader.us32.preheader:                        ; preds = %.preheader27.us
  br i1 %15, label %.preheader.us32.preheader..preheader.us32.prol.loopexit_crit_edge, label %.preheader.us32.preheader..preheader.us32.prol_crit_edge

.preheader.us32.preheader..preheader.us32.prol_crit_edge: ; preds = %.preheader.us32.preheader
  br label %.preheader.us32.prol

.preheader.us32.preheader..preheader.us32.prol.loopexit_crit_edge: ; preds = %.preheader.us32.preheader
  br label %.preheader.us32.prol.loopexit

.preheader.us32.prol:                             ; preds = %.preheader.us32.preheader..preheader.us32.prol_crit_edge, %.preheader.us32.prol..preheader.us32.prol_crit_edge
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.preheader.us32.prol..preheader.us32.prol_crit_edge ], [ 0, %.preheader.us32.preheader..preheader.us32.prol_crit_edge ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.preheader.us32.prol..preheader.us32.prol_crit_edge ], [ %xtraiter, %.preheader.us32.preheader..preheader.us32.prol_crit_edge ]
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv.prol
  %25 = load double, double* %24, align 8
  %26 = fmul double %25, %2
  store double %26, double* %24, align 8
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader.us32.prol..preheader.us32.prol.loopexit_crit_edge, label %.preheader.us32.prol..preheader.us32.prol_crit_edge, !llvm.loop !1

.preheader.us32.prol..preheader.us32.prol.loopexit_crit_edge: ; preds = %.preheader.us32.prol
  br label %.preheader.us32.prol.loopexit

.preheader.us32.prol..preheader.us32.prol_crit_edge: ; preds = %.preheader.us32.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br label %.preheader.us32.prol

.preheader.us32.prol.loopexit:                    ; preds = %.preheader.us32.prol..preheader.us32.prol.loopexit_crit_edge, %.preheader.us32.preheader..preheader.us32.prol.loopexit_crit_edge
  %indvars.iv.unr = phi i64 [ 0, %.preheader.us32.preheader..preheader.us32.prol.loopexit_crit_edge ], [ %xtraiter, %.preheader.us32.prol..preheader.us32.prol.loopexit_crit_edge ]
  br i1 %16, label %.preheader.us32.prol.loopexit...loopexit_crit_edge.us_crit_edge, label %.preheader.us32.prol.loopexit..preheader.us32_crit_edge

.preheader.us32.prol.loopexit..preheader.us32_crit_edge: ; preds = %.preheader.us32.prol.loopexit
  br label %.preheader.us32

.preheader.us32.prol.loopexit...loopexit_crit_edge.us_crit_edge: ; preds = %.preheader.us32.prol.loopexit
  br label %..loopexit_crit_edge.us

.preheader.us32:                                  ; preds = %.preheader.us32..preheader.us32_crit_edge, %.preheader.us32.prol.loopexit..preheader.us32_crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.unr, %.preheader.us32.prol.loopexit..preheader.us32_crit_edge ], [ %indvars.iv.next.3, %.preheader.us32..preheader.us32_crit_edge ]
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv
  %28 = bitcast double* %27 to <2 x double>*
  %29 = load <2 x double>, <2 x double>* %28, align 8
  %30 = insertelement <2 x double> undef, double %2, i32 0
  %31 = insertelement <2 x double> %30, double %2, i32 1
  %32 = fmul <2 x double> %29, %31
  %33 = bitcast double* %27 to <2 x double>*
  store <2 x double> %32, <2 x double>* %33, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv.next.1
  %35 = bitcast double* %34 to <2 x double>*
  %36 = load <2 x double>, <2 x double>* %35, align 8
  %37 = insertelement <2 x double> undef, double %2, i32 0
  %38 = insertelement <2 x double> %37, double %2, i32 1
  %39 = fmul <2 x double> %36, %38
  %40 = bitcast double* %34 to <2 x double>*
  store <2 x double> %39, <2 x double>* %40, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond50.3 = icmp eq i64 %indvars.iv.next.3, %8
  br i1 %exitcond50.3, label %.preheader.us32...loopexit_crit_edge.us_crit_edge, label %.preheader.us32..preheader.us32_crit_edge

.preheader.us32..preheader.us32_crit_edge:        ; preds = %.preheader.us32
  br label %.preheader.us32

.preheader.us32...loopexit_crit_edge.us_crit_edge: ; preds = %.preheader.us32
  br label %..loopexit_crit_edge.us

..loopexit_crit_edge.us:                          ; preds = %._crit_edge.us.us...loopexit_crit_edge.us_crit_edge, %.preheader.us32...loopexit_crit_edge.us_crit_edge, %.preheader.us32.prol.loopexit...loopexit_crit_edge.us_crit_edge
  %exitcond55 = icmp eq i64 %indvars.iv.next54, %wide.trip.count
  br i1 %exitcond55, label %..loopexit_crit_edge.us.._crit_edge31_crit_edge, label %..loopexit_crit_edge.us..preheader27.us_crit_edge

..loopexit_crit_edge.us..preheader27.us_crit_edge: ; preds = %..loopexit_crit_edge.us
  br label %.preheader27.us

..loopexit_crit_edge.us.._crit_edge31_crit_edge:  ; preds = %..loopexit_crit_edge.us
  br label %._crit_edge31

.preheader.us.us:                                 ; preds = %._crit_edge.us.us..preheader.us.us_crit_edge, %.preheader.us.us.preheader
  %indvars.iv45 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next46, %._crit_edge.us.us..preheader.us.us_crit_edge ]
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv45
  br i1 %22, label %.preheader.us.us..prol.loopexit_crit_edge, label %.prol.preheader

.preheader.us.us..prol.loopexit_crit_edge:        ; preds = %.preheader.us.us
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.preheader.us.us
  %42 = load double, double* %21, align 8
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next54, i64 %indvars.iv45
  %44 = load double, double* %43, align 8
  %45 = fmul double %42, %44
  %46 = load double, double* %41, align 8
  %47 = fadd double %46, %45
  store double %47, double* %41, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader.us.us..prol.loopexit_crit_edge, %.prol.preheader
  %indvars.iv42.unr.ph = phi i64 [ %indvars.iv.next43.prol, %.prol.preheader ], [ %indvars.iv.next54, %.preheader.us.us..prol.loopexit_crit_edge ]
  %.pre64 = load double, double* %41, align 8
  br i1 %23, label %.prol.loopexit.._crit_edge.us.us_crit_edge, label %.prol.loopexit..preheader.us.us.new_crit_edge

.prol.loopexit..preheader.us.us.new_crit_edge:    ; preds = %.prol.loopexit
  br label %.preheader.us.us.new

.prol.loopexit.._crit_edge.us.us_crit_edge:       ; preds = %.prol.loopexit
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %.preheader.us.us.new.._crit_edge.us.us_crit_edge, %.prol.loopexit.._crit_edge.us.us_crit_edge
  %48 = phi double [ %.pre64, %.prol.loopexit.._crit_edge.us.us_crit_edge ], [ %62, %.preheader.us.us.new.._crit_edge.us.us_crit_edge ]
  %49 = fmul double %48, %2
  store double %49, double* %41, align 8
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next46, %8
  br i1 %exitcond52, label %._crit_edge.us.us...loopexit_crit_edge.us_crit_edge, label %._crit_edge.us.us..preheader.us.us_crit_edge

._crit_edge.us.us..preheader.us.us_crit_edge:     ; preds = %._crit_edge.us.us
  br label %.preheader.us.us

._crit_edge.us.us...loopexit_crit_edge.us_crit_edge: ; preds = %._crit_edge.us.us
  br label %..loopexit_crit_edge.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us.new..preheader.us.us.new_crit_edge, %.prol.loopexit..preheader.us.us.new_crit_edge
  %50 = phi double [ %.pre64, %.prol.loopexit..preheader.us.us.new_crit_edge ], [ %62, %.preheader.us.us.new..preheader.us.us.new_crit_edge ]
  %indvars.iv42 = phi i64 [ %indvars.iv42.unr.ph, %.prol.loopexit..preheader.us.us.new_crit_edge ], [ %indvars.iv.next43.1, %.preheader.us.us.new..preheader.us.us.new_crit_edge ]
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv42, i64 %indvars.iv53
  %52 = load double, double* %51, align 8
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv42, i64 %indvars.iv45
  %54 = load double, double* %53, align 8
  %55 = fmul double %52, %54
  %56 = fadd double %50, %55
  store double %56, double* %41, align 8
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %57 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next43, i64 %indvars.iv53
  %58 = load double, double* %57, align 8
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next43, i64 %indvars.iv45
  %60 = load double, double* %59, align 8
  %61 = fmul double %58, %60
  %62 = fadd double %56, %61
  store double %62, double* %41, align 8
  %indvars.iv.next43.1 = add nsw i64 %indvars.iv42, 2
  %lftr.wideiv51.1 = trunc i64 %indvars.iv.next43.1 to i32
  %exitcond.1 = icmp eq i32 %lftr.wideiv51.1, %0
  br i1 %exitcond.1, label %.preheader.us.us.new.._crit_edge.us.us_crit_edge, label %.preheader.us.us.new..preheader.us.us.new_crit_edge

.preheader.us.us.new..preheader.us.us.new_crit_edge: ; preds = %.preheader.us.us.new
  br label %.preheader.us.us.new

.preheader.us.us.new.._crit_edge.us.us_crit_edge: ; preds = %.preheader.us.us.new
  br label %._crit_edge.us.us

._crit_edge31:                                    ; preds = %..loopexit_crit_edge.us.._crit_edge31_crit_edge, %.._crit_edge31_crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %1, 0
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %.preheader.us.preheader, label %.._crit_edge14_crit_edge

.._crit_edge14_crit_edge:                         ; preds = %3
  br label %._crit_edge14

.preheader.us.preheader:                          ; preds = %3
  %10 = sext i32 %0 to i64
  %11 = zext i32 %1 to i64
  %12 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv16 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next17, %._crit_edge.us..preheader.us_crit_edge ]
  %13 = mul nsw i64 %indvars.iv16, %10
  br label %._crit_edge24

._crit_edge24:                                    ; preds = %._crit_edge.._crit_edge24_crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge.._crit_edge24_crit_edge ]
  %14 = add nsw i64 %indvars.iv, %13
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, 20
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %._crit_edge24.._crit_edge_crit_edge

._crit_edge24.._crit_edge_crit_edge:              ; preds = %._crit_edge24
  br label %._crit_edge

; <label>:18:                                     ; preds = %._crit_edge24
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %19) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge24.._crit_edge_crit_edge, %18
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv
  %22 = load double, double* %21, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %22) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next, %11
  br i1 %exitcond21, label %._crit_edge.us, label %._crit_edge.._crit_edge24_crit_edge

._crit_edge.._crit_edge24_crit_edge:              ; preds = %._crit_edge
  br label %._crit_edge24

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond = icmp eq i64 %indvars.iv.next17, %12
  br i1 %exitcond, label %._crit_edge.us.._crit_edge14_crit_edge, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge.us.._crit_edge14_crit_edge:           ; preds = %._crit_edge.us
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge.us.._crit_edge14_crit_edge, %.._crit_edge14_crit_edge
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %26) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
