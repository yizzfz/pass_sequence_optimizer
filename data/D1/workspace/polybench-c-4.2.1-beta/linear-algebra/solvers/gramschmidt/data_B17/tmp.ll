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
  %14 = bitcast i8* %5 to [1200 x double]*
  %15 = bitcast i8* %4 to [1200 x double]*
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %15, [1200 x double]* %14)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]*) unnamed_addr #2 {
  %6 = alloca [1200 x double]*, align 8
  store [1200 x double]* %4, [1200 x double]** %6, align 8
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader2.lr.ph, label %.preheader1

.preheader2.lr.ph:                                ; preds = %5
  %8 = icmp sgt i32 %1, 0
  %9 = sitofp i32 %0 to double
  %10 = load [1200 x double]*, [1200 x double]** %6, align 8
  br i1 %8, label %.preheader2.us.preheader, label %._crit_edge3

.preheader2.us.preheader:                         ; preds = %.preheader2.lr.ph
  %11 = zext i32 %1 to i64
  %12 = add nsw i64 %11, -1
  %wide.trip.count17 = zext i32 %0 to i64
  br label %.preheader2.us

.preheader2.us:                                   ; preds = %._crit_edge5.us, %.preheader2.us.preheader
  %indvars.iv15 = phi i64 [ 0, %.preheader2.us.preheader ], [ %indvars.iv.next16, %._crit_edge5.us ]
  br label %13

; <label>:13:                                     ; preds = %13, %.preheader2.us
  %indvars.iv11 = phi i64 [ %indvars.iv.next12, %13 ], [ 0, %.preheader2.us ]
  %14 = mul nuw nsw i64 %indvars.iv11, %indvars.iv15
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, %0
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, %9
  %19 = fmul double %18, 1.000000e+02
  %20 = fadd double %19, 1.000000e+01
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv15, i64 %indvars.iv11
  store double %20, double* %21, align 8
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv15, i64 %indvars.iv11
  store double 0.000000e+00, double* %22, align 8
  %exitcond = icmp eq i64 %indvars.iv11, %12
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  br i1 %exitcond, label %._crit_edge5.us, label %13

._crit_edge5.us:                                  ; preds = %13
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next16, %wide.trip.count17
  br i1 %exitcond18, label %.preheader1.loopexit, label %.preheader2.us

.preheader1.loopexit:                             ; preds = %._crit_edge5.us
  br label %.preheader1

.preheader1:                                      ; preds = %.preheader1.loopexit, %5
  %23 = icmp sgt i32 %1, 0
  br i1 %23, label %.preheader.us.preheader, label %._crit_edge3

.preheader.us.preheader:                          ; preds = %.preheader1
  %24 = zext i32 %1 to i64
  %25 = shl nuw nsw i64 %24, 3
  %wide.trip.count9 = zext i32 %1 to i64
  %26 = add nsw i64 %wide.trip.count9, -1
  %xtraiter = and i64 %wide.trip.count9, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge.us.prol.loopexit, label %._crit_edge.us.prol.preheader

._crit_edge.us.prol.preheader:                    ; preds = %.preheader.us.preheader
  br label %._crit_edge.us.prol

._crit_edge.us.prol:                              ; preds = %._crit_edge.us.prol, %._crit_edge.us.prol.preheader
  %indvars.iv7.prol = phi i64 [ 0, %._crit_edge.us.prol.preheader ], [ %indvars.iv.next8.prol, %._crit_edge.us.prol ]
  %prol.iter = phi i64 [ %xtraiter, %._crit_edge.us.prol.preheader ], [ %prol.iter.sub, %._crit_edge.us.prol ]
  %scevgep.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv7.prol, i64 0
  %scevgep22.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep22.prol, i8 0, i64 %25, i32 8, i1 false)
  %indvars.iv.next8.prol = add nuw nsw i64 %indvars.iv7.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge.us.prol.loopexit.unr-lcssa, label %._crit_edge.us.prol, !llvm.loop !1

._crit_edge.us.prol.loopexit.unr-lcssa:           ; preds = %._crit_edge.us.prol
  br label %._crit_edge.us.prol.loopexit

