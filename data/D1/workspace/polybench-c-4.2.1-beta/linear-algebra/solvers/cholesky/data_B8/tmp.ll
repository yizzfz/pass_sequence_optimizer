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
  br i1 %5, label %6, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %.._crit_edge_crit_edge2

.._crit_edge_crit_edge2:                          ; preds = %6
  br label %._crit_edge

; <label>:9:                                      ; preds = %6
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %4)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge2, %.._crit_edge_crit_edge, %9
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader6.lr.ph, label %._crit_edge18.thread

._crit_edge18.thread:                             ; preds = %2
  %4 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %._crit_edge7

.preheader6.lr.ph:                                ; preds = %2
  %5 = sitofp i32 %0 to double
  %6 = add i32 %0, -2
  %7 = zext i32 %6 to i64
  %8 = sext i32 %0 to i64
  %wide.trip.count72 = zext i32 %0 to i64
  br label %.lr.ph13

.lr.ph13:                                         ; preds = %._crit_edge17..lr.ph13_crit_edge, %.preheader6.lr.ph
  %indvars.iv70 = phi i64 [ 0, %.preheader6.lr.ph ], [ %indvars.iv.next71, %._crit_edge17..lr.ph13_crit_edge ]
  %indvars.iv68 = phi i64 [ 1, %.preheader6.lr.ph ], [ %indvars.iv.next69, %._crit_edge17..lr.ph13_crit_edge ]
  %9 = mul nuw nsw i64 %indvars.iv70, 2001
  %10 = add nuw nsw i64 %9, 1
  %scevgep64 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %10
  %scevgep6465 = bitcast double* %scevgep64 to i8*
  %11 = sub i64 %7, %indvars.iv70
  %12 = shl i64 %11, 3
  %13 = and i64 %12, 34359738360
  %14 = add nuw nsw i64 %13, 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.._crit_edge_crit_edge, %.lr.ph13
  %indvars.iv52 = phi i64 [ 0, %.lr.ph13 ], [ %indvars.iv.next53, %._crit_edge.._crit_edge_crit_edge ]
  %15 = sub nsw i64 0, %indvars.iv52
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, %0
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, %5
  %20 = fadd double %19, 1.000000e+00
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv70, i64 %indvars.iv52
  store double %20, double* %21, align 8
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond59 = icmp eq i64 %indvars.iv.next53, %indvars.iv68
  br i1 %exitcond59, label %._crit_edge14, label %._crit_edge.._crit_edge_crit_edge

._crit_edge.._crit_edge_crit_edge:                ; preds = %._crit_edge
  br label %._crit_edge

._crit_edge14:                                    ; preds = %._crit_edge
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %22 = icmp slt i64 %indvars.iv.next71, %8
  br i1 %22, label %._crit_edge17.loopexit, label %._crit_edge14.._crit_edge17_crit_edge

._crit_edge14.._crit_edge17_crit_edge:            ; preds = %._crit_edge14
  br label %._crit_edge17

._crit_edge17.loopexit:                           ; preds = %._crit_edge14
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep6465, i8 0, i64 %14, i32 8, i1 false)
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge14.._crit_edge17_crit_edge, %._crit_edge17.loopexit
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv70, i64 %indvars.iv70
  store double 1.000000e+00, double* %23, align 8
  %exitcond73 = icmp eq i64 %indvars.iv.next71, %wide.trip.count72
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  br i1 %exitcond73, label %._crit_edge18, label %._crit_edge17..lr.ph13_crit_edge

._crit_edge17..lr.ph13_crit_edge:                 ; preds = %._crit_edge17
  br label %.lr.ph13

._crit_edge18:                                    ; preds = %._crit_edge17
  %24 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %25 = bitcast i8* %24 to [2000 x [2000 x double]]*
  %26 = add i32 %0, -1
  %27 = zext i32 %26 to i64
  %28 = shl nuw nsw i64 %27, 3
  %29 = add nuw nsw i64 %28, 8
  %30 = add nsw i64 %wide.trip.count72, -1
  %xtraiter124 = and i64 %wide.trip.count72, 7
  %lcmp.mod125 = icmp eq i64 %xtraiter124, 0
  br i1 %lcmp.mod125, label %._crit_edge18.._crit_edge12.us.prol.loopexit_crit_edge, label %._crit_edge12.us.prol.preheader

._crit_edge18.._crit_edge12.us.prol.loopexit_crit_edge: ; preds = %._crit_edge18
  br label %._crit_edge12.us.prol.loopexit

._crit_edge12.us.prol.preheader:                  ; preds = %._crit_edge18
  br label %._crit_edge12.us.prol

._crit_edge12.us.prol:                            ; preds = %._crit_edge12.us.prol.._crit_edge12.us.prol_crit_edge, %._crit_edge12.us.prol.preheader
  %indvars.iv48.prol = phi i64 [ 0, %._crit_edge12.us.prol.preheader ], [ %indvars.iv.next49.prol, %._crit_edge12.us.prol.._crit_edge12.us.prol_crit_edge ]
  %prol.iter126 = phi i64 [ %xtraiter124, %._crit_edge12.us.prol.preheader ], [ %prol.iter126.sub, %._crit_edge12.us.prol.._crit_edge12.us.prol_crit_edge ]
  %31 = mul nuw nsw i64 %indvars.iv48.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %24, i64 %31
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %29, i32 8, i1 false)
  %indvars.iv.next49.prol = add nuw nsw i64 %indvars.iv48.prol, 1
  %prol.iter126.sub = add i64 %prol.iter126, -1
  %prol.iter126.cmp = icmp eq i64 %prol.iter126.sub, 0
  br i1 %prol.iter126.cmp, label %._crit_edge12.us.prol.loopexit.unr-lcssa, label %._crit_edge12.us.prol.._crit_edge12.us.prol_crit_edge, !llvm.loop !1

