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
  br i1 %7, label %.lr.ph72, label %._crit_edge73

.lr.ph72:                                         ; preds = %6
  %wide.trip.count.us = zext i32 %2 to i64
  %8 = zext i32 %1 to i64
  %9 = add nsw i64 %wide.trip.count.us, -1
  %10 = icmp sgt i32 %1, 0
  %11 = icmp sgt i32 %2, 0
  %xtraiter91 = and i64 %wide.trip.count.us, 1
  %lcmp.mod92 = icmp eq i64 %xtraiter91, 0
  %12 = icmp eq i64 %9, 0
  %sunkaddr108 = ptrtoint double* %5 to i64
  %xtraiter97 = and i64 %wide.trip.count.us, 3
  %lcmp.mod98 = icmp eq i64 %xtraiter97, 0
  %13 = icmp ult i64 %9, 3
  %14 = add nsw i64 %8, -1
  %xtraiter = and i64 %8, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %15 = icmp ult i64 %14, 7
  %wide.trip.count = zext i32 %0 to i64
  br label %16

; <label>:16:                                     ; preds = %._crit_edge42, %.lr.ph72
  %indvars.iv = phi i64 [ 0, %.lr.ph72 ], [ %indvars.iv.next, %._crit_edge42 ]
  br i1 %10, label %.lr.ph41, label %._crit_edge42

.lr.ph41:                                         ; preds = %16
  br i1 %11, label %.lr.ph18.us.preheader, label %.lr.ph41.split.preheader

.lr.ph41.split.preheader:                         ; preds = %.lr.ph41
  br i1 %lcmp.mod, label %.lr.ph41.split.prol.loopexit, label %.lr.ph41.split.prol.preheader

.lr.ph41.split.prol.preheader:                    ; preds = %.lr.ph41.split.preheader
  br label %.lr.ph41.split.prol

.lr.ph41.split.prol:                              ; preds = %.lr.ph41.split.prol, %.lr.ph41.split.prol.preheader
  %indvars.iv61.prol = phi i64 [ %indvars.iv.next62.prol, %.lr.ph41.split.prol ], [ 0, %.lr.ph41.split.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph41.split.prol ], [ %xtraiter, %.lr.ph41.split.prol.preheader ]
  %indvars.iv.next62.prol = add nuw nsw i64 %indvars.iv61.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph41.split.prol.loopexit.unr-lcssa, label %.lr.ph41.split.prol, !llvm.loop !1

.lr.ph41.split.prol.loopexit.unr-lcssa:           ; preds = %.lr.ph41.split.prol
  br label %.lr.ph41.split.prol.loopexit

.lr.ph41.split.prol.loopexit:                     ; preds = %.lr.ph41.split.preheader, %.lr.ph41.split.prol.loopexit.unr-lcssa
  %indvars.iv61.unr = phi i64 [ 0, %.lr.ph41.split.preheader ], [ %indvars.iv.next62.prol, %.lr.ph41.split.prol.loopexit.unr-lcssa ]
  br i1 %15, label %._crit_edge42.loopexit114, label %.lr.ph41.split.preheader.new

.lr.ph41.split.preheader.new:                     ; preds = %.lr.ph41.split.prol.loopexit
  br label %.lr.ph41.split

.lr.ph18.us.preheader:                            ; preds = %.lr.ph41
  br label %.lr.ph18.us

._crit_edge30.us.loopexit:                        ; preds = %.lr.ph29.us.new
  br label %._crit_edge30.us

._crit_edge30.us:                                 ; preds = %._crit_edge30.us.loopexit, %.prol.loopexit96
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond87 = icmp eq i64 %indvars.iv.next67, %8
  br i1 %exitcond87, label %._crit_edge42.loopexit, label %.lr.ph18.us

