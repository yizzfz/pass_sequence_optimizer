; ModuleID = 'A.ll'
source_filename = "cholesky.c"
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

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_cholesky(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %._crit_edge

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %6
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %4)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader14.lr.ph, label %._crit_edge42.thread

._crit_edge42.thread:                             ; preds = %2
  %4 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %._crit_edge17

.preheader14.lr.ph:                               ; preds = %2
  %5 = sitofp i32 %0 to double
  %6 = add i32 %0, -2
  %7 = zext i32 %6 to i64
  %8 = sext i32 %0 to i64
  %wide.trip.count87 = zext i32 %0 to i64
  br label %.lr.ph36

.lr.ph36:                                         ; preds = %._crit_edge40, %.preheader14.lr.ph
  %indvars.iv85 = phi i64 [ 0, %.preheader14.lr.ph ], [ %indvars.iv.next86, %._crit_edge40 ]
  %indvars.iv83 = phi i64 [ 1, %.preheader14.lr.ph ], [ %indvars.iv.next84, %._crit_edge40 ]
  %9 = mul nuw nsw i64 %indvars.iv85, 2001
  %10 = add nuw nsw i64 %9, 1
  %scevgep81 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %10
  %11 = sub i64 %7, %indvars.iv85
  %12 = shl i64 %11, 3
  %13 = and i64 %12, 34359738360
  br label %._crit_edge

.preheader13:                                     ; preds = %._crit_edge
  %indvars.iv.next86 = add nuw nsw i64 %indvars.iv85, 1
  %14 = icmp slt i64 %indvars.iv.next86, %8
  br i1 %14, label %._crit_edge40.loopexit, label %._crit_edge40

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph36
  %indvars.iv69 = phi i64 [ 0, %.lr.ph36 ], [ %indvars.iv.next70, %._crit_edge ]
  %15 = sub nsw i64 0, %indvars.iv69
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, %0
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, %5
  %20 = fadd double %19, 1.000000e+00
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv85, i64 %indvars.iv69
  store double %20, double* %21, align 8
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond74 = icmp eq i64 %indvars.iv.next70, %indvars.iv83
  br i1 %exitcond74, label %.preheader13, label %._crit_edge

._crit_edge40.loopexit:                           ; preds = %.preheader13
  %22 = add nuw nsw i64 %13, 8
  %scevgep8182 = bitcast double* %scevgep81 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep8182, i8 0, i64 %22, i32 8, i1 false)
  br label %._crit_edge40

._crit_edge40:                                    ; preds = %.preheader13, %._crit_edge40.loopexit
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv85, i64 %indvars.iv85
  store double 1.000000e+00, double* %23, align 8
  %exitcond88 = icmp eq i64 %indvars.iv.next86, %wide.trip.count87
  %indvars.iv.next84 = add nuw nsw i64 %indvars.iv83, 1
  br i1 %exitcond88, label %._crit_edge42, label %.lr.ph36

._crit_edge42:                                    ; preds = %._crit_edge40
  %24 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %25 = bitcast i8* %24 to [2000 x [2000 x double]]*
  br i1 true, label %.preheader12.us.preheader, label %._crit_edge42.._crit_edge17_crit_edge

._crit_edge42.._crit_edge17_crit_edge:            ; preds = %._crit_edge42
  br label %._crit_edge17

.preheader12.us.preheader:                        ; preds = %._crit_edge42
  %26 = add i32 %0, -1
  %27 = zext i32 %26 to i64
  %28 = shl nuw nsw i64 %27, 3
  %29 = add nuw nsw i64 %28, 8
  %30 = add nsw i64 %wide.trip.count87, -1
  %xtraiter140 = and i64 %wide.trip.count87, 7
  %lcmp.mod141 = icmp eq i64 %xtraiter140, 0
  br i1 %lcmp.mod141, label %._crit_edge33.us.prol.loopexit, label %._crit_edge33.us.prol.preheader

._crit_edge33.us.prol.preheader:                  ; preds = %.preheader12.us.preheader
  br label %._crit_edge33.us.prol

