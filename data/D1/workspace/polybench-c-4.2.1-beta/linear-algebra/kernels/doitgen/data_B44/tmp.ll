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
define void @kernel_doitgen(i32, i32, i32, [140 x [160 x double]]* nocapture, [160 x double]* nocapture readonly, double* nocapture) local_unnamed_addr #0 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader2.lr.ph, label %.._crit_edge18_crit_edge

.._crit_edge18_crit_edge:                         ; preds = %6
  br label %._crit_edge18

.preheader2.lr.ph:                                ; preds = %6
  %8 = zext i32 %2 to i64
  %9 = add nsw i64 %8, -1
  %xtraiter48 = and i64 %8, 1
  %xtraiter54 = and i64 %8, 3
  %wide.trip.count43 = zext i32 %1 to i64
  %10 = add nsw i64 %wide.trip.count43, -1
  %11 = icmp sgt i32 %1, 0
  %12 = icmp sgt i32 %2, 0
  %13 = icmp eq i64 %xtraiter48, 0
  %14 = icmp eq i64 %9, 0
  %sunkaddr61 = ptrtoint double* %5 to i64
  %sunkaddr = ptrtoint double* %5 to i64
  %15 = icmp eq i64 %xtraiter54, 0
  %16 = icmp ult i64 %9, 3
  %xtraiter = and i64 %wide.trip.count43, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %17 = icmp ult i64 %10, 7
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader2

.preheader2:                                      ; preds = %._crit_edge9..preheader2_crit_edge, %.preheader2.lr.ph
  %indvars.iv = phi i64 [ 0, %.preheader2.lr.ph ], [ %indvars.iv.next, %._crit_edge9..preheader2_crit_edge ]
  br i1 %11, label %.preheader1.lr.ph, label %.preheader2.._crit_edge9_crit_edge

.preheader2.._crit_edge9_crit_edge:               ; preds = %.preheader2
  br label %._crit_edge9

.preheader1.lr.ph:                                ; preds = %.preheader2
  br i1 %12, label %.preheader1.us.preheader, label %.preheader1.preheader

.preheader1.preheader:                            ; preds = %.preheader1.lr.ph
  br i1 %lcmp.mod, label %.preheader1.preheader..preheader1.prol.loopexit_crit_edge, label %.preheader1.prol.preheader

.preheader1.preheader..preheader1.prol.loopexit_crit_edge: ; preds = %.preheader1.preheader
  br label %.preheader1.prol.loopexit

.preheader1.prol.preheader:                       ; preds = %.preheader1.preheader
  br label %.preheader1.prol

.preheader1.prol:                                 ; preds = %.preheader1.prol..preheader1.prol_crit_edge, %.preheader1.prol.preheader
  %indvars.iv21.prol = phi i64 [ %indvars.iv.next22.prol, %.preheader1.prol..preheader1.prol_crit_edge ], [ 0, %.preheader1.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.preheader1.prol..preheader1.prol_crit_edge ], [ %xtraiter, %.preheader1.prol.preheader ]
  %indvars.iv.next22.prol = add nuw nsw i64 %indvars.iv21.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader1.prol.loopexit.unr-lcssa, label %.preheader1.prol..preheader1.prol_crit_edge, !llvm.loop !1

.preheader1.prol..preheader1.prol_crit_edge:      ; preds = %.preheader1.prol
  br label %.preheader1.prol

.preheader1.prol.loopexit.unr-lcssa:              ; preds = %.preheader1.prol
  br label %.preheader1.prol.loopexit

.preheader1.prol.loopexit:                        ; preds = %.preheader1.preheader..preheader1.prol.loopexit_crit_edge, %.preheader1.prol.loopexit.unr-lcssa
  %indvars.iv21.unr = phi i64 [ 0, %.preheader1.preheader..preheader1.prol.loopexit_crit_edge ], [ %indvars.iv.next22.prol, %.preheader1.prol.loopexit.unr-lcssa ]
  br i1 %17, label %.preheader1.prol.loopexit.._crit_edge9.loopexit66_crit_edge, label %.preheader1.preheader.new

.preheader1.prol.loopexit.._crit_edge9.loopexit66_crit_edge: ; preds = %.preheader1.prol.loopexit
  br label %._crit_edge9.loopexit66

.preheader1.preheader.new:                        ; preds = %.preheader1.prol.loopexit
  br label %.preheader1

.preheader1.us.preheader:                         ; preds = %.preheader1.lr.ph
  br label %.preheader1.us

