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
  br i1 %9, label %10, label %16

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %16

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %5 to [1200 x double]*
  %15 = bitcast i8* %4 to [1200 x double]*
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %15, [1200 x double]* %14)
  br label %16

; <label>:16:                                     ; preds = %10, %13, %2
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
  %12 = zext i32 %0 to i64
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
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next12, %11
  br i1 %exitcond21, label %._crit_edge5.us, label %13

._crit_edge5.us:                                  ; preds = %13
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next16, %12
  br i1 %exitcond22, label %.preheader1.loopexit, label %.preheader2.us

.preheader1.loopexit:                             ; preds = %._crit_edge5.us
  br label %.preheader1

.preheader1:                                      ; preds = %.preheader1.loopexit, %5
  %23 = icmp sgt i32 %1, 0
  br i1 %23, label %.preheader.us.preheader, label %._crit_edge3

.preheader.us.preheader:                          ; preds = %.preheader1
  %24 = zext i32 %1 to i64
  %25 = zext i32 %1 to i64
  %26 = shl nuw nsw i64 %24, 3
  %27 = add nsw i64 %24, -1
  %xtraiter = and i64 %24, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.preheader.us.prol.loopexit, label %._crit_edge.us.prol.preheader

._crit_edge.us.prol.preheader:                    ; preds = %.preheader.us.preheader
  br label %._crit_edge.us.prol

._crit_edge.us.prol:                              ; preds = %._crit_edge.us.prol.preheader, %._crit_edge.us.prol
  %indvars.iv7.prol = phi i64 [ %indvars.iv.next8.prol, %._crit_edge.us.prol ], [ 0, %._crit_edge.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %._crit_edge.us.prol ], [ %xtraiter, %._crit_edge.us.prol.preheader ]
  %scevgep.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv7.prol, i64 0
  %scevgep23.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep23.prol, i8 0, i64 %26, i32 8, i1 false)
  %indvars.iv.next8.prol = add nuw nsw i64 %indvars.iv7.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader.us.prol.loopexit.loopexit, label %._crit_edge.us.prol, !llvm.loop !1

.preheader.us.prol.loopexit.loopexit:             ; preds = %._crit_edge.us.prol
  br label %.preheader.us.prol.loopexit

.preheader.us.prol.loopexit:                      ; preds = %.preheader.us.prol.loopexit.loopexit, %.preheader.us.preheader
  %indvars.iv7.unr = phi i64 [ 0, %.preheader.us.preheader ], [ %xtraiter, %.preheader.us.prol.loopexit.loopexit ]
  %28 = icmp ult i64 %27, 3
  br i1 %28, label %._crit_edge3, label %._crit_edge.us.3.preheader

._crit_edge.us.3.preheader:                       ; preds = %.preheader.us.prol.loopexit
  %29 = add nsw i64 %24, -4
  %30 = sub nsw i64 %29, %indvars.iv7.unr
  %31 = lshr i64 %30, 2
  %32 = and i64 %31, 1
  %lcmp.mod27 = icmp eq i64 %32, 0
  br i1 %lcmp.mod27, label %._crit_edge.us.3.prol.preheader, label %._crit_edge.us.3.prol.loopexit

._crit_edge.us.3.prol.preheader:                  ; preds = %._crit_edge.us.3.preheader
  br label %._crit_edge.us.3.prol

._crit_edge.us.3.prol:                            ; preds = %._crit_edge.us.3.prol.preheader
  %scevgep.prol29 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv7.unr, i64 0
  %scevgep23.prol30 = bitcast double* %scevgep.prol29 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep23.prol30, i8 0, i64 %26, i32 8, i1 false)
  %indvars.iv.next8.prol31 = add nuw nsw i64 %indvars.iv7.unr, 1
  %scevgep.1.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next8.prol31, i64 0
  %scevgep23.1.prol = bitcast double* %scevgep.1.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep23.1.prol, i8 0, i64 %26, i32 8, i1 false)
  %indvars.iv.next8.1.prol = add nuw nsw i64 %indvars.iv7.unr, 2
  %scevgep.2.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next8.1.prol, i64 0
  %scevgep23.2.prol = bitcast double* %scevgep.2.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep23.2.prol, i8 0, i64 %26, i32 8, i1 false)
  %indvars.iv.next8.2.prol = add nuw nsw i64 %indvars.iv7.unr, 3
  %scevgep.3.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next8.2.prol, i64 0
  %scevgep23.3.prol = bitcast double* %scevgep.3.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep23.3.prol, i8 0, i64 %26, i32 8, i1 false)
  %indvars.iv.next8.3.prol = or i64 %indvars.iv7.unr, 4
  br label %._crit_edge.us.3.prol.loopexit