._crit_edge33.us.prol:                            ; preds = %._crit_edge33.us.prol, %._crit_edge33.us.prol.preheader
  %indvars.iv65.prol = phi i64 [ 0, %._crit_edge33.us.prol.preheader ], [ %indvars.iv.next66.prol, %._crit_edge33.us.prol ]
  %prol.iter142 = phi i64 [ %xtraiter140, %._crit_edge33.us.prol.preheader ], [ %prol.iter142.sub, %._crit_edge33.us.prol ]
  %31 = mul nuw nsw i64 %indvars.iv65.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %24, i64 %31
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %29, i32 8, i1 false)
  %indvars.iv.next66.prol = add nuw nsw i64 %indvars.iv65.prol, 1
  %prol.iter142.sub = add i64 %prol.iter142, -1
  %prol.iter142.cmp = icmp eq i64 %prol.iter142.sub, 0
  br i1 %prol.iter142.cmp, label %._crit_edge33.us.prol.loopexit.unr-lcssa, label %._crit_edge33.us.prol, !llvm.loop !1

._crit_edge33.us.prol.loopexit.unr-lcssa:         ; preds = %._crit_edge33.us.prol
  br label %._crit_edge33.us.prol.loopexit

._crit_edge33.us.prol.loopexit:                   ; preds = %.preheader12.us.preheader, %._crit_edge33.us.prol.loopexit.unr-lcssa
  %indvars.iv65.unr = phi i64 [ 0, %.preheader12.us.preheader ], [ %indvars.iv.next66.prol, %._crit_edge33.us.prol.loopexit.unr-lcssa ]
  %32 = icmp ult i64 %30, 7
  br i1 %32, label %.preheader11, label %.preheader12.us.preheader.new

.preheader12.us.preheader.new:                    ; preds = %._crit_edge33.us.prol.loopexit
  br label %._crit_edge33.us

._crit_edge33.us:                                 ; preds = %._crit_edge33.us, %.preheader12.us.preheader.new
  %indvars.iv65 = phi i64 [ %indvars.iv65.unr, %.preheader12.us.preheader.new ], [ %indvars.iv.next66.7, %._crit_edge33.us ]
  %33 = mul nuw nsw i64 %indvars.iv65, 16000
  %scevgep = getelementptr i8, i8* %24, i64 %33
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %29, i32 8, i1 false)
  %34 = mul i64 %indvars.iv65, 16000
  %35 = add i64 %34, 16000
  %scevgep.1 = getelementptr i8, i8* %24, i64 %35
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %29, i32 8, i1 false)
  %36 = mul i64 %indvars.iv65, 16000
  %37 = add i64 %36, 32000
  %scevgep.2 = getelementptr i8, i8* %24, i64 %37
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %29, i32 8, i1 false)
  %38 = mul i64 %indvars.iv65, 16000
  %39 = add i64 %38, 48000
  %scevgep.3 = getelementptr i8, i8* %24, i64 %39
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %29, i32 8, i1 false)
  %40 = mul i64 %indvars.iv65, 16000
  %41 = add i64 %40, 64000
  %scevgep.4 = getelementptr i8, i8* %24, i64 %41
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 %29, i32 8, i1 false)
  %42 = mul i64 %indvars.iv65, 16000
  %43 = add i64 %42, 80000
  %scevgep.5 = getelementptr i8, i8* %24, i64 %43
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 %29, i32 8, i1 false)
  %44 = mul i64 %indvars.iv65, 16000
  %45 = add i64 %44, 96000
  %scevgep.6 = getelementptr i8, i8* %24, i64 %45
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 %29, i32 8, i1 false)
  %46 = mul i64 %indvars.iv65, 16000
  %47 = add i64 %46, 112000
  %scevgep.7 = getelementptr i8, i8* %24, i64 %47
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 %29, i32 8, i1 false)
  %indvars.iv.next66.7 = add nsw i64 %indvars.iv65, 8
  %exitcond68.7 = icmp eq i64 %indvars.iv.next66.7, %wide.trip.count87
  br i1 %exitcond68.7, label %.preheader11.unr-lcssa, label %._crit_edge33.us

.preheader11.unr-lcssa:                           ; preds = %._crit_edge33.us
  br label %.preheader11

.preheader11:                                     ; preds = %._crit_edge33.us.prol.loopexit, %.preheader11.unr-lcssa
  br i1 true, label %.preheader9.us.us.preheader.preheader, label %.preheader11.._crit_edge17_crit_edge

.preheader11.._crit_edge17_crit_edge:             ; preds = %.preheader11
  br label %._crit_edge17

