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
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %10
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader4.lr.ph, label %.preheader3

.preheader4.lr.ph:                                ; preds = %5
  %7 = icmp sgt i32 %1, 0
  %8 = sitofp i32 %0 to double
  br i1 %7, label %.preheader4.us.preheader, label %._crit_edge7

.preheader4.us.preheader:                         ; preds = %.preheader4.lr.ph
  %wide.trip.count21 = zext i32 %1 to i64
  %wide.trip.count27 = zext i32 %0 to i64
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %.preheader4.us.preheader, %._crit_edge10.us
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %._crit_edge10.us ], [ 0, %.preheader4.us.preheader ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader4.us
  %indvars.iv19 = phi i64 [ 0, %.preheader4.us ], [ %indvars.iv.next20, %._crit_edge ]
  %9 = mul nuw nsw i64 %indvars.iv19, %indvars.iv25
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, %0
  %12 = sitofp i32 %11 to double
  %13 = fdiv double %12, %8
  %14 = fmul double %13, 1.000000e+02
  %15 = fadd double %14, 1.000000e+01
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv25, i64 %indvars.iv19
  store double %15, double* %16, align 8
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv25, i64 %indvars.iv19
  store double 0.000000e+00, double* %17, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next20, %wide.trip.count21
  br i1 %exitcond22, label %._crit_edge10.us, label %._crit_edge

._crit_edge10.us:                                 ; preds = %._crit_edge
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next26, %wide.trip.count27
  br i1 %exitcond28, label %.preheader3.loopexit, label %.preheader4.us

.preheader3.loopexit:                             ; preds = %._crit_edge10.us
  br label %.preheader3

.preheader3:                                      ; preds = %.preheader3.loopexit, %5
  %18 = icmp sgt i32 %1, 0
  br i1 %18, label %.preheader.us.preheader, label %._crit_edge7

.preheader.us.preheader:                          ; preds = %.preheader3
  %19 = add i32 %1, -1
  %20 = zext i32 %19 to i64
  %21 = shl nuw nsw i64 %20, 3
  %22 = add nuw nsw i64 %21, 8
  %wide.trip.count17 = zext i32 %1 to i64
  %23 = add nsw i64 %wide.trip.count17, -1
  %xtraiter = and i64 %wide.trip.count17, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge.us.prol.loopexit, label %._crit_edge.us.prol.preheader

._crit_edge.us.prol.preheader:                    ; preds = %.preheader.us.preheader
  br label %._crit_edge.us.prol

._crit_edge.us.prol:                              ; preds = %._crit_edge.us.prol, %._crit_edge.us.prol.preheader
  %indvars.iv15.prol = phi i64 [ 0, %._crit_edge.us.prol.preheader ], [ %indvars.iv.next16.prol, %._crit_edge.us.prol ]
  %prol.iter = phi i64 [ %xtraiter, %._crit_edge.us.prol.preheader ], [ %prol.iter.sub, %._crit_edge.us.prol ]
  %scevgep.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv15.prol, i64 0
  %scevgep14.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.prol, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next16.prol = add nuw nsw i64 %indvars.iv15.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge.us.prol.loopexit.unr-lcssa, label %._crit_edge.us.prol, !llvm.loop !1

._crit_edge.us.prol.loopexit.unr-lcssa:           ; preds = %._crit_edge.us.prol
  br label %._crit_edge.us.prol.loopexit

._crit_edge.us.prol.loopexit:                     ; preds = %.preheader.us.preheader, %._crit_edge.us.prol.loopexit.unr-lcssa
  %indvars.iv15.unr = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next16.prol, %._crit_edge.us.prol.loopexit.unr-lcssa ]
  %24 = icmp ult i64 %23, 7
  br i1 %24, label %._crit_edge7.loopexit, label %.preheader.us.preheader.new