._crit_edge.us.3.prol.loopexit:                   ; preds = %._crit_edge.us.3.prol, %._crit_edge.us.3.preheader
  %indvars.iv7.unr32 = phi i64 [ %indvars.iv7.unr, %._crit_edge.us.3.preheader ], [ %indvars.iv.next8.3.prol, %._crit_edge.us.3.prol ]
  %33 = icmp eq i64 %31, 0
  br i1 %33, label %._crit_edge3.loopexit, label %._crit_edge.us.3.preheader.new

._crit_edge.us.3.preheader.new:                   ; preds = %._crit_edge.us.3.prol.loopexit
  br label %._crit_edge.us.3

._crit_edge3.loopexit.unr-lcssa:                  ; preds = %._crit_edge.us.3
  br label %._crit_edge3.loopexit

._crit_edge3.loopexit:                            ; preds = %._crit_edge.us.3.prol.loopexit, %._crit_edge3.loopexit.unr-lcssa
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.loopexit, %.preheader2.lr.ph, %.preheader.us.prol.loopexit, %.preheader1
  ret void

._crit_edge.us.3:                                 ; preds = %._crit_edge.us.3, %._crit_edge.us.3.preheader.new
  %indvars.iv7 = phi i64 [ %indvars.iv7.unr32, %._crit_edge.us.3.preheader.new ], [ %indvars.iv.next8.3.1, %._crit_edge.us.3 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv7, i64 0
  %scevgep23 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep23, i8 0, i64 %26, i32 8, i1 false)
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next8, i64 0
  %scevgep23.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep23.1, i8 0, i64 %26, i32 8, i1 false)
  %indvars.iv.next8.1 = add nsw i64 %indvars.iv7, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next8.1, i64 0
  %scevgep23.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep23.2, i8 0, i64 %26, i32 8, i1 false)
  %indvars.iv.next8.2 = add nsw i64 %indvars.iv7, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next8.2, i64 0
  %scevgep23.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep23.3, i8 0, i64 %26, i32 8, i1 false)
  %indvars.iv.next8.3 = add nsw i64 %indvars.iv7, 4
  %scevgep.133 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next8.3, i64 0
  %scevgep23.134 = bitcast double* %scevgep.133 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep23.134, i8 0, i64 %26, i32 8, i1 false)
  %indvars.iv.next8.135 = add nsw i64 %indvars.iv7, 5
  %scevgep.1.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next8.135, i64 0
  %scevgep23.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep23.1.1, i8 0, i64 %26, i32 8, i1 false)
  %indvars.iv.next8.1.1 = add nsw i64 %indvars.iv7, 6
  %scevgep.2.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next8.1.1, i64 0
  %scevgep23.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep23.2.1, i8 0, i64 %26, i32 8, i1 false)
  %indvars.iv.next8.2.1 = add nsw i64 %indvars.iv7, 7
  %scevgep.3.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next8.2.1, i64 0
  %scevgep23.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep23.3.1, i8 0, i64 %26, i32 8, i1 false)
  %indvars.iv.next8.3.1 = add nsw i64 %indvars.iv7, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next8.3.1, %25
  br i1 %exitcond.3.1, label %._crit_edge3.loopexit.unr-lcssa, label %._crit_edge.us.3
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
  %17 = zext i32 %0 to i64
  %18 = zext i32 %0 to i64
  %19 = zext i32 %1 to i64
  %20 = zext i32 %1 to i64
  %21 = add nsw i64 %16, -1
  %22 = shl nuw nsw i64 %20, 3
  %23 = add nsw i64 %22, -8
  %xtraiter = and i64 %16, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %24 = icmp ult i64 %21, 3
  %xtraiter62 = and i64 %16, 1
  %lcmp.mod63 = icmp eq i64 %xtraiter62, 0
  %25 = icmp eq i64 %21, 0
  %xtraiter67 = and i64 %16, 1
  %lcmp.mod68 = icmp eq i64 %xtraiter67, 0
  %26 = icmp eq i64 %21, 0
  %xtraiter71 = and i64 %16, 1
  %lcmp.mod72 = icmp eq i64 %xtraiter71, 0
  %27 = icmp eq i64 %21, 0
  br label %.preheader2