._crit_edge12.us.prol.._crit_edge12.us.prol_crit_edge: ; preds = %._crit_edge12.us.prol
  br label %._crit_edge12.us.prol

._crit_edge12.us.prol.loopexit.unr-lcssa:         ; preds = %._crit_edge12.us.prol
  br label %._crit_edge12.us.prol.loopexit

._crit_edge12.us.prol.loopexit:                   ; preds = %._crit_edge18.._crit_edge12.us.prol.loopexit_crit_edge, %._crit_edge12.us.prol.loopexit.unr-lcssa
  %indvars.iv48.unr = phi i64 [ 0, %._crit_edge18.._crit_edge12.us.prol.loopexit_crit_edge ], [ %indvars.iv.next49.prol, %._crit_edge12.us.prol.loopexit.unr-lcssa ]
  %32 = icmp ult i64 %30, 7
  br i1 %32, label %._crit_edge12.us.prol.loopexit..preheader2.us.us.preheader.preheader_crit_edge, label %._crit_edge18.new

._crit_edge12.us.prol.loopexit..preheader2.us.us.preheader.preheader_crit_edge: ; preds = %._crit_edge12.us.prol.loopexit
  br label %.preheader2.us.us.preheader.preheader

._crit_edge18.new:                                ; preds = %._crit_edge12.us.prol.loopexit
  br label %._crit_edge12.us

._crit_edge12.us:                                 ; preds = %._crit_edge12.us.._crit_edge12.us_crit_edge, %._crit_edge18.new
  %indvars.iv48 = phi i64 [ %indvars.iv48.unr, %._crit_edge18.new ], [ %indvars.iv.next49.7, %._crit_edge12.us.._crit_edge12.us_crit_edge ]
  %33 = mul nuw nsw i64 %indvars.iv48, 16000
  %scevgep = getelementptr i8, i8* %24, i64 %33
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %29, i32 8, i1 false)
  %34 = mul i64 %indvars.iv48, 16000
  %35 = add i64 %34, 16000
  %scevgep.1 = getelementptr i8, i8* %24, i64 %35
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %29, i32 8, i1 false)
  %36 = mul i64 %indvars.iv48, 16000
  %37 = add i64 %36, 32000
  %scevgep.2 = getelementptr i8, i8* %24, i64 %37
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %29, i32 8, i1 false)
  %38 = mul i64 %indvars.iv48, 16000
  %39 = add i64 %38, 48000
  %scevgep.3 = getelementptr i8, i8* %24, i64 %39
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %29, i32 8, i1 false)
  %40 = mul i64 %indvars.iv48, 16000
  %41 = add i64 %40, 64000
  %scevgep.4 = getelementptr i8, i8* %24, i64 %41
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 %29, i32 8, i1 false)
  %42 = mul i64 %indvars.iv48, 16000
  %43 = add i64 %42, 80000
  %scevgep.5 = getelementptr i8, i8* %24, i64 %43
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 %29, i32 8, i1 false)
  %44 = mul i64 %indvars.iv48, 16000
  %45 = add i64 %44, 96000
  %scevgep.6 = getelementptr i8, i8* %24, i64 %45
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 %29, i32 8, i1 false)
  %46 = mul i64 %indvars.iv48, 16000
  %47 = add i64 %46, 112000
  %scevgep.7 = getelementptr i8, i8* %24, i64 %47
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 %29, i32 8, i1 false)
  %indvars.iv.next49.7 = add nsw i64 %indvars.iv48, 8
  %exitcond51.7 = icmp eq i64 %indvars.iv.next49.7, %wide.trip.count72
  br i1 %exitcond51.7, label %.preheader2.us.us.preheader.preheader.unr-lcssa, label %._crit_edge12.us.._crit_edge12.us_crit_edge

._crit_edge12.us.._crit_edge12.us_crit_edge:      ; preds = %._crit_edge12.us
  br label %._crit_edge12.us

.preheader2.us.us.preheader.preheader.unr-lcssa:  ; preds = %._crit_edge12.us
  br label %.preheader2.us.us.preheader.preheader

.preheader2.us.us.preheader.preheader:            ; preds = %._crit_edge12.us.prol.loopexit..preheader2.us.us.preheader.preheader_crit_edge, %.preheader2.us.us.preheader.preheader.unr-lcssa
  %48 = shl nuw nsw i64 %wide.trip.count72, 3
  %49 = add nsw i64 %wide.trip.count72, -1
  %min.iters.check = icmp ult i32 %0, 4
  %50 = and i32 %0, 3
  %n.mod.vf = zext i32 %50 to i64
  %n.vec = sub nsw i64 %wide.trip.count72, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i32 %50, 0
  br label %.preheader2.us.us.preheader

.preheader2.us.us.preheader:                      ; preds = %._crit_edge10.us..preheader2.us.us.preheader_crit_edge, %.preheader2.us.us.preheader.preheader
  %indvars.iv40 = phi i64 [ %indvars.iv.next41, %._crit_edge10.us..preheader2.us.us.preheader_crit_edge ], [ 0, %.preheader2.us.us.preheader.preheader ]
  %scevgep81 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv40
  %scevgep8182 = bitcast double* %scevgep81 to i8*
  %51 = add i64 %indvars.iv40, -1999
  %scevgep83 = getelementptr [2000 x double], [2000 x double]* %1, i64 %wide.trip.count72, i64 %51
  %scevgep8384 = bitcast double* %scevgep83 to i8*
  br label %.preheader2.us.us

