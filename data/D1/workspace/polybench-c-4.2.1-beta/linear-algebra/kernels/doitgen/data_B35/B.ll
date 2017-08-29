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

; Function Attrs: noinline norecurse nounwind uwtable
define void @kernel_doitgen(i32, i32, i32, [140 x [160 x double]]* nocapture, [160 x double]*, double* nocapture) local_unnamed_addr #0 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader6.lr.ph, label %.._crit_edge57_crit_edge

.._crit_edge57_crit_edge:                         ; preds = %6
  br label %._crit_edge57

.preheader6.lr.ph:                                ; preds = %6
  %8 = icmp sgt i32 %1, 0
  %9 = icmp sgt i32 %2, 0
  %10 = add i32 %2, -1
  %xtraiter97 = and i32 %2, 1
  %lcmp.mod98 = icmp eq i32 %xtraiter97, 0
  %11 = icmp eq i32 %10, 0
  %wide.trip.count84 = zext i32 %2 to i64
  %xtraiter103 = and i32 %2, 3
  %lcmp.mod104 = icmp eq i32 %xtraiter103, 0
  %12 = icmp ult i32 %10, 3
  %wide.trip.count92 = zext i32 %1 to i64
  %13 = add nsw i32 %xtraiter103, -1
  %14 = zext i32 %13 to i64
  %15 = add nuw nsw i64 %14, 1
  %16 = sext i32 %0 to i64
  br label %.preheader6

.preheader6:                                      ; preds = %._crit_edge29..preheader6_crit_edge, %.preheader6.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge29..preheader6_crit_edge ], [ 0, %.preheader6.lr.ph ]
  br i1 %8, label %.preheader5.lr.ph, label %.preheader6.._crit_edge29_crit_edge

.preheader6.._crit_edge29_crit_edge:              ; preds = %.preheader6
  br label %._crit_edge29

.preheader5.lr.ph:                                ; preds = %.preheader6
  br i1 %9, label %.preheader5.lr.ph..preheader5.us_crit_edge, label %.preheader5.lr.ph..preheader5_crit_edge

.preheader5.lr.ph..preheader5_crit_edge:          ; preds = %.preheader5.lr.ph
  br label %.preheader5

.preheader5.lr.ph..preheader5.us_crit_edge:       ; preds = %.preheader5.lr.ph
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %._crit_edge26.us..preheader5.us_crit_edge, %.preheader5.lr.ph..preheader5.us_crit_edge
  %indvars.iv90 = phi i64 [ %indvars.iv.next91, %._crit_edge26.us..preheader5.us_crit_edge ], [ 0, %.preheader5.lr.ph..preheader5.us_crit_edge ]
  %17 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv90, i64 0
  br label %.lr.ph.us.us

._crit_edge26.us:                                 ; preds = %.prol.loopexit102.._crit_edge26.us_crit_edge, %.lr.ph25.us.new.._crit_edge26.us_crit_edge
  %indvars.iv.next91 = add nuw nsw i64 %indvars.iv90, 1
  %exitcond93 = icmp eq i64 %indvars.iv.next91, %wide.trip.count92
  br i1 %exitcond93, label %._crit_edge26.us.._crit_edge29_crit_edge, label %._crit_edge26.us..preheader5.us_crit_edge

._crit_edge26.us..preheader5.us_crit_edge:        ; preds = %._crit_edge26.us
  br label %.preheader5.us

._crit_edge26.us.._crit_edge29_crit_edge:         ; preds = %._crit_edge26.us
  br label %._crit_edge29

