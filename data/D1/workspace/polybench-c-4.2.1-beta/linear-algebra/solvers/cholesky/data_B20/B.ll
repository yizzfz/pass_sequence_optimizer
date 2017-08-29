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
  br i1 true, label %.preheader14.lr.ph, label %._crit_edge40.thread

._crit_edge40.thread:                             ; preds = %2
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %._crit_edge17

.preheader14.lr.ph:                               ; preds = %2
  br label %.lr.ph36

.lr.ph36:                                         ; preds = %._crit_edge38..lr.ph36_crit_edge, %.preheader14.lr.ph
  %indvars.iv87 = phi i64 [ 0, %.preheader14.lr.ph ], [ %indvars.iv.next88, %._crit_edge38..lr.ph36_crit_edge ]
  %indvars.iv85 = phi i64 [ 1, %.preheader14.lr.ph ], [ %indvars.iv.next86, %._crit_edge38..lr.ph36_crit_edge ]
  %4 = mul nuw nsw i64 %indvars.iv87, 2001
  %5 = add nuw nsw i64 %4, 1
  %scevgep81 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %5
  %6 = sub i64 1998, %indvars.iv87
  %7 = shl i64 %6, 3
  %8 = and i64 %7, 34359738360
  br label %._crit_edge

.preheader13:                                     ; preds = %._crit_edge
  %scevgep8182 = bitcast double* %scevgep81 to i8*
  %9 = add nuw nsw i64 %8, 8
  %indvars.iv.next88 = add nuw nsw i64 %indvars.iv87, 1
  %10 = icmp slt i64 %indvars.iv.next88, 2000
  br i1 %10, label %._crit_edge38.loopexit, label %.preheader13.._crit_edge38_crit_edge

.preheader13.._crit_edge38_crit_edge:             ; preds = %.preheader13
  br label %._crit_edge38

._crit_edge:                                      ; preds = %._crit_edge.._crit_edge_crit_edge, %.lr.ph36
  %indvars.iv69 = phi i64 [ 0, %.lr.ph36 ], [ %indvars.iv.next70, %._crit_edge.._crit_edge_crit_edge ]
  %11 = sub nsw i64 0, %indvars.iv69
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 2000
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, 2.000000e+03
  %16 = fadd double %15, 1.000000e+00
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv87, i64 %indvars.iv69
  store double %16, double* %17, align 8
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond76 = icmp eq i64 %indvars.iv.next70, %indvars.iv85
  br i1 %exitcond76, label %.preheader13, label %._crit_edge.._crit_edge_crit_edge

._crit_edge.._crit_edge_crit_edge:                ; preds = %._crit_edge
  br label %._crit_edge

._crit_edge38.loopexit:                           ; preds = %.preheader13
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep8182, i8 0, i64 %9, i32 8, i1 false)
  br label %._crit_edge38

._crit_edge38:                                    ; preds = %.preheader13.._crit_edge38_crit_edge, %._crit_edge38.loopexit
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv87, i64 %indvars.iv87
  store double 1.000000e+00, double* %18, align 8
  %exitcond90 = icmp eq i64 %indvars.iv.next88, 2000
  %indvars.iv.next86 = add nuw nsw i64 %indvars.iv85, 1
  br i1 %exitcond90, label %._crit_edge40, label %._crit_edge38..lr.ph36_crit_edge

._crit_edge38..lr.ph36_crit_edge:                 ; preds = %._crit_edge38
  br label %.lr.ph36

._crit_edge40:                                    ; preds = %._crit_edge38
  %19 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %20 = bitcast i8* %19 to [2000 x [2000 x double]]*
  br i1 true, label %._crit_edge40.._crit_edge33.us.prol.loopexit_crit_edge, label %._crit_edge33.us.prol.preheader

._crit_edge40.._crit_edge33.us.prol.loopexit_crit_edge: ; preds = %._crit_edge40
  br label %._crit_edge33.us.prol.loopexit

._crit_edge33.us.prol.preheader:                  ; preds = %._crit_edge40
  br label %._crit_edge33.us.prol

._crit_edge33.us.prol:                            ; preds = %._crit_edge33.us.prol.._crit_edge33.us.prol_crit_edge, %._crit_edge33.us.prol.preheader
  %indvars.iv65.prol = phi i64 [ 0, %._crit_edge33.us.prol.preheader ], [ %indvars.iv.next66.prol, %._crit_edge33.us.prol.._crit_edge33.us.prol_crit_edge ]
  %prol.iter143 = phi i64 [ 0, %._crit_edge33.us.prol.preheader ], [ %prol.iter143.sub, %._crit_edge33.us.prol.._crit_edge33.us.prol_crit_edge ]
  %21 = mul nuw nsw i64 %indvars.iv65.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %19, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next66.prol = add nuw nsw i64 %indvars.iv65.prol, 1
  %prol.iter143.sub = add nsw i64 %prol.iter143, -1
  %prol.iter143.cmp = icmp eq i64 %prol.iter143.sub, 0
  br i1 %prol.iter143.cmp, label %._crit_edge33.us.prol.loopexit.unr-lcssa, label %._crit_edge33.us.prol.._crit_edge33.us.prol_crit_edge, !llvm.loop !1

