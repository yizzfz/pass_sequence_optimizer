; ModuleID = 'A.ll'
source_filename = "doitgen.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define void @kernel_doitgen(i32, i32, i32, [140 x [160 x double]]* nocapture, [160 x double]*, double* nocapture) local_unnamed_addr #0 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph22, label %._crit_edge23

.lr.ph22:                                         ; preds = %6
  %8 = icmp sgt i32 %1, 0
  %9 = icmp sgt i32 %2, 0
  %10 = add i32 %2, -1
  %xtraiter53 = and i32 %2, 1
  %lcmp.mod54 = icmp eq i32 %xtraiter53, 0
  %11 = icmp eq i32 %10, 0
  %wide.trip.count40 = zext i32 %2 to i64
  %xtraiter59 = and i32 %2, 3
  %lcmp.mod60 = icmp eq i32 %xtraiter59, 0
  %12 = icmp ult i32 %10, 3
  %wide.trip.count48 = zext i32 %1 to i64
  %13 = add nsw i32 %xtraiter59, -1
  %14 = zext i32 %13 to i64
  %15 = add nuw nsw i64 %14, 1
  %16 = add nsw i64 %wide.trip.count48, -1
  %xtraiter = and i64 %wide.trip.count48, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %17 = icmp ult i64 %16, 7
  %wide.trip.count = zext i32 %0 to i64
  br label %18

; <label>:18:                                     ; preds = %._crit_edge12, %.lr.ph22
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge12 ], [ 0, %.lr.ph22 ]
  br i1 %8, label %.lr.ph11, label %._crit_edge12

.lr.ph11:                                         ; preds = %18
  br i1 %9, label %.lr.ph11.split.us.preheader, label %.lr.ph11.split.preheader

.lr.ph11.split.preheader:                         ; preds = %.lr.ph11
  br i1 %lcmp.mod, label %.lr.ph11.split.prol.loopexit, label %.lr.ph11.split.prol.preheader

.lr.ph11.split.prol.preheader:                    ; preds = %.lr.ph11.split.preheader
  br label %.lr.ph11.split.prol

.lr.ph11.split.prol:                              ; preds = %.lr.ph11.split.prol, %.lr.ph11.split.prol.preheader
  %indvars.iv26.prol = phi i64 [ %indvars.iv.next27.prol, %.lr.ph11.split.prol ], [ 0, %.lr.ph11.split.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph11.split.prol ], [ %xtraiter, %.lr.ph11.split.prol.preheader ]
  %indvars.iv.next27.prol = add nuw nsw i64 %indvars.iv26.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph11.split.prol.loopexit.unr-lcssa, label %.lr.ph11.split.prol, !llvm.loop !1

.lr.ph11.split.prol.loopexit.unr-lcssa:           ; preds = %.lr.ph11.split.prol
  br label %.lr.ph11.split.prol.loopexit

.lr.ph11.split.prol.loopexit:                     ; preds = %.lr.ph11.split.preheader, %.lr.ph11.split.prol.loopexit.unr-lcssa
  %indvars.iv26.unr = phi i64 [ 0, %.lr.ph11.split.preheader ], [ %indvars.iv.next27.prol, %.lr.ph11.split.prol.loopexit.unr-lcssa ]
  br i1 %17, label %._crit_edge12.loopexit64, label %.lr.ph11.split.preheader.new

.lr.ph11.split.preheader.new:                     ; preds = %.lr.ph11.split.prol.loopexit
  br label %.lr.ph11.split

.lr.ph11.split.us.preheader:                      ; preds = %.lr.ph11
  br label %.lr.ph11.split.us

.lr.ph11.split.us:                                ; preds = %.lr.ph11.split.us.preheader, %._crit_edge9.us
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %._crit_edge9.us ], [ 0, %.lr.ph11.split.us.preheader ]
  %19 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv46, i64 0
  br label %.lr.ph.us.us

._crit_edge9.us.loopexit:                         ; preds = %.lr.ph8.us.new
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %._crit_edge9.us.loopexit, %.prol.loopexit58
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next47, %wide.trip.count48
  br i1 %exitcond49, label %._crit_edge12.loopexit, label %.lr.ph11.split.us

