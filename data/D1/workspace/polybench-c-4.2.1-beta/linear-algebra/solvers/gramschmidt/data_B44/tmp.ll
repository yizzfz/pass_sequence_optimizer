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
  %9 = bitcast i8* %3 to [1200 x double]*
  %10 = bitcast i8* %4 to [1200 x double]*
  %11 = bitcast i8* %5 to [1200 x double]*
  tail call fastcc void @kernel_gramschmidt(i32 1000, i32 1200, [1200 x double]* %9, [1200 x double]* %10, [1200 x double]* %11)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %12 = icmp sgt i32 %0, 42
  br i1 %12, label %13, label %19

; <label>:13:                                     ; preds = %2
  %14 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %14, align 1
  %15 = icmp eq i8 %strcmpload, 0
  br i1 %15, label %16, label %19

; <label>:16:                                     ; preds = %13
  %17 = bitcast i8* %4 to [1200 x double]*
  %18 = bitcast i8* %5 to [1200 x double]*
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %17, [1200 x double]* %18)
  br label %19

; <label>:19:                                     ; preds = %13, %16, %2
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
  %23 = zext i32 %1 to i64
  %24 = shl nuw nsw i64 %22, 3
  %25 = add nsw i64 %22, -1
  %xtraiter = and i64 %22, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.preheader.us.prol.loopexit, label %._crit_edge.us.prol.preheader

._crit_edge.us.prol.preheader:                    ; preds = %.preheader.us.preheader
  br label %._crit_edge.us.prol

._crit_edge.us.prol:                              ; preds = %._crit_edge.us.prol.preheader, %._crit_edge.us.prol
  %indvars.iv37.prol = phi i64 [ %indvars.iv.next38.prol, %._crit_edge.us.prol ], [ 0, %._crit_edge.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %._crit_edge.us.prol ], [ %xtraiter, %._crit_edge.us.prol.preheader ]
  %scevgep.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv37.prol, i64 0
  %scevgep53.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep53.prol, i8 0, i64 %24, i32 8, i1 false)
  %indvars.iv.next38.prol = add nuw nsw i64 %indvars.iv37.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader.us.prol.loopexit.loopexit, label %._crit_edge.us.prol, !llvm.loop !1

.preheader.us.prol.loopexit.loopexit:             ; preds = %._crit_edge.us.prol
  br label %.preheader.us.prol.loopexit

.preheader.us.prol.loopexit:                      ; preds = %.preheader.us.prol.loopexit.loopexit, %.preheader.us.preheader
  %indvars.iv37.unr = phi i64 [ 0, %.preheader.us.preheader ], [ %xtraiter, %.preheader.us.prol.loopexit.loopexit ]
  %26 = icmp ult i64 %25, 3
  br i1 %26, label %._crit_edge30, label %._crit_edge.us.3.preheader

._crit_edge.us.3.preheader:                       ; preds = %.preheader.us.prol.loopexit
  %27 = add nsw i64 %22, -4
  %28 = sub nsw i64 %27, %indvars.iv37.unr
  %29 = lshr i64 %28, 2
  %30 = and i64 %29, 1
  %lcmp.mod57 = icmp eq i64 %30, 0
  br i1 %lcmp.mod57, label %._crit_edge.us.3.prol.preheader, label %._crit_edge.us.3.prol.loopexit

._crit_edge.us.3.prol.preheader:                  ; preds = %._crit_edge.us.3.preheader
  br label %._crit_edge.us.3.prol