._crit_edge33.us.prol.._crit_edge33.us.prol_crit_edge: ; preds = %._crit_edge33.us.prol
  br label %._crit_edge33.us.prol

._crit_edge33.us.prol.loopexit.unr-lcssa:         ; preds = %._crit_edge33.us.prol
  br label %._crit_edge33.us.prol.loopexit

._crit_edge33.us.prol.loopexit:                   ; preds = %._crit_edge40.._crit_edge33.us.prol.loopexit_crit_edge, %._crit_edge33.us.prol.loopexit.unr-lcssa
  br i1 false, label %._crit_edge33.us.prol.loopexit..preheader9.us.us.preheader.preheader_crit_edge, label %._crit_edge40.new

._crit_edge33.us.prol.loopexit..preheader9.us.us.preheader.preheader_crit_edge: ; preds = %._crit_edge33.us.prol.loopexit
  br label %.preheader9.us.us.preheader.preheader

._crit_edge40.new:                                ; preds = %._crit_edge33.us.prol.loopexit
  br label %._crit_edge33.us

._crit_edge33.us:                                 ; preds = %._crit_edge33.us.._crit_edge33.us_crit_edge, %._crit_edge40.new
  %indvars.iv65 = phi i64 [ 0, %._crit_edge40.new ], [ %indvars.iv.next66.7, %._crit_edge33.us.._crit_edge33.us_crit_edge ]
  %22 = mul i64 %indvars.iv65, 16000
  %scevgep = getelementptr i8, i8* %19, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %23 = add i64 %22, 16000
  %scevgep.1 = getelementptr i8, i8* %19, i64 %23
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %24 = add i64 %22, 32000
  %scevgep.2 = getelementptr i8, i8* %19, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %25 = add i64 %22, 48000
  %scevgep.3 = getelementptr i8, i8* %19, i64 %25
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %26 = add i64 %22, 64000
  %scevgep.4 = getelementptr i8, i8* %19, i64 %26
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %27 = add i64 %22, 80000
  %scevgep.5 = getelementptr i8, i8* %19, i64 %27
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %28 = add i64 %22, 96000
  %scevgep.6 = getelementptr i8, i8* %19, i64 %28
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %29 = add i64 %22, 112000
  %scevgep.7 = getelementptr i8, i8* %19, i64 %29
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next66.7 = add nsw i64 %indvars.iv65, 8
  %exitcond68.7 = icmp eq i64 %indvars.iv.next66.7, 2000
  br i1 %exitcond68.7, label %.preheader9.us.us.preheader.preheader.unr-lcssa, label %._crit_edge33.us.._crit_edge33.us_crit_edge

._crit_edge33.us.._crit_edge33.us_crit_edge:      ; preds = %._crit_edge33.us
  br label %._crit_edge33.us

.preheader9.us.us.preheader.preheader.unr-lcssa:  ; preds = %._crit_edge33.us
  br label %.preheader9.us.us.preheader.preheader

.preheader9.us.us.preheader.preheader:            ; preds = %._crit_edge33.us.prol.loopexit..preheader9.us.us.preheader.preheader_crit_edge, %.preheader9.us.us.preheader.preheader.unr-lcssa
  br label %.preheader9.us.us.preheader

.preheader9.us.us.preheader:                      ; preds = %._crit_edge22.us..preheader9.us.us.preheader_crit_edge, %.preheader9.us.us.preheader.preheader
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %._crit_edge22.us..preheader9.us.us.preheader_crit_edge ], [ 0, %.preheader9.us.us.preheader.preheader ]
  %scevgep98 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv57
  %scevgep9899 = bitcast double* %scevgep98 to i8*
  %30 = add nsw i64 %indvars.iv57, -1999
  %scevgep100 = getelementptr [2000 x double], [2000 x double]* %1, i64 2000, i64 %30
  %scevgep100101 = bitcast double* %scevgep100 to i8*
  br label %.preheader9.us.us

._crit_edge22.us:                                 ; preds = %._crit_edge20.us.us
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next58, 2000
  br i1 %exitcond60, label %.preheader.us.preheader, label %._crit_edge22.us..preheader9.us.us.preheader_crit_edge

._crit_edge22.us..preheader9.us.us.preheader_crit_edge: ; preds = %._crit_edge22.us
  br label %.preheader9.us.us.preheader

.preheader9.us.us:                                ; preds = %._crit_edge20.us.us..preheader9.us.us_crit_edge, %.preheader9.us.us.preheader
  %indvars.iv53 = phi i64 [ 0, %.preheader9.us.us.preheader ], [ %indvars.iv.next54, %._crit_edge20.us.us..preheader9.us.us_crit_edge ]
  %31 = mul nuw nsw i64 %indvars.iv53, 16000
  %scevgep96 = getelementptr i8, i8* %19, i64 %31
  %32 = add i64 16000, %31
  %scevgep97 = getelementptr i8, i8* %19, i64 %32
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv53, i64 %indvars.iv57
  br i1 false, label %.preheader9.us.us.._crit_edge91.preheader_crit_edge, label %min.iters.checked