._crit_edge10.us:                                 ; preds = %._crit_edge9.us.us
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next41, %wide.trip.count72
  br i1 %exitcond43, label %.preheader.us.preheader, label %._crit_edge10.us..preheader2.us.us.preheader_crit_edge

._crit_edge10.us..preheader2.us.us.preheader_crit_edge: ; preds = %._crit_edge10.us
  br label %.preheader2.us.us.preheader

.preheader.us.preheader:                          ; preds = %._crit_edge10.us
  %52 = add nsw i64 %wide.trip.count72, -1
  %53 = and i32 %0, 3
  %n.mod.vf96 = zext i32 %53 to i64
  %n.vec97 = sub nsw i64 %wide.trip.count72, %n.mod.vf96
  %cmp.zero98 = icmp eq i64 %n.vec97, 0
  %cmp.n115 = icmp eq i32 %53, 0
  br label %.preheader.us

.preheader2.us.us:                                ; preds = %._crit_edge9.us.us..preheader2.us.us_crit_edge, %.preheader2.us.us.preheader
  %indvars.iv36 = phi i64 [ 0, %.preheader2.us.us.preheader ], [ %indvars.iv.next37, %._crit_edge9.us.us..preheader2.us.us_crit_edge ]
  %54 = mul i64 %indvars.iv36, 16000
  %scevgep79 = getelementptr i8, i8* %24, i64 %54
  %55 = add i64 %48, %54
  %scevgep80 = getelementptr i8, i8* %24, i64 %55
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv36, i64 %indvars.iv40
  br i1 %min.iters.check, label %.preheader2.us.us.._crit_edge74.preheader_crit_edge, label %min.iters.checked

.preheader2.us.us.._crit_edge74.preheader_crit_edge: ; preds = %.preheader2.us.us
  br label %._crit_edge74.preheader

._crit_edge74.preheader:                          ; preds = %middle.block.._crit_edge74.preheader_crit_edge, %vector.memcheck.._crit_edge74.preheader_crit_edge, %min.iters.checked.._crit_edge74.preheader_crit_edge, %.preheader2.us.us.._crit_edge74.preheader_crit_edge
  %indvars.iv32.ph = phi i64 [ 0, %vector.memcheck.._crit_edge74.preheader_crit_edge ], [ 0, %min.iters.checked.._crit_edge74.preheader_crit_edge ], [ 0, %.preheader2.us.us.._crit_edge74.preheader_crit_edge ], [ %n.vec, %middle.block.._crit_edge74.preheader_crit_edge ]
  %57 = sub nsw i64 %wide.trip.count72, %indvars.iv32.ph
  %xtraiter122 = and i64 %57, 1
  %lcmp.mod123 = icmp eq i64 %xtraiter122, 0
  br i1 %lcmp.mod123, label %._crit_edge74.preheader.._crit_edge74.prol.loopexit.unr-lcssa_crit_edge, label %._crit_edge74.prol.preheader

._crit_edge74.preheader.._crit_edge74.prol.loopexit.unr-lcssa_crit_edge: ; preds = %._crit_edge74.preheader
  br label %._crit_edge74.prol.loopexit.unr-lcssa

._crit_edge74.prol.preheader:                     ; preds = %._crit_edge74.preheader
  br label %._crit_edge74.prol

._crit_edge74.prol:                               ; preds = %._crit_edge74.prol.preheader
  %58 = load double, double* %56, align 8
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv32.ph, i64 %indvars.iv40
  %60 = load double, double* %59, align 8
  %61 = fmul double %58, %60
  %62 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv36, i64 %indvars.iv32.ph
  %63 = load double, double* %62, align 8
  %64 = fadd double %63, %61
  store double %64, double* %62, align 8
  %indvars.iv.next33.prol = add nuw nsw i64 %indvars.iv32.ph, 1
  br label %._crit_edge74.prol.loopexit.unr-lcssa

._crit_edge74.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge74.preheader.._crit_edge74.prol.loopexit.unr-lcssa_crit_edge, %._crit_edge74.prol
  %indvars.iv32.unr.ph = phi i64 [ %indvars.iv.next33.prol, %._crit_edge74.prol ], [ %indvars.iv32.ph, %._crit_edge74.preheader.._crit_edge74.prol.loopexit.unr-lcssa_crit_edge ]
  br label %._crit_edge74.prol.loopexit

._crit_edge74.prol.loopexit:                      ; preds = %._crit_edge74.prol.loopexit.unr-lcssa
  %65 = icmp eq i64 %49, %indvars.iv32.ph
  br i1 %65, label %._crit_edge74.prol.loopexit.._crit_edge9.us.us.loopexit_crit_edge, label %._crit_edge74.preheader.new

._crit_edge74.prol.loopexit.._crit_edge9.us.us.loopexit_crit_edge: ; preds = %._crit_edge74.prol.loopexit
  br label %._crit_edge9.us.us.loopexit

._crit_edge74.preheader.new:                      ; preds = %._crit_edge74.prol.loopexit
  br label %._crit_edge74

min.iters.checked:                                ; preds = %.preheader2.us.us
  br i1 %cmp.zero, label %min.iters.checked.._crit_edge74.preheader_crit_edge, label %vector.memcheck

min.iters.checked.._crit_edge74.preheader_crit_edge: ; preds = %min.iters.checked
  br label %._crit_edge74.preheader

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult i8* %scevgep79, %scevgep8384
  %bound1 = icmp ult i8* %scevgep8182, %scevgep80
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %56 to i8*
  %bound086 = icmp ult i8* %scevgep79, %bc
  %bound187 = icmp ult i8* %bc, %scevgep80
  %found.conflict88 = and i1 %bound086, %bound187
  %conflict.rdx = or i1 %found.conflict, %found.conflict88
  br i1 %conflict.rdx, label %vector.memcheck.._crit_edge74.preheader_crit_edge, label %vector.ph