._crit_edge.us.3.prol:                            ; preds = %._crit_edge.us.3.prol.preheader
  %scevgep.prol59 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv37.unr, i64 0
  %scevgep53.prol60 = bitcast double* %scevgep.prol59 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep53.prol60, i8 0, i64 %24, i32 8, i1 false)
  %indvars.iv.next38.prol61 = add nuw nsw i64 %indvars.iv37.unr, 1
  %scevgep.1.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38.prol61, i64 0
  %scevgep53.1.prol = bitcast double* %scevgep.1.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep53.1.prol, i8 0, i64 %24, i32 8, i1 false)
  %indvars.iv.next38.1.prol = add nuw nsw i64 %indvars.iv37.unr, 2
  %scevgep.2.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38.1.prol, i64 0
  %scevgep53.2.prol = bitcast double* %scevgep.2.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep53.2.prol, i8 0, i64 %24, i32 8, i1 false)
  %indvars.iv.next38.2.prol = add nuw nsw i64 %indvars.iv37.unr, 3
  %scevgep.3.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38.2.prol, i64 0
  %scevgep53.3.prol = bitcast double* %scevgep.3.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep53.3.prol, i8 0, i64 %24, i32 8, i1 false)
  %indvars.iv.next38.3.prol = or i64 %indvars.iv37.unr, 4
  br label %._crit_edge.us.3.prol.loopexit

._crit_edge.us.3.prol.loopexit:                   ; preds = %._crit_edge.us.3.prol, %._crit_edge.us.3.preheader
  %indvars.iv37.unr62 = phi i64 [ %indvars.iv37.unr, %._crit_edge.us.3.preheader ], [ %indvars.iv.next38.3.prol, %._crit_edge.us.3.prol ]
  %31 = icmp eq i64 %29, 0
  br i1 %31, label %._crit_edge30.loopexit, label %._crit_edge.us.3.preheader.new

._crit_edge.us.3.preheader.new:                   ; preds = %._crit_edge.us.3.prol.loopexit
  br label %._crit_edge.us.3

._crit_edge30.loopexit.unr-lcssa:                 ; preds = %._crit_edge.us.3
  br label %._crit_edge30.loopexit

._crit_edge30.loopexit:                           ; preds = %._crit_edge.us.3.prol.loopexit, %._crit_edge30.loopexit.unr-lcssa
  br label %._crit_edge30

._crit_edge30:                                    ; preds = %._crit_edge30.loopexit, %.preheader27.lr.ph, %.preheader.us.prol.loopexit, %.preheader26
  ret void