.preheader9.us.us.._crit_edge91.preheader_crit_edge: ; preds = %.preheader9.us.us
  br label %._crit_edge91.preheader

._crit_edge91.preheader:                          ; preds = %middle.block.._crit_edge91.preheader_crit_edge, %vector.memcheck.._crit_edge91.preheader_crit_edge, %min.iters.checked.._crit_edge91.preheader_crit_edge, %.preheader9.us.us.._crit_edge91.preheader_crit_edge
  br i1 true, label %._crit_edge91.preheader.._crit_edge91.prol.loopexit.unr-lcssa_crit_edge, label %._crit_edge91.prol.preheader

._crit_edge91.preheader.._crit_edge91.prol.loopexit.unr-lcssa_crit_edge: ; preds = %._crit_edge91.preheader
  br label %._crit_edge91.prol.loopexit.unr-lcssa

._crit_edge91.prol.preheader:                     ; preds = %._crit_edge91.preheader
  %34 = load double, double* %33, align 8
  %35 = load double, double* %scevgep98, align 8
  %36 = fmul double %34, %35
  %37 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv53, i64 0
  %38 = load double, double* %37, align 8
  %39 = fadd double %38, %36
  store double %39, double* %37, align 8
  br label %._crit_edge91.prol.loopexit.unr-lcssa

._crit_edge91.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge91.preheader.._crit_edge91.prol.loopexit.unr-lcssa_crit_edge, %._crit_edge91.prol.preheader
  br i1 false, label %._crit_edge91.prol.loopexit.._crit_edge20.us.us.loopexit_crit_edge, label %._crit_edge91.preheader.new

._crit_edge91.prol.loopexit.._crit_edge20.us.us.loopexit_crit_edge: ; preds = %._crit_edge91.prol.loopexit.unr-lcssa
  br label %._crit_edge20.us.us.loopexit

._crit_edge91.preheader.new:                      ; preds = %._crit_edge91.prol.loopexit.unr-lcssa
  br label %._crit_edge91

min.iters.checked:                                ; preds = %.preheader9.us.us
  br i1 false, label %min.iters.checked.._crit_edge91.preheader_crit_edge, label %vector.memcheck

min.iters.checked.._crit_edge91.preheader_crit_edge: ; preds = %min.iters.checked
  br label %._crit_edge91.preheader

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult i8* %scevgep96, %scevgep100101
  %bound1 = icmp ult i8* %scevgep9899, %scevgep97
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %33 to i8*
  %bound0103 = icmp ult i8* %scevgep96, %bc
  %bound1104 = icmp ult i8* %bc, %scevgep97
  %found.conflict105 = and i1 %bound0103, %bound1104
  %conflict.rdx = or i1 %found.conflict, %found.conflict105
  br i1 %conflict.rdx, label %vector.memcheck.._crit_edge91.preheader_crit_edge, label %vector.body.preheader

vector.memcheck.._crit_edge91.preheader_crit_edge: ; preds = %vector.memcheck
  br label %._crit_edge91.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %40 = or i64 %index, 1
  %41 = or i64 %index, 2
  %42 = or i64 %index, 3
  %43 = load double, double* %33, align 8, !alias.scope !3
  %44 = insertelement <2 x double> undef, double %43, i32 0
  %45 = shufflevector <2 x double> %44, <2 x double> undef, <2 x i32> zeroinitializer
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %index, i64 %indvars.iv57
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %40, i64 %indvars.iv57
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %41, i64 %indvars.iv57
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %42, i64 %indvars.iv57
  %50 = load double, double* %46, align 8, !alias.scope !6
  %51 = load double, double* %47, align 8, !alias.scope !6
  %52 = load double, double* %48, align 8, !alias.scope !6
  %53 = load double, double* %49, align 8, !alias.scope !6
  %54 = insertelement <2 x double> undef, double %50, i32 0
  %55 = insertelement <2 x double> %54, double %51, i32 1
  %56 = insertelement <2 x double> undef, double %52, i32 0
  %57 = insertelement <2 x double> %56, double %53, i32 1
  %58 = fmul <2 x double> %45, %55
  %59 = fmul <2 x double> %45, %57
  %60 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv53, i64 %index
  %61 = bitcast double* %60 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %61, align 8, !alias.scope !8, !noalias !10
  %62 = getelementptr double, double* %60, i64 2
  %63 = bitcast double* %62 to <2 x double>*
  %wide.load107 = load <2 x double>, <2 x double>* %63, align 8, !alias.scope !8, !noalias !10
  %64 = fadd <2 x double> %wide.load, %58
  %65 = fadd <2 x double> %wide.load107, %59
  store <2 x double> %64, <2 x double>* %61, align 8, !alias.scope !8, !noalias !10
  store <2 x double> %65, <2 x double>* %63, align 8, !alias.scope !8, !noalias !10
  %index.next = add i64 %index, 4
  %66 = icmp eq i64 %index.next, 2000
  br i1 %66, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !11

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  br i1 true, label %middle.block.._crit_edge20.us.us_crit_edge, label %middle.block.._crit_edge91.preheader_crit_edge

middle.block.._crit_edge91.preheader_crit_edge:   ; preds = %middle.block
  br label %._crit_edge91.preheader