.lr.ph25.us.new:                                  ; preds = %.prol.loopexit102..lr.ph25.us.new_crit_edge, %.lr.ph25.us.new..lr.ph25.us.new_crit_edge
  %indvars.iv86 = phi i64 [ %indvars.iv.next87.3, %.lr.ph25.us.new..lr.ph25.us.new_crit_edge ], [ %indvars.iv86.unr, %.prol.loopexit102..lr.ph25.us.new_crit_edge ]
  %18 = getelementptr inbounds double, double* %5, i64 %indvars.iv86
  %19 = bitcast double* %18 to i64*
  %20 = load i64, i64* %19, align 8
  %21 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv90, i64 %indvars.iv86
  %22 = bitcast double* %21 to i64*
  store i64 %20, i64* %22, align 8
  %indvars.iv.next87 = add nuw nsw i64 %indvars.iv86, 1
  %23 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next87
  %24 = bitcast double* %23 to i64*
  %25 = load i64, i64* %24, align 8
  %26 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv90, i64 %indvars.iv.next87
  %27 = bitcast double* %26 to i64*
  store i64 %25, i64* %27, align 8
  %indvars.iv.next87.1 = add nsw i64 %indvars.iv86, 2
  %28 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next87.1
  %29 = bitcast double* %28 to i64*
  %30 = load i64, i64* %29, align 8
  %31 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv90, i64 %indvars.iv.next87.1
  %32 = bitcast double* %31 to i64*
  store i64 %30, i64* %32, align 8
  %indvars.iv.next87.2 = add nsw i64 %indvars.iv86, 3
  %33 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next87.2
  %34 = bitcast double* %33 to i64*
  %35 = load i64, i64* %34, align 8
  %36 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv90, i64 %indvars.iv.next87.2
  %37 = bitcast double* %36 to i64*
  store i64 %35, i64* %37, align 8
  %indvars.iv.next87.3 = add nsw i64 %indvars.iv86, 4
  %exitcond89.3 = icmp eq i64 %indvars.iv.next87.3, %wide.trip.count84
  br i1 %exitcond89.3, label %.lr.ph25.us.new.._crit_edge26.us_crit_edge, label %.lr.ph25.us.new..lr.ph25.us.new_crit_edge

.lr.ph25.us.new..lr.ph25.us.new_crit_edge:        ; preds = %.lr.ph25.us.new
  br label %.lr.ph25.us.new

.lr.ph25.us.new.._crit_edge26.us_crit_edge:       ; preds = %.lr.ph25.us.new
  br label %._crit_edge26.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us..lr.ph.us.us_crit_edge, %.preheader5.us
  %indvars.iv82 = phi i64 [ 0, %.preheader5.us ], [ %indvars.iv.next83, %._crit_edge.us.us..lr.ph.us.us_crit_edge ]
  %38 = getelementptr inbounds double, double* %5, i64 %indvars.iv82
  store double 0.000000e+00, double* %38, align 8
  br i1 %lcmp.mod98, label %.lr.ph.us.us..prol.loopexit96_crit_edge, label %.prol.preheader95

.lr.ph.us.us..prol.loopexit96_crit_edge:          ; preds = %.lr.ph.us.us
  br label %.prol.loopexit96

.prol.preheader95:                                ; preds = %.lr.ph.us.us
  %39 = load double, double* %17, align 8
  %40 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv82
  %41 = load double, double* %40, align 8
  %42 = fmul double %39, %41
  %43 = fadd double %42, 0.000000e+00
  store double %43, double* %38, align 8
  br label %.prol.loopexit96

.prol.loopexit96:                                 ; preds = %.lr.ph.us.us..prol.loopexit96_crit_edge, %.prol.preheader95
  %indvars.iv78.unr.ph = phi i64 [ 1, %.prol.preheader95 ], [ 0, %.lr.ph.us.us..prol.loopexit96_crit_edge ]
  %.unr.ph = phi double [ %43, %.prol.preheader95 ], [ 0.000000e+00, %.lr.ph.us.us..prol.loopexit96_crit_edge ]
  br i1 %11, label %.prol.loopexit96.._crit_edge.us.us_crit_edge, label %.prol.loopexit96..lr.ph.us.us.new_crit_edge

.prol.loopexit96..lr.ph.us.us.new_crit_edge:      ; preds = %.prol.loopexit96
  br label %.lr.ph.us.us.new

.prol.loopexit96.._crit_edge.us.us_crit_edge:     ; preds = %.prol.loopexit96
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %.lr.ph.us.us.new.._crit_edge.us.us_crit_edge, %.prol.loopexit96.._crit_edge.us.us_crit_edge
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1
  %exitcond85 = icmp eq i64 %indvars.iv.next83, %wide.trip.count84
  br i1 %exitcond85, label %.lr.ph25.us, label %._crit_edge.us.us..lr.ph.us.us_crit_edge