.lr.ph8.us.new:                                   ; preds = %.lr.ph8.us.new.preheader, %.lr.ph8.us.new
  %indvars.iv42 = phi i64 [ %indvars.iv.next43.3, %.lr.ph8.us.new ], [ %indvars.iv42.unr, %.lr.ph8.us.new.preheader ]
  %20 = getelementptr inbounds double, double* %5, i64 %indvars.iv42
  %21 = bitcast double* %20 to i64*
  %22 = load i64, i64* %21, align 8
  %23 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv46, i64 %indvars.iv42
  %24 = bitcast double* %23 to i64*
  store i64 %22, i64* %24, align 8
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %25 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next43
  %26 = bitcast double* %25 to i64*
  %27 = load i64, i64* %26, align 8
  %28 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv46, i64 %indvars.iv.next43
  %29 = bitcast double* %28 to i64*
  store i64 %27, i64* %29, align 8
  %indvars.iv.next43.1 = add nsw i64 %indvars.iv42, 2
  %30 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next43.1
  %31 = bitcast double* %30 to i64*
  %32 = load i64, i64* %31, align 8
  %33 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv46, i64 %indvars.iv.next43.1
  %34 = bitcast double* %33 to i64*
  store i64 %32, i64* %34, align 8
  %indvars.iv.next43.2 = add nsw i64 %indvars.iv42, 3
  %35 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next43.2
  %36 = bitcast double* %35 to i64*
  %37 = load i64, i64* %36, align 8
  %38 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv46, i64 %indvars.iv.next43.2
  %39 = bitcast double* %38 to i64*
  store i64 %37, i64* %39, align 8
  %indvars.iv.next43.3 = add nsw i64 %indvars.iv42, 4
  %exitcond45.3 = icmp eq i64 %indvars.iv.next43.3, %wide.trip.count40
  br i1 %exitcond45.3, label %._crit_edge9.us.loopexit, label %.lr.ph8.us.new

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph11.split.us
  %indvars.iv38 = phi i64 [ %indvars.iv.next39, %._crit_edge.us.us ], [ 0, %.lr.ph11.split.us ]
  %40 = getelementptr inbounds double, double* %5, i64 %indvars.iv38
  store double 0.000000e+00, double* %40, align 8
  br i1 %lcmp.mod54, label %.prol.loopexit52, label %.prol.preheader51

.prol.preheader51:                                ; preds = %.lr.ph.us.us
  %41 = load double, double* %19, align 8
  %42 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv38
  %43 = load double, double* %42, align 8
  %44 = fmul double %41, %43
  %45 = fadd double %44, 0.000000e+00
  store double %45, double* %40, align 8
  br label %.prol.loopexit52

.prol.loopexit52:                                 ; preds = %.lr.ph.us.us, %.prol.preheader51
  %indvars.iv34.unr.ph = phi i64 [ 1, %.prol.preheader51 ], [ 0, %.lr.ph.us.us ]
  %.unr.ph = phi double [ %45, %.prol.preheader51 ], [ 0.000000e+00, %.lr.ph.us.us ]
  br i1 %11, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit52
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit52
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next39, %wide.trip.count40
  br i1 %exitcond41, label %.lr.ph8.us, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %indvars.iv34 = phi i64 [ %indvars.iv.next35.1, %.lr.ph.us.us.new ], [ %indvars.iv34.unr.ph, %.lr.ph.us.us.new.preheader ]
  %46 = phi double [ %58, %.lr.ph.us.us.new ], [ %.unr.ph, %.lr.ph.us.us.new.preheader ]
  %47 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv46, i64 %indvars.iv34
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv34, i64 %indvars.iv38
  %50 = load double, double* %49, align 8
  %51 = fmul double %48, %50
  %52 = fadd double %46, %51
  store double %52, double* %40, align 8
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %53 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv46, i64 %indvars.iv.next35
  %54 = load double, double* %53, align 8
  %55 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next35, i64 %indvars.iv38
  %56 = load double, double* %55, align 8
  %57 = fmul double %54, %56
  %58 = fadd double %52, %57
  store double %58, double* %40, align 8
  %indvars.iv.next35.1 = add nuw nsw i64 %indvars.iv34, 2
  %exitcond37.1 = icmp eq i64 %indvars.iv.next35.1, %wide.trip.count40
  br i1 %exitcond37.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph8.us:                                       ; preds = %._crit_edge.us.us
  br i1 %lcmp.mod60, label %.prol.loopexit58, label %.prol.preheader57.preheader

.prol.preheader57.preheader:                      ; preds = %.lr.ph8.us
  br label %.prol.preheader57