.preheader.us.preheader.new:                      ; preds = %._crit_edge.us.prol.loopexit
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us, %.preheader.us.preheader.new
  %indvars.iv15 = phi i64 [ %indvars.iv15.unr, %.preheader.us.preheader.new ], [ %indvars.iv.next16.7, %._crit_edge.us ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv15, i64 0
  %scevgep14 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next16, i64 0
  %scevgep14.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.1, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next16.1 = add nsw i64 %indvars.iv15, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next16.1, i64 0
  %scevgep14.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.2, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next16.2 = add nsw i64 %indvars.iv15, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next16.2, i64 0
  %scevgep14.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.3, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next16.3 = add nsw i64 %indvars.iv15, 4
  %scevgep.4 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next16.3, i64 0
  %scevgep14.4 = bitcast double* %scevgep.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.4, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next16.4 = add nsw i64 %indvars.iv15, 5
  %scevgep.5 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next16.4, i64 0
  %scevgep14.5 = bitcast double* %scevgep.5 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.5, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next16.5 = add nsw i64 %indvars.iv15, 6
  %scevgep.6 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next16.5, i64 0
  %scevgep14.6 = bitcast double* %scevgep.6 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.6, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next16.6 = add nsw i64 %indvars.iv15, 7
  %scevgep.7 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next16.6, i64 0
  %scevgep14.7 = bitcast double* %scevgep.7 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.7, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next16.7 = add nsw i64 %indvars.iv15, 8
  %exitcond18.7 = icmp eq i64 %indvars.iv.next16.7, %wide.trip.count17
  br i1 %exitcond18.7, label %._crit_edge7.loopexit.unr-lcssa, label %._crit_edge.us

._crit_edge7.loopexit.unr-lcssa:                  ; preds = %._crit_edge.us
  br label %._crit_edge7.loopexit

._crit_edge7.loopexit:                            ; preds = %._crit_edge.us.prol.loopexit, %._crit_edge7.loopexit.unr-lcssa
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.loopexit, %.preheader4.lr.ph, %.preheader3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt(i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #0 {
  %6 = icmp sgt i32 %1, 0
  br i1 %6, label %.preheader5.lr.ph, label %._crit_edge31

.preheader5.lr.ph:                                ; preds = %5
  %7 = icmp sgt i32 %0, 0
  %8 = add i32 %1, -2
  %9 = zext i32 %8 to i64
  %10 = sext i32 %1 to i64
  %wide.trip.count46 = zext i32 %0 to i64
  %wide.trip.count56 = zext i32 %1 to i64
  %11 = add nsw i64 %wide.trip.count46, -1
  %xtraiter = and i64 %wide.trip.count46, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %12 = icmp ult i64 %11, 3
  %xtraiter68 = and i64 %wide.trip.count46, 1
  %lcmp.mod69 = icmp eq i64 %xtraiter68, 0
  %13 = icmp eq i64 %11, 0
  br label %.preheader5

.preheader5:                                      ; preds = %._crit_edge19, %.preheader5.lr.ph
  %indvars.iv60 = phi i64 [ 0, %.preheader5.lr.ph ], [ %indvars.iv.next61, %._crit_edge19 ]
  %indvars.iv52 = phi i64 [ 1, %.preheader5.lr.ph ], [ %indvars.iv.next53, %._crit_edge19 ]
  %14 = mul nuw nsw i64 %indvars.iv60, 1201
  %15 = add nuw nsw i64 %14, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 0, i64 %15
  %scevgep43 = bitcast double* %scevgep to i8*
  %16 = sub i64 %9, %indvars.iv60
  %17 = shl i64 %16, 3
  %18 = and i64 %17, 34359738360
  %19 = add nuw nsw i64 %18, 8
  br i1 %7, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader5
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol, %.lr.ph.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.lr.ph.prol ], [ 0, %.lr.ph.prol.preheader ]
  %.07.prol = phi double [ %23, %.lr.ph.prol ], [ 0.000000e+00, %.lr.ph.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.prol, i64 %indvars.iv60
  %21 = load double, double* %20, align 8
  %22 = fmul double %21, %21
  %23 = fadd double %.07.prol, %22
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.unr-lcssa, label %.lr.ph.prol, !llvm.loop !3

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.preheader, %.lr.ph.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %.lr.ph.preheader ], [ %23, %.lr.ph.prol.loopexit.unr-lcssa ]
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next.prol, %.lr.ph.prol.loopexit.unr-lcssa ]
  %.07.unr = phi double [ 0.000000e+00, %.lr.ph.preheader ], [ %23, %.lr.ph.prol.loopexit.unr-lcssa ]
  br i1 %12, label %._crit_edge.loopexit, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %.lr.ph.preheader.new ], [ %indvars.iv.next.3, %.lr.ph ]
  %.07 = phi double [ %.07.unr, %.lr.ph.preheader.new ], [ %39, %.lr.ph ]
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv, i64 %indvars.iv60
  %25 = load double, double* %24, align 8
  %26 = fmul double %25, %25
  %27 = fadd double %.07, %26
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next, i64 %indvars.iv60
  %29 = load double, double* %28, align 8
  %30 = fmul double %29, %29
  %31 = fadd double %27, %30
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.1, i64 %indvars.iv60
  %33 = load double, double* %32, align 8
  %34 = fmul double %33, %33
  %35 = fadd double %31, %34
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.2, i64 %indvars.iv60
  %37 = load double, double* %36, align 8
  %38 = fmul double %37, %37
  %39 = fadd double %35, %38
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count46
  br i1 %exitcond.3, label %._crit_edge.loopexit.unr-lcssa, label %.lr.ph

