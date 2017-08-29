; ModuleID = 'A.ll'
source_filename = "gramschmidt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"R\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"Q\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = bitcast i8* %3 to [1200 x double]*
  %7 = bitcast i8* %4 to [1200 x double]*
  %8 = bitcast i8* %5 to [1200 x double]*
  tail call fastcc void @init_array(i32 1000, i32 1200, [1200 x double]* %6, [1200 x double]* %7, [1200 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_gramschmidt(i32 1000, i32 1200, [1200 x double]* %6, [1200 x double]* %7, [1200 x double]* %8)
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
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8)
  br label %14

; <label>:14:                                     ; preds = %10, %13, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader27.lr.ph, label %.preheader26

.preheader27.lr.ph:                               ; preds = %5
  %7 = icmp sgt i32 %1, 0
  %8 = sitofp i32 %0 to double
  br i1 %7, label %.preheader27.us.preheader, label %._crit_edge30

.preheader27.us.preheader:                        ; preds = %.preheader27.lr.ph
  %9 = zext i32 %1 to i64
  %10 = zext i32 %0 to i64
  br label %.preheader27.us

.preheader27.us:                                  ; preds = %._crit_edge33.us, %.preheader27.us.preheader
  %indvars.iv45 = phi i64 [ 0, %.preheader27.us.preheader ], [ %indvars.iv.next46, %._crit_edge33.us ]
  br label %11

; <label>:11:                                     ; preds = %11, %.preheader27.us
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %11 ], [ 0, %.preheader27.us ]
  %12 = mul nuw nsw i64 %indvars.iv41, %indvars.iv45
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, %0
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, %8
  %17 = fmul double %16, 1.000000e+02
  %18 = fadd double %17, 1.000000e+01
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv45, i64 %indvars.iv41
  store double %18, double* %19, align 8
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv45, i64 %indvars.iv41
  store double 0.000000e+00, double* %20, align 8
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond51 = icmp eq i64 %indvars.iv.next42, %9
  br i1 %exitcond51, label %._crit_edge33.us, label %11

._crit_edge33.us:                                 ; preds = %11
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next46, %10
  br i1 %exitcond52, label %.preheader26.loopexit, label %.preheader27.us

.preheader26.loopexit:                            ; preds = %._crit_edge33.us
  br label %.preheader26

.preheader26:                                     ; preds = %.preheader26.loopexit, %5
  %21 = icmp sgt i32 %1, 0
  br i1 %21, label %.preheader.us.preheader, label %._crit_edge30

.preheader.us.preheader:                          ; preds = %.preheader26
  %22 = zext i32 %1 to i64
  %23 = shl nuw nsw i64 %22, 3
  %24 = add nsw i64 %22, -1
  %xtraiter = and i64 %22, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.preheader.us.prol.loopexit, label %.preheader.us.prol.preheader

.preheader.us.prol.preheader:                     ; preds = %.preheader.us.preheader
  br label %.preheader.us.prol

.preheader.us.prol:                               ; preds = %.preheader.us.prol.preheader, %.preheader.us.prol
  %indvars.iv37.prol = phi i64 [ %indvars.iv.next38.prol, %.preheader.us.prol ], [ 0, %.preheader.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.preheader.us.prol ], [ %xtraiter, %.preheader.us.prol.preheader ]
  %scevgep.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv37.prol, i64 0
  %scevgep53.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep53.prol, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next38.prol = add nuw nsw i64 %indvars.iv37.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader.us.prol.loopexit.loopexit, label %.preheader.us.prol, !llvm.loop !1

.preheader.us.prol.loopexit.loopexit:             ; preds = %.preheader.us.prol
  br label %.preheader.us.prol.loopexit

.preheader.us.prol.loopexit:                      ; preds = %.preheader.us.prol.loopexit.loopexit, %.preheader.us.preheader
  %indvars.iv37.unr = phi i64 [ 0, %.preheader.us.preheader ], [ %xtraiter, %.preheader.us.prol.loopexit.loopexit ]
  %25 = icmp ult i64 %24, 3
  br i1 %25, label %._crit_edge30, label %.preheader.us.preheader58