._crit_edge.us.us..lr.ph.us.us_crit_edge:         ; preds = %._crit_edge.us.us
  br label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge, %.prol.loopexit96..lr.ph.us.us.new_crit_edge
  %indvars.iv78 = phi i64 [ %indvars.iv.next79.1, %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge ], [ %indvars.iv78.unr.ph, %.prol.loopexit96..lr.ph.us.us.new_crit_edge ]
  %44 = phi double [ %56, %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge ], [ %.unr.ph, %.prol.loopexit96..lr.ph.us.us.new_crit_edge ]
  %45 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv90, i64 %indvars.iv78
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv78, i64 %indvars.iv82
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = fadd double %44, %49
  store double %50, double* %38, align 8
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %51 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv90, i64 %indvars.iv.next79
  %52 = load double, double* %51, align 8
  %53 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next79, i64 %indvars.iv82
  %54 = load double, double* %53, align 8
  %55 = fmul double %52, %54
  %56 = fadd double %50, %55
  store double %56, double* %38, align 8
  %indvars.iv.next79.1 = add nsw i64 %indvars.iv78, 2
  %exitcond81.1 = icmp eq i64 %indvars.iv.next79.1, %wide.trip.count84
  br i1 %exitcond81.1, label %.lr.ph.us.us.new.._crit_edge.us.us_crit_edge, label %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge

.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge:      ; preds = %.lr.ph.us.us.new
  br label %.lr.ph.us.us.new

.lr.ph.us.us.new.._crit_edge.us.us_crit_edge:     ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

.lr.ph25.us:                                      ; preds = %._crit_edge.us.us
  br i1 %lcmp.mod104, label %.lr.ph25.us..prol.loopexit102_crit_edge, label %.lr.ph25.us..prol.preheader101_crit_edge

.lr.ph25.us..prol.preheader101_crit_edge:         ; preds = %.lr.ph25.us
  br label %.prol.preheader101

.lr.ph25.us..prol.loopexit102_crit_edge:          ; preds = %.lr.ph25.us
  br label %.prol.loopexit102

.prol.preheader101:                               ; preds = %.prol.preheader101..prol.preheader101_crit_edge, %.lr.ph25.us..prol.preheader101_crit_edge
  %indvars.iv86.prol = phi i64 [ %indvars.iv.next87.prol, %.prol.preheader101..prol.preheader101_crit_edge ], [ 0, %.lr.ph25.us..prol.preheader101_crit_edge ]
  %prol.iter105 = phi i32 [ %prol.iter105.sub, %.prol.preheader101..prol.preheader101_crit_edge ], [ %xtraiter103, %.lr.ph25.us..prol.preheader101_crit_edge ]
  %57 = getelementptr inbounds double, double* %5, i64 %indvars.iv86.prol
  %58 = bitcast double* %57 to i64*
  %59 = load i64, i64* %58, align 8
  %60 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv90, i64 %indvars.iv86.prol
  %61 = bitcast double* %60 to i64*
  store i64 %59, i64* %61, align 8
  %prol.iter105.sub = add nsw i32 %prol.iter105, -1
  %prol.iter105.cmp = icmp eq i32 %prol.iter105.sub, 0
  br i1 %prol.iter105.cmp, label %.prol.preheader101..prol.loopexit102_crit_edge, label %.prol.preheader101..prol.preheader101_crit_edge, !llvm.loop !1

.prol.preheader101..prol.preheader101_crit_edge:  ; preds = %.prol.preheader101
  %indvars.iv.next87.prol = add nuw nsw i64 %indvars.iv86.prol, 1
  br label %.prol.preheader101

.prol.preheader101..prol.loopexit102_crit_edge:   ; preds = %.prol.preheader101
  br label %.prol.loopexit102