.preheader1.us:                                   ; preds = %._crit_edge8.us..preheader1.us_crit_edge, %.preheader1.us.preheader
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %._crit_edge8.us..preheader1.us_crit_edge ], [ 0, %.preheader1.us.preheader ]
  %18 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv41, i64 0
  br label %.lr.ph.us.us

._crit_edge8.us.loopexit:                         ; preds = %.lr.ph7.us.new
  br label %._crit_edge8.us

._crit_edge8.us:                                  ; preds = %.prol.loopexit53.._crit_edge8.us_crit_edge, %._crit_edge8.us.loopexit
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next42, %wide.trip.count43
  br i1 %exitcond44, label %._crit_edge9.loopexit, label %._crit_edge8.us..preheader1.us_crit_edge

._crit_edge8.us..preheader1.us_crit_edge:         ; preds = %._crit_edge8.us
  br label %.preheader1.us

.lr.ph7.us.new:                                   ; preds = %.lr.ph7.us.new..lr.ph7.us.new_crit_edge, %.lr.ph7.us.new.preheader
  %indvars.iv37 = phi i64 [ %indvars.iv.next38.3, %.lr.ph7.us.new..lr.ph7.us.new_crit_edge ], [ %indvars.iv37.unr, %.lr.ph7.us.new.preheader ]
  %19 = getelementptr inbounds double, double* %5, i64 %indvars.iv37
  %20 = bitcast double* %19 to i64*
  %21 = load i64, i64* %20, align 8
  %22 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv41, i64 %indvars.iv37
  %23 = bitcast double* %22 to i64*
  store i64 %21, i64* %23, align 8
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %24 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next38
  %25 = bitcast double* %24 to i64*
  %26 = load i64, i64* %25, align 8
  %27 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv41, i64 %indvars.iv.next38
  %28 = bitcast double* %27 to i64*
  store i64 %26, i64* %28, align 8
  %indvars.iv.next38.1 = add nsw i64 %indvars.iv37, 2
  %29 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next38.1
  %30 = bitcast double* %29 to i64*
  %31 = load i64, i64* %30, align 8
  %32 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv41, i64 %indvars.iv.next38.1
  %33 = bitcast double* %32 to i64*
  store i64 %31, i64* %33, align 8
  %indvars.iv.next38.2 = add nsw i64 %indvars.iv37, 3
  %34 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next38.2
  %35 = bitcast double* %34 to i64*
  %36 = load i64, i64* %35, align 8
  %37 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv41, i64 %indvars.iv.next38.2
  %38 = bitcast double* %37 to i64*
  store i64 %36, i64* %38, align 8
  %indvars.iv.next38.3 = add nuw nsw i64 %indvars.iv37, 4
  %exitcond40.3 = icmp eq i64 %indvars.iv.next38.3, %8
  br i1 %exitcond40.3, label %._crit_edge8.us.loopexit, label %.lr.ph7.us.new..lr.ph7.us.new_crit_edge

.lr.ph7.us.new..lr.ph7.us.new_crit_edge:          ; preds = %.lr.ph7.us.new
  br label %.lr.ph7.us.new

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us..lr.ph.us.us_crit_edge, %.preheader1.us
  %indvars.iv33 = phi i64 [ %indvars.iv.next34, %._crit_edge.us.us..lr.ph.us.us_crit_edge ], [ 0, %.preheader1.us ]
  %39 = getelementptr inbounds double, double* %5, i64 %indvars.iv33
  store double 0.000000e+00, double* %39, align 8
  br i1 %13, label %.lr.ph.us.us..prol.loopexit47_crit_edge, label %.prol.preheader46

.lr.ph.us.us..prol.loopexit47_crit_edge:          ; preds = %.lr.ph.us.us
  br label %.prol.loopexit47

.prol.preheader46:                                ; preds = %.lr.ph.us.us
  %40 = load double, double* %18, align 8
  %41 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv33
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = fadd double %43, 0.000000e+00
  %sunkaddr58 = shl i64 %indvars.iv33, 3
  %sunkaddr59 = add i64 %sunkaddr, %sunkaddr58
  %sunkaddr60 = inttoptr i64 %sunkaddr59 to double*
  store double %44, double* %sunkaddr60, align 8
  br label %.prol.loopexit47

