; ModuleID = 'A.ll'
source_filename = "doitgen.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define void @kernel_doitgen(i32, i32, i32, [140 x [160 x double]]* nocapture, [160 x double]* nocapture readonly, double* nocapture) #0 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader5.lr.ph, label %._crit_edge21

.preheader5.lr.ph:                                ; preds = %6
  %8 = icmp sgt i32 %1, 0
  %9 = icmp sgt i32 %2, 0
  %10 = add i32 %2, -1
  %xtraiter55 = and i32 %2, 3
  %lcmp.mod56 = icmp eq i32 %xtraiter55, 0
  %11 = icmp ult i32 %10, 3
  %wide.trip.count48.3 = zext i32 %2 to i64
  %wide.trip.count60 = zext i32 %1 to i64
  %xtraiter40 = and i32 %2, 1
  %lcmp.mod41 = icmp eq i32 %xtraiter40, 0
  %12 = icmp eq i32 %10, 0
  %wide.trip.count64 = zext i32 %0 to i64
  %13 = add nsw i32 %xtraiter55, -1
  %14 = zext i32 %13 to i64
  %15 = add nuw nsw i64 %14, 1
  %16 = add nsw i64 %wide.trip.count60, -1
  %xtraiter = and i64 %wide.trip.count60, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %17 = icmp ult i64 %16, 7
  br label %.preheader5

.preheader5:                                      ; preds = %._crit_edge13, %.preheader5.lr.ph
  %indvars.iv62 = phi i64 [ 0, %.preheader5.lr.ph ], [ %indvars.iv.next63, %._crit_edge13 ]
  br i1 %8, label %.preheader4.lr.ph, label %._crit_edge13

.preheader4.lr.ph:                                ; preds = %.preheader5
  br i1 %9, label %.preheader4.us.preheader, label %.preheader4.preheader

.preheader4.preheader:                            ; preds = %.preheader4.lr.ph
  br i1 %lcmp.mod, label %.preheader4.prol.loopexit, label %.preheader4.prol.preheader

.preheader4.prol.preheader:                       ; preds = %.preheader4.preheader
  br label %.preheader4.prol

.preheader4.prol:                                 ; preds = %.preheader4.prol, %.preheader4.prol.preheader
  %indvars.iv27.prol = phi i64 [ %indvars.iv.next28.prol, %.preheader4.prol ], [ 0, %.preheader4.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.preheader4.prol ], [ %xtraiter, %.preheader4.prol.preheader ]
  %indvars.iv.next28.prol = add nuw nsw i64 %indvars.iv27.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader4.prol.loopexit.unr-lcssa, label %.preheader4.prol, !llvm.loop !1

.preheader4.prol.loopexit.unr-lcssa:              ; preds = %.preheader4.prol
  br label %.preheader4.prol.loopexit

.preheader4.prol.loopexit:                        ; preds = %.preheader4.preheader, %.preheader4.prol.loopexit.unr-lcssa
  %indvars.iv27.unr = phi i64 [ 0, %.preheader4.preheader ], [ %indvars.iv.next28.prol, %.preheader4.prol.loopexit.unr-lcssa ]
  br i1 %17, label %._crit_edge13.loopexit68, label %.preheader4.preheader.new

.preheader4.preheader.new:                        ; preds = %.preheader4.prol.loopexit
  br label %.preheader4

.preheader4.us.preheader:                         ; preds = %.preheader4.lr.ph
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %.preheader4.us.preheader, %._crit_edge11.us
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %._crit_edge11.us ], [ 0, %.preheader4.us.preheader ]
  %18 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv58, i64 0
  br label %.lr.ph.us.us

._crit_edge11.us.loopexit:                        ; preds = %.lr.ph10.us.new
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge11.us.loopexit, %.prol.loopexit54
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond61 = icmp eq i64 %indvars.iv.next59, %wide.trip.count60
  br i1 %exitcond61, label %._crit_edge13.loopexit, label %.preheader4.us