vector.memcheck.._crit_edge74.preheader_crit_edge: ; preds = %vector.memcheck
  br label %._crit_edge74.preheader

vector.ph:                                        ; preds = %vector.memcheck
  %.pre = load double, double* %56, align 8, !alias.scope !3
  %66 = insertelement <2 x double> undef, double %.pre, i32 0
  %67 = shufflevector <2 x double> %66, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %68 = or i64 %index, 1
  %69 = or i64 %index, 2
  %70 = or i64 %index, 3
  %71 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %index, i64 %indvars.iv40
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %68, i64 %indvars.iv40
  %73 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %69, i64 %indvars.iv40
  %74 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %70, i64 %indvars.iv40
  %75 = load double, double* %71, align 8, !alias.scope !6
  %76 = load double, double* %72, align 8, !alias.scope !6
  %77 = load double, double* %73, align 8, !alias.scope !6
  %78 = load double, double* %74, align 8, !alias.scope !6
  %79 = insertelement <2 x double> undef, double %75, i32 0
  %80 = insertelement <2 x double> %79, double %76, i32 1
  %81 = insertelement <2 x double> undef, double %77, i32 0
  %82 = insertelement <2 x double> %81, double %78, i32 1
  %83 = fmul <2 x double> %67, %80
  %84 = fmul <2 x double> %67, %82
  %85 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv36, i64 %index
  %86 = bitcast double* %85 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %86, align 8, !alias.scope !8, !noalias !10
  %87 = getelementptr double, double* %85, i64 2
  %88 = bitcast double* %87 to <2 x double>*
  %wide.load90 = load <2 x double>, <2 x double>* %88, align 8, !alias.scope !8, !noalias !10
  %89 = fadd <2 x double> %wide.load, %83
  %90 = fadd <2 x double> %wide.load90, %84
  store <2 x double> %89, <2 x double>* %86, align 8, !alias.scope !8, !noalias !10
  store <2 x double> %90, <2 x double>* %88, align 8, !alias.scope !8, !noalias !10
  %index.next = add i64 %index, 4
  %91 = icmp eq i64 %index.next, %n.vec
  br i1 %91, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !11

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %middle.block.._crit_edge9.us.us_crit_edge, label %middle.block.._crit_edge74.preheader_crit_edge

middle.block.._crit_edge74.preheader_crit_edge:   ; preds = %middle.block
  br label %._crit_edge74.preheader

middle.block.._crit_edge9.us.us_crit_edge:        ; preds = %middle.block
  br label %._crit_edge9.us.us

._crit_edge9.us.us.loopexit.unr-lcssa:            ; preds = %._crit_edge74
  br label %._crit_edge9.us.us.loopexit

._crit_edge9.us.us.loopexit:                      ; preds = %._crit_edge74.prol.loopexit.._crit_edge9.us.us.loopexit_crit_edge, %._crit_edge9.us.us.loopexit.unr-lcssa
  br label %._crit_edge9.us.us

._crit_edge9.us.us:                               ; preds = %middle.block.._crit_edge9.us.us_crit_edge, %._crit_edge9.us.us.loopexit
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next37, %wide.trip.count72
  br i1 %exitcond39, label %._crit_edge10.us, label %._crit_edge9.us.us..preheader2.us.us_crit_edge

._crit_edge9.us.us..preheader2.us.us_crit_edge:   ; preds = %._crit_edge9.us.us
  br label %.preheader2.us.us

._crit_edge74:                                    ; preds = %._crit_edge74.._crit_edge74_crit_edge, %._crit_edge74.preheader.new
  %indvars.iv32 = phi i64 [ %indvars.iv32.unr.ph, %._crit_edge74.preheader.new ], [ %indvars.iv.next33.1, %._crit_edge74.._crit_edge74_crit_edge ]
  %92 = load double, double* %56, align 8
  %93 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv32, i64 %indvars.iv40
  %94 = load double, double* %93, align 8
  %95 = fmul double %92, %94
  %96 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv36, i64 %indvars.iv32
  %97 = load double, double* %96, align 8
  %98 = fadd double %97, %95
  store double %98, double* %96, align 8
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %99 = load double, double* %56, align 8
  %100 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next33, i64 %indvars.iv40
  %101 = load double, double* %100, align 8
  %102 = fmul double %99, %101
  %103 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv36, i64 %indvars.iv.next33
  %104 = load double, double* %103, align 8
  %105 = fadd double %104, %102
  store double %105, double* %103, align 8
  %indvars.iv.next33.1 = add nsw i64 %indvars.iv32, 2
  %exitcond35.1 = icmp eq i64 %indvars.iv.next33.1, %wide.trip.count72
  br i1 %exitcond35.1, label %._crit_edge9.us.us.loopexit.unr-lcssa, label %._crit_edge74.._crit_edge74_crit_edge, !llvm.loop !14

._crit_edge74.._crit_edge74_crit_edge:            ; preds = %._crit_edge74
  br label %._crit_edge74

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv28 = phi i64 [ %indvars.iv.next29, %._crit_edge.us..preheader.us_crit_edge ], [ 0, %.preheader.us.preheader ]
  %scevgep100 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 0
  %scevgep100101 = bitcast double* %scevgep100 to i8*
  %scevgep102 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %wide.trip.count72
  %scevgep102103 = bitcast double* %scevgep102 to i8*
  %106 = mul i64 %indvars.iv28, 16000
  %scevgep104 = getelementptr i8, i8* %24, i64 %106
  %107 = add i64 %48, %106
  %scevgep105 = getelementptr i8, i8* %24, i64 %107
  br i1 %min.iters.check, label %.preheader.us.._crit_edge75.preheader_crit_edge, label %min.iters.checked95