.preheader9.us.us.preheader.preheader:            ; preds = %.preheader11
  %48 = shl nuw nsw i64 %wide.trip.count87, 3
  %49 = add nsw i64 %wide.trip.count87, -1
  %min.iters.check = icmp ult i32 %0, 4
  %50 = and i32 %0, 3
  %n.mod.vf = zext i32 %50 to i64
  %n.vec = sub nsw i64 %wide.trip.count87, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i32 %50, 0
  br label %.preheader9.us.us.preheader

.preheader9.us.us.preheader:                      ; preds = %.preheader9.us.us.preheader.preheader, %._crit_edge22.us
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %._crit_edge22.us ], [ 0, %.preheader9.us.us.preheader.preheader ]
  %scevgep97 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv57
  %scevgep9798 = bitcast double* %scevgep97 to i8*
  %51 = add nsw i64 %indvars.iv57, -1999
  %scevgep99 = getelementptr [2000 x double], [2000 x double]* %1, i64 %wide.trip.count87, i64 %51
  %scevgep99100 = bitcast double* %scevgep99 to i8*
  br label %.preheader9.us.us

._crit_edge22.us:                                 ; preds = %._crit_edge20.us.us
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next58, %wide.trip.count87
  br i1 %exitcond60, label %.preheader8, label %.preheader9.us.us.preheader

.preheader9.us.us:                                ; preds = %._crit_edge20.us.us, %.preheader9.us.us.preheader
  %indvars.iv53 = phi i64 [ 0, %.preheader9.us.us.preheader ], [ %indvars.iv.next54, %._crit_edge20.us.us ]
  %52 = mul nuw nsw i64 %indvars.iv53, 16000
  %scevgep95 = getelementptr i8, i8* %24, i64 %52
  %53 = add i64 %48, %52
  %scevgep96 = getelementptr i8, i8* %24, i64 %53
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv53, i64 %indvars.iv57
  br i1 %min.iters.check, label %._crit_edge90.preheader, label %min.iters.checked

._crit_edge90.preheader:                          ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader9.us.us
  %indvars.iv49.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader9.us.us ], [ %n.vec, %middle.block ]
  %55 = sub nsw i64 %wide.trip.count87, %indvars.iv49.ph
  %xtraiter138 = and i64 %55, 1
  %lcmp.mod139 = icmp eq i64 %xtraiter138, 0
  br i1 %lcmp.mod139, label %._crit_edge90.prol.loopexit.unr-lcssa, label %._crit_edge90.prol.preheader

._crit_edge90.prol.preheader:                     ; preds = %._crit_edge90.preheader
  br label %._crit_edge90.prol

._crit_edge90.prol:                               ; preds = %._crit_edge90.prol.preheader
  %56 = load double, double* %54, align 8
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv49.ph, i64 %indvars.iv57
  %58 = load double, double* %57, align 8
  %59 = fmul double %56, %58
  %60 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv53, i64 %indvars.iv49.ph
  %61 = load double, double* %60, align 8
  %62 = fadd double %61, %59
  store double %62, double* %60, align 8
  %indvars.iv.next50.prol = add nuw nsw i64 %indvars.iv49.ph, 1
  br label %._crit_edge90.prol.loopexit.unr-lcssa

._crit_edge90.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge90.preheader, %._crit_edge90.prol
  %indvars.iv49.unr.ph = phi i64 [ %indvars.iv.next50.prol, %._crit_edge90.prol ], [ %indvars.iv49.ph, %._crit_edge90.preheader ]
  br label %._crit_edge90.prol.loopexit

._crit_edge90.prol.loopexit:                      ; preds = %._crit_edge90.prol.loopexit.unr-lcssa
  %63 = icmp eq i64 %49, %indvars.iv49.ph
  br i1 %63, label %._crit_edge20.us.us.loopexit, label %._crit_edge90.preheader.new

._crit_edge90.preheader.new:                      ; preds = %._crit_edge90.prol.loopexit
  br label %._crit_edge90