.preheader.us.preheader58:                        ; preds = %.preheader.us.prol.loopexit
  %26 = add nsw i64 %22, -4
  %27 = sub nsw i64 %26, %indvars.iv37.unr
  %28 = lshr i64 %27, 2
  %29 = and i64 %28, 1
  %lcmp.mod62 = icmp eq i64 %29, 0
  br i1 %lcmp.mod62, label %.preheader.us.prol.preheader59, label %.preheader.us.prol.loopexit60

.preheader.us.prol.preheader59:                   ; preds = %.preheader.us.preheader58
  br label %.preheader.us.prol63

.preheader.us.prol63:                             ; preds = %.preheader.us.prol.preheader59
  %scevgep.prol65 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv37.unr, i64 0
  %scevgep53.prol66 = bitcast double* %scevgep.prol65 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep53.prol66, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next38.prol67 = add nuw nsw i64 %indvars.iv37.unr, 1
  %scevgep.1.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38.prol67, i64 0
  %scevgep53.1.prol = bitcast double* %scevgep.1.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep53.1.prol, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next38.1.prol = add nuw nsw i64 %indvars.iv37.unr, 2
  %scevgep.2.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38.1.prol, i64 0
  %scevgep53.2.prol = bitcast double* %scevgep.2.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep53.2.prol, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next38.2.prol = add nuw nsw i64 %indvars.iv37.unr, 3
  %scevgep.3.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38.2.prol, i64 0
  %scevgep53.3.prol = bitcast double* %scevgep.3.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep53.3.prol, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next38.3.prol = or i64 %indvars.iv37.unr, 4
  br label %.preheader.us.prol.loopexit60

.preheader.us.prol.loopexit60:                    ; preds = %.preheader.us.prol63, %.preheader.us.preheader58
  %indvars.iv37.unr68 = phi i64 [ %indvars.iv37.unr, %.preheader.us.preheader58 ], [ %indvars.iv.next38.3.prol, %.preheader.us.prol63 ]
  %30 = icmp eq i64 %28, 0
  br i1 %30, label %._crit_edge30.loopexit, label %.preheader.us.preheader58.new