.prol.loopexit47:                                 ; preds = %.lr.ph.us.us..prol.loopexit47_crit_edge, %.prol.preheader46
  %indvars.iv29.unr.ph = phi i64 [ 1, %.prol.preheader46 ], [ 0, %.lr.ph.us.us..prol.loopexit47_crit_edge ]
  %.unr.ph = phi double [ %44, %.prol.preheader46 ], [ 0.000000e+00, %.lr.ph.us.us..prol.loopexit47_crit_edge ]
  br i1 %14, label %.prol.loopexit47.._crit_edge.us.us_crit_edge, label %.lr.ph.us.us.new.preheader

.prol.loopexit47.._crit_edge.us.us_crit_edge:     ; preds = %.prol.loopexit47
  br label %._crit_edge.us.us

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit47
  %sunkaddr62 = shl i64 %indvars.iv33, 3
  %sunkaddr63 = add i64 %sunkaddr61, %sunkaddr62
  %sunkaddr64 = inttoptr i64 %sunkaddr63 to double*
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %.prol.loopexit47.._crit_edge.us.us_crit_edge, %._crit_edge.us.us.loopexit
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next34, %8
  br i1 %exitcond36, label %.lr.ph7.us, label %._crit_edge.us.us..lr.ph.us.us_crit_edge

._crit_edge.us.us..lr.ph.us.us_crit_edge:         ; preds = %._crit_edge.us.us
  br label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge, %.lr.ph.us.us.new.preheader
  %indvars.iv29 = phi i64 [ %indvars.iv.next30.1, %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge ], [ %indvars.iv29.unr.ph, %.lr.ph.us.us.new.preheader ]
  %45 = phi double [ %57, %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge ], [ %.unr.ph, %.lr.ph.us.us.new.preheader ]
  %46 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv41, i64 %indvars.iv29
  %47 = load double, double* %46, align 8
  %48 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv29, i64 %indvars.iv33
  %49 = load double, double* %48, align 8
  %50 = fmul double %47, %49
  %51 = fadd double %45, %50
  store double %51, double* %sunkaddr64, align 8
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %52 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv41, i64 %indvars.iv.next30
  %53 = load double, double* %52, align 8
  %54 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next30, i64 %indvars.iv33
  %55 = load double, double* %54, align 8
  %56 = fmul double %53, %55
  %57 = fadd double %51, %56
  store double %57, double* %sunkaddr64, align 8
  %indvars.iv.next30.1 = add nuw nsw i64 %indvars.iv29, 2
  %exitcond32.1 = icmp eq i64 %indvars.iv.next30.1, %8
  br i1 %exitcond32.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge

.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge:      ; preds = %.lr.ph.us.us.new
  br label %.lr.ph.us.us.new

.lr.ph7.us:                                       ; preds = %._crit_edge.us.us
  br i1 %15, label %.lr.ph7.us..prol.loopexit53_crit_edge, label %.prol.preheader52.preheader

.lr.ph7.us..prol.loopexit53_crit_edge:            ; preds = %.lr.ph7.us
  br label %.prol.loopexit53

.prol.preheader52.preheader:                      ; preds = %.lr.ph7.us
  br label %.prol.preheader52

.prol.preheader52:                                ; preds = %.prol.preheader52..prol.preheader52_crit_edge, %.prol.preheader52.preheader
  %indvars.iv37.prol = phi i64 [ %indvars.iv.next38.prol, %.prol.preheader52..prol.preheader52_crit_edge ], [ 0, %.prol.preheader52.preheader ]
  %prol.iter56 = phi i64 [ %prol.iter56.sub, %.prol.preheader52..prol.preheader52_crit_edge ], [ %xtraiter54, %.prol.preheader52.preheader ]
  %58 = getelementptr inbounds double, double* %5, i64 %indvars.iv37.prol
  %59 = bitcast double* %58 to i64*
  %60 = load i64, i64* %59, align 8
  %61 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv41, i64 %indvars.iv37.prol
  %62 = bitcast double* %61 to i64*
  store i64 %60, i64* %62, align 8
  %indvars.iv.next38.prol = add nuw nsw i64 %indvars.iv37.prol, 1
  %prol.iter56.sub = add nsw i64 %prol.iter56, -1
  %prol.iter56.cmp = icmp eq i64 %prol.iter56.sub, 0
  br i1 %prol.iter56.cmp, label %.prol.loopexit53.loopexit, label %.prol.preheader52..prol.preheader52_crit_edge, !llvm.loop !3

.prol.preheader52..prol.preheader52_crit_edge:    ; preds = %.prol.preheader52
  br label %.prol.preheader52

.prol.loopexit53.loopexit:                        ; preds = %.prol.preheader52
  br label %.prol.loopexit53