min.iters.checked:                                ; preds = %.preheader9.us.us
  br i1 %cmp.zero, label %._crit_edge90.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult i8* %scevgep95, %scevgep99100
  %bound1 = icmp ult i8* %scevgep9798, %scevgep96
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %54 to i8*
  %bound0102 = icmp ult i8* %scevgep95, %bc
  %bound1103 = icmp ult i8* %bc, %scevgep96
  %found.conflict104 = and i1 %bound0102, %bound1103
  %conflict.rdx = or i1 %found.conflict, %found.conflict104
  br i1 %conflict.rdx, label %._crit_edge90.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %.pre = load double, double* %54, align 8, !alias.scope !3
  %64 = insertelement <2 x double> undef, double %.pre, i32 0
  %65 = shufflevector <2 x double> %64, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %66 = or i64 %index, 1
  %67 = or i64 %index, 2
  %68 = or i64 %index, 3
  %69 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %index, i64 %indvars.iv57
  %70 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %66, i64 %indvars.iv57
  %71 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %67, i64 %indvars.iv57
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %68, i64 %indvars.iv57
  %73 = load double, double* %69, align 8, !alias.scope !6
  %74 = load double, double* %70, align 8, !alias.scope !6
  %75 = load double, double* %71, align 8, !alias.scope !6
  %76 = load double, double* %72, align 8, !alias.scope !6
  %77 = insertelement <2 x double> undef, double %73, i32 0
  %78 = insertelement <2 x double> %77, double %74, i32 1
  %79 = insertelement <2 x double> undef, double %75, i32 0
  %80 = insertelement <2 x double> %79, double %76, i32 1
  %81 = fmul <2 x double> %65, %78
  %82 = fmul <2 x double> %65, %80
  %83 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv53, i64 %index
  %84 = bitcast double* %83 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %84, align 8, !alias.scope !8, !noalias !10
  %85 = getelementptr double, double* %83, i64 2
  %86 = bitcast double* %85 to <2 x double>*
  %wide.load106 = load <2 x double>, <2 x double>* %86, align 8, !alias.scope !8, !noalias !10
  %87 = fadd <2 x double> %wide.load, %81
  %88 = fadd <2 x double> %wide.load106, %82
  store <2 x double> %87, <2 x double>* %84, align 8, !alias.scope !8, !noalias !10
  store <2 x double> %88, <2 x double>* %86, align 8, !alias.scope !8, !noalias !10
  %index.next = add i64 %index, 4
  %89 = icmp eq i64 %index.next, %n.vec
  br i1 %89, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge20.us.us, label %._crit_edge90.preheader

._crit_edge20.us.us.loopexit.unr-lcssa:           ; preds = %._crit_edge90
  br label %._crit_edge20.us.us.loopexit

._crit_edge20.us.us.loopexit:                     ; preds = %._crit_edge90.prol.loopexit, %._crit_edge20.us.us.loopexit.unr-lcssa
  br label %._crit_edge20.us.us

._crit_edge20.us.us:                              ; preds = %._crit_edge20.us.us.loopexit, %middle.block
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next54, %wide.trip.count87
  br i1 %exitcond56, label %._crit_edge22.us, label %.preheader9.us.us

._crit_edge90:                                    ; preds = %._crit_edge90, %._crit_edge90.preheader.new
  %indvars.iv49 = phi i64 [ %indvars.iv49.unr.ph, %._crit_edge90.preheader.new ], [ %indvars.iv.next50.1, %._crit_edge90 ]
  %90 = load double, double* %54, align 8
  %91 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv49, i64 %indvars.iv57
  %92 = load double, double* %91, align 8
  %93 = fmul double %90, %92
  %94 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv53, i64 %indvars.iv49
  %95 = load double, double* %94, align 8
  %96 = fadd double %95, %93
  store double %96, double* %94, align 8
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %97 = load double, double* %54, align 8
  %98 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next50, i64 %indvars.iv57
  %99 = load double, double* %98, align 8
  %100 = fmul double %97, %99
  %101 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv53, i64 %indvars.iv.next50
  %102 = load double, double* %101, align 8
  %103 = fadd double %102, %100
  store double %103, double* %101, align 8
  %indvars.iv.next50.1 = add nsw i64 %indvars.iv49, 2
  %exitcond52.1 = icmp eq i64 %indvars.iv.next50.1, %wide.trip.count87
  br i1 %exitcond52.1, label %._crit_edge20.us.us.loopexit.unr-lcssa, label %._crit_edge90, !llvm.loop !14

.preheader8:                                      ; preds = %._crit_edge22.us
  br i1 true, label %.preheader.us.preheader, label %.preheader8.._crit_edge17_crit_edge

.preheader8.._crit_edge17_crit_edge:              ; preds = %.preheader8
  br label %._crit_edge17