._crit_edge.us.prol.loopexit:                     ; preds = %.preheader.us.preheader, %._crit_edge.us.prol.loopexit.unr-lcssa
  %indvars.iv7.unr = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next8.prol, %._crit_edge.us.prol.loopexit.unr-lcssa ]
  %27 = icmp ult i64 %26, 7
  br i1 %27, label %._crit_edge3.loopexit, label %.preheader.us.preheader.new

.preheader.us.preheader.new:                      ; preds = %._crit_edge.us.prol.loopexit
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us, %.preheader.us.preheader.new
  %indvars.iv7 = phi i64 [ %indvars.iv7.unr, %.preheader.us.preheader.new ], [ %indvars.iv.next8.7, %._crit_edge.us ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv7, i64 0
  %scevgep22 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep22, i8 0, i64 %25, i32 8, i1 false)
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next8, i64 0
  %scevgep22.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep22.1, i8 0, i64 %25, i32 8, i1 false)
  %indvars.iv.next8.1 = add nsw i64 %indvars.iv7, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next8.1, i64 0
  %scevgep22.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep22.2, i8 0, i64 %25, i32 8, i1 false)
  %indvars.iv.next8.2 = add nsw i64 %indvars.iv7, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next8.2, i64 0
  %scevgep22.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep22.3, i8 0, i64 %25, i32 8, i1 false)
  %indvars.iv.next8.3 = add nsw i64 %indvars.iv7, 4
  %scevgep.4 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next8.3, i64 0
  %scevgep22.4 = bitcast double* %scevgep.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep22.4, i8 0, i64 %25, i32 8, i1 false)
  %indvars.iv.next8.4 = add nsw i64 %indvars.iv7, 5
  %scevgep.5 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next8.4, i64 0
  %scevgep22.5 = bitcast double* %scevgep.5 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep22.5, i8 0, i64 %25, i32 8, i1 false)
  %indvars.iv.next8.5 = add nsw i64 %indvars.iv7, 6
  %scevgep.6 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next8.5, i64 0
  %scevgep22.6 = bitcast double* %scevgep.6 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep22.6, i8 0, i64 %25, i32 8, i1 false)
  %indvars.iv.next8.6 = add nsw i64 %indvars.iv7, 7
  %scevgep.7 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next8.6, i64 0
  %scevgep22.7 = bitcast double* %scevgep.7 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep22.7, i8 0, i64 %25, i32 8, i1 false)
  %indvars.iv.next8.7 = add nsw i64 %indvars.iv7, 8
  %exitcond10.7 = icmp eq i64 %indvars.iv.next8.7, %wide.trip.count9
  br i1 %exitcond10.7, label %._crit_edge3.loopexit.unr-lcssa, label %._crit_edge.us

._crit_edge3.loopexit.unr-lcssa:                  ; preds = %._crit_edge.us
  br label %._crit_edge3.loopexit

._crit_edge3.loopexit:                            ; preds = %._crit_edge.us.prol.loopexit, %._crit_edge3.loopexit.unr-lcssa
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.loopexit, %.preheader2.lr.ph, %.preheader1
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt(i32, i32, [1200 x double]*, [1200 x double]* nocapture, [1200 x double]*) unnamed_addr #0 {
  %6 = alloca [1200 x double]*, align 8
  %7 = alloca [1200 x double]*, align 8
  store [1200 x double]* %2, [1200 x double]** %6, align 8
  store [1200 x double]* %4, [1200 x double]** %7, align 8
  %8 = icmp sgt i32 %1, 0
  br i1 %8, label %.preheader2.lr.ph, label %._crit_edge14