._crit_edge.loopexit.unr-lcssa:                   ; preds = %.lr.ph
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %39, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader5
  %.0.lcssa = phi double [ 0.000000e+00, %.preheader5 ], [ %.lcssa, %._crit_edge.loopexit ]
  %40 = tail call double @sqrt(double %.0.lcssa) #4
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv60, i64 %indvars.iv60
  store double %40, double* %41, align 8
  br i1 %7, label %.lr.ph10.preheader, label %.preheader4

.lr.ph10.preheader:                               ; preds = %._crit_edge
  br label %.lr.ph10

.preheader4.loopexit:                             ; preds = %.lr.ph10
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader4.loopexit, %._crit_edge
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %42 = icmp slt i64 %indvars.iv.next61, %10
  br i1 %42, label %.lr.ph18, label %._crit_edge19

.lr.ph18:                                         ; preds = %.preheader4
  br i1 %7, label %.lr.ph18.split.us.preheader, label %._crit_edge19.loopexit32

.lr.ph18.split.us.preheader:                      ; preds = %.lr.ph18
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv60
  br label %.lr.ph18.split.us

.lr.ph18.split.us:                                ; preds = %.lr.ph18.split.us.preheader, %.loopexit.us
  %indvars.iv54 = phi i64 [ %indvars.iv.next55, %.loopexit.us ], [ %indvars.iv52, %.lr.ph18.split.us.preheader ]
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv60, i64 %indvars.iv54
  store double 0.000000e+00, double* %44, align 8
  br i1 %lcmp.mod69, label %._crit_edge65.prol.loopexit.unr-lcssa, label %._crit_edge65.prol.preheader

._crit_edge65.prol.preheader:                     ; preds = %.lr.ph18.split.us
  br label %._crit_edge65.prol

._crit_edge65.prol:                               ; preds = %._crit_edge65.prol.preheader
  %45 = load double, double* %43, align 8
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv54
  %47 = load double, double* %46, align 8
  %48 = fmul double %45, %47
  %49 = fadd double %48, 0.000000e+00
  store double %49, double* %44, align 8
  br label %._crit_edge65.prol.loopexit.unr-lcssa

._crit_edge65.prol.loopexit.unr-lcssa:            ; preds = %.lr.ph18.split.us, %._crit_edge65.prol
  %.lcssa67.unr.ph = phi double [ %49, %._crit_edge65.prol ], [ undef, %.lr.ph18.split.us ]
  %indvars.iv44.unr.ph = phi i64 [ 1, %._crit_edge65.prol ], [ 0, %.lr.ph18.split.us ]
  %.unr.ph = phi double [ %49, %._crit_edge65.prol ], [ 0.000000e+00, %.lr.ph18.split.us ]
  br label %._crit_edge65.prol.loopexit

._crit_edge65.prol.loopexit:                      ; preds = %._crit_edge65.prol.loopexit.unr-lcssa
  br i1 %13, label %..preheader_crit_edge.us, label %.lr.ph18.split.us.new