.lr.ph29.us.new:                                  ; preds = %.lr.ph29.us.new.preheader, %.lr.ph29.us.new
  %indvars.iv31.us = phi i64 [ %indvars.iv.next32.us.3, %.lr.ph29.us.new ], [ %indvars.iv31.us.unr, %.lr.ph29.us.new.preheader ]
  %17 = getelementptr inbounds double, double* %5, i64 %indvars.iv31.us
  %18 = bitcast double* %17 to i64*
  %19 = load i64, i64* %18, align 8
  %20 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv66, i64 %indvars.iv31.us
  %21 = bitcast double* %20 to i64*
  store i64 %19, i64* %21, align 8
  %indvars.iv.next32.us = add nuw nsw i64 %indvars.iv31.us, 1
  %22 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next32.us
  %23 = bitcast double* %22 to i64*
  %24 = load i64, i64* %23, align 8
  %25 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv66, i64 %indvars.iv.next32.us
  %26 = bitcast double* %25 to i64*
  store i64 %24, i64* %26, align 8
  %indvars.iv.next32.us.1 = add nsw i64 %indvars.iv31.us, 2
  %27 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next32.us.1
  %28 = bitcast double* %27 to i64*
  %29 = load i64, i64* %28, align 8
  %30 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv66, i64 %indvars.iv.next32.us.1
  %31 = bitcast double* %30 to i64*
  store i64 %29, i64* %31, align 8
  %indvars.iv.next32.us.2 = add nsw i64 %indvars.iv31.us, 3
  %32 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next32.us.2
  %33 = bitcast double* %32 to i64*
  %34 = load i64, i64* %33, align 8
  %35 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv66, i64 %indvars.iv.next32.us.2
  %36 = bitcast double* %35 to i64*
  store i64 %34, i64* %36, align 8
  %indvars.iv.next32.us.3 = add nuw nsw i64 %indvars.iv31.us, 4
  %exitcond34.us.3 = icmp eq i64 %indvars.iv.next32.us.3, %wide.trip.count.us
  br i1 %exitcond34.us.3, label %._crit_edge30.us.loopexit, label %.lr.ph29.us.new

.lr.ph18.us:                                      ; preds = %.lr.ph18.us.preheader, %._crit_edge30.us
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %._crit_edge30.us ], [ 0, %.lr.ph18.us.preheader ]
  %37 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv66, i64 0
  br label %.lr.ph.us.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph18.us
  %indvars.iv35.us = phi i64 [ %indvars.iv.next36.us, %._crit_edge.us.us ], [ 0, %.lr.ph18.us ]
  %38 = getelementptr inbounds double, double* %5, i64 %indvars.iv35.us
  store double 0.000000e+00, double* %38, align 8
  br i1 %lcmp.mod92, label %.prol.loopexit90, label %.prol.preheader89

.prol.preheader89:                                ; preds = %.lr.ph.us.us
  %39 = load double, double* %37, align 8
  %40 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv35.us
  %41 = load double, double* %40, align 8
  %42 = fmul double %39, %41
  %43 = fadd double %42, 0.000000e+00
  %sunkaddr105 = shl i64 %indvars.iv35.us, 3
  %sunkaddr106 = add i64 %sunkaddr108, %sunkaddr105
  %sunkaddr107 = inttoptr i64 %sunkaddr106 to double*
  store double %43, double* %sunkaddr107, align 8
  br label %.prol.loopexit90