.preheader2.lr.ph:                                ; preds = %5
  %9 = icmp sgt i32 %0, 0
  %10 = load [1200 x double]*, [1200 x double]** %6, align 8
  %11 = icmp sgt i32 %0, 0
  %12 = load [1200 x double]*, [1200 x double]** %7, align 8
  %13 = icmp sgt i32 %0, 0
  %14 = icmp sgt i32 %0, 0
  %15 = sext i32 %1 to i64
  %16 = zext i32 %0 to i64
  %17 = add nsw i64 %16, -1
  %18 = zext i32 %0 to i64
  %19 = add nsw i64 %18, -1
  %20 = zext i32 %1 to i64
  %21 = shl nuw nsw i64 %20, 3
  %22 = add nsw i64 %21, -8
  %23 = zext i32 %0 to i64
  %24 = add nsw i64 %23, -1
  %wide.trip.count47 = zext i32 %1 to i64
  %wide.trip.count51 = zext i32 %1 to i64
  %xtraiter = and i64 %16, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %25 = icmp ult i64 %17, 3
  %xtraiter66 = and i64 %16, 1
  %lcmp.mod67 = icmp eq i64 %xtraiter66, 0
  %26 = icmp eq i64 %17, 0
  %xtraiter70 = and i64 %16, 1
  %lcmp.mod71 = icmp eq i64 %xtraiter70, 0
  %27 = icmp eq i64 %17, 0
  %xtraiter74 = and i64 %16, 1
  %lcmp.mod75 = icmp eq i64 %xtraiter74, 0
  %28 = icmp eq i64 %17, 0
  br label %.preheader2

.preheader2:                                      ; preds = %._crit_edge12, %.preheader2.lr.ph
  %indvars.iv49 = phi i64 [ 0, %.preheader2.lr.ph ], [ %indvars.iv.next50, %._crit_edge12 ]
  %indvars.iv43 = phi i64 [ 1, %.preheader2.lr.ph ], [ %indvars.iv.next44, %._crit_edge12 ]
  %29 = mul i64 %indvars.iv49, 1201
  %30 = add i64 %29, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 0, i64 %30
  %scevgep60 = bitcast double* %scevgep to i8*
  %31 = mul i64 %indvars.iv49, -8
  %32 = add i64 %22, %31
  br i1 %9, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader2
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol, %.lr.ph.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.lr.ph.prol ], [ 0, %.lr.ph.prol.preheader ]
  %33 = phi double [ %37, %.lr.ph.prol ], [ 0.000000e+00, %.lr.ph.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv.prol, i64 %indvars.iv49
  %35 = load double, double* %34, align 8
  %36 = fmul double %35, %35
  %37 = fadd double %33, %36
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.unr-lcssa, label %.lr.ph.prol, !llvm.loop !3

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.preheader, %.lr.ph.prol.loopexit.unr-lcssa
  %.lcssa65.unr = phi double [ undef, %.lr.ph.preheader ], [ %37, %.lr.ph.prol.loopexit.unr-lcssa ]
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next.prol, %.lr.ph.prol.loopexit.unr-lcssa ]
  %.unr = phi double [ 0.000000e+00, %.lr.ph.preheader ], [ %37, %.lr.ph.prol.loopexit.unr-lcssa ]
  br i1 %25, label %._crit_edge.loopexit, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %.lr.ph.preheader.new ], [ %indvars.iv.next.3, %.lr.ph ]
  %38 = phi double [ %.unr, %.lr.ph.preheader.new ], [ %54, %.lr.ph ]
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv, i64 %indvars.iv49
  %40 = load double, double* %39, align 8
  %41 = fmul double %40, %40
  %42 = fadd double %38, %41
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv.next, i64 %indvars.iv49
  %44 = load double, double* %43, align 8
  %45 = fmul double %44, %44
  %46 = fadd double %42, %45
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv.next.1, i64 %indvars.iv49
  %48 = load double, double* %47, align 8
  %49 = fmul double %48, %48
  %50 = fadd double %46, %49
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv.next.2, i64 %indvars.iv49
  %52 = load double, double* %51, align 8
  %53 = fmul double %52, %52
  %54 = fadd double %50, %53
  %exitcond58.3 = icmp eq i64 %indvars.iv.next.2, %17
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  br i1 %exitcond58.3, label %._crit_edge.loopexit.unr-lcssa, label %.lr.ph

