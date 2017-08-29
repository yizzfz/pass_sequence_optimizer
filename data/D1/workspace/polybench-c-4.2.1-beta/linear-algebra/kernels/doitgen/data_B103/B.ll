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
define void @kernel_doitgen(i32, i32, i32, [140 x [160 x double]]*, [160 x double]*, double*) local_unnamed_addr #0 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph30, label %.._crit_edge31_crit_edge

.._crit_edge31_crit_edge:                         ; preds = %6
  br label %._crit_edge31

.lr.ph30:                                         ; preds = %6
  %8 = sext i32 %0 to i64
  %9 = zext i32 %2 to i64
  %10 = add nsw i64 %9, -1
  %11 = icmp sgt i32 %1, 0
  %12 = icmp sgt i32 %2, 0
  %xtraiter75 = and i64 %9, 1
  %lcmp.mod76 = icmp eq i64 %xtraiter75, 0
  %13 = icmp eq i64 %10, 0
  %sunkaddr = ptrtoint double* %5 to i64
  %xtraiter79 = and i64 %9, 3
  %lcmp.mod80 = icmp eq i64 %xtraiter79, 0
  %14 = icmp ult i64 %10, 3
  %wide.trip.count52 = zext i32 %1 to i64
  %15 = sext i32 %2 to i64
  %16 = sext i32 %1 to i64
  br label %17

; <label>:17:                                     ; preds = %._crit_edge14._crit_edge, %.lr.ph30
  %indvars.iv66 = phi i64 [ 0, %.lr.ph30 ], [ %indvars.iv.next67, %._crit_edge14._crit_edge ]
  br i1 %11, label %.lr.ph13, label %.._crit_edge14_crit_edge

.._crit_edge14_crit_edge:                         ; preds = %17
  br label %._crit_edge14

.lr.ph13:                                         ; preds = %17
  br i1 %12, label %.lr.ph13..lr.ph13.split.us_crit_edge, label %.lr.ph13..lr.ph13.split_crit_edge

.lr.ph13..lr.ph13.split_crit_edge:                ; preds = %.lr.ph13
  br label %.lr.ph13.split

.lr.ph13..lr.ph13.split.us_crit_edge:             ; preds = %.lr.ph13
  br label %.lr.ph13.split.us

.lr.ph13.split.us:                                ; preds = %._crit_edge10.us..lr.ph13.split.us_crit_edge, %.lr.ph13..lr.ph13.split.us_crit_edge
  %indvars.iv85 = phi i64 [ %indvars.iv.next86, %._crit_edge10.us..lr.ph13.split.us_crit_edge ], [ 0, %.lr.ph13..lr.ph13.split.us_crit_edge ]
  %18 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv66, i64 %indvars.iv85, i64 0
  br label %.lr.ph.us.us

._crit_edge10.us:                                 ; preds = %.prol.loopexit78.._crit_edge10.us_crit_edge, %.lr.ph9.us.new.._crit_edge10.us_crit_edge
  %indvars.iv.next86 = add nuw i64 %indvars.iv85, 1
  %19 = icmp slt i64 %indvars.iv.next86, %16
  br i1 %19, label %._crit_edge10.us..lr.ph13.split.us_crit_edge, label %._crit_edge10.us.._crit_edge14_crit_edge

._crit_edge10.us.._crit_edge14_crit_edge:         ; preds = %._crit_edge10.us
  br label %._crit_edge14

._crit_edge10.us..lr.ph13.split.us_crit_edge:     ; preds = %._crit_edge10.us
  br label %.lr.ph13.split.us