.preheader2:                                      ; preds = %._crit_edge12, %.preheader2.lr.ph
  %indvars.iv49 = phi i64 [ 0, %.preheader2.lr.ph ], [ %indvars.iv.next50, %._crit_edge12 ]
  %indvars.iv43 = phi i64 [ 1, %.preheader2.lr.ph ], [ %indvars.iv.next44, %._crit_edge12 ]
  %28 = mul i64 %indvars.iv49, 1201
  %29 = add i64 %28, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 0, i64 %29
  %scevgep64 = bitcast double* %scevgep to i8*
  %30 = mul i64 %indvars.iv49, -8
  %31 = add i64 %23, %30
  br i1 %9, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader2
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %32 = phi double [ %36, %.prol.preheader ], [ 0.000000e+00, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv.prol, i64 %indvars.iv49
  %34 = load double, double* %33, align 8
  %35 = fmul double %34, %34
  %36 = fadd double %32, %35
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %.lcssa53.unr = phi double [ undef, %.lr.ph ], [ %36, %.prol.loopexit.loopexit ]
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %xtraiter, %.prol.loopexit.loopexit ]
  %.unr = phi double [ 0.000000e+00, %.lr.ph ], [ %36, %.prol.loopexit.loopexit ]
  br i1 %24, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ %indvars.iv.unr, %.lr.ph.new.preheader ]
  %37 = phi double [ %53, %.lr.ph.new ], [ %.unr, %.lr.ph.new.preheader ]
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv, i64 %indvars.iv49
  %39 = load double, double* %38, align 8
  %40 = fmul double %39, %39
  %41 = fadd double %37, %40
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv.next, i64 %indvars.iv49
  %43 = load double, double* %42, align 8
  %44 = fmul double %43, %43
  %45 = fadd double %41, %44
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv.next.1, i64 %indvars.iv49
  %47 = load double, double* %46, align 8
  %48 = fmul double %47, %47
  %49 = fadd double %45, %48
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv.next.2, i64 %indvars.iv49
  %51 = load double, double* %50, align 8
  %52 = fmul double %51, %51
  %53 = fadd double %49, %52
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond54.3 = icmp eq i64 %indvars.iv.next.3, %16
  br i1 %exitcond54.3, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %.preheader2
  %.lcssa = phi double [ 0.000000e+00, %.preheader2 ], [ %.lcssa53.unr, %.prol.loopexit ], [ %53, %._crit_edge.loopexit ]
  %54 = tail call double @sqrt(double %.lcssa) #4
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv49, i64 %indvars.iv49
  store double %54, double* %55, align 8
  br i1 %11, label %.lr.ph6, label %.preheader1

.lr.ph6:                                          ; preds = %._crit_edge
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv49, i64 %indvars.iv49
  br i1 %lcmp.mod63, label %.prol.loopexit61, label %.prol.preheader60

.prol.preheader60:                                ; preds = %.lr.ph6
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 0, i64 %indvars.iv49
  %58 = load double, double* %57, align 8
  %59 = load double, double* %56, align 8
  %60 = fdiv double %58, %59
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %12, i64 0, i64 %indvars.iv49
  store double %60, double* %61, align 8
  br label %.prol.loopexit61

.prol.loopexit61:                                 ; preds = %.prol.preheader60, %.lr.ph6
  %indvars.iv25.unr.ph = phi i64 [ 1, %.prol.preheader60 ], [ 0, %.lr.ph6 ]
  br i1 %25, label %.preheader1, label %.lr.ph6.new.preheader

.lr.ph6.new.preheader:                            ; preds = %.prol.loopexit61
  br label %.lr.ph6.new

.preheader1.loopexit:                             ; preds = %.lr.ph6.new
  br label %.preheader1

.preheader1:                                      ; preds = %.preheader1.loopexit, %.prol.loopexit61, %._crit_edge
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %62 = icmp slt i64 %indvars.iv.next50, %15
  br i1 %62, label %.lr.ph11, label %._crit_edge12

.lr.ph11:                                         ; preds = %.preheader1
  br i1 %13, label %.lr.ph11.split.us.preheader, label %._crit_edge12.loopexit23

.lr.ph11.split.us.preheader:                      ; preds = %.lr.ph11
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %12, i64 0, i64 %indvars.iv49
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %12, i64 0, i64 %indvars.iv49
  br label %.lr.ph11.split.us

.lr.ph11.split.us:                                ; preds = %.lr.ph11.split.us.preheader, %.loopexit.us
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %.loopexit.us ], [ %indvars.iv43, %.lr.ph11.split.us.preheader ]
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv49, i64 %indvars.iv45
  store double 0.000000e+00, double* %65, align 8
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv49, i64 %indvars.iv45
  br i1 %lcmp.mod68, label %.prol.loopexit66, label %.prol.preheader65