._crit_edge.loopexit.unr-lcssa:                   ; preds = %.lr.ph
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa65 = phi double [ %.lcssa65.unr, %.lr.ph.prol.loopexit ], [ %54, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader2
  %.lcssa = phi double [ 0.000000e+00, %.preheader2 ], [ %.lcssa65, %._crit_edge.loopexit ]
  %55 = tail call double @sqrt(double %.lcssa) #4
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv49, i64 %indvars.iv49
  store double %55, double* %56, align 8
  br i1 %11, label %.lr.ph6, label %.preheader1

.lr.ph6:                                          ; preds = %._crit_edge
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv49, i64 %indvars.iv49
  br i1 %lcmp.mod67, label %.prol.loopexit.unr-lcssa, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph6
  br label %58

; <label>:58:                                     ; preds = %.prol.preheader
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 0, i64 %indvars.iv49
  %60 = load double, double* %59, align 8
  %61 = load double, double* %57, align 8
  %62 = fdiv double %60, %61
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %12, i64 0, i64 %indvars.iv49
  store double %62, double* %63, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph6, %58
  %indvars.iv25.unr.ph = phi i64 [ 1, %58 ], [ 0, %.lr.ph6 ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  br i1 %26, label %.preheader1.loopexit, label %.lr.ph6.new

.lr.ph6.new:                                      ; preds = %.prol.loopexit
  br label %114

.preheader1.loopexit.unr-lcssa:                   ; preds = %114
  br label %.preheader1.loopexit

.preheader1.loopexit:                             ; preds = %.prol.loopexit, %.preheader1.loopexit.unr-lcssa
  br label %.preheader1

.preheader1:                                      ; preds = %.preheader1.loopexit, %._crit_edge
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %64 = icmp slt i64 %indvars.iv.next50, %15
  br i1 %64, label %.lr.ph11, label %._crit_edge12

.lr.ph11:                                         ; preds = %.preheader1
  br i1 %13, label %.lr.ph11.split.us.preheader, label %._crit_edge12.loopexit23

.lr.ph11.split.us.preheader:                      ; preds = %.lr.ph11
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %12, i64 0, i64 %indvars.iv49
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %12, i64 0, i64 %indvars.iv49
  br label %.lr.ph11.split.us

.lr.ph11.split.us:                                ; preds = %.lr.ph11.split.us.preheader, %.loopexit.us
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %.loopexit.us ], [ %indvars.iv43, %.lr.ph11.split.us.preheader ]
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv49, i64 %indvars.iv45
  store double 0.000000e+00, double* %67, align 8
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv49, i64 %indvars.iv45
  br i1 %lcmp.mod71, label %.prol.loopexit69.unr-lcssa, label %.prol.preheader68

.prol.preheader68:                                ; preds = %.lr.ph11.split.us
  br label %69

; <label>:69:                                     ; preds = %.prol.preheader68
  %70 = load double, double* %65, align 8
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 0, i64 %indvars.iv45
  %72 = load double, double* %71, align 8
  %73 = fmul double %70, %72
  %74 = load double, double* %68, align 8
  %75 = fadd double %74, %73
  store double %75, double* %68, align 8
  br label %.prol.loopexit69.unr-lcssa

.prol.loopexit69.unr-lcssa:                       ; preds = %.lr.ph11.split.us, %69
  %indvars.iv35.unr.ph = phi i64 [ 1, %69 ], [ 0, %.lr.ph11.split.us ]
  br label %.prol.loopexit69

.prol.loopexit69:                                 ; preds = %.prol.loopexit69.unr-lcssa
  br i1 %27, label %.preheader.us, label %.lr.ph11.split.us.new

.lr.ph11.split.us.new:                            ; preds = %.prol.loopexit69
  br label %76

; <label>:76:                                     ; preds = %76, %.lr.ph11.split.us.new
  %indvars.iv35 = phi i64 [ %indvars.iv35.unr.ph, %.lr.ph11.split.us.new ], [ %indvars.iv.next36.1, %76 ]
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %12, i64 %indvars.iv35, i64 %indvars.iv49
  %78 = load double, double* %77, align 8
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv35, i64 %indvars.iv45
  %80 = load double, double* %79, align 8
  %81 = fmul double %78, %80
  %82 = load double, double* %68, align 8
  %83 = fadd double %82, %81
  store double %83, double* %68, align 8
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %84 = getelementptr inbounds [1200 x double], [1200 x double]* %12, i64 %indvars.iv.next36, i64 %indvars.iv49
  %85 = load double, double* %84, align 8
  %86 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv.next36, i64 %indvars.iv45
  %87 = load double, double* %86, align 8
  %88 = fmul double %85, %87
  %89 = load double, double* %68, align 8
  %90 = fadd double %89, %88
  store double %90, double* %68, align 8
  %exitcond61.1 = icmp eq i64 %indvars.iv.next36, %24
  %indvars.iv.next36.1 = add nsw i64 %indvars.iv35, 2
  br i1 %exitcond61.1, label %.preheader.us.unr-lcssa, label %76

.preheader.us.unr-lcssa:                          ; preds = %76
  br label %.preheader.us

.preheader.us:                                    ; preds = %.prol.loopexit69, %.preheader.us.unr-lcssa
  br i1 %14, label %.lr.ph10.us, label %.loopexit.us

.lr.ph10.us:                                      ; preds = %.preheader.us
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv49, i64 %indvars.iv45
  br i1 %lcmp.mod75, label %.prol.loopexit73.unr-lcssa, label %.prol.preheader72

.prol.preheader72:                                ; preds = %.lr.ph10.us
  br label %92

; <label>:92:                                     ; preds = %.prol.preheader72
  %93 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 0, i64 %indvars.iv45
  %94 = load double, double* %93, align 8
  %95 = load double, double* %66, align 8
  %96 = load double, double* %91, align 8
  %97 = fmul double %95, %96
  %98 = fsub double %94, %97
  store double %98, double* %93, align 8
  br label %.prol.loopexit73.unr-lcssa

.prol.loopexit73.unr-lcssa:                       ; preds = %.lr.ph10.us, %92
  %indvars.iv39.unr.ph = phi i64 [ 1, %92 ], [ 0, %.lr.ph10.us ]
  br label %.prol.loopexit73

.prol.loopexit73:                                 ; preds = %.prol.loopexit73.unr-lcssa
  br i1 %28, label %.loopexit.us.loopexit, label %.lr.ph10.us.new

.lr.ph10.us.new:                                  ; preds = %.prol.loopexit73
  br label %99

; <label>:99:                                     ; preds = %99, %.lr.ph10.us.new
  %indvars.iv39 = phi i64 [ %indvars.iv39.unr.ph, %.lr.ph10.us.new ], [ %indvars.iv.next40.1, %99 ]
  %100 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv39, i64 %indvars.iv45
  %101 = load double, double* %100, align 8
  %102 = getelementptr inbounds [1200 x double], [1200 x double]* %12, i64 %indvars.iv39, i64 %indvars.iv49
  %103 = load double, double* %102, align 8
  %104 = load double, double* %91, align 8
  %105 = fmul double %103, %104
  %106 = fsub double %101, %105
  store double %106, double* %100, align 8
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %107 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv.next40, i64 %indvars.iv45
  %108 = load double, double* %107, align 8
  %109 = getelementptr inbounds [1200 x double], [1200 x double]* %12, i64 %indvars.iv.next40, i64 %indvars.iv49
  %110 = load double, double* %109, align 8
  %111 = load double, double* %91, align 8
  %112 = fmul double %110, %111
  %113 = fsub double %108, %112
  store double %113, double* %107, align 8
  %exitcond62.1 = icmp eq i64 %indvars.iv.next40, %24
  %indvars.iv.next40.1 = add nsw i64 %indvars.iv39, 2
  br i1 %exitcond62.1, label %.loopexit.us.loopexit.unr-lcssa, label %99

.loopexit.us.loopexit.unr-lcssa:                  ; preds = %99
  br label %.loopexit.us.loopexit

.loopexit.us.loopexit:                            ; preds = %.prol.loopexit73, %.loopexit.us.loopexit.unr-lcssa
  br label %.loopexit.us

.loopexit.us:                                     ; preds = %.loopexit.us.loopexit, %.preheader.us
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond48 = icmp eq i64 %indvars.iv.next46, %wide.trip.count47
  br i1 %exitcond48, label %._crit_edge12.loopexit, label %.lr.ph11.split.us

; <label>:114:                                    ; preds = %114, %.lr.ph6.new
  %indvars.iv25 = phi i64 [ %indvars.iv25.unr.ph, %.lr.ph6.new ], [ %indvars.iv.next26.1, %114 ]
  %115 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv25, i64 %indvars.iv49
  %116 = load double, double* %115, align 8
  %117 = load double, double* %57, align 8
  %118 = fdiv double %116, %117
  %119 = getelementptr inbounds [1200 x double], [1200 x double]* %12, i64 %indvars.iv25, i64 %indvars.iv49
  store double %118, double* %119, align 8
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %120 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv.next26, i64 %indvars.iv49
  %121 = load double, double* %120, align 8
  %122 = load double, double* %57, align 8
  %123 = fdiv double %121, %122
  %124 = getelementptr inbounds [1200 x double], [1200 x double]* %12, i64 %indvars.iv.next26, i64 %indvars.iv49
  store double %123, double* %124, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next26, %19
  %indvars.iv.next26.1 = add nsw i64 %indvars.iv25, 2
  br i1 %exitcond.1, label %.preheader1.loopexit.unr-lcssa, label %114

._crit_edge12.loopexit23:                         ; preds = %.lr.ph11
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep60, i8 0, i64 %32, i32 8, i1 false)
  br label %._crit_edge12