.lr.ph9.us.new:                                   ; preds = %.prol.loopexit78..lr.ph9.us.new_crit_edge, %.lr.ph9.us.new..lr.ph9.us.new_crit_edge
  %indvars.iv62 = phi i64 [ %indvars.iv.next63.3, %.lr.ph9.us.new..lr.ph9.us.new_crit_edge ], [ %indvars.iv62.unr, %.prol.loopexit78..lr.ph9.us.new_crit_edge ]
  %20 = getelementptr inbounds double, double* %5, i64 %indvars.iv62
  %21 = bitcast double* %20 to i64*
  %22 = load i64, i64* %21, align 8
  %23 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv66, i64 %indvars.iv85, i64 %indvars.iv62
  %24 = bitcast double* %23 to i64*
  store i64 %22, i64* %24, align 8
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %25 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next63
  %26 = bitcast double* %25 to i64*
  %27 = load i64, i64* %26, align 8
  %28 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv66, i64 %indvars.iv85, i64 %indvars.iv.next63
  %29 = bitcast double* %28 to i64*
  store i64 %27, i64* %29, align 8
  %indvars.iv.next63.1 = add nsw i64 %indvars.iv62, 2
  %30 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next63.1
  %31 = bitcast double* %30 to i64*
  %32 = load i64, i64* %31, align 8
  %33 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv66, i64 %indvars.iv85, i64 %indvars.iv.next63.1
  %34 = bitcast double* %33 to i64*
  store i64 %32, i64* %34, align 8
  %indvars.iv.next63.2 = add nsw i64 %indvars.iv62, 3
  %35 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next63.2
  %36 = bitcast double* %35 to i64*
  %37 = load i64, i64* %36, align 8
  %38 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv66, i64 %indvars.iv85, i64 %indvars.iv.next63.2
  %39 = bitcast double* %38 to i64*
  store i64 %37, i64* %39, align 8
  %indvars.iv.next63.3 = add nsw i64 %indvars.iv62, 4
  %exitcond65.3 = icmp eq i64 %indvars.iv.next63.3, %9
  br i1 %exitcond65.3, label %.lr.ph9.us.new.._crit_edge10.us_crit_edge, label %.lr.ph9.us.new..lr.ph9.us.new_crit_edge

.lr.ph9.us.new..lr.ph9.us.new_crit_edge:          ; preds = %.lr.ph9.us.new
  br label %.lr.ph9.us.new

.lr.ph9.us.new.._crit_edge10.us_crit_edge:        ; preds = %.lr.ph9.us.new
  br label %._crit_edge10.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us..lr.ph.us.us_crit_edge, %.lr.ph13.split.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge.us.us..lr.ph.us.us_crit_edge ], [ 0, %.lr.ph13.split.us ]
  %40 = getelementptr inbounds double, double* %5, i64 %indvars.iv
  store double 0.000000e+00, double* %40, align 8
  br i1 %lcmp.mod76, label %.lr.ph.us.us..prol.loopexit74_crit_edge, label %.prol.preheader73

.lr.ph.us.us..prol.loopexit74_crit_edge:          ; preds = %.lr.ph.us.us
  br label %.prol.loopexit74

.prol.preheader73:                                ; preds = %.lr.ph.us.us
  %41 = load double, double* %18, align 8
  %42 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv
  %43 = load double, double* %42, align 8
  %44 = fmul double %41, %43
  %sunkaddr42.prol = shl nsw i64 %indvars.iv, 3
  %sunkaddr43.prol = add i64 %sunkaddr, %sunkaddr42.prol
  %sunkaddr44.prol = inttoptr i64 %sunkaddr43.prol to double*
  %45 = load double, double* %sunkaddr44.prol, align 8
  %46 = fadd double %45, %44
  store double %46, double* %sunkaddr44.prol, align 8
  br label %.prol.loopexit74

.prol.loopexit74:                                 ; preds = %.lr.ph.us.us..prol.loopexit74_crit_edge, %.prol.preheader73
  %indvars.iv58.unr.ph = phi i64 [ 1, %.prol.preheader73 ], [ 0, %.lr.ph.us.us..prol.loopexit74_crit_edge ]
  br i1 %13, label %.prol.loopexit74.._crit_edge.us.us_crit_edge, label %.lr.ph.us.us.new.preheader

.prol.loopexit74.._crit_edge.us.us_crit_edge:     ; preds = %.prol.loopexit74
  br label %._crit_edge.us.us

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit74
  %sunkaddr42 = shl nsw i64 %indvars.iv, 3
  %sunkaddr43 = add i64 %sunkaddr, %sunkaddr42
  %sunkaddr44 = inttoptr i64 %sunkaddr43 to double*
  %.pre = load double, double* %sunkaddr44, align 8
  br label %.lr.ph.us.us.new

._crit_edge.us.us:                                ; preds = %.lr.ph.us.us.new.._crit_edge.us.us_crit_edge, %.prol.loopexit74.._crit_edge.us.us_crit_edge
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %47 = icmp slt i64 %indvars.iv.next, %15
  br i1 %47, label %._crit_edge.us.us..lr.ph.us.us_crit_edge, label %.lr.ph9.us