.lr.ph18.split.us.new:                            ; preds = %._crit_edge65.prol.loopexit
  br label %._crit_edge65

.loopexit.us.loopexit:                            ; preds = %.lr.ph15.us
  br label %.loopexit.us

.loopexit.us:                                     ; preds = %..preheader_crit_edge.us..loopexit.us_crit_edge, %.loopexit.us.loopexit
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond57 = icmp eq i64 %indvars.iv.next55, %wide.trip.count56
  br i1 %exitcond57, label %._crit_edge19.loopexit, label %.lr.ph18.split.us

.lr.ph15.us:                                      ; preds = %.lr.ph15.us..lr.ph15.us_crit_edge, %.lr.ph15.us.preheader
  %50 = phi double [ %.pre66, %.lr.ph15.us..lr.ph15.us_crit_edge ], [ %.lcssa67, %.lr.ph15.us.preheader ]
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %.lr.ph15.us..lr.ph15.us_crit_edge ], [ 0, %.lr.ph15.us.preheader ]
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv48, i64 %indvars.iv54
  %52 = load double, double* %51, align 8
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv48, i64 %indvars.iv60
  %54 = load double, double* %53, align 8
  %55 = fmul double %54, %50
  %56 = fsub double %52, %55
  store double %56, double* %51, align 8
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond51 = icmp eq i64 %indvars.iv.next49, %wide.trip.count46
  br i1 %exitcond51, label %.loopexit.us.loopexit, label %.lr.ph15.us..lr.ph15.us_crit_edge

.lr.ph15.us..lr.ph15.us_crit_edge:                ; preds = %.lr.ph15.us
  %.pre66 = load double, double* %44, align 8
  br label %.lr.ph15.us

._crit_edge65:                                    ; preds = %._crit_edge65, %.lr.ph18.split.us.new
  %indvars.iv44 = phi i64 [ %indvars.iv44.unr.ph, %.lr.ph18.split.us.new ], [ %indvars.iv.next45.1, %._crit_edge65 ]
  %57 = phi double [ %.unr.ph, %.lr.ph18.split.us.new ], [ %69, %._crit_edge65 ]
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv44, i64 %indvars.iv60
  %59 = load double, double* %58, align 8
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv44, i64 %indvars.iv54
  %61 = load double, double* %60, align 8
  %62 = fmul double %59, %61
  %63 = fadd double %57, %62
  store double %63, double* %44, align 8
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next45, i64 %indvars.iv60
  %65 = load double, double* %64, align 8
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next45, i64 %indvars.iv54
  %67 = load double, double* %66, align 8
  %68 = fmul double %65, %67
  %69 = fadd double %63, %68
  store double %69, double* %44, align 8
  %indvars.iv.next45.1 = add nsw i64 %indvars.iv44, 2
  %exitcond47.1 = icmp eq i64 %indvars.iv.next45.1, %wide.trip.count46
  br i1 %exitcond47.1, label %..preheader_crit_edge.us.unr-lcssa, label %._crit_edge65

..preheader_crit_edge.us.unr-lcssa:               ; preds = %._crit_edge65
  br label %..preheader_crit_edge.us

..preheader_crit_edge.us:                         ; preds = %._crit_edge65.prol.loopexit, %..preheader_crit_edge.us.unr-lcssa
  %.lcssa67 = phi double [ %.lcssa67.unr.ph, %._crit_edge65.prol.loopexit ], [ %69, %..preheader_crit_edge.us.unr-lcssa ]
  br i1 true, label %.lr.ph15.us.preheader, label %..preheader_crit_edge.us..loopexit.us_crit_edge

..preheader_crit_edge.us..loopexit.us_crit_edge:  ; preds = %..preheader_crit_edge.us
  br label %.loopexit.us

.lr.ph15.us.preheader:                            ; preds = %..preheader_crit_edge.us
  br label %.lr.ph15.us