.preheader.us.._crit_edge75.preheader_crit_edge:  ; preds = %.preheader.us
  br label %._crit_edge75.preheader

min.iters.checked95:                              ; preds = %.preheader.us
  br i1 %cmp.zero98, label %min.iters.checked95.._crit_edge75.preheader_crit_edge, label %vector.memcheck110

min.iters.checked95.._crit_edge75.preheader_crit_edge: ; preds = %min.iters.checked95
  br label %._crit_edge75.preheader

vector.memcheck110:                               ; preds = %min.iters.checked95
  %bound0106 = icmp ult i8* %scevgep100101, %scevgep105
  %bound1107 = icmp ult i8* %scevgep104, %scevgep102103
  %found.conflict108 = and i1 %bound0106, %bound1107
  br i1 %found.conflict108, label %vector.memcheck110.._crit_edge75.preheader_crit_edge, label %vector.body91.preheader

vector.memcheck110.._crit_edge75.preheader_crit_edge: ; preds = %vector.memcheck110
  br label %._crit_edge75.preheader

vector.body91.preheader:                          ; preds = %vector.memcheck110
  br label %vector.body91

vector.body91:                                    ; preds = %vector.body91.vector.body91_crit_edge, %vector.body91.preheader
  %index112 = phi i64 [ %index.next113, %vector.body91.vector.body91_crit_edge ], [ 0, %vector.body91.preheader ]
  %108 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv28, i64 %index112
  %109 = bitcast double* %108 to <2 x i64>*
  %wide.load120 = load <2 x i64>, <2 x i64>* %109, align 8, !alias.scope !15
  %110 = getelementptr double, double* %108, i64 2
  %111 = bitcast double* %110 to <2 x i64>*
  %wide.load121 = load <2 x i64>, <2 x i64>* %111, align 8, !alias.scope !15
  %112 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %index112
  %113 = bitcast double* %112 to <2 x i64>*
  store <2 x i64> %wide.load120, <2 x i64>* %113, align 8, !alias.scope !18, !noalias !15
  %114 = getelementptr double, double* %112, i64 2
  %115 = bitcast double* %114 to <2 x i64>*
  store <2 x i64> %wide.load121, <2 x i64>* %115, align 8, !alias.scope !18, !noalias !15
  %index.next113 = add i64 %index112, 4
  %116 = icmp eq i64 %index.next113, %n.vec97
  br i1 %116, label %middle.block92, label %vector.body91.vector.body91_crit_edge, !llvm.loop !20

vector.body91.vector.body91_crit_edge:            ; preds = %vector.body91
  br label %vector.body91

middle.block92:                                   ; preds = %vector.body91
  br i1 %cmp.n115, label %middle.block92.._crit_edge.us_crit_edge, label %middle.block92.._crit_edge75.preheader_crit_edge

middle.block92.._crit_edge75.preheader_crit_edge: ; preds = %middle.block92
  br label %._crit_edge75.preheader

middle.block92.._crit_edge.us_crit_edge:          ; preds = %middle.block92
  br label %._crit_edge.us

._crit_edge75.preheader:                          ; preds = %middle.block92.._crit_edge75.preheader_crit_edge, %vector.memcheck110.._crit_edge75.preheader_crit_edge, %min.iters.checked95.._crit_edge75.preheader_crit_edge, %.preheader.us.._crit_edge75.preheader_crit_edge
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck110.._crit_edge75.preheader_crit_edge ], [ 0, %min.iters.checked95.._crit_edge75.preheader_crit_edge ], [ 0, %.preheader.us.._crit_edge75.preheader_crit_edge ], [ %n.vec97, %middle.block92.._crit_edge75.preheader_crit_edge ]
  %117 = sub nsw i64 %wide.trip.count72, %indvars.iv.ph
  %118 = sub nsw i64 %52, %indvars.iv.ph
  %xtraiter = and i64 %117, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge75.preheader.._crit_edge75.prol.loopexit_crit_edge, label %._crit_edge75.prol.preheader

._crit_edge75.preheader.._crit_edge75.prol.loopexit_crit_edge: ; preds = %._crit_edge75.preheader
  br label %._crit_edge75.prol.loopexit

._crit_edge75.prol.preheader:                     ; preds = %._crit_edge75.preheader
  br label %._crit_edge75.prol

._crit_edge75.prol:                               ; preds = %._crit_edge75.prol.._crit_edge75.prol_crit_edge, %._crit_edge75.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %._crit_edge75.prol.._crit_edge75.prol_crit_edge ], [ %indvars.iv.ph, %._crit_edge75.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %._crit_edge75.prol.._crit_edge75.prol_crit_edge ], [ %xtraiter, %._crit_edge75.prol.preheader ]
  %119 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv28, i64 %indvars.iv.prol
  %120 = bitcast double* %119 to i64*
  %121 = load i64, i64* %120, align 8
  %122 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv.prol
  %123 = bitcast double* %122 to i64*
  store i64 %121, i64* %123, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge75.prol.loopexit.unr-lcssa, label %._crit_edge75.prol.._crit_edge75.prol_crit_edge, !llvm.loop !21

._crit_edge75.prol.._crit_edge75.prol_crit_edge:  ; preds = %._crit_edge75.prol
  br label %._crit_edge75.prol

._crit_edge75.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge75.prol
  br label %._crit_edge75.prol.loopexit