._crit_edge.us.3:                                 ; preds = %._crit_edge.us.3, %._crit_edge.us.3.preheader.new
  %indvars.iv37 = phi i64 [ %indvars.iv37.unr62, %._crit_edge.us.3.preheader.new ], [ %indvars.iv.next38.3.1, %._crit_edge.us.3 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv37, i64 0
  %scevgep53 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep53, i8 0, i64 %24, i32 8, i1 false)
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38, i64 0
  %scevgep53.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep53.1, i8 0, i64 %24, i32 8, i1 false)
  %indvars.iv.next38.1 = add nsw i64 %indvars.iv37, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38.1, i64 0
  %scevgep53.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep53.2, i8 0, i64 %24, i32 8, i1 false)
  %indvars.iv.next38.2 = add nsw i64 %indvars.iv37, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38.2, i64 0
  %scevgep53.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep53.3, i8 0, i64 %24, i32 8, i1 false)
  %indvars.iv.next38.3 = add nuw nsw i64 %indvars.iv37, 4
  %scevgep.163 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38.3, i64 0
  %scevgep53.164 = bitcast double* %scevgep.163 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep53.164, i8 0, i64 %24, i32 8, i1 false)
  %indvars.iv.next38.165 = add nsw i64 %indvars.iv37, 5
  %scevgep.1.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38.165, i64 0
  %scevgep53.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep53.1.1, i8 0, i64 %24, i32 8, i1 false)
  %indvars.iv.next38.1.1 = add nsw i64 %indvars.iv37, 6
  %scevgep.2.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38.1.1, i64 0
  %scevgep53.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep53.2.1, i8 0, i64 %24, i32 8, i1 false)
  %indvars.iv.next38.2.1 = add nsw i64 %indvars.iv37, 7
  %scevgep.3.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next38.2.1, i64 0
  %scevgep53.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep53.3.1, i8 0, i64 %24, i32 8, i1 false)
  %indvars.iv.next38.3.1 = add nsw i64 %indvars.iv37, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next38.3.1, %23
  br i1 %exitcond.3.1, label %._crit_edge30.loopexit.unr-lcssa, label %._crit_edge.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt(i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #0 {
  %6 = icmp sgt i32 %1, 0
  br i1 %6, label %.preheader66.lr.ph, label %._crit_edge80

.preheader66.lr.ph:                               ; preds = %5
  %7 = icmp sgt i32 %0, 0
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %0, 0
  %10 = icmp sgt i32 %0, 0
  %11 = sext i32 %1 to i64
  %12 = zext i32 %0 to i64
  %13 = zext i32 %0 to i64
  %14 = zext i32 %0 to i64
  %15 = zext i32 %1 to i64
  %16 = zext i32 %1 to i64
  %17 = add nsw i64 %12, -1
  %18 = shl nuw nsw i64 %16, 3
  %19 = add nsw i64 %18, -8
  %xtraiter = and i64 %12, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %20 = icmp ult i64 %17, 3
  %xtraiter126 = and i64 %12, 1
  %lcmp.mod127 = icmp eq i64 %xtraiter126, 0
  %21 = icmp eq i64 %17, 0
  %xtraiter131 = and i64 %12, 1
  %lcmp.mod132 = icmp eq i64 %xtraiter131, 0
  %22 = icmp eq i64 %17, 0
  %xtraiter135 = and i64 %12, 1
  %lcmp.mod136 = icmp eq i64 %xtraiter135, 0
  %23 = icmp eq i64 %17, 0
  br label %.preheader66

.preheader66:                                     ; preds = %._crit_edge78, %.preheader66.lr.ph
  %indvars.iv114 = phi i64 [ 0, %.preheader66.lr.ph ], [ %indvars.iv.next115, %._crit_edge78 ]
  %indvars.iv108 = phi i64 [ 1, %.preheader66.lr.ph ], [ %indvars.iv.next109, %._crit_edge78 ]
  %24 = mul i64 %indvars.iv114, 1201
  %25 = add i64 %24, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 0, i64 %25
  %scevgep128 = bitcast double* %scevgep to i8*
  %26 = mul i64 %indvars.iv114, -8
  %27 = add i64 %19, %26
  br i1 %7, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader66
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %.068.prol = phi double [ %31, %.prol.preheader ], [ 0.000000e+00, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.prol, i64 %indvars.iv114
  %29 = load double, double* %28, align 8
  %30 = fmul double %29, %29
  %31 = fadd double %.068.prol, %30
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %31, %.prol.loopexit.loopexit ]
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %xtraiter, %.prol.loopexit.loopexit ]
  %.068.unr = phi double [ 0.000000e+00, %.lr.ph ], [ %31, %.prol.loopexit.loopexit ]
  br i1 %20, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ %indvars.iv.unr, %.lr.ph.new.preheader ]
  %.068 = phi double [ %47, %.lr.ph.new ], [ %.068.unr, %.lr.ph.new.preheader ]
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv, i64 %indvars.iv114
  %33 = load double, double* %32, align 8
  %34 = fmul double %33, %33
  %35 = fadd double %.068, %34
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next, i64 %indvars.iv114
  %37 = load double, double* %36, align 8
  %38 = fmul double %37, %37
  %39 = fadd double %35, %38
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.1, i64 %indvars.iv114
  %41 = load double, double* %40, align 8
  %42 = fmul double %41, %41
  %43 = fadd double %39, %42
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.2, i64 %indvars.iv114
  %45 = load double, double* %44, align 8
  %46 = fmul double %45, %45
  %47 = fadd double %43, %46
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond118.3 = icmp eq i64 %indvars.iv.next.3, %12
  br i1 %exitcond118.3, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %.preheader66
  %.0.lcssa = phi double [ 0.000000e+00, %.preheader66 ], [ %.lcssa.unr, %.prol.loopexit ], [ %47, %._crit_edge.loopexit ]
  %48 = tail call double @sqrt(double %.0.lcssa) #4
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv114, i64 %indvars.iv114
  store double %48, double* %49, align 8
  br i1 %8, label %.lr.ph71, label %.preheader65