.preheader.us.preheader:                          ; preds = %.preheader8
  %104 = add nsw i64 %wide.trip.count87, -1
  %105 = and i32 %0, 3
  %n.mod.vf112 = zext i32 %105 to i64
  %n.vec113 = sub nsw i64 %wide.trip.count87, %n.mod.vf112
  %cmp.zero114 = icmp eq i64 %n.vec113, 0
  %cmp.n131 = icmp eq i32 %105, 0
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %scevgep116 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 0
  %scevgep116117 = bitcast double* %scevgep116 to i8*
  %scevgep118 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 %wide.trip.count87
  %scevgep118119 = bitcast double* %scevgep118 to i8*
  %106 = mul nuw nsw i64 %indvars.iv45, 16000
  %scevgep120 = getelementptr i8, i8* %24, i64 %106
  %107 = add i64 %48, %106
  %scevgep121 = getelementptr i8, i8* %24, i64 %107
  br i1 %min.iters.check, label %._crit_edge91.preheader, label %min.iters.checked111

min.iters.checked111:                             ; preds = %.preheader.us
  br i1 %cmp.zero114, label %._crit_edge91.preheader, label %vector.memcheck126

vector.memcheck126:                               ; preds = %min.iters.checked111
  %bound0122 = icmp ult i8* %scevgep116117, %scevgep121
  %bound1123 = icmp ult i8* %scevgep120, %scevgep118119
  %memcheck.conflict125 = and i1 %bound0122, %bound1123
  br i1 %memcheck.conflict125, label %._crit_edge91.preheader, label %vector.body107.preheader

vector.body107.preheader:                         ; preds = %vector.memcheck126
  br label %vector.body107

vector.body107:                                   ; preds = %vector.body107.preheader, %vector.body107
  %index128 = phi i64 [ %index.next129, %vector.body107 ], [ 0, %vector.body107.preheader ]
  %108 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv45, i64 %index128
  %109 = bitcast double* %108 to <2 x i64>*
  %wide.load136 = load <2 x i64>, <2 x i64>* %109, align 8, !alias.scope !15
  %110 = getelementptr double, double* %108, i64 2
  %111 = bitcast double* %110 to <2 x i64>*
  %wide.load137 = load <2 x i64>, <2 x i64>* %111, align 8, !alias.scope !15
  %112 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 %index128
  %113 = bitcast double* %112 to <2 x i64>*
  store <2 x i64> %wide.load136, <2 x i64>* %113, align 8, !alias.scope !18, !noalias !15
  %114 = getelementptr double, double* %112, i64 2
  %115 = bitcast double* %114 to <2 x i64>*
  store <2 x i64> %wide.load137, <2 x i64>* %115, align 8, !alias.scope !18, !noalias !15
  %index.next129 = add i64 %index128, 4
  %116 = icmp eq i64 %index.next129, %n.vec113
  br i1 %116, label %middle.block108, label %vector.body107, !llvm.loop !20

middle.block108:                                  ; preds = %vector.body107
  br i1 %cmp.n131, label %._crit_edge.us, label %._crit_edge91.preheader

._crit_edge91.preheader:                          ; preds = %middle.block108, %vector.memcheck126, %min.iters.checked111, %.preheader.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck126 ], [ 0, %min.iters.checked111 ], [ 0, %.preheader.us ], [ %n.vec113, %middle.block108 ]
  %117 = sub nsw i64 %wide.trip.count87, %indvars.iv.ph
  %118 = sub nsw i64 %104, %indvars.iv.ph
  %xtraiter = and i64 %117, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge91.prol.loopexit, label %._crit_edge91.prol.preheader

._crit_edge91.prol.preheader:                     ; preds = %._crit_edge91.preheader
  br label %._crit_edge91.prol

._crit_edge91.prol:                               ; preds = %._crit_edge91.prol, %._crit_edge91.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %._crit_edge91.prol ], [ %indvars.iv.ph, %._crit_edge91.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %._crit_edge91.prol ], [ %xtraiter, %._crit_edge91.prol.preheader ]
  %119 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv45, i64 %indvars.iv.prol
  %120 = bitcast double* %119 to i64*
  %121 = load i64, i64* %120, align 8
  %122 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 %indvars.iv.prol
  %123 = bitcast double* %122 to i64*
  store i64 %121, i64* %123, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge91.prol.loopexit.unr-lcssa, label %._crit_edge91.prol, !llvm.loop !21

._crit_edge91.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge91.prol
  br label %._crit_edge91.prol.loopexit

._crit_edge91.prol.loopexit:                      ; preds = %._crit_edge91.preheader, %._crit_edge91.prol.loopexit.unr-lcssa
  %indvars.iv.unr = phi i64 [ %indvars.iv.ph, %._crit_edge91.preheader ], [ %indvars.iv.next.prol, %._crit_edge91.prol.loopexit.unr-lcssa ]
  %124 = icmp ult i64 %118, 3
  br i1 %124, label %._crit_edge.us.loopexit, label %._crit_edge91.preheader.new