.prol.preheader65:                                ; preds = %.lr.ph11.split.us
  %67 = load double, double* %64, align 8
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 0, i64 %indvars.iv45
  %69 = load double, double* %68, align 8
  %70 = fmul double %67, %69
  %71 = load double, double* %66, align 8
  %72 = fadd double %71, %70
  store double %72, double* %66, align 8
  br label %.prol.loopexit66

.prol.loopexit66:                                 ; preds = %.prol.preheader65, %.lr.ph11.split.us
  %indvars.iv35.unr.ph = phi i64 [ 1, %.prol.preheader65 ], [ 0, %.lr.ph11.split.us ]
  br i1 %26, label %.preheader.us, label %.lr.ph11.split.us.new.preheader

.lr.ph11.split.us.new.preheader:                  ; preds = %.prol.loopexit66
  br label %.lr.ph11.split.us.new

.lr.ph11.split.us.new:                            ; preds = %.lr.ph11.split.us.new.preheader, %.lr.ph11.split.us.new
  %indvars.iv35 = phi i64 [ %indvars.iv.next36.1, %.lr.ph11.split.us.new ], [ %indvars.iv35.unr.ph, %.lr.ph11.split.us.new.preheader ]
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %12, i64 %indvars.iv35, i64 %indvars.iv49
  %74 = load double, double* %73, align 8
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv35, i64 %indvars.iv45
  %76 = load double, double* %75, align 8
  %77 = fmul double %74, %76
  %78 = load double, double* %66, align 8
  %79 = fadd double %78, %77
  store double %79, double* %66, align 8
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %12, i64 %indvars.iv.next36, i64 %indvars.iv49
  %81 = load double, double* %80, align 8
  %82 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv.next36, i64 %indvars.iv45
  %83 = load double, double* %82, align 8
  %84 = fmul double %81, %83
  %85 = load double, double* %66, align 8
  %86 = fadd double %85, %84
  store double %86, double* %66, align 8
  %indvars.iv.next36.1 = add nuw nsw i64 %indvars.iv35, 2
  %exitcond56.1 = icmp eq i64 %indvars.iv.next36.1, %18
  br i1 %exitcond56.1, label %.preheader.us.loopexit, label %.lr.ph11.split.us.new

.preheader.us.loopexit:                           ; preds = %.lr.ph11.split.us.new
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.loopexit, %.prol.loopexit66
  br i1 %14, label %.lr.ph10.us, label %.loopexit.us

.lr.ph10.us:                                      ; preds = %.preheader.us
  %87 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv49, i64 %indvars.iv45
  br i1 %lcmp.mod72, label %.prol.loopexit70, label %.prol.preheader69

.prol.preheader69:                                ; preds = %.lr.ph10.us
  %88 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 0, i64 %indvars.iv45
  %89 = load double, double* %88, align 8
  %90 = load double, double* %63, align 8
  %91 = load double, double* %87, align 8
  %92 = fmul double %90, %91
  %93 = fsub double %89, %92
  store double %93, double* %88, align 8
  br label %.prol.loopexit70

.prol.loopexit70:                                 ; preds = %.prol.preheader69, %.lr.ph10.us
  %indvars.iv39.unr.ph = phi i64 [ 1, %.prol.preheader69 ], [ 0, %.lr.ph10.us ]
  br i1 %27, label %.loopexit.us, label %.lr.ph10.us.new.preheader

.lr.ph10.us.new.preheader:                        ; preds = %.prol.loopexit70
  br label %.lr.ph10.us.new

.lr.ph10.us.new:                                  ; preds = %.lr.ph10.us.new.preheader, %.lr.ph10.us.new
  %indvars.iv39 = phi i64 [ %indvars.iv.next40.1, %.lr.ph10.us.new ], [ %indvars.iv39.unr.ph, %.lr.ph10.us.new.preheader ]
  %94 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv39, i64 %indvars.iv45
  %95 = load double, double* %94, align 8
  %96 = getelementptr inbounds [1200 x double], [1200 x double]* %12, i64 %indvars.iv39, i64 %indvars.iv49
  %97 = load double, double* %96, align 8
  %98 = load double, double* %87, align 8
  %99 = fmul double %97, %98
  %100 = fsub double %95, %99
  store double %100, double* %94, align 8
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %101 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv.next40, i64 %indvars.iv45
  %102 = load double, double* %101, align 8
  %103 = getelementptr inbounds [1200 x double], [1200 x double]* %12, i64 %indvars.iv.next40, i64 %indvars.iv49
  %104 = load double, double* %103, align 8
  %105 = load double, double* %87, align 8
  %106 = fmul double %104, %105
  %107 = fsub double %102, %106
  store double %107, double* %101, align 8
  %indvars.iv.next40.1 = add nuw nsw i64 %indvars.iv39, 2
  %exitcond57.1 = icmp eq i64 %indvars.iv.next40.1, %18
  br i1 %exitcond57.1, label %.loopexit.us.loopexit, label %.lr.ph10.us.new