.lr.ph71:                                         ; preds = %._crit_edge
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv114, i64 %indvars.iv114
  br i1 %lcmp.mod127, label %.prol.loopexit125, label %.prol.preheader124

.prol.preheader124:                               ; preds = %.lr.ph71
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv114
  %52 = load double, double* %51, align 8
  %53 = load double, double* %50, align 8
  %54 = fdiv double %52, %53
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv114
  store double %54, double* %55, align 8
  br label %.prol.loopexit125

.prol.loopexit125:                                ; preds = %.prol.preheader124, %.lr.ph71
  %indvars.iv90.unr.ph = phi i64 [ 1, %.prol.preheader124 ], [ 0, %.lr.ph71 ]
  br i1 %21, label %.preheader65, label %.lr.ph71.new.preheader

.lr.ph71.new.preheader:                           ; preds = %.prol.loopexit125
  br label %.lr.ph71.new

.preheader65.loopexit:                            ; preds = %.lr.ph71.new
  br label %.preheader65

.preheader65:                                     ; preds = %.preheader65.loopexit, %.prol.loopexit125, %._crit_edge
  %indvars.iv.next115 = add nuw nsw i64 %indvars.iv114, 1
  %56 = icmp slt i64 %indvars.iv.next115, %11
  br i1 %56, label %.lr.ph77, label %._crit_edge78

.lr.ph77:                                         ; preds = %.preheader65
  br i1 %9, label %.lr.ph77.split.us.preheader, label %._crit_edge78.loopexit89

.lr.ph77.split.us.preheader:                      ; preds = %.lr.ph77
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv114
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv114
  br label %.lr.ph77.split.us

.lr.ph77.split.us:                                ; preds = %.lr.ph77.split.us.preheader, %.loopexit.us
  %indvars.iv110 = phi i64 [ %indvars.iv.next111, %.loopexit.us ], [ %indvars.iv108, %.lr.ph77.split.us.preheader ]
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv114, i64 %indvars.iv110
  store double 0.000000e+00, double* %59, align 8
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv114, i64 %indvars.iv110
  br i1 %lcmp.mod132, label %.prol.loopexit130, label %.prol.preheader129

.prol.preheader129:                               ; preds = %.lr.ph77.split.us
  %61 = load double, double* %58, align 8
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv110
  %63 = load double, double* %62, align 8
  %64 = fmul double %61, %63
  %65 = load double, double* %60, align 8
  %66 = fadd double %65, %64
  store double %66, double* %60, align 8
  br label %.prol.loopexit130

.prol.loopexit130:                                ; preds = %.prol.preheader129, %.lr.ph77.split.us
  %indvars.iv100.unr.ph = phi i64 [ 1, %.prol.preheader129 ], [ 0, %.lr.ph77.split.us ]
  br i1 %22, label %.preheader.us, label %.lr.ph77.split.us.new.preheader

.lr.ph77.split.us.new.preheader:                  ; preds = %.prol.loopexit130
  br label %.lr.ph77.split.us.new

.lr.ph77.split.us.new:                            ; preds = %.lr.ph77.split.us.new.preheader, %.lr.ph77.split.us.new
  %indvars.iv100 = phi i64 [ %indvars.iv.next101.1, %.lr.ph77.split.us.new ], [ %indvars.iv100.unr.ph, %.lr.ph77.split.us.new.preheader ]
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv100, i64 %indvars.iv114
  %68 = load double, double* %67, align 8
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv100, i64 %indvars.iv110
  %70 = load double, double* %69, align 8
  %71 = fmul double %68, %70
  %72 = load double, double* %60, align 8
  %73 = fadd double %72, %71
  store double %73, double* %60, align 8
  %indvars.iv.next101 = add nuw nsw i64 %indvars.iv100, 1
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next101, i64 %indvars.iv114
  %75 = load double, double* %74, align 8
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next101, i64 %indvars.iv110
  %77 = load double, double* %76, align 8
  %78 = fmul double %75, %77
  %79 = load double, double* %60, align 8
  %80 = fadd double %79, %78
  store double %80, double* %60, align 8
  %indvars.iv.next101.1 = add nuw nsw i64 %indvars.iv100, 2
  %exitcond120.1 = icmp eq i64 %indvars.iv.next101.1, %14
  br i1 %exitcond120.1, label %.preheader.us.loopexit, label %.lr.ph77.split.us.new