.prol.preheader57:                                ; preds = %.prol.preheader57.preheader, %.prol.preheader57
  %indvars.iv42.prol = phi i64 [ %indvars.iv.next43.prol, %.prol.preheader57 ], [ 0, %.prol.preheader57.preheader ]
  %prol.iter61 = phi i32 [ %prol.iter61.sub, %.prol.preheader57 ], [ %xtraiter59, %.prol.preheader57.preheader ]
  %59 = getelementptr inbounds double, double* %5, i64 %indvars.iv42.prol
  %60 = bitcast double* %59 to i64*
  %61 = load i64, i64* %60, align 8
  %62 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv46, i64 %indvars.iv42.prol
  %63 = bitcast double* %62 to i64*
  store i64 %61, i64* %63, align 8
  %indvars.iv.next43.prol = add nuw nsw i64 %indvars.iv42.prol, 1
  %prol.iter61.sub = add nsw i32 %prol.iter61, -1
  %prol.iter61.cmp = icmp eq i32 %prol.iter61.sub, 0
  br i1 %prol.iter61.cmp, label %.prol.loopexit58.loopexit, label %.prol.preheader57, !llvm.loop !3

.prol.loopexit58.loopexit:                        ; preds = %.prol.preheader57
  br label %.prol.loopexit58

.prol.loopexit58:                                 ; preds = %.prol.loopexit58.loopexit, %.lr.ph8.us
  %indvars.iv42.unr = phi i64 [ 0, %.lr.ph8.us ], [ %15, %.prol.loopexit58.loopexit ]
  br i1 %12, label %._crit_edge9.us, label %.lr.ph8.us.new.preheader

.lr.ph8.us.new.preheader:                         ; preds = %.prol.loopexit58
  br label %.lr.ph8.us.new

.lr.ph11.split:                                   ; preds = %.lr.ph11.split, %.lr.ph11.split.preheader.new
  %indvars.iv26 = phi i64 [ %indvars.iv26.unr, %.lr.ph11.split.preheader.new ], [ %indvars.iv.next27.7, %.lr.ph11.split ]
  %indvars.iv.next27.7 = add nsw i64 %indvars.iv26, 8
  %exitcond29.7 = icmp eq i64 %indvars.iv.next27.7, %wide.trip.count48
  br i1 %exitcond29.7, label %._crit_edge12.loopexit64.unr-lcssa, label %.lr.ph11.split

._crit_edge12.loopexit:                           ; preds = %._crit_edge9.us
  br label %._crit_edge12

._crit_edge12.loopexit64.unr-lcssa:               ; preds = %.lr.ph11.split
  br label %._crit_edge12.loopexit64

._crit_edge12.loopexit64:                         ; preds = %.lr.ph11.split.prol.loopexit, %._crit_edge12.loopexit64.unr-lcssa
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit64, %._crit_edge12.loopexit, %18
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge23.loopexit, label %18

._crit_edge23.loopexit:                           ; preds = %._crit_edge12
  br label %._crit_edge23

._crit_edge23:                                    ; preds = %._crit_edge23.loopexit, %6
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = call i8* @polybench_alloc_data(i64 3360000, i32 8) #4
  %4 = call i8* @polybench_alloc_data(i64 160, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 25600, i32 8) #4
  %6 = bitcast i8* %3 to [140 x [160 x double]]*
  %7 = bitcast i8* %5 to [160 x double]*
  call fastcc void @init_array([140 x [160 x double]]* %6, [160 x double]* %7)
  call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to double*
  call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %7, double* %8)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %10
  call fastcc void @print_array([140 x [160 x double]]* %6)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([140 x [160 x double]]* nocapture, [160 x double]* nocapture) unnamed_addr #2 {
.lr.ph11.split.us.preheader:
  br label %.lr.ph5.us.us.preheader

.lr.ph5.us.us.preheader:                          ; preds = %._crit_edge9.us, %.lr.ph11.split.us.preheader
  %indvars.iv32 = phi i64 [ 0, %.lr.ph11.split.us.preheader ], [ %indvars.iv.next33, %._crit_edge9.us ]
  br label %.lr.ph5.us.us.new

._crit_edge9.us:                                  ; preds = %._crit_edge6.us.us
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next33, 150
  br i1 %exitcond35, label %.lr.ph.us.new.preheader, label %.lr.ph5.us.us.preheader

.lr.ph.us.new.preheader:                          ; preds = %._crit_edge9.us
  br label %.lr.ph.us.new

.lr.ph5.us.us.new:                                ; preds = %._crit_edge6.us.us, %.lr.ph5.us.us.preheader
  %indvars.iv28 = phi i64 [ 0, %.lr.ph5.us.us.preheader ], [ %indvars.iv.next29, %._crit_edge6.us.us ]
  %2 = mul nuw nsw i64 %indvars.iv32, %indvars.iv28
  br label %3

._crit_edge6.us.us:                               ; preds = %3
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next29, 140
  br i1 %exitcond31, label %._crit_edge9.us, label %.lr.ph5.us.us.new