middle.block.._crit_edge20.us.us_crit_edge:       ; preds = %middle.block
  br label %._crit_edge20.us.us

._crit_edge20.us.us.loopexit.unr-lcssa:           ; preds = %._crit_edge91
  br label %._crit_edge20.us.us.loopexit

._crit_edge20.us.us.loopexit:                     ; preds = %._crit_edge91.prol.loopexit.._crit_edge20.us.us.loopexit_crit_edge, %._crit_edge20.us.us.loopexit.unr-lcssa
  br label %._crit_edge20.us.us

._crit_edge20.us.us:                              ; preds = %middle.block.._crit_edge20.us.us_crit_edge, %._crit_edge20.us.us.loopexit
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next54, 2000
  br i1 %exitcond56, label %._crit_edge22.us, label %._crit_edge20.us.us..preheader9.us.us_crit_edge

._crit_edge20.us.us..preheader9.us.us_crit_edge:  ; preds = %._crit_edge20.us.us
  br label %.preheader9.us.us

._crit_edge91:                                    ; preds = %._crit_edge91.._crit_edge91_crit_edge, %._crit_edge91.preheader.new
  %indvars.iv49 = phi i64 [ 0, %._crit_edge91.preheader.new ], [ %indvars.iv.next50.1, %._crit_edge91.._crit_edge91_crit_edge ]
  %67 = load double, double* %33, align 8
  %68 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv49, i64 %indvars.iv57
  %69 = load double, double* %68, align 8
  %70 = fmul double %67, %69
  %71 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv53, i64 %indvars.iv49
  %72 = load double, double* %71, align 8
  %73 = fadd double %72, %70
  store double %73, double* %71, align 8
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %74 = load double, double* %33, align 8
  %75 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next50, i64 %indvars.iv57
  %76 = load double, double* %75, align 8
  %77 = fmul double %74, %76
  %78 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv53, i64 %indvars.iv.next50
  %79 = load double, double* %78, align 8
  %80 = fadd double %79, %77
  store double %80, double* %78, align 8
  %indvars.iv.next50.1 = add nsw i64 %indvars.iv49, 2
  %exitcond52.1 = icmp eq i64 %indvars.iv.next50.1, 2000
  br i1 %exitcond52.1, label %._crit_edge20.us.us.loopexit.unr-lcssa, label %._crit_edge91.._crit_edge91_crit_edge, !llvm.loop !14

._crit_edge91.._crit_edge91_crit_edge:            ; preds = %._crit_edge91
  br label %._crit_edge91

.preheader.us.preheader:                          ; preds = %._crit_edge22.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %._crit_edge.us..preheader.us_crit_edge ], [ 0, %.preheader.us.preheader ]
  %scevgep117 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 0
  %scevgep117118 = bitcast double* %scevgep117 to i8*
  %scevgep119 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 2000
  %scevgep119120 = bitcast double* %scevgep119 to i8*
  %81 = mul nuw nsw i64 %indvars.iv45, 16000
  %scevgep121 = getelementptr i8, i8* %19, i64 %81
  %82 = add i64 16000, %81
  %scevgep122 = getelementptr i8, i8* %19, i64 %82
  br i1 false, label %.preheader.us.._crit_edge92.preheader_crit_edge, label %min.iters.checked112

.preheader.us.._crit_edge92.preheader_crit_edge:  ; preds = %.preheader.us
  br label %._crit_edge92.preheader

min.iters.checked112:                             ; preds = %.preheader.us
  br i1 false, label %min.iters.checked112.._crit_edge92.preheader_crit_edge, label %vector.memcheck127

min.iters.checked112.._crit_edge92.preheader_crit_edge: ; preds = %min.iters.checked112
  br label %._crit_edge92.preheader

vector.memcheck127:                               ; preds = %min.iters.checked112
  %bound0123 = icmp ult i8* %scevgep117118, %scevgep122
  %bound1124 = icmp ult i8* %scevgep121, %scevgep119120
  %memcheck.conflict126 = and i1 %bound0123, %bound1124
  br i1 %memcheck.conflict126, label %vector.memcheck127.._crit_edge92.preheader_crit_edge, label %vector.body108.preheader

vector.memcheck127.._crit_edge92.preheader_crit_edge: ; preds = %vector.memcheck127
  br label %._crit_edge92.preheader

vector.body108.preheader:                         ; preds = %vector.memcheck127
  br label %vector.body108

vector.body108:                                   ; preds = %vector.body108.vector.body108_crit_edge, %vector.body108.preheader
  %index129 = phi i64 [ %index.next130, %vector.body108.vector.body108_crit_edge ], [ 0, %vector.body108.preheader ]
  %83 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv45, i64 %index129
  %84 = bitcast double* %83 to <2 x i64>*
  %wide.load137 = load <2 x i64>, <2 x i64>* %84, align 8, !alias.scope !15
  %85 = getelementptr double, double* %83, i64 2
  %86 = bitcast double* %85 to <2 x i64>*
  %wide.load138 = load <2 x i64>, <2 x i64>* %86, align 8, !alias.scope !15
  %87 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 %index129
  %88 = bitcast double* %87 to <2 x i64>*
  store <2 x i64> %wide.load137, <2 x i64>* %88, align 8, !alias.scope !18, !noalias !15
  %89 = getelementptr double, double* %87, i64 2
  %90 = bitcast double* %89 to <2 x i64>*
  store <2 x i64> %wide.load138, <2 x i64>* %90, align 8, !alias.scope !18, !noalias !15
  %index.next130 = add i64 %index129, 4
  %91 = icmp eq i64 %index.next130, 2000
  br i1 %91, label %middle.block109, label %vector.body108.vector.body108_crit_edge, !llvm.loop !20