.lr.ph10.us.new:                                  ; preds = %.lr.ph10.us.new.preheader, %.lr.ph10.us.new
  %indvars.iv46 = phi i64 [ %indvars.iv.next47.3, %.lr.ph10.us.new ], [ %indvars.iv46.unr, %.lr.ph10.us.new.preheader ]
  %19 = getelementptr inbounds double, double* %5, i64 %indvars.iv46
  %20 = bitcast double* %19 to i64*
  %21 = load i64, i64* %20, align 8
  %22 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv58, i64 %indvars.iv46
  %23 = bitcast double* %22 to i64*
  store i64 %21, i64* %23, align 8
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %24 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next47
  %25 = bitcast double* %24 to i64*
  %26 = load i64, i64* %25, align 8
  %27 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv58, i64 %indvars.iv.next47
  %28 = bitcast double* %27 to i64*
  store i64 %26, i64* %28, align 8
  %indvars.iv.next47.1 = add nsw i64 %indvars.iv46, 2
  %29 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next47.1
  %30 = bitcast double* %29 to i64*
  %31 = load i64, i64* %30, align 8
  %32 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv58, i64 %indvars.iv.next47.1
  %33 = bitcast double* %32 to i64*
  store i64 %31, i64* %33, align 8
  %indvars.iv.next47.2 = add nsw i64 %indvars.iv46, 3
  %34 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next47.2
  %35 = bitcast double* %34 to i64*
  %36 = load i64, i64* %35, align 8
  %37 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv58, i64 %indvars.iv.next47.2
  %38 = bitcast double* %37 to i64*
  store i64 %36, i64* %38, align 8
  %indvars.iv.next47.3 = add nsw i64 %indvars.iv46, 4
  %exitcond49.3 = icmp eq i64 %indvars.iv.next47.3, %wide.trip.count48.3
  br i1 %exitcond49.3, label %._crit_edge11.us.loopexit, label %.lr.ph10.us.new

.lr.ph.us.us:                                     ; preds = %.preheader4.us, %._crit_edge.us.us
  %indvars.iv42 = phi i64 [ %indvars.iv.next43, %._crit_edge.us.us ], [ 0, %.preheader4.us ]
  %39 = getelementptr inbounds double, double* %5, i64 %indvars.iv42
  store double 0.000000e+00, double* %39, align 8
  br i1 %lcmp.mod41, label %.prol.loopexit39, label %.prol.preheader38

.prol.preheader38:                                ; preds = %.lr.ph.us.us
  %40 = load double, double* %18, align 8
  %41 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv42
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = fadd double %43, 0.000000e+00
  store double %44, double* %39, align 8
  br label %.prol.loopexit39

.prol.loopexit39:                                 ; preds = %.prol.preheader38, %.lr.ph.us.us
  %indvars.iv34.unr.ph = phi i64 [ 1, %.prol.preheader38 ], [ 0, %.lr.ph.us.us ]
  %.unr.ph = phi double [ %44, %.prol.preheader38 ], [ 0.000000e+00, %.lr.ph.us.us ]
  br i1 %12, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit39
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit39
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %exitcond45 = icmp eq i64 %indvars.iv.next43, %wide.trip.count48.3
  br i1 %exitcond45, label %.lr.ph10.us, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %indvars.iv34 = phi i64 [ %indvars.iv.next35.1, %.lr.ph.us.us.new ], [ %indvars.iv34.unr.ph, %.lr.ph.us.us.new.preheader ]
  %45 = phi double [ %57, %.lr.ph.us.us.new ], [ %.unr.ph, %.lr.ph.us.us.new.preheader ]
  %46 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv58, i64 %indvars.iv34
  %47 = load double, double* %46, align 8
  %48 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv34, i64 %indvars.iv42
  %49 = load double, double* %48, align 8
  %50 = fmul double %47, %49
  %51 = fadd double %45, %50
  store double %51, double* %39, align 8
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %52 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv58, i64 %indvars.iv.next35
  %53 = load double, double* %52, align 8
  %54 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next35, i64 %indvars.iv42
  %55 = load double, double* %54, align 8
  %56 = fmul double %53, %55
  %57 = fadd double %51, %56
  store double %57, double* %39, align 8
  %indvars.iv.next35.1 = add nuw nsw i64 %indvars.iv34, 2
  %exitcond37.1 = icmp eq i64 %indvars.iv.next35.1, %wide.trip.count48.3
  br i1 %exitcond37.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph10.us:                                      ; preds = %._crit_edge.us.us
  br i1 %lcmp.mod56, label %.prol.loopexit54, label %.prol.preheader53.preheader