.loopexit.us.loopexit:                            ; preds = %.lr.ph10.us.new
  br label %.loopexit.us

.loopexit.us:                                     ; preds = %.loopexit.us.loopexit, %.prol.loopexit70, %.preheader.us
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond58 = icmp eq i64 %indvars.iv.next46, %19
  br i1 %exitcond58, label %._crit_edge12.loopexit, label %.lr.ph11.split.us

.lr.ph6.new:                                      ; preds = %.lr.ph6.new.preheader, %.lr.ph6.new
  %indvars.iv25 = phi i64 [ %indvars.iv.next26.1, %.lr.ph6.new ], [ %indvars.iv25.unr.ph, %.lr.ph6.new.preheader ]
  %108 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv25, i64 %indvars.iv49
  %109 = load double, double* %108, align 8
  %110 = load double, double* %56, align 8
  %111 = fdiv double %109, %110
  %112 = getelementptr inbounds [1200 x double], [1200 x double]* %12, i64 %indvars.iv25, i64 %indvars.iv49
  store double %111, double* %112, align 8
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %113 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv.next26, i64 %indvars.iv49
  %114 = load double, double* %113, align 8
  %115 = load double, double* %56, align 8
  %116 = fdiv double %114, %115
  %117 = getelementptr inbounds [1200 x double], [1200 x double]* %12, i64 %indvars.iv.next26, i64 %indvars.iv49
  store double %116, double* %117, align 8
  %indvars.iv.next26.1 = add nuw nsw i64 %indvars.iv25, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next26.1, %17
  br i1 %exitcond.1, label %.preheader1.loopexit, label %.lr.ph6.new

._crit_edge12.loopexit23:                         ; preds = %.lr.ph11
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep64, i8 0, i64 %31, i32 8, i1 false)
  br label %._crit_edge12

._crit_edge12.loopexit:                           ; preds = %.loopexit.us
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %._crit_edge12.loopexit23, %.preheader1
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond59 = icmp eq i64 %indvars.iv.next50, %20
  br i1 %exitcond59, label %._crit_edge14.loopexit, label %.preheader2

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
  %11 = zext i32 %1 to i64
  %12 = zext i32 %1 to i64
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %._crit_edge7.us, %.preheader4.us.preheader
  %indvars.iv19 = phi i64 [ 0, %.preheader4.us.preheader ], [ %indvars.iv.next20, %._crit_edge7.us ]
  %13 = mul nsw i64 %indvars.iv19, %10
  br label %14

; <label>:14:                                     ; preds = %21, %.preheader4.us
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %21 ], [ 0, %.preheader4.us ]
  %15 = add nsw i64 %indvars.iv15, %13
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, 20
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %21

; <label>:19:                                     ; preds = %14
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %20) #6
  br label %21

; <label>:21:                                     ; preds = %19, %14
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv19, i64 %indvars.iv15
  %24 = load double, double* %23, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %24) #6
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next16, %11
  br i1 %exitcond24, label %._crit_edge7.us, label %14

._crit_edge7.us:                                  ; preds = %21
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next20, %12
  br i1 %exitcond25, label %._crit_edge8.loopexit, label %.preheader4.us

._crit_edge8.loopexit:                            ; preds = %._crit_edge7.us
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %4
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %29 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %30 = icmp sgt i32 %0, 0
  %31 = icmp sgt i32 %1, 0
  %or.cond = and i1 %30, %31
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge5

.preheader.us.preheader:                          ; preds = %._crit_edge8
  %32 = sext i32 %1 to i64
  %33 = zext i32 %1 to i64
  %34 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv10 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next11, %._crit_edge.us ]
  %35 = mul nsw i64 %indvars.iv10, %32
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
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %42) #6
  br label %43

; <label>:43:                                     ; preds = %41, %36
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv10, i64 %indvars.iv
  %46 = load double, double* %45, align 8
  %47 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %44, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %46) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next, %33
  br i1 %exitcond23, label %._crit_edge.us, label %36

._crit_edge.us:                                   ; preds = %43
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond = icmp eq i64 %indvars.iv.next11, %34
  br i1 %exitcond, label %._crit_edge5.loopexit, label %.preheader.us

._crit_edge5.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.loopexit, %._crit_edge8
  %48 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %49 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %48, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %51 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %50) #6
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