.prol.loopexit53:                                 ; preds = %.lr.ph7.us..prol.loopexit53_crit_edge, %.prol.loopexit53.loopexit
  %indvars.iv37.unr = phi i64 [ 0, %.lr.ph7.us..prol.loopexit53_crit_edge ], [ %xtraiter54, %.prol.loopexit53.loopexit ]
  br i1 %16, label %.prol.loopexit53.._crit_edge8.us_crit_edge, label %.lr.ph7.us.new.preheader

.prol.loopexit53.._crit_edge8.us_crit_edge:       ; preds = %.prol.loopexit53
  br label %._crit_edge8.us

.lr.ph7.us.new.preheader:                         ; preds = %.prol.loopexit53
  br label %.lr.ph7.us.new

.preheader1:                                      ; preds = %.preheader1..preheader1_crit_edge, %.preheader1.preheader.new
  %indvars.iv21 = phi i64 [ %indvars.iv21.unr, %.preheader1.preheader.new ], [ %indvars.iv.next22.7, %.preheader1..preheader1_crit_edge ]
  %indvars.iv.next22.7 = add nsw i64 %indvars.iv21, 8
  %exitcond24.7 = icmp eq i64 %indvars.iv.next22.7, %wide.trip.count43
  br i1 %exitcond24.7, label %._crit_edge9.loopexit66.unr-lcssa, label %.preheader1..preheader1_crit_edge

.preheader1..preheader1_crit_edge:                ; preds = %.preheader1
  br label %.preheader1

._crit_edge9.loopexit:                            ; preds = %._crit_edge8.us
  br label %._crit_edge9

._crit_edge9.loopexit66.unr-lcssa:                ; preds = %.preheader1
  br label %._crit_edge9.loopexit66

._crit_edge9.loopexit66:                          ; preds = %.preheader1.prol.loopexit.._crit_edge9.loopexit66_crit_edge, %._crit_edge9.loopexit66.unr-lcssa
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %.preheader2.._crit_edge9_crit_edge, %._crit_edge9.loopexit66, %._crit_edge9.loopexit
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge18.loopexit, label %._crit_edge9..preheader2_crit_edge

._crit_edge9..preheader2_crit_edge:               ; preds = %._crit_edge9
  br label %.preheader2

._crit_edge18.loopexit:                           ; preds = %._crit_edge9
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %.._crit_edge18_crit_edge, %._crit_edge18.loopexit
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
.preheader3.us.preheader:
  br label %.preheader2.us.us.preheader

.preheader2.us.us.preheader:                      ; preds = %._crit_edge7.us..preheader2.us.us.preheader_crit_edge, %.preheader3.us.preheader
  %indvars.iv28 = phi i64 [ 0, %.preheader3.us.preheader ], [ %indvars.iv.next29, %._crit_edge7.us..preheader2.us.us.preheader_crit_edge ]
  br label %.preheader2.us.us.new

._crit_edge7.us:                                  ; preds = %._crit_edge6.us.us
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next29, 150
  br i1 %exitcond31, label %.preheader.us.new.preheader, label %._crit_edge7.us..preheader2.us.us.preheader_crit_edge

._crit_edge7.us..preheader2.us.us.preheader_crit_edge: ; preds = %._crit_edge7.us
  br label %.preheader2.us.us.preheader

.preheader.us.new.preheader:                      ; preds = %._crit_edge7.us
  br label %.preheader.us.new

.preheader2.us.us.new:                            ; preds = %._crit_edge6.us.us..preheader2.us.us.new_crit_edge, %.preheader2.us.us.preheader
  %indvars.iv24 = phi i64 [ 0, %.preheader2.us.us.preheader ], [ %indvars.iv.next25, %._crit_edge6.us.us..preheader2.us.us.new_crit_edge ]
  %2 = mul nuw nsw i64 %indvars.iv24, %indvars.iv28
  br label %3

._crit_edge6.us.us:                               ; preds = %3
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next25, 140
  br i1 %exitcond27, label %._crit_edge7.us, label %._crit_edge6.us.us..preheader2.us.us.new_crit_edge

._crit_edge6.us.us..preheader2.us.us.new_crit_edge: ; preds = %._crit_edge6.us.us
  br label %.preheader2.us.us.new