.preheader.us.preheader58.new:                    ; preds = %.preheader.us.prol.loopexit60
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us, %.preheader.us.preheader58.new
  %indvars.iv37 = phi i64 [ %indvars.iv37.unr68, %.preheader.us.preheader58.new ], [ %indvars.iv.next38.3.1, %.preheader.us ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv37, i64 0
  %scevgep53 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep53, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38, i64 0
  %scevgep53.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep53.1, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next38.1 = add nsw i64 %indvars.iv37, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38.1, i64 0
  %scevgep53.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep53.2, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next38.2 = add nsw i64 %indvars.iv37, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38.2, i64 0
  %scevgep53.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep53.3, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next38.3 = add nuw nsw i64 %indvars.iv37, 4
  %scevgep.169 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38.3, i64 0
  %scevgep53.170 = bitcast double* %scevgep.169 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep53.170, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next38.171 = add nsw i64 %indvars.iv37, 5
  %scevgep.1.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38.171, i64 0
  %scevgep53.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep53.1.1, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next38.1.1 = add nsw i64 %indvars.iv37, 6
  %scevgep.2.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38.1.1, i64 0
  %scevgep53.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep53.2.1, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next38.2.1 = add nsw i64 %indvars.iv37, 7
  %scevgep.3.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38.2.1, i64 0
  %scevgep53.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep53.3.1, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next38.3.1 = add nsw i64 %indvars.iv37, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next38.3.1, %22
  br i1 %exitcond.3.1, label %._crit_edge30.loopexit.unr-lcssa, label %.preheader.us

._crit_edge30.loopexit.unr-lcssa:                 ; preds = %.preheader.us
  br label %._crit_edge30.loopexit

._crit_edge30.loopexit:                           ; preds = %.preheader.us.prol.loopexit60, %._crit_edge30.loopexit.unr-lcssa
  br label %._crit_edge30

._crit_edge30:                                    ; preds = %._crit_edge30.loopexit, %.preheader27.lr.ph, %.preheader.us.prol.loopexit, %.preheader26
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt(i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #0 {
  %6 = icmp sgt i32 %1, 0
  br i1 %6, label %.preheader66.lr.ph, label %._crit_edge80

.preheader66.lr.ph:                               ; preds = %5
  %7 = icmp sgt i32 %0, 0
  %8 = sext i32 %1 to i64
  %9 = zext i32 %0 to i64
  %10 = zext i32 %1 to i64
  %11 = add nsw i64 %9, -1
  %12 = shl nuw nsw i64 %10, 3
  %13 = add nsw i64 %12, -8
  %xtraiter = and i64 %9, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %14 = icmp ult i64 %11, 3
  %xtraiter126 = and i64 %9, 1
  %lcmp.mod127 = icmp eq i64 %xtraiter126, 0
  %15 = icmp eq i64 %11, 0
  %xtraiter131 = and i64 %9, 1
  %lcmp.mod132 = icmp ne i64 %xtraiter131, 0
  %16 = icmp eq i64 %11, 0
  br label %.preheader66

.preheader66:                                     ; preds = %._crit_edge78, %.preheader66.lr.ph
  %indvars.iv114 = phi i64 [ 0, %.preheader66.lr.ph ], [ %indvars.iv.next115, %._crit_edge78 ]
  %indvars.iv108 = phi i64 [ 1, %.preheader66.lr.ph ], [ %indvars.iv.next109, %._crit_edge78 ]
  %17 = mul i64 %indvars.iv114, 1201
  %18 = add i64 %17, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 0, i64 %18
  %scevgep128 = bitcast double* %scevgep to i8*
  %19 = mul i64 %indvars.iv114, -8
  %20 = add i64 %13, %19
  br i1 %7, label %.lr.ph, label %._crit_edge.thread

._crit_edge.thread:                               ; preds = %.preheader66
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv114, i64 %indvars.iv114
  store double 0.000000e+00, double* %21, align 8
  br label %.preheader65

.lr.ph:                                           ; preds = %.preheader66
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %.068.prol = phi double [ %25, %.prol.preheader ], [ 0.000000e+00, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.prol, i64 %indvars.iv114
  %23 = load double, double* %22, align 8
  %24 = fmul double %23, %23
  %25 = fadd double %.068.prol, %24
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %25, %.prol.loopexit.loopexit ]
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %xtraiter, %.prol.loopexit.loopexit ]
  %.068.unr = phi double [ 0.000000e+00, %.lr.ph ], [ %25, %.prol.loopexit.loopexit ]
  br i1 %14, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ %indvars.iv.unr, %.lr.ph.new.preheader ]
  %.068 = phi double [ %41, %.lr.ph.new ], [ %.068.unr, %.lr.ph.new.preheader ]
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv, i64 %indvars.iv114
  %27 = load double, double* %26, align 8
  %28 = fmul double %27, %27
  %29 = fadd double %.068, %28
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next, i64 %indvars.iv114
  %31 = load double, double* %30, align 8
  %32 = fmul double %31, %31
  %33 = fadd double %29, %32
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.1, i64 %indvars.iv114
  %35 = load double, double* %34, align 8
  %36 = fmul double %35, %35
  %37 = fadd double %33, %36
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.2, i64 %indvars.iv114
  %39 = load double, double* %38, align 8
  %40 = fmul double %39, %39
  %41 = fadd double %37, %40
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond118.3 = icmp eq i64 %indvars.iv.next.3, %9
  br i1 %exitcond118.3, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit
  %.0.lcssa = phi double [ %.lcssa.unr, %.prol.loopexit ], [ %41, %._crit_edge.loopexit ]
  %42 = tail call double @sqrt(double %.0.lcssa) #4
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv114, i64 %indvars.iv114
  store double %42, double* %43, align 8
  br i1 %7, label %.lr.ph71, label %.preheader65

.lr.ph71:                                         ; preds = %._crit_edge
  br i1 %lcmp.mod127, label %.prol.loopexit125.unr-lcssa, label %.prol.preheader124