._crit_edge91.preheader.new:                      ; preds = %._crit_edge91.prol.loopexit
  br label %._crit_edge91

._crit_edge91:                                    ; preds = %._crit_edge91, %._crit_edge91.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %._crit_edge91.preheader.new ], [ %indvars.iv.next.3, %._crit_edge91 ]
  %125 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv45, i64 %indvars.iv
  %126 = bitcast double* %125 to i64*
  %127 = load i64, i64* %126, align 8
  %128 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 %indvars.iv
  %129 = bitcast double* %128 to i64*
  store i64 %127, i64* %129, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %130 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv45, i64 %indvars.iv.next
  %131 = bitcast double* %130 to i64*
  %132 = load i64, i64* %131, align 8
  %133 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 %indvars.iv.next
  %134 = bitcast double* %133 to i64*
  store i64 %132, i64* %134, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %135 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv45, i64 %indvars.iv.next.1
  %136 = bitcast double* %135 to i64*
  %137 = load i64, i64* %136, align 8
  %138 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 %indvars.iv.next.1
  %139 = bitcast double* %138 to i64*
  store i64 %137, i64* %139, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %140 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv45, i64 %indvars.iv.next.2
  %141 = bitcast double* %140 to i64*
  %142 = load i64, i64* %141, align 8
  %143 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 %indvars.iv.next.2
  %144 = bitcast double* %143 to i64*
  store i64 %142, i64* %144, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count87
  br i1 %exitcond.3, label %._crit_edge.us.loopexit.unr-lcssa, label %._crit_edge91, !llvm.loop !22

._crit_edge.us.loopexit.unr-lcssa:                ; preds = %._crit_edge91
  br label %._crit_edge.us.loopexit

._crit_edge.us.loopexit:                          ; preds = %._crit_edge91.prol.loopexit, %._crit_edge.us.loopexit.unr-lcssa
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block108
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond48 = icmp eq i64 %indvars.iv.next46, %wide.trip.count87
  br i1 %exitcond48, label %._crit_edge17.loopexit, label %.preheader.us

._crit_edge17.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %.preheader8.._crit_edge17_crit_edge, %.preheader11.._crit_edge17_crit_edge, %._crit_edge42.._crit_edge17_crit_edge, %._crit_edge17.loopexit, %._crit_edge42.thread
  %145 = phi i8* [ undef, %.preheader8.._crit_edge17_crit_edge ], [ undef, %.preheader11.._crit_edge17_crit_edge ], [ undef, %._crit_edge42.._crit_edge17_crit_edge ], [ %4, %._crit_edge42.thread ], [ %24, %._crit_edge17.loopexit ]
  tail call void @free(i8* %145) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader4.preheader, label %._crit_edge11

.preheader4.preheader:                            ; preds = %2
  %wide.trip.count27 = zext i32 %0 to i64
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader4.preheader, %._crit_edge9
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %._crit_edge9 ], [ 0, %.preheader4.preheader ]
  %4 = add i64 %indvars.iv25, -1
  %5 = icmp sgt i64 %indvars.iv25, 0
  br i1 %5, label %.preheader.preheader, label %._crit_edge9

.preheader.preheader:                             ; preds = %.preheader4
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv25, i64 0
  br label %.preheader

.preheader3:                                      ; preds = %._crit_edge
  br i1 true, label %.lr.ph8, label %.preheader3.._crit_edge9_crit_edge

.preheader3.._crit_edge9_crit_edge:               ; preds = %.preheader3
  br label %._crit_edge9

.lr.ph8:                                          ; preds = %.preheader3
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv25
  %.pre32 = load double, double* %7, align 8
  %xtraiter33 = and i64 %indvars.iv25, 3
  %lcmp.mod34 = icmp eq i64 %xtraiter33, 0
  br i1 %lcmp.mod34, label %._crit_edge30.prol.loopexit, label %._crit_edge30.prol.preheader

._crit_edge30.prol.preheader:                     ; preds = %.lr.ph8
  br label %._crit_edge30.prol