; <label>:3:                                      ; preds = %._crit_edge, %.preheader2.us.us.new
  %indvars.iv20 = phi i64 [ 0, %.preheader2.us.us.new ], [ %indvars.iv.next21.1, %._crit_edge ]
  %4 = add nuw nsw i64 %indvars.iv20, %2
  %5 = trunc i64 %4 to i32
  %6 = srem i32 %5, 160
  %7 = sitofp i32 %6 to double
  %8 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %0, i64 %indvars.iv28, i64 %indvars.iv24, i64 %indvars.iv20
  %indvars.iv.next21 = or i64 %indvars.iv20, 1
  %9 = add nuw nsw i64 %indvars.iv.next21, %2
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 160
  %12 = sitofp i32 %11 to double
  %13 = insertelement <2 x double> undef, double %7, i32 0
  %14 = insertelement <2 x double> %13, double %12, i32 1
  %15 = fdiv <2 x double> %14, <double 1.600000e+02, double 1.600000e+02>
  %16 = bitcast double* %8 to <2 x double>*
  store <2 x double> %15, <2 x double>* %16, align 8
  %indvars.iv.next21.1 = add nuw nsw i64 %indvars.iv20, 2
  %exitcond23.1 = icmp eq i64 %indvars.iv.next21.1, 160
  br i1 %exitcond23.1, label %._crit_edge6.us.us, label %._crit_edge

._crit_edge:                                      ; preds = %3
  br label %3

.preheader.us.new:                                ; preds = %._crit_edge.us..preheader.us.new_crit_edge, %.preheader.us.new.preheader
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %._crit_edge.us..preheader.us.new_crit_edge ], [ 0, %.preheader.us.new.preheader ]
  br label %17

; <label>:17:                                     ; preds = %._crit_edge1, %.preheader.us.new
  %indvars.iv = phi i64 [ 0, %.preheader.us.new ], [ %indvars.iv.next.1, %._crit_edge1 ]
  %18 = mul nuw nsw i64 %indvars.iv, %indvars.iv15
  %19 = trunc i64 %18 to i32
  %20 = srem i32 %19, 160
  %21 = sitofp i32 %20 to double
  %22 = getelementptr inbounds [160 x double], [160 x double]* %1, i64 %indvars.iv15, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %23 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv15
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
  br i1 %exitcond.1, label %._crit_edge.us, label %._crit_edge1

._crit_edge1:                                     ; preds = %17
  br label %17

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next16, 160
  br i1 %exitcond18, label %._crit_edge4, label %._crit_edge.us..preheader.us.new_crit_edge

._crit_edge.us..preheader.us.new_crit_edge:       ; preds = %._crit_edge.us
  br label %.preheader.us.new

._crit_edge4:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([140 x [160 x double]]* nocapture readonly) unnamed_addr #1 {
.preheader1.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %._crit_edge2.us..preheader.us.us.preheader_crit_edge, %.preheader1.us.preheader
  %indvars.iv17 = phi i64 [ 0, %.preheader1.us.preheader ], [ %indvars.iv.next18, %._crit_edge2.us..preheader.us.us.preheader_crit_edge ]
  %5 = mul nuw nsw i64 %indvars.iv17, 140
  br label %.preheader.us.us

._crit_edge2.us:                                  ; preds = %._crit_edge.us.us
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next18, 150
  br i1 %exitcond20, label %._crit_edge3, label %._crit_edge2.us..preheader.us.us.preheader_crit_edge

._crit_edge2.us..preheader.us.us.preheader_crit_edge: ; preds = %._crit_edge2.us
  br label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge.us.us..preheader.us.us_crit_edge, %.preheader.us.us.preheader
  %indvars.iv13 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next14, %._crit_edge.us.us..preheader.us.us_crit_edge ]
  %6 = add nuw nsw i64 %indvars.iv13, %5
  %sext = mul nuw nsw i64 %6, 687194767360
  %7 = lshr exact i64 %sext, 32
  br label %8

._crit_edge.us.us:                                ; preds = %15
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next14, 140
  br i1 %exitcond16, label %._crit_edge2.us, label %._crit_edge.us.us..preheader.us.us_crit_edge

._crit_edge.us.us..preheader.us.us_crit_edge:     ; preds = %._crit_edge.us.us
  br label %.preheader.us.us

; <label>:8:                                      ; preds = %._crit_edge1, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge1 ], [ 0, %.preheader.us.us ]
  %9 = add nuw nsw i64 %indvars.iv, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge

._crit_edge:                                      ; preds = %8
  br label %15

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %15

; <label>:15:                                     ; preds = %._crit_edge, %13
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %0, i64 %indvars.iv17, i64 %indvars.iv13, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond12, label %._crit_edge.us.us, label %._crit_edge1

._crit_edge1:                                     ; preds = %15
  br label %8

._crit_edge3:                                     ; preds = %._crit_edge2.us
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