.prol.preheader124:                               ; preds = %.lr.ph71
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv114
  %45 = load double, double* %44, align 8
  %46 = fdiv double %45, %42
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv114
  store double %46, double* %47, align 8
  br label %.prol.loopexit125.unr-lcssa

.prol.loopexit125.unr-lcssa:                      ; preds = %.lr.ph71, %.prol.preheader124
  %indvars.iv90.unr.ph = phi i64 [ 1, %.prol.preheader124 ], [ 0, %.lr.ph71 ]
  br i1 %15, label %.preheader65, label %.lr.ph71.new.preheader

.lr.ph71.new.preheader:                           ; preds = %.prol.loopexit125.unr-lcssa
  br label %.lr.ph71.new

.preheader65.loopexit:                            ; preds = %.lr.ph71.new
  br label %.preheader65

.preheader65:                                     ; preds = %.preheader65.loopexit, %.prol.loopexit125.unr-lcssa, %._crit_edge.thread, %._crit_edge
  %indvars.iv.next115 = add nuw nsw i64 %indvars.iv114, 1
  %48 = icmp slt i64 %indvars.iv.next115, %8
  br i1 %48, label %.lr.ph77, label %._crit_edge78

.lr.ph77:                                         ; preds = %.preheader65
  br i1 %7, label %.lr.ph77.split.us.preheader, label %.lr.ph77.split.split.preheader

.lr.ph77.split.us.preheader:                      ; preds = %.lr.ph77
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv114
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv114
  br label %.lr.ph77.split.us

.lr.ph77.split.split.preheader:                   ; preds = %.lr.ph77
  call void @llvm.memset.p0i8.i64(i8* %scevgep128, i8 0, i64 %20, i32 8, i1 false)
  br label %._crit_edge78

.lr.ph77.split.us:                                ; preds = %.lr.ph77.split.us.preheader, %.loopexit.us
  %indvars.iv110 = phi i64 [ %indvars.iv.next111, %.loopexit.us ], [ %indvars.iv108, %.lr.ph77.split.us.preheader ]
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv114, i64 %indvars.iv110
  store double 0.000000e+00, double* %51, align 8
  br i1 %lcmp.mod132, label %.prol.preheader129, label %.prol.loopexit130.unr-lcssa

.prol.preheader129:                               ; preds = %.lr.ph77.split.us
  %52 = load double, double* %49, align 8
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv110
  %54 = load double, double* %53, align 8
  %55 = fmul double %52, %54
  %56 = fadd double %55, 0.000000e+00
  store double %56, double* %51, align 8
  br label %.prol.loopexit130.unr-lcssa

.prol.loopexit130.unr-lcssa:                      ; preds = %.lr.ph77.split.us, %.prol.preheader129
  %57 = phi double [ %56, %.prol.preheader129 ], [ 0.000000e+00, %.lr.ph77.split.us ]
  %indvars.iv100.unr.ph = phi i64 [ 1, %.prol.preheader129 ], [ 0, %.lr.ph77.split.us ]
  br i1 %16, label %.lr.ph76.us, label %.lr.ph77.split.us.new.preheader

.lr.ph77.split.us.new.preheader:                  ; preds = %.prol.loopexit130.unr-lcssa
  br label %.lr.ph77.split.us.new

.lr.ph77.split.us.new:                            ; preds = %.lr.ph77.split.us.new.preheader, %.lr.ph77.split.us.new
  %58 = phi double [ %70, %.lr.ph77.split.us.new ], [ %57, %.lr.ph77.split.us.new.preheader ]
  %indvars.iv100 = phi i64 [ %indvars.iv.next101.1, %.lr.ph77.split.us.new ], [ %indvars.iv100.unr.ph, %.lr.ph77.split.us.new.preheader ]
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv100, i64 %indvars.iv114
  %60 = load double, double* %59, align 8
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv100, i64 %indvars.iv110
  %62 = load double, double* %61, align 8
  %63 = fmul double %60, %62
  %64 = fadd double %58, %63
  store double %64, double* %51, align 8
  %indvars.iv.next101 = add nuw nsw i64 %indvars.iv100, 1
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next101, i64 %indvars.iv114
  %66 = load double, double* %65, align 8
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next101, i64 %indvars.iv110
  %68 = load double, double* %67, align 8
  %69 = fmul double %66, %68
  %70 = fadd double %64, %69
  store double %70, double* %51, align 8
  %indvars.iv.next101.1 = add nuw nsw i64 %indvars.iv100, 2
  %exitcond120.1 = icmp eq i64 %indvars.iv.next101.1, %9
  br i1 %exitcond120.1, label %.lr.ph76.us.loopexit, label %.lr.ph77.split.us.new