.prol.loopexit102:                                ; preds = %.prol.preheader101..prol.loopexit102_crit_edge, %.lr.ph25.us..prol.loopexit102_crit_edge
  %indvars.iv86.unr = phi i64 [ 0, %.lr.ph25.us..prol.loopexit102_crit_edge ], [ %15, %.prol.preheader101..prol.loopexit102_crit_edge ]
  br i1 %12, label %.prol.loopexit102.._crit_edge26.us_crit_edge, label %.prol.loopexit102..lr.ph25.us.new_crit_edge

.prol.loopexit102..lr.ph25.us.new_crit_edge:      ; preds = %.prol.loopexit102
  br label %.lr.ph25.us.new

.prol.loopexit102.._crit_edge26.us_crit_edge:     ; preds = %.prol.loopexit102
  br label %._crit_edge26.us

.preheader5:                                      ; preds = %.preheader5..preheader5_crit_edge, %.preheader5.lr.ph..preheader5_crit_edge
  %indvars.iv74 = phi i64 [ %indvars.iv.next75, %.preheader5..preheader5_crit_edge ], [ 0, %.preheader5.lr.ph..preheader5_crit_edge ]
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %exitcond77 = icmp eq i64 %indvars.iv.next75, %wide.trip.count92
  br i1 %exitcond77, label %.preheader5.._crit_edge29_crit_edge, label %.preheader5..preheader5_crit_edge

.preheader5..preheader5_crit_edge:                ; preds = %.preheader5
  br label %.preheader5

.preheader5.._crit_edge29_crit_edge:              ; preds = %.preheader5
  br label %._crit_edge29

._crit_edge29:                                    ; preds = %.preheader5.._crit_edge29_crit_edge, %._crit_edge26.us.._crit_edge29_crit_edge, %.preheader6.._crit_edge29_crit_edge
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %62 = icmp slt i64 %indvars.iv.next, %16
  br i1 %62, label %._crit_edge29..preheader6_crit_edge, label %._crit_edge29.._crit_edge57_crit_edge

._crit_edge29.._crit_edge57_crit_edge:            ; preds = %._crit_edge29
  br label %._crit_edge57

._crit_edge29..preheader6_crit_edge:              ; preds = %._crit_edge29
  br label %.preheader6

._crit_edge57:                                    ; preds = %._crit_edge29.._crit_edge57_crit_edge, %.._crit_edge57_crit_edge
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #1 {
  %3 = tail call i8* @polybench_alloc_data(i64 3360000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 160, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 25600, i32 8) #4
  %6 = bitcast i8* %3 to [140 x [160 x double]]*
  %7 = bitcast i8* %5 to [160 x double]*
  tail call fastcc void @init_array([140 x [160 x double]]* %6, [160 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to double*
  tail call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %7, double* %8)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %._crit_edge

._crit_edge:                                      ; preds = %2
  br label %14

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge1

._crit_edge1:                                     ; preds = %10
  br label %14

; <label>:13:                                     ; preds = %10
  tail call fastcc void @print_array([140 x [160 x double]]* %6)
  br label %14

; <label>:14:                                     ; preds = %._crit_edge1, %._crit_edge, %13
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([140 x [160 x double]]* nocapture, [160 x double]* nocapture) unnamed_addr #0 {
  br label %.preheader7

.preheader7:                                      ; preds = %..preheader7_crit_edge, %2
  %indvars.iv24 = phi i64 [ 0, %2 ], [ %indvars.iv.next25, %..preheader7_crit_edge ]
  br label %.preheader6

.preheader6:                                      ; preds = %..preheader6_crit_edge, %.preheader7
  %indvars.iv21 = phi i64 [ 0, %.preheader7 ], [ %indvars.iv.next22, %..preheader6_crit_edge ]
  %3 = mul nuw nsw i64 %indvars.iv24, %indvars.iv21
  br label %4

; <label>:4:                                      ; preds = %._crit_edge, %.preheader6
  %indvars.iv18 = phi i64 [ 0, %.preheader6 ], [ %indvars.iv.next19.1, %._crit_edge ]
  %5 = add nuw nsw i64 %3, %indvars.iv18
  %6 = trunc i64 %5 to i32
  %7 = srem i32 %6, 160
  %8 = sitofp i32 %7 to double
  %9 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %0, i64 %indvars.iv24, i64 %indvars.iv21, i64 %indvars.iv18
  %indvars.iv.next19 = or i64 %indvars.iv18, 1
  %10 = add nuw nsw i64 %3, %indvars.iv.next19
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 160
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %8, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fdiv <2 x double> %15, <double 1.600000e+02, double 1.600000e+02>
  %17 = bitcast double* %9 to <2 x double>*
  store <2 x double> %16, <2 x double>* %17, align 8
  %indvars.iv.next19.1 = add nuw nsw i64 %indvars.iv18, 2
  %exitcond20.1 = icmp eq i64 %indvars.iv.next19.1, 160
  br i1 %exitcond20.1, label %18, label %._crit_edge

._crit_edge:                                      ; preds = %4
  br label %4

; <label>:18:                                     ; preds = %4
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next22, 140
  br i1 %exitcond23, label %19, label %..preheader6_crit_edge

..preheader6_crit_edge:                           ; preds = %18
  br label %.preheader6

; <label>:19:                                     ; preds = %18
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next25, 150
  br i1 %exitcond26, label %..preheader_crit_edge, label %..preheader7_crit_edge

..preheader7_crit_edge:                           ; preds = %19
  br label %.preheader7

..preheader_crit_edge:                            ; preds = %19
  br label %.preheader

.preheader:                                       ; preds = %..preheader_crit_edge2, %..preheader_crit_edge
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %..preheader_crit_edge2 ], [ 0, %..preheader_crit_edge ]
  br label %20