._crit_edge75.prol.loopexit:                      ; preds = %._crit_edge75.preheader.._crit_edge75.prol.loopexit_crit_edge, %._crit_edge75.prol.loopexit.unr-lcssa
  %indvars.iv.unr = phi i64 [ %indvars.iv.ph, %._crit_edge75.preheader.._crit_edge75.prol.loopexit_crit_edge ], [ %indvars.iv.next.prol, %._crit_edge75.prol.loopexit.unr-lcssa ]
  %124 = icmp ult i64 %118, 3
  br i1 %124, label %._crit_edge75.prol.loopexit.._crit_edge.us.loopexit_crit_edge, label %._crit_edge75.preheader.new

._crit_edge75.prol.loopexit.._crit_edge.us.loopexit_crit_edge: ; preds = %._crit_edge75.prol.loopexit
  br label %._crit_edge.us.loopexit

._crit_edge75.preheader.new:                      ; preds = %._crit_edge75.prol.loopexit
  br label %._crit_edge75

._crit_edge75:                                    ; preds = %._crit_edge75.._crit_edge75_crit_edge, %._crit_edge75.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %._crit_edge75.preheader.new ], [ %indvars.iv.next.3, %._crit_edge75.._crit_edge75_crit_edge ]
  %125 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv28, i64 %indvars.iv
  %126 = bitcast double* %125 to i64*
  %127 = load i64, i64* %126, align 8
  %128 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv
  %129 = bitcast double* %128 to i64*
  store i64 %127, i64* %129, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %130 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv28, i64 %indvars.iv.next
  %131 = bitcast double* %130 to i64*
  %132 = load i64, i64* %131, align 8
  %133 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv.next
  %134 = bitcast double* %133 to i64*
  store i64 %132, i64* %134, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %135 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv28, i64 %indvars.iv.next.1
  %136 = bitcast double* %135 to i64*
  %137 = load i64, i64* %136, align 8
  %138 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv.next.1
  %139 = bitcast double* %138 to i64*
  store i64 %137, i64* %139, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %140 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv28, i64 %indvars.iv.next.2
  %141 = bitcast double* %140 to i64*
  %142 = load i64, i64* %141, align 8
  %143 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv.next.2
  %144 = bitcast double* %143 to i64*
  store i64 %142, i64* %144, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond27.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count72
  br i1 %exitcond27.3, label %._crit_edge.us.loopexit.unr-lcssa, label %._crit_edge75.._crit_edge75_crit_edge, !llvm.loop !22

._crit_edge75.._crit_edge75_crit_edge:            ; preds = %._crit_edge75
  br label %._crit_edge75

._crit_edge.us.loopexit.unr-lcssa:                ; preds = %._crit_edge75
  br label %._crit_edge.us.loopexit

._crit_edge.us.loopexit:                          ; preds = %._crit_edge75.prol.loopexit.._crit_edge.us.loopexit_crit_edge, %._crit_edge.us.loopexit.unr-lcssa
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %middle.block92.._crit_edge.us_crit_edge, %._crit_edge.us.loopexit
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next29, %wide.trip.count72
  br i1 %exitcond31, label %._crit_edge7.loopexit, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge7.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.loopexit, %._crit_edge18.thread
  %145 = phi i8* [ %4, %._crit_edge18.thread ], [ %24, %._crit_edge7.loopexit ]
  tail call void @free(i8* %145) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader2.preheader, label %.._crit_edge5_crit_edge

.._crit_edge5_crit_edge:                          ; preds = %2
  br label %._crit_edge5

.preheader2.preheader:                            ; preds = %2
  %wide.trip.count30 = zext i32 %0 to i64
  br label %.preheader2

.preheader2:                                      ; preds = %._crit_edge4..preheader2_crit_edge, %.preheader2.preheader
  %indvars.iv28 = phi i64 [ %indvars.iv.next29, %._crit_edge4..preheader2_crit_edge ], [ 0, %.preheader2.preheader ]
  %4 = add i64 %indvars.iv28, -1
  %5 = icmp sgt i64 %indvars.iv28, 0
  br i1 %5, label %.preheader.preheader, label %.preheader2.._crit_edge4_crit_edge

.preheader2.._crit_edge4_crit_edge:               ; preds = %.preheader2
  br label %._crit_edge4

.preheader.preheader:                             ; preds = %.preheader2
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 0
  br label %.preheader

.lr.ph3:                                          ; preds = %._crit_edge
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv28
  %.pre35 = load double, double* %7, align 8
  %xtraiter36 = and i64 %indvars.iv28, 3
  %lcmp.mod37 = icmp eq i64 %xtraiter36, 0
  br i1 %lcmp.mod37, label %.lr.ph3.._crit_edge33.prol.loopexit_crit_edge, label %._crit_edge33.prol.preheader

.lr.ph3.._crit_edge33.prol.loopexit_crit_edge:    ; preds = %.lr.ph3
  br label %._crit_edge33.prol.loopexit

._crit_edge33.prol.preheader:                     ; preds = %.lr.ph3
  br label %._crit_edge33.prol