.prol.preheader53.preheader:                      ; preds = %.lr.ph10.us
  br label %.prol.preheader53

.prol.preheader53:                                ; preds = %.prol.preheader53.preheader, %.prol.preheader53
  %indvars.iv46.prol = phi i64 [ %indvars.iv.next47.prol, %.prol.preheader53 ], [ 0, %.prol.preheader53.preheader ]
  %prol.iter57 = phi i32 [ %prol.iter57.sub, %.prol.preheader53 ], [ %xtraiter55, %.prol.preheader53.preheader ]
  %58 = getelementptr inbounds double, double* %5, i64 %indvars.iv46.prol
  %59 = bitcast double* %58 to i64*
  %60 = load i64, i64* %59, align 8
  %61 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv58, i64 %indvars.iv46.prol
  %62 = bitcast double* %61 to i64*
  store i64 %60, i64* %62, align 8
  %indvars.iv.next47.prol = add nuw nsw i64 %indvars.iv46.prol, 1
  %prol.iter57.sub = add nsw i32 %prol.iter57, -1
  %prol.iter57.cmp = icmp eq i32 %prol.iter57.sub, 0
  br i1 %prol.iter57.cmp, label %.prol.loopexit54.loopexit, label %.prol.preheader53, !llvm.loop !3

.prol.loopexit54.loopexit:                        ; preds = %.prol.preheader53
  br label %.prol.loopexit54

.prol.loopexit54:                                 ; preds = %.prol.loopexit54.loopexit, %.lr.ph10.us
  %indvars.iv46.unr = phi i64 [ 0, %.lr.ph10.us ], [ %15, %.prol.loopexit54.loopexit ]
  br i1 %11, label %._crit_edge11.us, label %.lr.ph10.us.new.preheader

.lr.ph10.us.new.preheader:                        ; preds = %.prol.loopexit54
  br label %.lr.ph10.us.new

.preheader4:                                      ; preds = %.preheader4, %.preheader4.preheader.new
  %indvars.iv27 = phi i64 [ %indvars.iv27.unr, %.preheader4.preheader.new ], [ %indvars.iv.next28.7, %.preheader4 ]
  %indvars.iv.next28.7 = add nsw i64 %indvars.iv27, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next28.7, %wide.trip.count60
  br i1 %exitcond.7, label %._crit_edge13.loopexit68.unr-lcssa, label %.preheader4

._crit_edge13.loopexit:                           ; preds = %._crit_edge11.us
  br label %._crit_edge13

._crit_edge13.loopexit68.unr-lcssa:               ; preds = %.preheader4
  br label %._crit_edge13.loopexit68

._crit_edge13.loopexit68:                         ; preds = %.preheader4.prol.loopexit, %._crit_edge13.loopexit68.unr-lcssa
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit68, %._crit_edge13.loopexit, %.preheader5
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %exitcond65 = icmp eq i64 %indvars.iv.next63, %wide.trip.count64
  br i1 %exitcond65, label %._crit_edge21.loopexit, label %.preheader5