.lr.ph76.us.loopexit:                             ; preds = %.lr.ph77.split.us.new
  br label %.lr.ph76.us

.lr.ph76.us:                                      ; preds = %.lr.ph76.us.loopexit, %.prol.loopexit130.unr-lcssa
  %71 = phi double [ %57, %.prol.loopexit130.unr-lcssa ], [ %70, %.lr.ph76.us.loopexit ]
  br i1 %lcmp.mod132, label %.prol.preheader133, label %.prol.loopexit134.unr-lcssa

.prol.preheader133:                               ; preds = %.lr.ph76.us
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv110
  %73 = load double, double* %72, align 8
  %74 = load double, double* %50, align 8
  %75 = fmul double %74, %71
  %76 = fsub double %73, %75
  store double %76, double* %72, align 8
  br label %.prol.loopexit134.unr-lcssa

.prol.loopexit134.unr-lcssa:                      ; preds = %.lr.ph76.us, %.prol.preheader133
  %indvars.iv104.unr.ph = phi i64 [ 1, %.prol.preheader133 ], [ 0, %.lr.ph76.us ]
  br i1 %16, label %.loopexit.us, label %.lr.ph76.us.new.preheader

.lr.ph76.us.new.preheader:                        ; preds = %.prol.loopexit134.unr-lcssa
  br label %.lr.ph76.us.new

.lr.ph76.us.new:                                  ; preds = %.lr.ph76.us.new.preheader, %.lr.ph76.us.new
  %indvars.iv104 = phi i64 [ %indvars.iv.next105.1, %.lr.ph76.us.new ], [ %indvars.iv104.unr.ph, %.lr.ph76.us.new.preheader ]
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv104, i64 %indvars.iv110
  %78 = load double, double* %77, align 8
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv104, i64 %indvars.iv114
  %80 = load double, double* %79, align 8
  %81 = load double, double* %51, align 8
  %82 = fmul double %80, %81
  %83 = fsub double %78, %82
  store double %83, double* %77, align 8
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1
  %84 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next105, i64 %indvars.iv110
  %85 = load double, double* %84, align 8
  %86 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next105, i64 %indvars.iv114
  %87 = load double, double* %86, align 8
  %88 = load double, double* %51, align 8
  %89 = fmul double %87, %88
  %90 = fsub double %85, %89
  store double %90, double* %84, align 8
  %indvars.iv.next105.1 = add nuw nsw i64 %indvars.iv104, 2
  %exitcond121.1 = icmp eq i64 %indvars.iv.next105.1, %9
  br i1 %exitcond121.1, label %.loopexit.us.loopexit, label %.lr.ph76.us.new

.loopexit.us.loopexit:                            ; preds = %.lr.ph76.us.new
  br label %.loopexit.us

.loopexit.us:                                     ; preds = %.loopexit.us.loopexit, %.prol.loopexit134.unr-lcssa
  %indvars.iv.next111 = add nuw nsw i64 %indvars.iv110, 1
  %exitcond122 = icmp eq i64 %indvars.iv.next111, %10
  br i1 %exitcond122, label %._crit_edge78.loopexit, label %.lr.ph77.split.us