.prol.loopexit90:                                 ; preds = %.prol.preheader89, %.lr.ph.us.us
  %indvars.iv.us.us.unr.ph = phi i64 [ 1, %.prol.preheader89 ], [ 0, %.lr.ph.us.us ]
  %.unr.ph = phi double [ %43, %.prol.preheader89 ], [ 0.000000e+00, %.lr.ph.us.us ]
  br i1 %12, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit90
  %sunkaddr109 = shl i64 %indvars.iv35.us, 3
  %sunkaddr110 = add i64 %sunkaddr108, %sunkaddr109
  %sunkaddr111 = inttoptr i64 %sunkaddr110 to double*
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit90
  %indvars.iv.next36.us = add nuw nsw i64 %indvars.iv35.us, 1
  %exitcond38.us = icmp eq i64 %indvars.iv.next36.us, %wide.trip.count.us
  br i1 %exitcond38.us, label %.lr.ph29.us, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %indvars.iv.us.us = phi i64 [ %indvars.iv.next.us.us.1, %.lr.ph.us.us.new ], [ %indvars.iv.us.us.unr.ph, %.lr.ph.us.us.new.preheader ]
  %44 = phi double [ %56, %.lr.ph.us.us.new ], [ %.unr.ph, %.lr.ph.us.us.new.preheader ]
  %45 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv66, i64 %indvars.iv.us.us
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.us.us, i64 %indvars.iv35.us
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = fadd double %49, %44
  store double %50, double* %sunkaddr111, align 8
  %indvars.iv.next.us.us = add nuw nsw i64 %indvars.iv.us.us, 1
  %51 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv66, i64 %indvars.iv.next.us.us
  %52 = load double, double* %51, align 8
  %53 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next.us.us, i64 %indvars.iv35.us
  %54 = load double, double* %53, align 8
  %55 = fmul double %52, %54
  %56 = fadd double %55, %50
  store double %56, double* %sunkaddr111, align 8
  %indvars.iv.next.us.us.1 = add nuw nsw i64 %indvars.iv.us.us, 2
  %exitcond.us.us.1 = icmp eq i64 %indvars.iv.next.us.us.1, %wide.trip.count.us
  br i1 %exitcond.us.us.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph29.us:                                      ; preds = %._crit_edge.us.us
  br i1 %lcmp.mod98, label %.prol.loopexit96, label %.prol.preheader95.preheader

.prol.preheader95.preheader:                      ; preds = %.lr.ph29.us
  br label %.prol.preheader95

.prol.preheader95:                                ; preds = %.prol.preheader95.preheader, %.prol.preheader95
  %indvars.iv31.us.prol = phi i64 [ %indvars.iv.next32.us.prol, %.prol.preheader95 ], [ 0, %.prol.preheader95.preheader ]
  %prol.iter99 = phi i64 [ %prol.iter99.sub, %.prol.preheader95 ], [ %xtraiter97, %.prol.preheader95.preheader ]
  %57 = getelementptr inbounds double, double* %5, i64 %indvars.iv31.us.prol
  %58 = bitcast double* %57 to i64*
  %59 = load i64, i64* %58, align 8
  %60 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv66, i64 %indvars.iv31.us.prol
  %61 = bitcast double* %60 to i64*
  store i64 %59, i64* %61, align 8
  %indvars.iv.next32.us.prol = add nuw nsw i64 %indvars.iv31.us.prol, 1
  %prol.iter99.sub = add nsw i64 %prol.iter99, -1
  %prol.iter99.cmp = icmp eq i64 %prol.iter99.sub, 0
  br i1 %prol.iter99.cmp, label %.prol.loopexit96.loopexit, label %.prol.preheader95, !llvm.loop !3

.prol.loopexit96.loopexit:                        ; preds = %.prol.preheader95
  br label %.prol.loopexit96

.prol.loopexit96:                                 ; preds = %.prol.loopexit96.loopexit, %.lr.ph29.us
  %indvars.iv31.us.unr = phi i64 [ 0, %.lr.ph29.us ], [ %xtraiter97, %.prol.loopexit96.loopexit ]
  br i1 %13, label %._crit_edge30.us, label %.lr.ph29.us.new.preheader

.lr.ph29.us.new.preheader:                        ; preds = %.prol.loopexit96
  br label %.lr.ph29.us.new

.lr.ph41.split:                                   ; preds = %.lr.ph41.split, %.lr.ph41.split.preheader.new
  %indvars.iv61 = phi i64 [ %indvars.iv61.unr, %.lr.ph41.split.preheader.new ], [ %indvars.iv.next62.7, %.lr.ph41.split ]
  %indvars.iv.next62.7 = add nsw i64 %indvars.iv61, 8
  %exitcond86.7 = icmp eq i64 %indvars.iv.next62.7, %8
  br i1 %exitcond86.7, label %._crit_edge42.loopexit114.unr-lcssa, label %.lr.ph41.split