._crit_edge.us.us..lr.ph.us.us_crit_edge:         ; preds = %._crit_edge.us.us
  br label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge, %.lr.ph.us.us.new.preheader
  %48 = phi double [ %60, %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge ], [ %.pre, %.lr.ph.us.us.new.preheader ]
  %indvars.iv58 = phi i64 [ %indvars.iv.next59.1, %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge ], [ %indvars.iv58.unr.ph, %.lr.ph.us.us.new.preheader ]
  %49 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv66, i64 %indvars.iv85, i64 %indvars.iv58
  %50 = load double, double* %49, align 8
  %51 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv58, i64 %indvars.iv
  %52 = load double, double* %51, align 8
  %53 = fmul double %50, %52
  %54 = fadd double %48, %53
  store double %54, double* %sunkaddr44, align 8
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %55 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv66, i64 %indvars.iv85, i64 %indvars.iv.next59
  %56 = load double, double* %55, align 8
  %57 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next59, i64 %indvars.iv
  %58 = load double, double* %57, align 8
  %59 = fmul double %56, %58
  %60 = fadd double %54, %59
  store double %60, double* %sunkaddr44, align 8
  %indvars.iv.next59.1 = add nsw i64 %indvars.iv58, 2
  %exitcond61.1 = icmp eq i64 %indvars.iv.next59.1, %9
  br i1 %exitcond61.1, label %.lr.ph.us.us.new.._crit_edge.us.us_crit_edge, label %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge

.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge:      ; preds = %.lr.ph.us.us.new
  br label %.lr.ph.us.us.new

.lr.ph.us.us.new.._crit_edge.us.us_crit_edge:     ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

.lr.ph9.us:                                       ; preds = %._crit_edge.us.us
  br i1 %lcmp.mod80, label %.lr.ph9.us..prol.loopexit78_crit_edge, label %.lr.ph9.us..prol.preheader77_crit_edge

.lr.ph9.us..prol.preheader77_crit_edge:           ; preds = %.lr.ph9.us
  br label %.prol.preheader77

.lr.ph9.us..prol.loopexit78_crit_edge:            ; preds = %.lr.ph9.us
  br label %.prol.loopexit78

.prol.preheader77:                                ; preds = %.prol.preheader77..prol.preheader77_crit_edge, %.lr.ph9.us..prol.preheader77_crit_edge
  %indvars.iv62.prol = phi i64 [ %indvars.iv.next63.prol, %.prol.preheader77..prol.preheader77_crit_edge ], [ 0, %.lr.ph9.us..prol.preheader77_crit_edge ]
  %prol.iter81 = phi i64 [ %prol.iter81.sub, %.prol.preheader77..prol.preheader77_crit_edge ], [ %xtraiter79, %.lr.ph9.us..prol.preheader77_crit_edge ]
  %61 = getelementptr inbounds double, double* %5, i64 %indvars.iv62.prol
  %62 = bitcast double* %61 to i64*
  %63 = load i64, i64* %62, align 8
  %64 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv66, i64 %indvars.iv85, i64 %indvars.iv62.prol
  %65 = bitcast double* %64 to i64*
  store i64 %63, i64* %65, align 8
  %prol.iter81.sub = add nsw i64 %prol.iter81, -1
  %prol.iter81.cmp = icmp eq i64 %prol.iter81.sub, 0
  br i1 %prol.iter81.cmp, label %.prol.preheader77..prol.loopexit78_crit_edge, label %.prol.preheader77..prol.preheader77_crit_edge, !llvm.loop !1

.prol.preheader77..prol.preheader77_crit_edge:    ; preds = %.prol.preheader77
  %indvars.iv.next63.prol = add nuw nsw i64 %indvars.iv62.prol, 1
  br label %.prol.preheader77

.prol.preheader77..prol.loopexit78_crit_edge:     ; preds = %.prol.preheader77
  br label %.prol.loopexit78

.prol.loopexit78:                                 ; preds = %.prol.preheader77..prol.loopexit78_crit_edge, %.lr.ph9.us..prol.loopexit78_crit_edge
  %indvars.iv62.unr = phi i64 [ 0, %.lr.ph9.us..prol.loopexit78_crit_edge ], [ %xtraiter79, %.prol.preheader77..prol.loopexit78_crit_edge ]
  br i1 %14, label %.prol.loopexit78.._crit_edge10.us_crit_edge, label %.prol.loopexit78..lr.ph9.us.new_crit_edge

.prol.loopexit78..lr.ph9.us.new_crit_edge:        ; preds = %.prol.loopexit78
  br label %.lr.ph9.us.new

.prol.loopexit78.._crit_edge10.us_crit_edge:      ; preds = %.prol.loopexit78
  br label %._crit_edge10.us