; <label>:20:                                     ; preds = %._crit_edge1, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %._crit_edge1 ]
  %21 = mul nuw nsw i64 %indvars.iv15, %indvars.iv
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, 160
  %24 = sitofp i32 %23 to double
  %25 = getelementptr inbounds [160 x double], [160 x double]* %1, i64 %indvars.iv15, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %26 = mul nuw nsw i64 %indvars.iv15, %indvars.iv.next
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
  br i1 %exitcond.1, label %34, label %._crit_edge1

._crit_edge1:                                     ; preds = %20
  br label %20

; <label>:34:                                     ; preds = %20
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next16, 160
  br i1 %exitcond17, label %35, label %..preheader_crit_edge2

..preheader_crit_edge2:                           ; preds = %34
  br label %.preheader

; <label>:35:                                     ; preds = %34
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([140 x [160 x double]]* nocapture readonly) unnamed_addr #1 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader3

.preheader3:                                      ; preds = %..preheader3_crit_edge, %1
  %indvars.iv11 = phi i64 [ 0, %1 ], [ %indvars.iv.next12, %..preheader3_crit_edge ]
  %6 = mul nuw nsw i64 %indvars.iv11, 140
  br label %.preheader

.preheader:                                       ; preds = %..preheader_crit_edge, %.preheader3
  %indvars.iv8 = phi i64 [ 0, %.preheader3 ], [ %indvars.iv.next9, %..preheader_crit_edge ]
  %7 = add nuw nsw i64 %6, %indvars.iv8
  %8 = mul nuw nsw i64 %7, 160
  br label %9

; <label>:9:                                      ; preds = %._crit_edge1, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge1 ]
  %10 = add nuw nsw i64 %8, %indvars.iv
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge

._crit_edge:                                      ; preds = %9
  br label %16

; <label>:14:                                     ; preds = %9
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %16

; <label>:16:                                     ; preds = %._crit_edge, %14
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %0, i64 %indvars.iv11, i64 %indvars.iv8, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond, label %21, label %._crit_edge1

._crit_edge1:                                     ; preds = %16
  br label %9

; <label>:21:                                     ; preds = %16
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next9, 140
  br i1 %exitcond10, label %22, label %..preheader_crit_edge

..preheader_crit_edge:                            ; preds = %21
  br label %.preheader

; <label>:22:                                     ; preds = %21
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next12, 150
  br i1 %exitcond13, label %23, label %..preheader3_crit_edge

..preheader3_crit_edge:                           ; preds = %22
  br label %.preheader3

; <label>:23:                                     ; preds = %22
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %26) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