._crit_edge42.loopexit:                           ; preds = %._crit_edge30.us
  br label %._crit_edge42

._crit_edge42.loopexit114.unr-lcssa:              ; preds = %.lr.ph41.split
  br label %._crit_edge42.loopexit114

._crit_edge42.loopexit114:                        ; preds = %.lr.ph41.split.prol.loopexit, %._crit_edge42.loopexit114.unr-lcssa
  br label %._crit_edge42

._crit_edge42:                                    ; preds = %._crit_edge42.loopexit114, %._crit_edge42.loopexit, %16
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge73.loopexit, label %16

._crit_edge73.loopexit:                           ; preds = %._crit_edge42
  br label %._crit_edge73

._crit_edge73:                                    ; preds = %._crit_edge73.loopexit, %6
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
  br i1 %9, label %10, label %14

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %14

; <label>:13:                                     ; preds = %10
  tail call fastcc void @print_array([140 x [160 x double]]* %6)
  br label %14

; <label>:14:                                     ; preds = %10, %13, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([140 x [160 x double]]* nocapture, [160 x double]* nocapture) unnamed_addr #0 {
.lr.ph38.split.us:
  br label %.lr.ph15.us.us.preheader

.lr.ph15.us.us.preheader:                         ; preds = %.lr.ph38.split.us, %._crit_edge25.us
  %indvars.iv62 = phi i64 [ %indvars.iv.next63, %._crit_edge25.us ], [ 0, %.lr.ph38.split.us ]
  br label %.lr.ph15.us.us.new

._crit_edge25.us:                                 ; preds = %._crit_edge16.us.us
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %exitcond69 = icmp eq i64 %indvars.iv.next63, 150
  br i1 %exitcond69, label %.lr.ph.us.new.preheader, label %.lr.ph15.us.us.preheader

.lr.ph.us.new.preheader:                          ; preds = %._crit_edge25.us
  br label %.lr.ph.us.new

.lr.ph15.us.us.new:                               ; preds = %._crit_edge16.us.us, %.lr.ph15.us.us.preheader
  %indvars.iv32.us = phi i64 [ %indvars.iv.next33.us, %._crit_edge16.us.us ], [ 0, %.lr.ph15.us.us.preheader ]
  %2 = mul nuw nsw i64 %indvars.iv32.us, %indvars.iv62
  br label %3

._crit_edge16.us.us:                              ; preds = %3
  %indvars.iv.next33.us = add nuw nsw i64 %indvars.iv32.us, 1
  %exitcond35.us = icmp eq i64 %indvars.iv.next33.us, 140
  br i1 %exitcond35.us, label %._crit_edge25.us, label %.lr.ph15.us.us.new

; <label>:3:                                      ; preds = %3, %.lr.ph15.us.us.new
  %indvars.iv18.us.us = phi i64 [ 0, %.lr.ph15.us.us.new ], [ %indvars.iv.next19.us.us.1, %3 ]
  %4 = add nuw nsw i64 %2, %indvars.iv18.us.us
  %5 = trunc i64 %4 to i32
  %6 = srem i32 %5, 160
  %7 = sitofp i32 %6 to double
  %8 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %0, i64 %indvars.iv62, i64 %indvars.iv32.us, i64 %indvars.iv18.us.us
  %indvars.iv.next19.us.us = or i64 %indvars.iv18.us.us, 1
  %9 = add nuw nsw i64 %2, %indvars.iv.next19.us.us
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 160
  %12 = sitofp i32 %11 to double
  %13 = insertelement <2 x double> undef, double %7, i32 0
  %14 = insertelement <2 x double> %13, double %12, i32 1
  %15 = fdiv <2 x double> %14, <double 1.600000e+02, double 1.600000e+02>
  %16 = bitcast double* %8 to <2 x double>*
  store <2 x double> %15, <2 x double>* %16, align 8
  %indvars.iv.next19.us.us.1 = add nuw nsw i64 %indvars.iv18.us.us, 2
  %exitcond21.us.us.1 = icmp eq i64 %indvars.iv.next19.us.us.1, 160
  br i1 %exitcond21.us.us.1, label %._crit_edge16.us.us, label %3

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader, %._crit_edge.us
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %._crit_edge.us ], [ 0, %.lr.ph.us.new.preheader ]
  br label %17