.lr.ph13.split:                                   ; preds = %.lr.ph13.split..lr.ph13.split_crit_edge, %.lr.ph13..lr.ph13.split_crit_edge
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %.lr.ph13.split..lr.ph13.split_crit_edge ], [ 0, %.lr.ph13..lr.ph13.split_crit_edge ]
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next51, %wide.trip.count52
  br i1 %exitcond53, label %.lr.ph13.split.._crit_edge14_crit_edge, label %.lr.ph13.split..lr.ph13.split_crit_edge

.lr.ph13.split..lr.ph13.split_crit_edge:          ; preds = %.lr.ph13.split
  br label %.lr.ph13.split

.lr.ph13.split.._crit_edge14_crit_edge:           ; preds = %.lr.ph13.split
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %.lr.ph13.split.._crit_edge14_crit_edge, %._crit_edge10.us.._crit_edge14_crit_edge, %.._crit_edge14_crit_edge
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %66 = icmp slt i64 %indvars.iv.next67, %8
  br i1 %66, label %._crit_edge14._crit_edge, label %._crit_edge14.._crit_edge31_crit_edge

._crit_edge14.._crit_edge31_crit_edge:            ; preds = %._crit_edge14
  br label %._crit_edge31

._crit_edge14._crit_edge:                         ; preds = %._crit_edge14
  br label %17

._crit_edge31:                                    ; preds = %._crit_edge14.._crit_edge31_crit_edge, %.._crit_edge31_crit_edge
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #1 {
  %3 = call i8* @polybench_alloc_data(i64 3360000, i32 8) #4
  %4 = call i8* @polybench_alloc_data(i64 160, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 25600, i32 8) #4
  %6 = bitcast i8* %3 to [140 x [160 x double]]*
  %7 = bitcast i8* %5 to [160 x double]*
  call fastcc void @init_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %7)
  call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %5 to [160 x double]*
  %9 = bitcast i8* %4 to double*
  call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %8, double* %9)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %10 = icmp sgt i32 %0, 42
  br i1 %10, label %11, label %._crit_edge

._crit_edge:                                      ; preds = %2
  br label %15

; <label>:11:                                     ; preds = %2
  %12 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %12, align 1
  %13 = icmp eq i8 %strcmpload, 0
  br i1 %13, label %14, label %._crit_edge2

._crit_edge2:                                     ; preds = %11
  br label %15

; <label>:14:                                     ; preds = %11
  call fastcc void @print_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6)
  br label %15

; <label>:15:                                     ; preds = %._crit_edge2, %._crit_edge, %14
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, [140 x [160 x double]]*, [160 x double]*) unnamed_addr #0 {
.lr.ph20:
  br label %.lr.ph20.split.us

.lr.ph20.split.us:                                ; preds = %._crit_edge14.us..lr.ph20.split.us_crit_edge, %.lr.ph20
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %._crit_edge14.us..lr.ph20.split.us_crit_edge ], [ 0, %.lr.ph20 ]
  br label %.lr.ph9.us.us

._crit_edge14.us:                                 ; preds = %._crit_edge10.us.us
  %indvars.iv.next60 = add nuw i64 %indvars.iv59, 1
  %5 = icmp slt i64 %indvars.iv.next60, 150
  br i1 %5, label %._crit_edge14.us..lr.ph20.split.us_crit_edge, label %._crit_edge14.us..lr.ph2.split.us_crit_edge

._crit_edge14.us..lr.ph2.split.us_crit_edge:      ; preds = %._crit_edge14.us
  br label %.lr.ph2.split.us

._crit_edge14.us..lr.ph20.split.us_crit_edge:     ; preds = %._crit_edge14.us
  br label %.lr.ph20.split.us

.lr.ph9.us.us:                                    ; preds = %._crit_edge10.us.us..lr.ph9.us.us_crit_edge, %.lr.ph20.split.us
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %._crit_edge10.us.us..lr.ph9.us.us_crit_edge ], [ 0, %.lr.ph20.split.us ]
  %6 = mul nsw i64 %indvars.iv59, %indvars.iv57
  %7 = trunc i64 %6 to i32
  br label %9

._crit_edge10.us.us:                              ; preds = %9
  %indvars.iv.next58 = add nuw i64 %indvars.iv57, 1
  %8 = icmp slt i64 %indvars.iv.next58, 140
  br i1 %8, label %._crit_edge10.us.us..lr.ph9.us.us_crit_edge, label %._crit_edge14.us

._crit_edge10.us.us..lr.ph9.us.us_crit_edge:      ; preds = %._crit_edge10.us.us
  br label %.lr.ph9.us.us