vector.body108.vector.body108_crit_edge:          ; preds = %vector.body108
  br label %vector.body108

middle.block109:                                  ; preds = %vector.body108
  br i1 true, label %middle.block109.._crit_edge.us_crit_edge, label %middle.block109.._crit_edge92.preheader_crit_edge

middle.block109.._crit_edge92.preheader_crit_edge: ; preds = %middle.block109
  br label %._crit_edge92.preheader

middle.block109.._crit_edge.us_crit_edge:         ; preds = %middle.block109
  br label %._crit_edge.us

._crit_edge92.preheader:                          ; preds = %middle.block109.._crit_edge92.preheader_crit_edge, %vector.memcheck127.._crit_edge92.preheader_crit_edge, %min.iters.checked112.._crit_edge92.preheader_crit_edge, %.preheader.us.._crit_edge92.preheader_crit_edge
  br i1 true, label %._crit_edge92.preheader.._crit_edge92.prol.loopexit_crit_edge, label %._crit_edge92.prol.preheader

._crit_edge92.preheader.._crit_edge92.prol.loopexit_crit_edge: ; preds = %._crit_edge92.preheader
  br label %._crit_edge92.prol.loopexit

._crit_edge92.prol.preheader:                     ; preds = %._crit_edge92.preheader
  br label %._crit_edge92.prol

._crit_edge92.prol:                               ; preds = %._crit_edge92.prol.._crit_edge92.prol_crit_edge, %._crit_edge92.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %._crit_edge92.prol.._crit_edge92.prol_crit_edge ], [ 0, %._crit_edge92.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %._crit_edge92.prol.._crit_edge92.prol_crit_edge ], [ 0, %._crit_edge92.prol.preheader ]
  %92 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv45, i64 %indvars.iv.prol
  %93 = bitcast double* %92 to i64*
  %94 = load i64, i64* %93, align 8
  %95 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 %indvars.iv.prol
  %96 = bitcast double* %95 to i64*
  store i64 %94, i64* %96, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge92.prol.loopexit.unr-lcssa, label %._crit_edge92.prol.._crit_edge92.prol_crit_edge, !llvm.loop !21

._crit_edge92.prol.._crit_edge92.prol_crit_edge:  ; preds = %._crit_edge92.prol
  br label %._crit_edge92.prol

._crit_edge92.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge92.prol
  br label %._crit_edge92.prol.loopexit

._crit_edge92.prol.loopexit:                      ; preds = %._crit_edge92.preheader.._crit_edge92.prol.loopexit_crit_edge, %._crit_edge92.prol.loopexit.unr-lcssa
  br i1 false, label %._crit_edge92.prol.loopexit.._crit_edge.us.loopexit_crit_edge, label %._crit_edge92.preheader.new

._crit_edge92.prol.loopexit.._crit_edge.us.loopexit_crit_edge: ; preds = %._crit_edge92.prol.loopexit
  br label %._crit_edge.us.loopexit

._crit_edge92.preheader.new:                      ; preds = %._crit_edge92.prol.loopexit
  br label %._crit_edge92

._crit_edge92:                                    ; preds = %._crit_edge92.._crit_edge92_crit_edge, %._crit_edge92.preheader.new
  %indvars.iv = phi i64 [ 0, %._crit_edge92.preheader.new ], [ %indvars.iv.next.3, %._crit_edge92.._crit_edge92_crit_edge ]
  %97 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv45, i64 %indvars.iv
  %98 = bitcast double* %97 to i64*
  %99 = load i64, i64* %98, align 8
  %100 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 %indvars.iv
  %101 = bitcast double* %100 to i64*
  store i64 %99, i64* %101, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %102 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv45, i64 %indvars.iv.next
  %103 = bitcast double* %102 to i64*
  %104 = load i64, i64* %103, align 8
  %105 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 %indvars.iv.next
  %106 = bitcast double* %105 to i64*
  store i64 %104, i64* %106, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %107 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv45, i64 %indvars.iv.next.1
  %108 = bitcast double* %107 to i64*
  %109 = load i64, i64* %108, align 8
  %110 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 %indvars.iv.next.1
  %111 = bitcast double* %110 to i64*
  store i64 %109, i64* %111, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %112 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv45, i64 %indvars.iv.next.2
  %113 = bitcast double* %112 to i64*
  %114 = load i64, i64* %113, align 8
  %115 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 %indvars.iv.next.2
  %116 = bitcast double* %115 to i64*
  store i64 %114, i64* %116, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond44.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond44.3, label %._crit_edge.us.loopexit.unr-lcssa, label %._crit_edge92.._crit_edge92_crit_edge, !llvm.loop !22