._crit_edge33.prol:                               ; preds = %._crit_edge33.prol.._crit_edge33.prol_crit_edge, %._crit_edge33.prol.preheader
  %8 = phi double [ %.pre35, %._crit_edge33.prol.preheader ], [ %12, %._crit_edge33.prol.._crit_edge33.prol_crit_edge ]
  %indvars.iv20.prol = phi i64 [ 0, %._crit_edge33.prol.preheader ], [ %indvars.iv.next21.prol, %._crit_edge33.prol.._crit_edge33.prol_crit_edge ]
  %prol.iter = phi i64 [ %xtraiter36, %._crit_edge33.prol.preheader ], [ %prol.iter.sub, %._crit_edge33.prol.._crit_edge33.prol_crit_edge ]
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv20.prol
  %10 = load double, double* %9, align 8
  %11 = fmul double %10, %10
  %12 = fsub double %8, %11
  store double %12, double* %7, align 8
  %indvars.iv.next21.prol = add nuw nsw i64 %indvars.iv20.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge33.prol.loopexit.unr-lcssa, label %._crit_edge33.prol.._crit_edge33.prol_crit_edge, !llvm.loop !23

._crit_edge33.prol.._crit_edge33.prol_crit_edge:  ; preds = %._crit_edge33.prol
  br label %._crit_edge33.prol

._crit_edge33.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge33.prol
  br label %._crit_edge33.prol.loopexit

._crit_edge33.prol.loopexit:                      ; preds = %.lr.ph3.._crit_edge33.prol.loopexit_crit_edge, %._crit_edge33.prol.loopexit.unr-lcssa
  %.unr38 = phi double [ %.pre35, %.lr.ph3.._crit_edge33.prol.loopexit_crit_edge ], [ %12, %._crit_edge33.prol.loopexit.unr-lcssa ]
  %indvars.iv20.unr = phi i64 [ 0, %.lr.ph3.._crit_edge33.prol.loopexit_crit_edge ], [ %indvars.iv.next21.prol, %._crit_edge33.prol.loopexit.unr-lcssa ]
  %13 = icmp ult i64 %4, 3
  br i1 %13, label %._crit_edge33.prol.loopexit.._crit_edge4.loopexit_crit_edge, label %.lr.ph3.new

._crit_edge33.prol.loopexit.._crit_edge4.loopexit_crit_edge: ; preds = %._crit_edge33.prol.loopexit
  br label %._crit_edge4.loopexit

.lr.ph3.new:                                      ; preds = %._crit_edge33.prol.loopexit
  br label %._crit_edge33

.preheader:                                       ; preds = %._crit_edge..preheader_crit_edge, %.preheader.preheader
  %indvars.iv12 = phi i64 [ %indvars.iv.next13, %._crit_edge..preheader_crit_edge ], [ 0, %.preheader.preheader ]
  %14 = icmp sgt i64 %indvars.iv12, 0
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv12
  %.pre = load double, double* %15, align 8
  br i1 %14, label %._crit_edge32.preheader, label %.preheader.._crit_edge_crit_edge

.preheader.._crit_edge_crit_edge:                 ; preds = %.preheader
  br label %._crit_edge

._crit_edge32.preheader:                          ; preds = %.preheader
  %xtraiter = and i64 %indvars.iv12, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge32.preheader.._crit_edge32.prol.loopexit.unr-lcssa_crit_edge, label %._crit_edge32.prol.preheader

._crit_edge32.preheader.._crit_edge32.prol.loopexit.unr-lcssa_crit_edge: ; preds = %._crit_edge32.preheader
  br label %._crit_edge32.prol.loopexit.unr-lcssa

._crit_edge32.prol.preheader:                     ; preds = %._crit_edge32.preheader
  br label %._crit_edge32.prol

._crit_edge32.prol:                               ; preds = %._crit_edge32.prol.preheader
  %16 = load double, double* %6, align 8
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv12, i64 0
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = fsub double %.pre, %19
  store double %20, double* %15, align 8
  br label %._crit_edge32.prol.loopexit.unr-lcssa

._crit_edge32.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge32.preheader.._crit_edge32.prol.loopexit.unr-lcssa_crit_edge, %._crit_edge32.prol
  %.lcssa.unr.ph = phi double [ %20, %._crit_edge32.prol ], [ undef, %._crit_edge32.preheader.._crit_edge32.prol.loopexit.unr-lcssa_crit_edge ]
  %.unr.ph = phi double [ %20, %._crit_edge32.prol ], [ %.pre, %._crit_edge32.preheader.._crit_edge32.prol.loopexit.unr-lcssa_crit_edge ]
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge32.prol ], [ 0, %._crit_edge32.preheader.._crit_edge32.prol.loopexit.unr-lcssa_crit_edge ]
  br label %._crit_edge32.prol.loopexit

._crit_edge32.prol.loopexit:                      ; preds = %._crit_edge32.prol.loopexit.unr-lcssa
  %21 = icmp eq i64 %indvars.iv12, 1
  br i1 %21, label %._crit_edge32.prol.loopexit.._crit_edge.loopexit_crit_edge, label %._crit_edge32.preheader.new

._crit_edge32.prol.loopexit.._crit_edge.loopexit_crit_edge: ; preds = %._crit_edge32.prol.loopexit
  br label %._crit_edge.loopexit

._crit_edge32.preheader.new:                      ; preds = %._crit_edge32.prol.loopexit
  br label %._crit_edge32

._crit_edge32:                                    ; preds = %._crit_edge32.._crit_edge32_crit_edge, %._crit_edge32.preheader.new
  %22 = phi double [ %.unr.ph, %._crit_edge32.preheader.new ], [ %34, %._crit_edge32.._crit_edge32_crit_edge ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %._crit_edge32.preheader.new ], [ %indvars.iv.next.1, %._crit_edge32.._crit_edge32_crit_edge ]
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv12, i64 %indvars.iv
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fsub double %22, %27
  store double %28, double* %15, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv.next
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv12, i64 %indvars.iv.next
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = fsub double %28, %33
  store double %34, double* %15, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond11.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv12
  br i1 %exitcond11.1, label %._crit_edge.loopexit.unr-lcssa, label %._crit_edge32.._crit_edge32_crit_edge