.preheader.us.loopexit:                           ; preds = %.lr.ph77.split.us.new
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.loopexit, %.prol.loopexit130
  br i1 %10, label %.lr.ph76.us, label %.loopexit.us

.lr.ph76.us:                                      ; preds = %.preheader.us
  %81 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv114, i64 %indvars.iv110
  br i1 %lcmp.mod136, label %.prol.loopexit134, label %.prol.preheader133

.prol.preheader133:                               ; preds = %.lr.ph76.us
  %82 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv110
  %83 = load double, double* %82, align 8
  %84 = load double, double* %57, align 8
  %85 = load double, double* %81, align 8
  %86 = fmul double %84, %85
  %87 = fsub double %83, %86
  %88 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv110
  store double %87, double* %88, align 8
  br label %.prol.loopexit134

.prol.loopexit134:                                ; preds = %.prol.preheader133, %.lr.ph76.us
  %indvars.iv104.unr.ph = phi i64 [ 1, %.prol.preheader133 ], [ 0, %.lr.ph76.us ]
  br i1 %23, label %.loopexit.us, label %.lr.ph76.us.new.preheader

.lr.ph76.us.new.preheader:                        ; preds = %.prol.loopexit134
  br label %.lr.ph76.us.new

.lr.ph76.us.new:                                  ; preds = %.lr.ph76.us.new.preheader, %.lr.ph76.us.new
  %indvars.iv104 = phi i64 [ %indvars.iv.next105.1, %.lr.ph76.us.new ], [ %indvars.iv104.unr.ph, %.lr.ph76.us.new.preheader ]
  %89 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv104, i64 %indvars.iv110
  %90 = load double, double* %89, align 8
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv104, i64 %indvars.iv114
  %92 = load double, double* %91, align 8
  %93 = load double, double* %81, align 8
  %94 = fmul double %92, %93
  %95 = fsub double %90, %94
  %96 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv104, i64 %indvars.iv110
  store double %95, double* %96, align 8
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1
  %97 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next105, i64 %indvars.iv110
  %98 = load double, double* %97, align 8
  %99 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next105, i64 %indvars.iv114
  %100 = load double, double* %99, align 8
  %101 = load double, double* %81, align 8
  %102 = fmul double %100, %101
  %103 = fsub double %98, %102
  %104 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next105, i64 %indvars.iv110
  store double %103, double* %104, align 8
  %indvars.iv.next105.1 = add nuw nsw i64 %indvars.iv104, 2
  %exitcond121.1 = icmp eq i64 %indvars.iv.next105.1, %14
  br i1 %exitcond121.1, label %.loopexit.us.loopexit, label %.lr.ph76.us.new

.loopexit.us.loopexit:                            ; preds = %.lr.ph76.us.new
  br label %.loopexit.us

.loopexit.us:                                     ; preds = %.loopexit.us.loopexit, %.prol.loopexit134, %.preheader.us
  %indvars.iv.next111 = add nuw nsw i64 %indvars.iv110, 1
  %exitcond122 = icmp eq i64 %indvars.iv.next111, %15
  br i1 %exitcond122, label %._crit_edge78.loopexit, label %.lr.ph77.split.us

.lr.ph71.new:                                     ; preds = %.lr.ph71.new.preheader, %.lr.ph71.new
  %indvars.iv90 = phi i64 [ %indvars.iv.next91.1, %.lr.ph71.new ], [ %indvars.iv90.unr.ph, %.lr.ph71.new.preheader ]
  %105 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv90, i64 %indvars.iv114
  %106 = load double, double* %105, align 8
  %107 = load double, double* %50, align 8
  %108 = fdiv double %106, %107
  %109 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv90, i64 %indvars.iv114
  store double %108, double* %109, align 8
  %indvars.iv.next91 = add nuw nsw i64 %indvars.iv90, 1
  %110 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next91, i64 %indvars.iv114
  %111 = load double, double* %110, align 8
  %112 = load double, double* %50, align 8
  %113 = fdiv double %111, %112
  %114 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next91, i64 %indvars.iv114
  store double %113, double* %114, align 8
  %indvars.iv.next91.1 = add nuw nsw i64 %indvars.iv90, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next91.1, %13
  br i1 %exitcond.1, label %.preheader65.loopexit, label %.lr.ph71.new