._crit_edge30.prol:                               ; preds = %._crit_edge30.prol, %._crit_edge30.prol.preheader
  %8 = phi double [ %.pre32, %._crit_edge30.prol.preheader ], [ %12, %._crit_edge30.prol ]
  %indvars.iv20.prol = phi i64 [ 0, %._crit_edge30.prol.preheader ], [ %indvars.iv.next21.prol, %._crit_edge30.prol ]
  %prol.iter = phi i64 [ %xtraiter33, %._crit_edge30.prol.preheader ], [ %prol.iter.sub, %._crit_edge30.prol ]
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv20.prol
  %10 = load double, double* %9, align 8
  %11 = fmul double %10, %10
  %12 = fsub double %8, %11
  store double %12, double* %7, align 8
  %indvars.iv.next21.prol = add nuw nsw i64 %indvars.iv20.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge30.prol.loopexit.unr-lcssa, label %._crit_edge30.prol, !llvm.loop !23

._crit_edge30.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge30.prol
  br label %._crit_edge30.prol.loopexit

._crit_edge30.prol.loopexit:                      ; preds = %.lr.ph8, %._crit_edge30.prol.loopexit.unr-lcssa
  %.unr35 = phi double [ %.pre32, %.lr.ph8 ], [ %12, %._crit_edge30.prol.loopexit.unr-lcssa ]
  %indvars.iv20.unr = phi i64 [ 0, %.lr.ph8 ], [ %indvars.iv.next21.prol, %._crit_edge30.prol.loopexit.unr-lcssa ]
  %13 = icmp ult i64 %4, 3
  br i1 %13, label %._crit_edge9.loopexit, label %.lr.ph8.new

.lr.ph8.new:                                      ; preds = %._crit_edge30.prol.loopexit
  br label %._crit_edge30

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %._crit_edge ], [ 0, %.preheader.preheader ]
  %14 = icmp sgt i64 %indvars.iv14, 0
  br i1 %14, label %.lr.ph, label %.preheader.._crit_edge_crit_edge

.preheader.._crit_edge_crit_edge:                 ; preds = %.preheader
  %.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv14
  %.pre31 = load double, double* %.phi.trans.insert, align 8
  br label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv14
  %.pre = load double, double* %15, align 8
  %xtraiter = and i64 %indvars.iv14, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge29.prol.loopexit.unr-lcssa, label %._crit_edge29.prol.preheader

._crit_edge29.prol.preheader:                     ; preds = %.lr.ph
  br label %._crit_edge29.prol

._crit_edge29.prol:                               ; preds = %._crit_edge29.prol.preheader
  %16 = load double, double* %6, align 8
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv14, i64 0
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = fsub double %.pre, %19
  store double %20, double* %15, align 8
  br label %._crit_edge29.prol.loopexit.unr-lcssa

._crit_edge29.prol.loopexit.unr-lcssa:            ; preds = %.lr.ph, %._crit_edge29.prol
  %.lcssa.unr.ph = phi double [ %20, %._crit_edge29.prol ], [ undef, %.lr.ph ]
  %.unr.ph = phi double [ %20, %._crit_edge29.prol ], [ %.pre, %.lr.ph ]
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge29.prol ], [ 0, %.lr.ph ]
  br label %._crit_edge29.prol.loopexit

._crit_edge29.prol.loopexit:                      ; preds = %._crit_edge29.prol.loopexit.unr-lcssa
  %21 = icmp eq i64 %indvars.iv14, 1
  br i1 %21, label %._crit_edge.loopexit, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %._crit_edge29.prol.loopexit
  br label %._crit_edge29

._crit_edge29:                                    ; preds = %._crit_edge29, %.lr.ph.new
  %22 = phi double [ %.unr.ph, %.lr.ph.new ], [ %34, %._crit_edge29 ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.new ], [ %indvars.iv.next.1, %._crit_edge29 ]
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv14, i64 %indvars.iv
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fsub double %22, %27
  store double %28, double* %15, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv.next
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv14, i64 %indvars.iv.next
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = fsub double %28, %33
  store double %34, double* %15, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv14
  br i1 %exitcond.1, label %._crit_edge.loopexit.unr-lcssa, label %._crit_edge29