._crit_edge32.._crit_edge32_crit_edge:            ; preds = %._crit_edge32
  br label %._crit_edge32

._crit_edge.loopexit.unr-lcssa:                   ; preds = %._crit_edge32
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge32.prol.loopexit.._crit_edge.loopexit_crit_edge, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %._crit_edge32.prol.loopexit.._crit_edge.loopexit_crit_edge ], [ %34, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %.preheader.._crit_edge_crit_edge, %._crit_edge.loopexit
  %35 = phi double [ %.pre, %.preheader.._crit_edge_crit_edge ], [ %.lcssa, %._crit_edge.loopexit ]
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv12, i64 %indvars.iv12
  %37 = load double, double* %36, align 8
  %38 = fdiv double %35, %37
  store double %38, double* %15, align 8
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next13, %indvars.iv28
  br i1 %exitcond19, label %.lr.ph3, label %._crit_edge..preheader_crit_edge

._crit_edge..preheader_crit_edge:                 ; preds = %._crit_edge
  br label %.preheader

._crit_edge33:                                    ; preds = %._crit_edge33.._crit_edge33_crit_edge, %.lr.ph3.new
  %39 = phi double [ %.unr38, %.lr.ph3.new ], [ %55, %._crit_edge33.._crit_edge33_crit_edge ]
  %indvars.iv20 = phi i64 [ %indvars.iv20.unr, %.lr.ph3.new ], [ %indvars.iv.next21.3, %._crit_edge33.._crit_edge33_crit_edge ]
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv20
  %41 = load double, double* %40, align 8
  %42 = fmul double %41, %41
  %43 = fsub double %39, %42
  store double %43, double* %7, align 8
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv.next21
  %45 = load double, double* %44, align 8
  %46 = fmul double %45, %45
  %47 = fsub double %43, %46
  store double %47, double* %7, align 8
  %indvars.iv.next21.1 = add nsw i64 %indvars.iv20, 2
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv.next21.1
  %49 = load double, double* %48, align 8
  %50 = fmul double %49, %49
  %51 = fsub double %47, %50
  store double %51, double* %7, align 8
  %indvars.iv.next21.2 = add nsw i64 %indvars.iv20, 3
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv.next21.2
  %53 = load double, double* %52, align 8
  %54 = fmul double %53, %53
  %55 = fsub double %51, %54
  store double %55, double* %7, align 8
  %indvars.iv.next21.3 = add nsw i64 %indvars.iv20, 4
  %exitcond27.3 = icmp eq i64 %indvars.iv.next21.3, %indvars.iv28
  br i1 %exitcond27.3, label %._crit_edge4.loopexit.unr-lcssa, label %._crit_edge33.._crit_edge33_crit_edge

._crit_edge33.._crit_edge33_crit_edge:            ; preds = %._crit_edge33
  br label %._crit_edge33

._crit_edge4.loopexit.unr-lcssa:                  ; preds = %._crit_edge33
  br label %._crit_edge4.loopexit

._crit_edge4.loopexit:                            ; preds = %._crit_edge33.prol.loopexit.._crit_edge4.loopexit_crit_edge, %._crit_edge4.loopexit.unr-lcssa
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %.preheader2.._crit_edge4_crit_edge, %._crit_edge4.loopexit
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv28
  %57 = load double, double* %56, align 8
  %58 = tail call double @sqrt(double %57) #3
  store double %58, double* %56, align 8
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next29, %wide.trip.count30
  br i1 %exitcond31, label %._crit_edge5.loopexit, label %._crit_edge4..preheader2_crit_edge

._crit_edge4..preheader2_crit_edge:               ; preds = %._crit_edge4
  br label %.preheader2

._crit_edge5.loopexit:                            ; preds = %._crit_edge4
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %.._crit_edge5_crit_edge, %._crit_edge5.loopexit
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.preheader, label %.._crit_edge1_crit_edge

.._crit_edge1_crit_edge:                          ; preds = %2
  br label %._crit_edge1

.preheader.preheader:                             ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count12 = zext i32 %0 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge..lr.ph_crit_edge, %.preheader.preheader
  %indvars.iv10 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next11, %._crit_edge..lr.ph_crit_edge ]
  %indvars.iv8 = phi i64 [ 1, %.preheader.preheader ], [ %indvars.iv.next9, %._crit_edge..lr.ph_crit_edge ]
  %9 = mul nsw i64 %indvars.iv10, %8
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge14.._crit_edge15_crit_edge, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge14.._crit_edge15_crit_edge ]
  %10 = add nsw i64 %indvars.iv, %9
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge15.._crit_edge14_crit_edge

._crit_edge15.._crit_edge14_crit_edge:            ; preds = %._crit_edge15
  br label %._crit_edge14

; <label>:14:                                     ; preds = %._crit_edge15
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge15.._crit_edge14_crit_edge, %14
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv10, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next, %indvars.iv8
  br i1 %exitcond7, label %._crit_edge, label %._crit_edge14.._crit_edge15_crit_edge

._crit_edge14.._crit_edge15_crit_edge:            ; preds = %._crit_edge14
  br label %._crit_edge15

._crit_edge:                                      ; preds = %._crit_edge14
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next11, %wide.trip.count12
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  br i1 %exitcond13, label %._crit_edge1.loopexit, label %._crit_edge..lr.ph_crit_edge

._crit_edge..lr.ph_crit_edge:                     ; preds = %._crit_edge
  br label %.lr.ph

._crit_edge1.loopexit:                            ; preds = %._crit_edge
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %.._crit_edge1_crit_edge, %._crit_edge1.loopexit
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #2

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