._crit_edge92.._crit_edge92_crit_edge:            ; preds = %._crit_edge92
  br label %._crit_edge92

._crit_edge.us.loopexit.unr-lcssa:                ; preds = %._crit_edge92
  br label %._crit_edge.us.loopexit

._crit_edge.us.loopexit:                          ; preds = %._crit_edge92.prol.loopexit.._crit_edge.us.loopexit_crit_edge, %._crit_edge.us.loopexit.unr-lcssa
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %middle.block109.._crit_edge.us_crit_edge, %._crit_edge.us.loopexit
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond48 = icmp eq i64 %indvars.iv.next46, 2000
  br i1 %exitcond48, label %._crit_edge17.loopexit, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge17.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17.loopexit, %._crit_edge40.thread
  %117 = phi i8* [ undef, %._crit_edge40.thread ], [ %19, %._crit_edge17.loopexit ]
  tail call void @free(i8* %117) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  br i1 true, label %.preheader4.preheader, label %.._crit_edge11_crit_edge

.._crit_edge11_crit_edge:                         ; preds = %2
  br label %._crit_edge11

.preheader4.preheader:                            ; preds = %2
  br label %.preheader4

.preheader4:                                      ; preds = %._crit_edge9..preheader4_crit_edge, %.preheader4.preheader
  %indvars.iv47 = phi i2 [ 0, %.preheader4.preheader ], [ %indvars.iv.next48, %._crit_edge9..preheader4_crit_edge ]
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %._crit_edge9..preheader4_crit_edge ], [ 0, %.preheader4.preheader ]
  %3 = zext i2 %indvars.iv47 to i64
  %4 = add nsw i64 %indvars.iv34, -1
  %5 = icmp sgt i64 %indvars.iv34, 0
  br i1 %5, label %.preheader.preheader, label %.preheader4.._crit_edge9_crit_edge

.preheader4.._crit_edge9_crit_edge:               ; preds = %.preheader4
  %.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv34, i64 %indvars.iv34
  %.pre49 = load double, double* %.phi.trans.insert, align 8
  br label %._crit_edge9

.preheader.preheader:                             ; preds = %.preheader4
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv34, i64 0
  br label %.preheader

.lr.ph8:                                          ; preds = %._crit_edge
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv34, i64 %indvars.iv34
  %.pre41 = load double, double* %7, align 8
  %xtraiter42 = and i64 %indvars.iv34, 3
  %lcmp.mod43 = icmp eq i64 %xtraiter42, 0
  br i1 %lcmp.mod43, label %.lr.ph8.._crit_edge39.prol.loopexit_crit_edge, label %._crit_edge39.prol.preheader

.lr.ph8.._crit_edge39.prol.loopexit_crit_edge:    ; preds = %.lr.ph8
  br label %._crit_edge39.prol.loopexit

._crit_edge39.prol.preheader:                     ; preds = %.lr.ph8
  br label %._crit_edge39.prol

._crit_edge39.prol:                               ; preds = %._crit_edge39.prol.._crit_edge39.prol_crit_edge, %._crit_edge39.prol.preheader
  %8 = phi double [ %.pre41, %._crit_edge39.prol.preheader ], [ %12, %._crit_edge39.prol.._crit_edge39.prol_crit_edge ]
  %indvars.iv26.prol = phi i64 [ 0, %._crit_edge39.prol.preheader ], [ %indvars.iv.next27.prol, %._crit_edge39.prol.._crit_edge39.prol_crit_edge ]
  %prol.iter = phi i64 [ %xtraiter42, %._crit_edge39.prol.preheader ], [ %prol.iter.sub, %._crit_edge39.prol.._crit_edge39.prol_crit_edge ]
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv34, i64 %indvars.iv26.prol
  %10 = load double, double* %9, align 8
  %11 = fmul double %10, %10
  %12 = fsub double %8, %11
  store double %12, double* %7, align 8
  %indvars.iv.next27.prol = add nuw nsw i64 %indvars.iv26.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge39.prol.loopexit.unr-lcssa, label %._crit_edge39.prol.._crit_edge39.prol_crit_edge, !llvm.loop !23

._crit_edge39.prol.._crit_edge39.prol_crit_edge:  ; preds = %._crit_edge39.prol
  br label %._crit_edge39.prol

._crit_edge39.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge39.prol
  br label %._crit_edge39.prol.loopexit

._crit_edge39.prol.loopexit:                      ; preds = %.lr.ph8.._crit_edge39.prol.loopexit_crit_edge, %._crit_edge39.prol.loopexit.unr-lcssa
  %.unr44 = phi double [ %.pre41, %.lr.ph8.._crit_edge39.prol.loopexit_crit_edge ], [ %12, %._crit_edge39.prol.loopexit.unr-lcssa ]
  %indvars.iv26.unr = phi i64 [ 0, %.lr.ph8.._crit_edge39.prol.loopexit_crit_edge ], [ %3, %._crit_edge39.prol.loopexit.unr-lcssa ]
  %13 = icmp ult i64 %4, 3
  br i1 %13, label %._crit_edge39.prol.loopexit.._crit_edge9.loopexit_crit_edge, label %.lr.ph8.new