._crit_edge.loopexit.unr-lcssa:                   ; preds = %._crit_edge29
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge29.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %._crit_edge29.prol.loopexit ], [ %34, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %.preheader.._crit_edge_crit_edge, %._crit_edge.loopexit
  %.pre-phi = phi double* [ %.phi.trans.insert, %.preheader.._crit_edge_crit_edge ], [ %15, %._crit_edge.loopexit ]
  %35 = phi double [ %.pre31, %.preheader.._crit_edge_crit_edge ], [ %.lcssa, %._crit_edge.loopexit ]
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv14, i64 %indvars.iv14
  %37 = load double, double* %36, align 8
  %38 = fdiv double %35, %37
  store double %38, double* %.pre-phi, align 8
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next15, %indvars.iv25
  br i1 %exitcond19, label %.preheader3, label %.preheader

._crit_edge30:                                    ; preds = %._crit_edge30, %.lr.ph8.new
  %39 = phi double [ %.unr35, %.lr.ph8.new ], [ %55, %._crit_edge30 ]
  %indvars.iv20 = phi i64 [ %indvars.iv20.unr, %.lr.ph8.new ], [ %indvars.iv.next21.3, %._crit_edge30 ]
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv20
  %41 = load double, double* %40, align 8
  %42 = fmul double %41, %41
  %43 = fsub double %39, %42
  store double %43, double* %7, align 8
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv.next21
  %45 = load double, double* %44, align 8
  %46 = fmul double %45, %45
  %47 = fsub double %43, %46
  store double %47, double* %7, align 8
  %indvars.iv.next21.1 = add nsw i64 %indvars.iv20, 2
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv.next21.1
  %49 = load double, double* %48, align 8
  %50 = fmul double %49, %49
  %51 = fsub double %47, %50
  store double %51, double* %7, align 8
  %indvars.iv.next21.2 = add nsw i64 %indvars.iv20, 3
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv.next21.2
  %53 = load double, double* %52, align 8
  %54 = fmul double %53, %53
  %55 = fsub double %51, %54
  store double %55, double* %7, align 8
  %indvars.iv.next21.3 = add nsw i64 %indvars.iv20, 4
  %exitcond24.3 = icmp eq i64 %indvars.iv.next21.3, %indvars.iv25
  br i1 %exitcond24.3, label %._crit_edge9.loopexit.unr-lcssa, label %._crit_edge30

._crit_edge9.loopexit.unr-lcssa:                  ; preds = %._crit_edge30
  br label %._crit_edge9.loopexit

._crit_edge9.loopexit:                            ; preds = %._crit_edge30.prol.loopexit, %._crit_edge9.loopexit.unr-lcssa
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %.preheader3.._crit_edge9_crit_edge, %._crit_edge9.loopexit, %.preheader4
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv25
  %57 = load double, double* %56, align 8
  %58 = tail call double @sqrt(double %57) #3
  store double %58, double* %56, align 8
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next26, %wide.trip.count27
  br i1 %exitcond28, label %._crit_edge11.loopexit, label %.preheader4

._crit_edge11.loopexit:                           ; preds = %._crit_edge9
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.loopexit, %2
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.preheader, label %._crit_edge4

.preheader.preheader:                             ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count11 = zext i32 %0 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv9 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next10, %._crit_edge ]
  %indvars.iv7 = phi i64 [ 1, %.preheader.preheader ], [ %indvars.iv.next8, %._crit_edge ]
  %9 = mul nsw i64 %indvars.iv9, %8
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge13, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge13 ]
  %10 = add nsw i64 %indvars.iv, %9
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge13

; <label>:14:                                     ; preds = %._crit_edge14
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge14, %14
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv9, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %indvars.iv7
  br i1 %exitcond, label %._crit_edge, label %._crit_edge14

._crit_edge:                                      ; preds = %._crit_edge13
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next10, %wide.trip.count11
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  br i1 %exitcond12, label %._crit_edge4.loopexit, label %.lr.ph

._crit_edge4.loopexit:                            ; preds = %._crit_edge
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %2
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { argmemonly nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = !{!4}
!4 = distinct !{!4, !5}
!5 = distinct !{!5, !"LVerDomain"}
!6 = !{!7}
!7 = distinct !{!7, !5}
!8 = !{!9}
!9 = distinct !{!9, !5}
!10 = !{!7, !4}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.vectorize.width", i32 1}
!13 = !{!"llvm.loop.interleave.count", i32 1}
!14 = distinct !{!14, !12, !13}
!15 = !{!16}
!16 = distinct !{!16, !17}
!17 = distinct !{!17, !"LVerDomain"}
!18 = !{!19}
!19 = distinct !{!19, !17}
!20 = distinct !{!20, !12, !13}
!21 = distinct !{!21, !2}
!22 = distinct !{!22, !12, !13}
!23 = distinct !{!23, !2}