; <label>:17:                                     ; preds = %17, %.lr.ph.us.new
  %indvars.iv.us = phi i64 [ 0, %.lr.ph.us.new ], [ %indvars.iv.next.us.1, %17 ]
  %18 = mul nuw nsw i64 %indvars.iv58, %indvars.iv.us
  %19 = trunc i64 %18 to i32
  %20 = srem i32 %19, 160
  %21 = sitofp i32 %20 to double
  %22 = getelementptr inbounds [160 x double], [160 x double]* %1, i64 %indvars.iv58, i64 %indvars.iv.us
  %indvars.iv.next.us = or i64 %indvars.iv.us, 1
  %23 = mul nuw nsw i64 %indvars.iv58, %indvars.iv.next.us
  %24 = trunc i64 %23 to i32
  %25 = srem i32 %24, 160
  %26 = sitofp i32 %25 to double
  %27 = insertelement <2 x double> undef, double %21, i32 0
  %28 = insertelement <2 x double> %27, double %26, i32 1
  %29 = fdiv <2 x double> %28, <double 1.600000e+02, double 1.600000e+02>
  %30 = bitcast double* %22 to <2 x double>*
  store <2 x double> %29, <2 x double>* %30, align 8
  %indvars.iv.next.us.1 = add nuw nsw i64 %indvars.iv.us, 2
  %exitcond.us.1 = icmp eq i64 %indvars.iv.next.us.1, 160
  br i1 %exitcond.us.1, label %._crit_edge.us, label %17

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond = icmp eq i64 %indvars.iv.next59, 160
  br i1 %exitcond, label %._crit_edge8, label %.lr.ph.us.new

._crit_edge8:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([140 x [160 x double]]* nocapture readonly) unnamed_addr #1 {
.lr.ph18.split.us:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph.us.us.preheader

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph18.split.us, %._crit_edge6.us
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %._crit_edge6.us ], [ 0, %.lr.ph18.split.us ]
  %5 = mul nuw nsw i64 %indvars.iv39, 140
  br label %.lr.ph.us.us

._crit_edge6.us:                                  ; preds = %._crit_edge.us.us
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond = icmp eq i64 %indvars.iv.next40, 150
  br i1 %exitcond, label %20, label %.lr.ph.us.us.preheader

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge.us.us
  %indvars.iv12.us = phi i64 [ %indvars.iv.next13.us, %._crit_edge.us.us ], [ 0, %.lr.ph.us.us.preheader ]
  %6 = add nuw nsw i64 %5, %indvars.iv12.us
  %7 = mul nuw nsw i64 %6, 160
  br label %8

._crit_edge.us.us:                                ; preds = %15
  %indvars.iv.next13.us = add nuw nsw i64 %indvars.iv12.us, 1
  %exitcond15.us = icmp eq i64 %indvars.iv.next13.us, 140
  br i1 %exitcond15.us, label %._crit_edge6.us, label %.lr.ph.us.us

; <label>:8:                                      ; preds = %15, %.lr.ph.us.us
  %indvars.iv.us.us = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.us.us, %15 ]
  %9 = add nuw nsw i64 %7, %indvars.iv.us.us
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %15

; <label>:15:                                     ; preds = %13, %8
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %0, i64 %indvars.iv39, i64 %indvars.iv12.us, i64 %indvars.iv.us.us
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next.us.us = add nuw nsw i64 %indvars.iv.us.us, 1
  %exitcond.us.us = icmp eq i64 %indvars.iv.next.us.us, 160
  br i1 %exitcond.us.us, label %._crit_edge.us.us, label %8

; <label>:20:                                     ; preds = %._crit_edge6.us
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
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
!3 = distinct !{!3, !2}