._crit_edge39.prol.loopexit.._crit_edge9.loopexit_crit_edge: ; preds = %._crit_edge39.prol.loopexit
  br label %._crit_edge9.loopexit

.lr.ph8.new:                                      ; preds = %._crit_edge39.prol.loopexit
  br label %._crit_edge39

.preheader:                                       ; preds = %._crit_edge..preheader_crit_edge, %.preheader.preheader
  %indvars.iv18 = phi i64 [ %indvars.iv.next19, %._crit_edge..preheader_crit_edge ], [ 0, %.preheader.preheader ]
  %14 = icmp sgt i64 %indvars.iv18, 0
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv34, i64 %indvars.iv18
  %.pre = load double, double* %15, align 8
  br i1 %14, label %._crit_edge38.preheader, label %.preheader.._crit_edge_crit_edge

.preheader.._crit_edge_crit_edge:                 ; preds = %.preheader
  br label %._crit_edge

._crit_edge38.preheader:                          ; preds = %.preheader
  %xtraiter = and i64 %indvars.iv18, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge38.preheader.._crit_edge38.prol.loopexit.unr-lcssa_crit_edge, label %._crit_edge38.prol.preheader

._crit_edge38.preheader.._crit_edge38.prol.loopexit.unr-lcssa_crit_edge: ; preds = %._crit_edge38.preheader
  br label %._crit_edge38.prol.loopexit.unr-lcssa

._crit_edge38.prol.preheader:                     ; preds = %._crit_edge38.preheader
  %16 = load double, double* %6, align 8
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv18, i64 0
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = fsub double %.pre, %19
  store double %20, double* %15, align 8
  br label %._crit_edge38.prol.loopexit.unr-lcssa

._crit_edge38.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge38.preheader.._crit_edge38.prol.loopexit.unr-lcssa_crit_edge, %._crit_edge38.prol.preheader
  %.lcssa.unr.ph = phi double [ %20, %._crit_edge38.prol.preheader ], [ undef, %._crit_edge38.preheader.._crit_edge38.prol.loopexit.unr-lcssa_crit_edge ]
  %.unr.ph = phi double [ %20, %._crit_edge38.prol.preheader ], [ %.pre, %._crit_edge38.preheader.._crit_edge38.prol.loopexit.unr-lcssa_crit_edge ]
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge38.prol.preheader ], [ 0, %._crit_edge38.preheader.._crit_edge38.prol.loopexit.unr-lcssa_crit_edge ]
  %21 = icmp eq i64 %indvars.iv18, 1
  br i1 %21, label %._crit_edge38.prol.loopexit.._crit_edge.loopexit_crit_edge, label %._crit_edge38.preheader.new

._crit_edge38.prol.loopexit.._crit_edge.loopexit_crit_edge: ; preds = %._crit_edge38.prol.loopexit.unr-lcssa
  br label %._crit_edge.loopexit

._crit_edge38.preheader.new:                      ; preds = %._crit_edge38.prol.loopexit.unr-lcssa
  br label %._crit_edge38

._crit_edge38:                                    ; preds = %._crit_edge38.._crit_edge38_crit_edge, %._crit_edge38.preheader.new
  %22 = phi double [ %.unr.ph, %._crit_edge38.preheader.new ], [ %34, %._crit_edge38.._crit_edge38_crit_edge ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %._crit_edge38.preheader.new ], [ %indvars.iv.next.1, %._crit_edge38.._crit_edge38_crit_edge ]
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv34, i64 %indvars.iv
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv18, i64 %indvars.iv
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fsub double %22, %27
  store double %28, double* %15, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv34, i64 %indvars.iv.next
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv18, i64 %indvars.iv.next
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = fsub double %28, %33
  store double %34, double* %15, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond17.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv18
  br i1 %exitcond17.1, label %._crit_edge.loopexit.unr-lcssa, label %._crit_edge38.._crit_edge38_crit_edge

._crit_edge38.._crit_edge38_crit_edge:            ; preds = %._crit_edge38
  br label %._crit_edge38