._crit_edge78.loopexit89:                         ; preds = %.lr.ph77
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep128, i8 0, i64 %27, i32 8, i1 false)
  br label %._crit_edge78

._crit_edge78.loopexit:                           ; preds = %.loopexit.us
  br label %._crit_edge78

._crit_edge78:                                    ; preds = %._crit_edge78.loopexit, %._crit_edge78.loopexit89, %.preheader65
  %indvars.iv.next109 = add nuw nsw i64 %indvars.iv108, 1
  %exitcond123 = icmp eq i64 %indvars.iv.next115, %16
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
  %6 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %5) #6
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.preheader25.us.preheader, label %._crit_edge35

.preheader25.us.preheader:                        ; preds = %4
  %10 = sext i32 %1 to i64
  %11 = zext i32 %1 to i64
  %12 = zext i32 %1 to i64
  br label %.preheader25.us

.preheader25.us:                                  ; preds = %._crit_edge32.us, %.preheader25.us.preheader
  %indvars.iv49 = phi i64 [ 0, %.preheader25.us.preheader ], [ %indvars.iv.next50, %._crit_edge32.us ]
  %13 = mul nsw i64 %indvars.iv49, %10
  br label %14

; <label>:14:                                     ; preds = %21, %.preheader25.us
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %21 ], [ 0, %.preheader25.us ]
  %15 = add nsw i64 %indvars.iv45, %13
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, 20
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %21

; <label>:19:                                     ; preds = %14
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc38.us = call i32 @fputc(i32 10, %struct._IO_FILE* %20) #6
  br label %21

; <label>:21:                                     ; preds = %19, %14
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv49, i64 %indvars.iv45
  %24 = load double, double* %23, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %24) #7
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next46, %11
  br i1 %exitcond54, label %._crit_edge32.us, label %14

._crit_edge32.us:                                 ; preds = %21
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next50, %12
  br i1 %exitcond55, label %._crit_edge35.loopexit, label %.preheader25.us

._crit_edge35.loopexit:                           ; preds = %._crit_edge32.us
  br label %._crit_edge35

._crit_edge35:                                    ; preds = %._crit_edge35.loopexit, %4
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %29 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %30 = icmp sgt i32 %0, 0
  %31 = icmp sgt i32 %1, 0
  %or.cond = and i1 %30, %31
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge29

.preheader.us.preheader:                          ; preds = %._crit_edge35
  %32 = sext i32 %1 to i64
  %33 = zext i32 %1 to i64
  %34 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv40 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next41, %._crit_edge.us ]
  %35 = mul nsw i64 %indvars.iv40, %32
  br label %36

; <label>:36:                                     ; preds = %43, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %43 ], [ 0, %.preheader.us ]
  %37 = add nsw i64 %indvars.iv, %35
  %38 = trunc i64 %37 to i32
  %39 = srem i32 %38, 20
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %41, label %43

; <label>:41:                                     ; preds = %36
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %42) #6
  br label %43

; <label>:43:                                     ; preds = %41, %36
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv40, i64 %indvars.iv
  %46 = load double, double* %45, align 8
  %47 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %44, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %46) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next, %33
  br i1 %exitcond53, label %._crit_edge.us, label %36

._crit_edge.us:                                   ; preds = %43
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond = icmp eq i64 %indvars.iv.next41, %34
  br i1 %exitcond, label %._crit_edge29.loopexit, label %.preheader.us

._crit_edge29.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge29

._crit_edge29:                                    ; preds = %._crit_edge29.loopexit, %._crit_edge35
  %48 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %49 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %48, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %51 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %50) #6
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