._crit_edge12.loopexit:                           ; preds = %.loopexit.us
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %.preheader1, %._crit_edge12.loopexit23
  %exitcond52 = icmp eq i64 %indvars.iv.next50, %wide.trip.count51
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  br i1 %exitcond52, label %._crit_edge14.loopexit, label %.preheader2

._crit_edge14.loopexit:                           ; preds = %._crit_edge12
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %5
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %5) #6
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.preheader4.us.preheader, label %._crit_edge8

.preheader4.us.preheader:                         ; preds = %4
  %10 = sext i32 %1 to i64
  %wide.trip.count17 = zext i32 %1 to i64
  %wide.trip.count21 = zext i32 %1 to i64
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %._crit_edge7.us, %.preheader4.us.preheader
  %indvars.iv19 = phi i64 [ 0, %.preheader4.us.preheader ], [ %indvars.iv.next20, %._crit_edge7.us ]
  %11 = mul nsw i64 %indvars.iv19, %10
  br label %._crit_edge23

._crit_edge23:                                    ; preds = %._crit_edge, %.preheader4.us
  %indvars.iv15 = phi i64 [ 0, %.preheader4.us ], [ %indvars.iv.next16, %._crit_edge ]
  %12 = add nsw i64 %indvars.iv15, %11
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge

; <label>:16:                                     ; preds = %._crit_edge23
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge23, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv19, i64 %indvars.iv15
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next16, %wide.trip.count17
  br i1 %exitcond18, label %._crit_edge7.us, label %._crit_edge23

._crit_edge7.us:                                  ; preds = %._crit_edge
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next20, %wide.trip.count21
  br i1 %exitcond22, label %._crit_edge8.loopexit, label %.preheader4.us

._crit_edge8.loopexit:                            ; preds = %._crit_edge7.us
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %4
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %26 = icmp sgt i32 %0, 0
  %27 = icmp sgt i32 %1, 0
  %or.cond = and i1 %26, %27
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge5

.preheader.us.preheader:                          ; preds = %._crit_edge8
  %28 = sext i32 %1 to i64
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count12 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv10 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next11, %._crit_edge.us ]
  %29 = mul nsw i64 %indvars.iv10, %28
  br label %._crit_edge25

._crit_edge25:                                    ; preds = %._crit_edge24, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge24 ]
  %30 = add nsw i64 %indvars.iv, %29
  %31 = trunc i64 %30 to i32
  %32 = srem i32 %31, 20
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %34, label %._crit_edge24

; <label>:34:                                     ; preds = %._crit_edge25
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %35) #6
  br label %._crit_edge24

._crit_edge24:                                    ; preds = %._crit_edge25, %34
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv10, i64 %indvars.iv
  %38 = load double, double* %37, align 8
  %39 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %36, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %38) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge25

._crit_edge.us:                                   ; preds = %._crit_edge24
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next11, %wide.trip.count12
  br i1 %exitcond13, label %._crit_edge5.loopexit, label %.preheader.us

._crit_edge5.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.loopexit, %._crit_edge8
  %40 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %41 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %40, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %43 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %42) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