.lr.ph10:                                         ; preds = %.lr.ph10..lr.ph10_crit_edge, %.lr.ph10.preheader
  %70 = phi double [ %.pre, %.lr.ph10..lr.ph10_crit_edge ], [ %40, %.lr.ph10.preheader ]
  %indvars.iv33 = phi i64 [ %indvars.iv.next34, %.lr.ph10..lr.ph10_crit_edge ], [ 0, %.lr.ph10.preheader ]
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv33, i64 %indvars.iv60
  %72 = load double, double* %71, align 8
  %73 = fdiv double %72, %70
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv33, i64 %indvars.iv60
  store double %73, double* %74, align 8
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next34, %wide.trip.count46
  br i1 %exitcond36, label %.preheader4.loopexit, label %.lr.ph10..lr.ph10_crit_edge

.lr.ph10..lr.ph10_crit_edge:                      ; preds = %.lr.ph10
  %.pre = load double, double* %41, align 8
  br label %.lr.ph10

._crit_edge19.loopexit32:                         ; preds = %.lr.ph18
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep43, i8 0, i64 %19, i32 8, i1 false)
  br label %._crit_edge19

._crit_edge19.loopexit:                           ; preds = %.loopexit.us
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19.loopexit, %.preheader4, %._crit_edge19.loopexit32
  %exitcond63 = icmp eq i64 %indvars.iv.next61, %wide.trip.count56
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  br i1 %exitcond63, label %._crit_edge31.loopexit, label %.preheader5

._crit_edge31.loopexit:                           ; preds = %._crit_edge19
  br label %._crit_edge31

._crit_edge31:                                    ; preds = %._crit_edge31.loopexit, %5
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
  br i1 %9, label %.preheader4.us.preheader, label %._crit_edge12

.preheader4.us.preheader:                         ; preds = %4
  %10 = sext i32 %1 to i64
  %wide.trip.count21 = zext i32 %1 to i64
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %._crit_edge10.us, %.preheader4.us.preheader
  %indvars.iv23 = phi i64 [ 0, %.preheader4.us.preheader ], [ %indvars.iv.next24, %._crit_edge10.us ]
  %11 = mul nsw i64 %indvars.iv23, %10
  br label %._crit_edge27

._crit_edge27:                                    ; preds = %._crit_edge, %.preheader4.us
  %indvars.iv19 = phi i64 [ 0, %.preheader4.us ], [ %indvars.iv.next20, %._crit_edge ]
  %12 = add nsw i64 %indvars.iv19, %11
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge

; <label>:16:                                     ; preds = %._crit_edge27
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge27, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv23, i64 %indvars.iv19
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #7
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next20, %wide.trip.count21
  br i1 %exitcond22, label %._crit_edge10.us, label %._crit_edge27

._crit_edge10.us:                                 ; preds = %._crit_edge
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next24, %wide.trip.count21
  br i1 %exitcond26, label %._crit_edge12.loopexit, label %.preheader4.us

._crit_edge12.loopexit:                           ; preds = %._crit_edge10.us
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %4
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %26 = icmp sgt i32 %0, 0
  %or.cond = and i1 %26, %9
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge7

.preheader.us.preheader:                          ; preds = %._crit_edge12
  %27 = sext i32 %1 to i64
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count16 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv14 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next15, %._crit_edge.us ]
  %28 = mul nsw i64 %indvars.iv14, %27
  br label %._crit_edge29

._crit_edge29:                                    ; preds = %._crit_edge28, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge28 ]
  %29 = add nsw i64 %indvars.iv, %28
  %30 = trunc i64 %29 to i32
  %31 = srem i32 %30, 20
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %33, label %._crit_edge28

; <label>:33:                                     ; preds = %._crit_edge29
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %34) #6
  br label %._crit_edge28

._crit_edge28:                                    ; preds = %._crit_edge29, %33
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv14, i64 %indvars.iv
  %37 = load double, double* %36, align 8
  %38 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %37) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge29

._crit_edge.us:                                   ; preds = %._crit_edge28
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next15, %wide.trip.count16
  br i1 %exitcond17, label %._crit_edge7.loopexit, label %.preheader.us

._crit_edge7.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.loopexit, %._crit_edge12
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %39, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %42 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %41) #6
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