._crit_edge.loopexit.unr-lcssa:                   ; preds = %._crit_edge38
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge38.prol.loopexit.._crit_edge.loopexit_crit_edge, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %._crit_edge38.prol.loopexit.._crit_edge.loopexit_crit_edge ], [ %34, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %.preheader.._crit_edge_crit_edge, %._crit_edge.loopexit
  %35 = phi double [ %.pre, %.preheader.._crit_edge_crit_edge ], [ %.lcssa, %._crit_edge.loopexit ]
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv18, i64 %indvars.iv18
  %37 = load double, double* %36, align 8
  %38 = fdiv double %35, %37
  store double %38, double* %15, align 8
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next19, %indvars.iv34
  br i1 %exitcond25, label %.lr.ph8, label %._crit_edge..preheader_crit_edge

._crit_edge..preheader_crit_edge:                 ; preds = %._crit_edge
  br label %.preheader

._crit_edge39:                                    ; preds = %._crit_edge39.._crit_edge39_crit_edge, %.lr.ph8.new
  %39 = phi double [ %.unr44, %.lr.ph8.new ], [ %55, %._crit_edge39.._crit_edge39_crit_edge ]
  %indvars.iv26 = phi i64 [ %indvars.iv26.unr, %.lr.ph8.new ], [ %indvars.iv.next27.3, %._crit_edge39.._crit_edge39_crit_edge ]
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv34, i64 %indvars.iv26
  %41 = load double, double* %40, align 8
  %42 = fmul double %41, %41
  %43 = fsub double %39, %42
  store double %43, double* %7, align 8
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv34, i64 %indvars.iv.next27
  %45 = load double, double* %44, align 8
  %46 = fmul double %45, %45
  %47 = fsub double %43, %46
  store double %47, double* %7, align 8
  %indvars.iv.next27.1 = add nsw i64 %indvars.iv26, 2
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv34, i64 %indvars.iv.next27.1
  %49 = load double, double* %48, align 8
  %50 = fmul double %49, %49
  %51 = fsub double %47, %50
  store double %51, double* %7, align 8
  %indvars.iv.next27.2 = add nsw i64 %indvars.iv26, 3
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv34, i64 %indvars.iv.next27.2
  %53 = load double, double* %52, align 8
  %54 = fmul double %53, %53
  %55 = fsub double %51, %54
  store double %55, double* %7, align 8
  %indvars.iv.next27.3 = add nsw i64 %indvars.iv26, 4
  %exitcond33.3 = icmp eq i64 %indvars.iv.next27.3, %indvars.iv34
  br i1 %exitcond33.3, label %._crit_edge9.loopexit.unr-lcssa, label %._crit_edge39.._crit_edge39_crit_edge

._crit_edge39.._crit_edge39_crit_edge:            ; preds = %._crit_edge39
  br label %._crit_edge39

._crit_edge9.loopexit.unr-lcssa:                  ; preds = %._crit_edge39
  br label %._crit_edge9.loopexit

._crit_edge9.loopexit:                            ; preds = %._crit_edge39.prol.loopexit.._crit_edge9.loopexit_crit_edge, %._crit_edge9.loopexit.unr-lcssa
  %56 = phi double [ %.unr44, %._crit_edge39.prol.loopexit.._crit_edge9.loopexit_crit_edge ], [ %55, %._crit_edge9.loopexit.unr-lcssa ]
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %.preheader4.._crit_edge9_crit_edge, %._crit_edge9.loopexit
  %.pre-phi = phi double* [ %.phi.trans.insert, %.preheader4.._crit_edge9_crit_edge ], [ %7, %._crit_edge9.loopexit ]
  %57 = phi double [ %.pre49, %.preheader4.._crit_edge9_crit_edge ], [ %56, %._crit_edge9.loopexit ]
  %58 = tail call double @sqrt(double %57) #3
  store double %58, double* %.pre-phi, align 8
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next35, 2000
  %indvars.iv.next48 = add i2 %indvars.iv47, 1
  br i1 %exitcond37, label %._crit_edge11.loopexit, label %._crit_edge9..preheader4_crit_edge

._crit_edge9..preheader4_crit_edge:               ; preds = %._crit_edge9
  br label %.preheader4

._crit_edge11.loopexit:                           ; preds = %._crit_edge9
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %.._crit_edge11_crit_edge, %._crit_edge11.loopexit
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
  br i1 true, label %.preheader.preheader, label %.._crit_edge4_crit_edge

.._crit_edge4_crit_edge:                          ; preds = %2
  br label %._crit_edge4

.preheader.preheader:                             ; preds = %2
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge..lr.ph_crit_edge, %.preheader.preheader
  %indvars.iv13 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next14, %._crit_edge..lr.ph_crit_edge ]
  %indvars.iv11 = phi i64 [ 1, %.preheader.preheader ], [ %indvars.iv.next12, %._crit_edge..lr.ph_crit_edge ]
  %7 = mul nsw i64 %indvars.iv13, 2000
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %._crit_edge17.._crit_edge18_crit_edge, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge17.._crit_edge18_crit_edge ]
  %8 = add nsw i64 %indvars.iv, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge18.._crit_edge17_crit_edge

._crit_edge18.._crit_edge17_crit_edge:            ; preds = %._crit_edge18
  br label %._crit_edge17

; <label>:12:                                     ; preds = %._crit_edge18
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge18.._crit_edge17_crit_edge, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv13, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next, %indvars.iv11
  br i1 %exitcond10, label %._crit_edge, label %._crit_edge17.._crit_edge18_crit_edge

._crit_edge17.._crit_edge18_crit_edge:            ; preds = %._crit_edge17
  br label %._crit_edge18

._crit_edge:                                      ; preds = %._crit_edge17
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next14, 2000
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  br i1 %exitcond16, label %._crit_edge4.loopexit, label %._crit_edge..lr.ph_crit_edge

._crit_edge..lr.ph_crit_edge:                     ; preds = %._crit_edge
  br label %.lr.ph

._crit_edge4.loopexit:                            ; preds = %._crit_edge
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %.._crit_edge4_crit_edge, %._crit_edge4.loopexit
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
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