.lr.ph71.new:                                     ; preds = %.lr.ph71.new.preheader, %.lr.ph71.new
  %indvars.iv90 = phi i64 [ %indvars.iv.next91.1, %.lr.ph71.new ], [ %indvars.iv90.unr.ph, %.lr.ph71.new.preheader ]
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv90, i64 %indvars.iv114
  %92 = load double, double* %91, align 8
  %93 = load double, double* %43, align 8
  %94 = fdiv double %92, %93
  %95 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv90, i64 %indvars.iv114
  store double %94, double* %95, align 8
  %indvars.iv.next91 = add nuw nsw i64 %indvars.iv90, 1
  %96 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next91, i64 %indvars.iv114
  %97 = load double, double* %96, align 8
  %98 = load double, double* %43, align 8
  %99 = fdiv double %97, %98
  %100 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next91, i64 %indvars.iv114
  store double %99, double* %100, align 8
  %indvars.iv.next91.1 = add nuw nsw i64 %indvars.iv90, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next91.1, %9
  br i1 %exitcond.1, label %.preheader65.loopexit, label %.lr.ph71.new

._crit_edge78.loopexit:                           ; preds = %.loopexit.us
  br label %._crit_edge78

._crit_edge78:                                    ; preds = %._crit_edge78.loopexit, %.lr.ph77.split.split.preheader, %.preheader65
  %indvars.iv.next109 = add nuw nsw i64 %indvars.iv108, 1
  %exitcond123 = icmp eq i64 %indvars.iv.next115, %10
  br i1 %exitcond123, label %._crit_edge80.loopexit, label %.preheader66

._crit_edge80.loopexit:                           ; preds = %._crit_edge78
  br label %._crit_edge80

._crit_edge80:                                    ; preds = %._crit_edge80.loopexit, %5
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %5) #6
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.preheader4.us.preheader, label %._crit_edge14

.preheader4.us.preheader:                         ; preds = %4
  %10 = sext i32 %1 to i64
  %11 = zext i32 %1 to i64
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %._crit_edge11.us, %.preheader4.us.preheader
  %indvars.iv25 = phi i64 [ 0, %.preheader4.us.preheader ], [ %indvars.iv.next26, %._crit_edge11.us ]
  %12 = mul nsw i64 %indvars.iv25, %10
  br label %13

; <label>:13:                                     ; preds = %20, %.preheader4.us
  %indvars.iv21 = phi i64 [ %indvars.iv.next22, %20 ], [ 0, %.preheader4.us ]
  %14 = add nsw i64 %indvars.iv21, %12
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, 20
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %20

; <label>:18:                                     ; preds = %13
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %19) #6
  br label %20

; <label>:20:                                     ; preds = %18, %13
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv25, i64 %indvars.iv21
  %23 = load double, double* %22, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %23) #7
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next22, %11
  br i1 %exitcond30, label %._crit_edge11.us, label %13

._crit_edge11.us:                                 ; preds = %20
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next26, %11
  br i1 %exitcond31, label %._crit_edge14.loopexit, label %.preheader4.us

._crit_edge14.loopexit:                           ; preds = %._crit_edge11.us
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %4
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %.not = icmp slt i32 %0, 1
  %.not32 = xor i1 %9, true
  %brmerge = or i1 %.not, %.not32
  br i1 %brmerge, label %._crit_edge8, label %.preheader.us.preheader

.preheader.us.preheader:                          ; preds = %._crit_edge14
  %29 = sext i32 %1 to i64
  %30 = zext i32 %1 to i64
  %31 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv16 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next17, %._crit_edge.us ]
  %32 = mul nsw i64 %indvars.iv16, %29
  br label %33

; <label>:33:                                     ; preds = %40, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %40 ], [ 0, %.preheader.us ]
  %34 = add nsw i64 %indvars.iv, %32
  %35 = trunc i64 %34 to i32
  %36 = srem i32 %35, 20
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %38, label %40

; <label>:38:                                     ; preds = %33
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %39) #6
  br label %40

; <label>:40:                                     ; preds = %38, %33
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv16, i64 %indvars.iv
  %43 = load double, double* %42, align 8
  %44 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %41, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %43) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next, %30
  br i1 %exitcond29, label %._crit_edge.us, label %33

._crit_edge.us:                                   ; preds = %40
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond = icmp eq i64 %indvars.iv.next17, %31
  br i1 %exitcond, label %._crit_edge8.loopexit, label %.preheader.us

._crit_edge8.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %._crit_edge14
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %46 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %45, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %47 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %48 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %47) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