; <label>:9:                                      ; preds = %._crit_edge, %.lr.ph9.us.us
  %indvars.iv44 = phi i64 [ %indvars.iv.next45, %._crit_edge ], [ 0, %.lr.ph9.us.us ]
  %10 = trunc i64 %indvars.iv44 to i32
  %11 = add nsw i32 %7, %10
  %12 = srem i32 %11, 160
  %13 = sitofp i32 %12 to double
  %14 = fdiv double %13, 1.600000e+02
  %15 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv59, i64 %indvars.iv57, i64 %indvars.iv44
  store double %14, double* %15, align 8
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next45, 160
  br i1 %exitcond47, label %._crit_edge10.us.us, label %._crit_edge

._crit_edge:                                      ; preds = %9
  br label %9

.lr.ph2.split.us:                                 ; preds = %._crit_edge.us..lr.ph2.split.us_crit_edge, %._crit_edge14.us..lr.ph2.split.us_crit_edge
  %indvars.iv55 = phi i64 [ %indvars.iv.next56, %._crit_edge.us..lr.ph2.split.us_crit_edge ], [ 0, %._crit_edge14.us..lr.ph2.split.us_crit_edge ]
  %16 = trunc i64 %indvars.iv55 to i32
  br label %17

; <label>:17:                                     ; preds = %._crit_edge54, %.lr.ph2.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph2.split.us ], [ %indvars.iv.next, %._crit_edge54 ]
  %18 = trunc i64 %indvars.iv to i32
  %19 = mul nsw i32 %16, %18
  %20 = srem i32 %19, 160
  %21 = sitofp i32 %20 to double
  %22 = fdiv double %21, 1.600000e+02
  %23 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv55, i64 %indvars.iv
  store double %22, double* %23, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge54

._crit_edge54:                                    ; preds = %17
  br label %17

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next56 = add nuw i64 %indvars.iv55, 1
  %24 = icmp slt i64 %indvars.iv.next56, 160
  br i1 %24, label %._crit_edge.us..lr.ph2.split.us_crit_edge, label %._crit_edge3

._crit_edge.us..lr.ph2.split.us_crit_edge:        ; preds = %._crit_edge.us
  br label %.lr.ph2.split.us

._crit_edge3:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, i32, [140 x [160 x double]]*) unnamed_addr #1 {
.lr.ph9:
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph9.split.us

.lr.ph9.split.us:                                 ; preds = %._crit_edge3.us..lr.ph9.split.us_crit_edge, %.lr.ph9
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %._crit_edge3.us..lr.ph9.split.us_crit_edge ], [ 0, %.lr.ph9 ]
  %8 = mul nsw i64 %indvars.iv34, 140
  br label %.lr.ph.us.us

._crit_edge3.us:                                  ; preds = %._crit_edge.us.us
  %indvars.iv.next35 = add nuw i64 %indvars.iv34, 1
  %9 = icmp slt i64 %indvars.iv.next35, 150
  br i1 %9, label %._crit_edge3.us..lr.ph9.split.us_crit_edge, label %._crit_edge10

._crit_edge3.us..lr.ph9.split.us_crit_edge:       ; preds = %._crit_edge3.us
  br label %.lr.ph9.split.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us..lr.ph.us.us_crit_edge, %.lr.ph9.split.us
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %._crit_edge.us.us..lr.ph.us.us_crit_edge ], [ 0, %.lr.ph9.split.us ]
  %10 = add i64 %8, %indvars.iv32
  %11 = mul i64 %10, 160
  br label %13

._crit_edge.us.us:                                ; preds = %20
  %indvars.iv.next33 = add nuw i64 %indvars.iv32, 1
  %12 = icmp slt i64 %indvars.iv.next33, 140
  br i1 %12, label %._crit_edge.us.us..lr.ph.us.us_crit_edge, label %._crit_edge3.us

._crit_edge.us.us..lr.ph.us.us_crit_edge:         ; preds = %._crit_edge.us.us
  br label %.lr.ph.us.us

; <label>:13:                                     ; preds = %._crit_edge31, %.lr.ph.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge31 ], [ 0, %.lr.ph.us.us ]
  %14 = add i64 %11, %indvars.iv
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, 20
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %._crit_edge

._crit_edge:                                      ; preds = %13
  br label %20

; <label>:18:                                     ; preds = %13
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %19) #5
  br label %20

; <label>:20:                                     ; preds = %._crit_edge, %18
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv34, i64 %indvars.iv32, i64 %indvars.iv
  %23 = load double, double* %22, align 8
  %24 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %23) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond29, label %._crit_edge.us.us, label %._crit_edge31

._crit_edge31:                                    ; preds = %20
  br label %13

._crit_edge10:                                    ; preds = %._crit_edge3.us
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %27) #5
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