; <label>:3:                                      ; preds = %3, %.lr.ph5.us.us.new
  %indvars.iv24 = phi i64 [ 0, %.lr.ph5.us.us.new ], [ %indvars.iv.next25.1, %3 ]
  %4 = add nuw nsw i64 %2, %indvars.iv24
  %5 = trunc i64 %4 to i32
  %6 = srem i32 %5, 160
  %7 = sitofp i32 %6 to double
  %8 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %0, i64 %indvars.iv32, i64 %indvars.iv28, i64 %indvars.iv24
  %indvars.iv.next25 = or i64 %indvars.iv24, 1
  %9 = add nuw nsw i64 %2, %indvars.iv.next25
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 160
  %12 = sitofp i32 %11 to double
  %13 = insertelement <2 x double> undef, double %7, i32 0
  %14 = insertelement <2 x double> %13, double %12, i32 1
  %15 = fdiv <2 x double> %14, <double 1.600000e+02, double 1.600000e+02>
  %16 = bitcast double* %8 to <2 x double>*
  store <2 x double> %15, <2 x double>* %16, align 8
  %indvars.iv.next25.1 = add nuw nsw i64 %indvars.iv24, 2
  %exitcond27.1 = icmp eq i64 %indvars.iv.next25.1, 160
  br i1 %exitcond27.1, label %._crit_edge6.us.us, label %3

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader, %._crit_edge.us
  %indvars.iv19 = phi i64 [ %indvars.iv.next20, %._crit_edge.us ], [ 0, %.lr.ph.us.new.preheader ]
  br label %17

; <label>:17:                                     ; preds = %17, %.lr.ph.us.new
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.new ], [ %indvars.iv.next.1, %17 ]
  %18 = mul nuw nsw i64 %indvars.iv19, %indvars.iv
  %19 = trunc i64 %18 to i32
  %20 = srem i32 %19, 160
  %21 = sitofp i32 %20 to double
  %22 = getelementptr inbounds [160 x double], [160 x double]* %1, i64 %indvars.iv19, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %23 = mul nuw nsw i64 %indvars.iv19, %indvars.iv.next
  %24 = trunc i64 %23 to i32
  %25 = srem i32 %24, 160
  %26 = sitofp i32 %25 to double
  %27 = insertelement <2 x double> undef, double %21, i32 0
  %28 = insertelement <2 x double> %27, double %26, i32 1
  %29 = fdiv <2 x double> %28, <double 1.600000e+02, double 1.600000e+02>
  %30 = bitcast double* %22 to <2 x double>*
  store <2 x double> %29, <2 x double>* %30, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 160
  br i1 %exitcond.1, label %._crit_edge.us, label %17

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next20, 160
  br i1 %exitcond22, label %._crit_edge3, label %.lr.ph.us.new

._crit_edge3:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([140 x [160 x double]]* nocapture readonly) unnamed_addr #0 {
.lr.ph7.split.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph.us.us.preheader

.lr.ph.us.us.preheader:                           ; preds = %._crit_edge5.us, %.lr.ph7.split.us.preheader
  %indvars.iv22 = phi i64 [ 0, %.lr.ph7.split.us.preheader ], [ %indvars.iv.next23, %._crit_edge5.us ]
  %5 = mul nuw nsw i64 %indvars.iv22, 140
  br label %.lr.ph.us.us

._crit_edge5.us:                                  ; preds = %._crit_edge2.us.us
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next23, 150
  br i1 %exitcond25, label %._crit_edge8, label %.lr.ph.us.us.preheader

.lr.ph.us.us:                                     ; preds = %._crit_edge2.us.us, %.lr.ph.us.us.preheader
  %indvars.iv18 = phi i64 [ 0, %.lr.ph.us.us.preheader ], [ %indvars.iv.next19, %._crit_edge2.us.us ]
  %6 = add nuw nsw i64 %5, %indvars.iv18
  %sext = mul nuw nsw i64 %6, 687194767360
  %7 = lshr exact i64 %sext, 32
  br label %8

._crit_edge2.us.us:                               ; preds = %._crit_edge.us.us
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next19, 140
  br i1 %exitcond21, label %._crit_edge5.us, label %.lr.ph.us.us

; <label>:8:                                      ; preds = %._crit_edge.us.us, %.lr.ph.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge.us.us ], [ 0, %.lr.ph.us.us ]
  %9 = add nuw nsw i64 %7, %indvars.iv
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge.us.us

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %8, %13
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %0, i64 %indvars.iv22, i64 %indvars.iv18, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond17, label %._crit_edge2.us.us, label %8

._crit_edge8:                                     ; preds = %._crit_edge5.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
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
!3 = distinct !{!3, !2}