._crit_edge21.loopexit:                           ; preds = %._crit_edge13
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge21.loopexit, %6
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 3360000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 160, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 25600, i32 8) #4
  %6 = bitcast i8* %3 to [140 x [160 x double]]*
  %7 = bitcast i8* %5 to [160 x double]*
  tail call void @init_array([140 x [160 x double]]* %6, [160 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to double*
  tail call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %7, double* %8)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %14

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %14

; <label>:13:                                     ; preds = %10
  tail call void @print_array([140 x [160 x double]]* %6)
  br label %14

; <label>:14:                                     ; preds = %10, %13, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array([140 x [160 x double]]* nocapture, [160 x double]* nocapture) #2 {
  br label %.preheader3

.preheader3:                                      ; preds = %19, %2
  %indvars.iv17 = phi i64 [ 0, %2 ], [ %indvars.iv.next18, %19 ]
  br label %.preheader2

.preheader2:                                      ; preds = %18, %.preheader3
  %indvars.iv14 = phi i64 [ 0, %.preheader3 ], [ %indvars.iv.next15, %18 ]
  %3 = mul nuw nsw i64 %indvars.iv14, %indvars.iv17
  br label %4

; <label>:4:                                      ; preds = %4, %.preheader2
  %indvars.iv11 = phi i64 [ 0, %.preheader2 ], [ %indvars.iv.next12.1, %4 ]
  %5 = add nuw nsw i64 %indvars.iv11, %3
  %6 = trunc i64 %5 to i32
  %7 = srem i32 %6, 160
  %8 = sitofp i32 %7 to double
  %9 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %0, i64 %indvars.iv17, i64 %indvars.iv14, i64 %indvars.iv11
  %indvars.iv.next12 = or i64 %indvars.iv11, 1
  %10 = add nuw nsw i64 %indvars.iv.next12, %3
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 160
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %8, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fdiv <2 x double> %15, <double 1.600000e+02, double 1.600000e+02>
  %17 = bitcast double* %9 to <2 x double>*
  store <2 x double> %16, <2 x double>* %17, align 8
  %indvars.iv.next12.1 = add nuw nsw i64 %indvars.iv11, 2
  %exitcond13.1 = icmp eq i64 %indvars.iv.next12.1, 160
  br i1 %exitcond13.1, label %18, label %4

; <label>:18:                                     ; preds = %4
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next15, 140
  br i1 %exitcond16, label %19, label %.preheader2

; <label>:19:                                     ; preds = %18
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next18, 150
  br i1 %exitcond19, label %.preheader.preheader, label %.preheader3

.preheader.preheader:                             ; preds = %19
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %34
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %34 ], [ 0, %.preheader.preheader ]
  br label %20

; <label>:20:                                     ; preds = %20, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %20 ]
  %21 = mul nuw nsw i64 %indvars.iv, %indvars.iv9
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, 160
  %24 = sitofp i32 %23 to double
  %25 = getelementptr inbounds [160 x double], [160 x double]* %1, i64 %indvars.iv9, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %26 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv9
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, 160
  %29 = sitofp i32 %28 to double
  %30 = insertelement <2 x double> undef, double %24, i32 0
  %31 = insertelement <2 x double> %30, double %29, i32 1
  %32 = fdiv <2 x double> %31, <double 1.600000e+02, double 1.600000e+02>
  %33 = bitcast double* %25 to <2 x double>*
  store <2 x double> %32, <2 x double>* %33, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 160
  br i1 %exitcond.1, label %34, label %20

; <label>:34:                                     ; preds = %20
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond = icmp eq i64 %indvars.iv.next10, 160
  br i1 %exitcond, label %35, label %.preheader

; <label>:35:                                     ; preds = %34
  ret void
}

declare void @polybench_timer_start(...) #1

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([140 x [160 x double]]* nocapture readonly) #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader1

.preheader1:                                      ; preds = %22, %1
  %indvars.iv9 = phi i64 [ 0, %1 ], [ %indvars.iv.next10, %22 ]
  %6 = mul nuw nsw i64 %indvars.iv9, 22400
  br label %.preheader

.preheader:                                       ; preds = %21, %.preheader1
  %indvars.iv6 = phi i64 [ 0, %.preheader1 ], [ %indvars.iv.next7, %21 ]
  %7 = mul nuw nsw i64 %indvars.iv6, 160
  %8 = add nuw nsw i64 %7, %6
  br label %9

; <label>:9:                                      ; preds = %16, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %16 ]
  %10 = add nuw nsw i64 %8, %indvars.iv
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %9
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %16

; <label>:16:                                     ; preds = %14, %9
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %0, i64 %indvars.iv9, i64 %indvars.iv6, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond, label %21, label %9

; <label>:21:                                     ; preds = %16
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 140
  br i1 %exitcond8, label %22, label %.preheader

; <label>:22:                                     ; preds = %21
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next10, 150
  br i1 %exitcond11, label %23, label %.preheader1

; <label>:23:                                     ; preds = %22
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %26) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

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
