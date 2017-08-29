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
  tail call fastcc void @init_array([2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_cholesky([2000 x double]* %4)
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
  tail call fastcc void @print_array([2000 x double]* %4)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture) unnamed_addr #0 {
  br i1 true, label %.preheader14.lr.ph, label %._crit_edge42.thread

._crit_edge42.thread:                             ; preds = %1
  %2 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %._crit_edge17

.preheader14.lr.ph:                               ; preds = %1
  br label %.lr.ph36

.lr.ph36:                                         ; preds = %._crit_edge40, %.preheader14.lr.ph
  %indvars.iv89 = phi i64 [ 0, %.preheader14.lr.ph ], [ %indvars.iv.next90, %._crit_edge40 ]
  %indvars.iv87 = phi i64 [ 1, %.preheader14.lr.ph ], [ %indvars.iv.next88, %._crit_edge40 ]
  %3 = mul nuw nsw i64 %indvars.iv89, 2001
  %4 = sub i64 1998, %indvars.iv89
  br label %._crit_edge

.preheader13:                                     ; preds = %._crit_edge
  %5 = add nuw nsw i64 %3, 1
  %6 = shl i64 %4, 3
  %scevgep83 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %5
  %7 = and i64 %6, 34359738360
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1
  %8 = icmp slt i64 %indvars.iv.next90, 2000
  br i1 %8, label %.lr.ph39.preheader, label %._crit_edge40

.lr.ph39.preheader:                               ; preds = %.preheader13
  %9 = add nuw nsw i64 %7, 8
  %scevgep8384 = bitcast double* %scevgep83 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep8384, i8 0, i64 %9, i32 8, i1 false)
  br label %._crit_edge40

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph36
  %indvars.iv71 = phi i64 [ 0, %.lr.ph36 ], [ %indvars.iv.next72, %._crit_edge ]
  %10 = sub nsw i64 0, %indvars.iv71
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 2000
  %13 = sitofp i32 %12 to double
  %14 = fdiv double %13, 2.000000e+03
  %15 = fadd double %14, 1.000000e+00
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv89, i64 %indvars.iv71
  store double %15, double* %16, align 8
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %exitcond78 = icmp eq i64 %indvars.iv.next72, %indvars.iv87
  br i1 %exitcond78, label %.preheader13, label %._crit_edge

._crit_edge40:                                    ; preds = %.preheader13, %.lr.ph39.preheader
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv89, i64 %indvars.iv89
  store double 1.000000e+00, double* %17, align 8
  %exitcond92 = icmp eq i64 %indvars.iv.next90, 2000
  %indvars.iv.next88 = add nuw nsw i64 %indvars.iv87, 1
  br i1 %exitcond92, label %._crit_edge42, label %.lr.ph36

._crit_edge42:                                    ; preds = %._crit_edge40
  %18 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %19 = bitcast i8* %18 to [2000 x [2000 x double]]*
  br i1 true, label %.preheader12.us.prol.loopexit, label %.preheader12.us.prol.preheader

.preheader12.us.prol.preheader:                   ; preds = %._crit_edge42
  br label %.preheader12.us.prol

.preheader12.us.prol:                             ; preds = %.preheader12.us.prol, %.preheader12.us.prol.preheader
  %indvars.iv67.prol = phi i64 [ 0, %.preheader12.us.prol.preheader ], [ %indvars.iv.next68.prol, %.preheader12.us.prol ]
  %prol.iter146 = phi i64 [ 0, %.preheader12.us.prol.preheader ], [ %prol.iter146.sub, %.preheader12.us.prol ]
  %20 = mul nuw nsw i64 %indvars.iv67.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %18, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next68.prol = add nuw nsw i64 %indvars.iv67.prol, 1
  %prol.iter146.sub = add nsw i64 %prol.iter146, -1
  %prol.iter146.cmp = icmp eq i64 %prol.iter146.sub, 0
  br i1 %prol.iter146.cmp, label %.preheader12.us.prol.loopexit.unr-lcssa, label %.preheader12.us.prol, !llvm.loop !1

.preheader12.us.prol.loopexit.unr-lcssa:          ; preds = %.preheader12.us.prol
  br label %.preheader12.us.prol.loopexit

.preheader12.us.prol.loopexit:                    ; preds = %._crit_edge42, %.preheader12.us.prol.loopexit.unr-lcssa
  br i1 false, label %.preheader9.us.us.preheader.preheader, label %._crit_edge42.new

._crit_edge42.new:                                ; preds = %.preheader12.us.prol.loopexit
  br label %.preheader12.us

.preheader12.us:                                  ; preds = %.preheader12.us, %._crit_edge42.new
  %indvars.iv67 = phi i64 [ 0, %._crit_edge42.new ], [ %indvars.iv.next68.7, %.preheader12.us ]
  %21 = mul nuw nsw i64 %indvars.iv67, 16000
  %scevgep = getelementptr i8, i8* %18, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %22 = mul i64 %indvars.iv67, 16000
  %23 = add i64 %22, 16000
  %scevgep.1 = getelementptr i8, i8* %18, i64 %23
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %24 = mul i64 %indvars.iv67, 16000
  %25 = add i64 %24, 32000
  %scevgep.2 = getelementptr i8, i8* %18, i64 %25
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %26 = mul i64 %indvars.iv67, 16000
  %27 = add i64 %26, 48000
  %scevgep.3 = getelementptr i8, i8* %18, i64 %27
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %28 = mul i64 %indvars.iv67, 16000
  %29 = add i64 %28, 64000
  %scevgep.4 = getelementptr i8, i8* %18, i64 %29
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %30 = mul i64 %indvars.iv67, 16000
  %31 = add i64 %30, 80000
  %scevgep.5 = getelementptr i8, i8* %18, i64 %31
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %32 = mul i64 %indvars.iv67, 16000
  %33 = add i64 %32, 96000
  %scevgep.6 = getelementptr i8, i8* %18, i64 %33
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %34 = mul i64 %indvars.iv67, 16000
  %35 = add i64 %34, 112000
  %scevgep.7 = getelementptr i8, i8* %18, i64 %35
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next68.7 = add nsw i64 %indvars.iv67, 8
  %exitcond70.7 = icmp eq i64 %indvars.iv.next68.7, 2000
  br i1 %exitcond70.7, label %.preheader9.us.us.preheader.preheader.unr-lcssa, label %.preheader12.us

.preheader9.us.us.preheader.preheader.unr-lcssa:  ; preds = %.preheader12.us
  br label %.preheader9.us.us.preheader.preheader

.preheader9.us.us.preheader.preheader:            ; preds = %.preheader12.us.prol.loopexit, %.preheader9.us.us.preheader.preheader.unr-lcssa
  br label %.preheader9.us.us.preheader

.preheader9.us.us.preheader:                      ; preds = %.preheader9.us.us.preheader.preheader, %._crit_edge22.us
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %._crit_edge22.us ], [ 0, %.preheader9.us.us.preheader.preheader ]
  %scevgep101 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv59
  %scevgep101102 = bitcast double* %scevgep101 to i8*
  %36 = add nsw i64 %indvars.iv59, -1999
  %scevgep103 = getelementptr [2000 x double], [2000 x double]* %0, i64 2000, i64 %36
  %scevgep103104 = bitcast double* %scevgep103 to i8*
  br label %.preheader9.us.us

._crit_edge22.us:                                 ; preds = %._crit_edge20.us.us
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next60, 2000
  br i1 %exitcond62, label %.preheader.us.preheader, label %.preheader9.us.us.preheader

.preheader9.us.us:                                ; preds = %._crit_edge20.us.us, %.preheader9.us.us.preheader
  %indvars.iv55 = phi i64 [ 0, %.preheader9.us.us.preheader ], [ %indvars.iv.next56, %._crit_edge20.us.us ]
  %37 = mul nuw nsw i64 %indvars.iv55, 16000
  %scevgep99 = getelementptr i8, i8* %18, i64 %37
  %38 = add i64 16000, %37
  %scevgep100 = getelementptr i8, i8* %18, i64 %38
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv55, i64 %indvars.iv59
  br i1 false, label %._crit_edge93.preheader, label %min.iters.checked

._crit_edge93.preheader:                          ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader9.us.us
  %indvars.iv51.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader9.us.us ], [ 2000, %middle.block ]
  br i1 true, label %._crit_edge93.prol.loopexit.unr-lcssa, label %._crit_edge93.prol.preheader

._crit_edge93.prol.preheader:                     ; preds = %._crit_edge93.preheader
  br label %._crit_edge93.prol

._crit_edge93.prol:                               ; preds = %._crit_edge93.prol.preheader
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv51.ph, i64 %indvars.iv59
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv55, i64 %indvars.iv51.ph
  %45 = load double, double* %44, align 8
  %46 = fadd double %45, %43
  store double %46, double* %44, align 8
  %indvars.iv.next52.prol = add nuw nsw i64 %indvars.iv51.ph, 1
  br label %._crit_edge93.prol.loopexit.unr-lcssa

._crit_edge93.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge93.preheader, %._crit_edge93.prol
  %indvars.iv51.unr.ph = phi i64 [ %indvars.iv.next52.prol, %._crit_edge93.prol ], [ %indvars.iv51.ph, %._crit_edge93.preheader ]
  br label %._crit_edge93.prol.loopexit

._crit_edge93.prol.loopexit:                      ; preds = %._crit_edge93.prol.loopexit.unr-lcssa
  br i1 false, label %._crit_edge20.us.us.loopexit, label %._crit_edge93.preheader.new

._crit_edge93.preheader.new:                      ; preds = %._crit_edge93.prol.loopexit
  br label %._crit_edge93

min.iters.checked:                                ; preds = %.preheader9.us.us
  br i1 false, label %._crit_edge93.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult i8* %scevgep99, %scevgep103104
  %bound1 = icmp ult i8* %scevgep101102, %scevgep100
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %39 to i8*
  %bc105 = bitcast double* %39 to i8*
  %bound0106 = icmp ult i8* %scevgep99, %bc105
  %bound1107 = icmp ult i8* %bc, %scevgep100
  %found.conflict108 = and i1 %bound0106, %bound1107
  %conflict.rdx = or i1 %found.conflict, %found.conflict108
  br i1 %conflict.rdx, label %._crit_edge93.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %47 = load double, double* %39, align 8, !alias.scope !3
  %48 = insertelement <2 x double> undef, double %47, i32 0
  %49 = shufflevector <2 x double> %48, <2 x double> undef, <2 x i32> zeroinitializer
  %50 = insertelement <2 x double> undef, double %47, i32 0
  %51 = shufflevector <2 x double> %50, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %52 = or i64 %index, 1
  %53 = or i64 %index, 2
  %54 = or i64 %index, 3
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index, i64 %indvars.iv59
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %52, i64 %indvars.iv59
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %53, i64 %indvars.iv59
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %54, i64 %indvars.iv59
  %59 = load double, double* %55, align 8, !alias.scope !6
  %60 = load double, double* %56, align 8, !alias.scope !6
  %61 = load double, double* %57, align 8, !alias.scope !6
  %62 = load double, double* %58, align 8, !alias.scope !6
  %63 = insertelement <2 x double> undef, double %59, i32 0
  %64 = insertelement <2 x double> %63, double %60, i32 1
  %65 = insertelement <2 x double> undef, double %61, i32 0
  %66 = insertelement <2 x double> %65, double %62, i32 1
  %67 = fmul <2 x double> %49, %64
  %68 = fmul <2 x double> %51, %66
  %69 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv55, i64 %index
  %70 = bitcast double* %69 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %70, align 8, !alias.scope !8, !noalias !10
  %71 = getelementptr double, double* %69, i64 2
  %72 = bitcast double* %71 to <2 x double>*
  %wide.load110 = load <2 x double>, <2 x double>* %72, align 8, !alias.scope !8, !noalias !10
  %73 = fadd <2 x double> %wide.load, %67
  %74 = fadd <2 x double> %wide.load110, %68
  %75 = bitcast double* %69 to <2 x double>*
  store <2 x double> %73, <2 x double>* %75, align 8, !alias.scope !8, !noalias !10
  %76 = bitcast double* %71 to <2 x double>*
  store <2 x double> %74, <2 x double>* %76, align 8, !alias.scope !8, !noalias !10
  %index.next = add i64 %index, 4
  %77 = icmp eq i64 %index.next, 2000
  br i1 %77, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  br i1 true, label %._crit_edge20.us.us, label %._crit_edge93.preheader

._crit_edge20.us.us.loopexit.unr-lcssa:           ; preds = %._crit_edge93
  br label %._crit_edge20.us.us.loopexit

._crit_edge20.us.us.loopexit:                     ; preds = %._crit_edge93.prol.loopexit, %._crit_edge20.us.us.loopexit.unr-lcssa
  br label %._crit_edge20.us.us

._crit_edge20.us.us:                              ; preds = %._crit_edge20.us.us.loopexit, %middle.block
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond98 = icmp eq i64 %indvars.iv.next56, 2000
  br i1 %exitcond98, label %._crit_edge22.us, label %.preheader9.us.us

._crit_edge93:                                    ; preds = %._crit_edge93, %._crit_edge93.preheader.new
  %indvars.iv51 = phi i64 [ %indvars.iv51.unr.ph, %._crit_edge93.preheader.new ], [ %indvars.iv.next52.1, %._crit_edge93 ]
  %78 = load double, double* %39, align 8
  %79 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv51, i64 %indvars.iv59
  %80 = load double, double* %79, align 8
  %81 = fmul double %78, %80
  %82 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv55, i64 %indvars.iv51
  %83 = load double, double* %82, align 8
  %84 = fadd double %83, %81
  store double %84, double* %82, align 8
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %85 = load double, double* %39, align 8
  %86 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next52, i64 %indvars.iv59
  %87 = load double, double* %86, align 8
  %88 = fmul double %85, %87
  %89 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv55, i64 %indvars.iv.next52
  %90 = load double, double* %89, align 8
  %91 = fadd double %90, %88
  store double %91, double* %89, align 8
  %indvars.iv.next52.1 = add nsw i64 %indvars.iv51, 2
  %exitcond54.1 = icmp eq i64 %indvars.iv.next52.1, 2000
  br i1 %exitcond54.1, label %._crit_edge20.us.us.loopexit.unr-lcssa, label %._crit_edge93, !llvm.loop !14

.preheader.us.preheader:                          ; preds = %._crit_edge22.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv47 = phi i64 [ %indvars.iv.next48, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %scevgep120 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv47, i64 0
  %scevgep120121 = bitcast double* %scevgep120 to i8*
  %scevgep122 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv47, i64 2000
  %scevgep122123 = bitcast double* %scevgep122 to i8*
  %92 = mul nuw nsw i64 %indvars.iv47, 16000
  %scevgep124 = getelementptr i8, i8* %18, i64 %92
  %93 = add i64 16000, %92
  %scevgep125 = getelementptr i8, i8* %18, i64 %93
  br i1 false, label %._crit_edge94.preheader, label %min.iters.checked115

min.iters.checked115:                             ; preds = %.preheader.us
  br i1 false, label %._crit_edge94.preheader, label %vector.memcheck130

vector.memcheck130:                               ; preds = %min.iters.checked115
  %bound0126 = icmp ult i8* %scevgep120121, %scevgep125
  %bound1127 = icmp ult i8* %scevgep124, %scevgep122123
  %memcheck.conflict129 = and i1 %bound0126, %bound1127
  br i1 %memcheck.conflict129, label %._crit_edge94.preheader, label %vector.body111.preheader

vector.body111.preheader:                         ; preds = %vector.memcheck130
  br label %vector.body111

vector.body111:                                   ; preds = %vector.body111.preheader, %vector.body111
  %index132 = phi i64 [ %index.next133, %vector.body111 ], [ 0, %vector.body111.preheader ]
  %94 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv47, i64 %index132
  %95 = bitcast double* %94 to <2 x i64>*
  %wide.load140 = load <2 x i64>, <2 x i64>* %95, align 8, !alias.scope !15
  %96 = getelementptr double, double* %94, i64 2
  %97 = bitcast double* %96 to <2 x i64>*
  %wide.load141 = load <2 x i64>, <2 x i64>* %97, align 8, !alias.scope !15
  %98 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv47, i64 %index132
  %99 = bitcast double* %98 to <2 x i64>*
  store <2 x i64> %wide.load140, <2 x i64>* %99, align 8, !alias.scope !18, !noalias !15
  %100 = getelementptr double, double* %98, i64 2
  %101 = bitcast double* %100 to <2 x i64>*
  store <2 x i64> %wide.load141, <2 x i64>* %101, align 8, !alias.scope !18, !noalias !15
  %index.next133 = add i64 %index132, 4
  %102 = icmp eq i64 %index.next133, 2000
  br i1 %102, label %middle.block112, label %vector.body111, !llvm.loop !20

middle.block112:                                  ; preds = %vector.body111
  br i1 true, label %._crit_edge.us, label %._crit_edge94.preheader

._crit_edge94.preheader:                          ; preds = %middle.block112, %vector.memcheck130, %min.iters.checked115, %.preheader.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck130 ], [ 0, %min.iters.checked115 ], [ 0, %.preheader.us ], [ 2000, %middle.block112 ]
  %103 = sub nsw i64 1999, %indvars.iv.ph
  br i1 true, label %._crit_edge94.prol.loopexit, label %._crit_edge94.prol.preheader

._crit_edge94.prol.preheader:                     ; preds = %._crit_edge94.preheader
  br label %._crit_edge94.prol

._crit_edge94.prol:                               ; preds = %._crit_edge94.prol, %._crit_edge94.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %._crit_edge94.prol ], [ %indvars.iv.ph, %._crit_edge94.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %._crit_edge94.prol ], [ 0, %._crit_edge94.prol.preheader ]
  %104 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv47, i64 %indvars.iv.prol
  %105 = bitcast double* %104 to i64*
  %106 = load i64, i64* %105, align 8
  %107 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv47, i64 %indvars.iv.prol
  %108 = bitcast double* %107 to i64*
  store i64 %106, i64* %108, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge94.prol.loopexit.unr-lcssa, label %._crit_edge94.prol, !llvm.loop !21

._crit_edge94.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge94.prol
  br label %._crit_edge94.prol.loopexit

._crit_edge94.prol.loopexit:                      ; preds = %._crit_edge94.preheader, %._crit_edge94.prol.loopexit.unr-lcssa
  %109 = icmp ult i64 %103, 3
  br i1 %109, label %._crit_edge.us.loopexit, label %._crit_edge94.preheader.new

._crit_edge94.preheader.new:                      ; preds = %._crit_edge94.prol.loopexit
  br label %._crit_edge94

._crit_edge94:                                    ; preds = %._crit_edge94, %._crit_edge94.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.ph, %._crit_edge94.preheader.new ], [ %indvars.iv.next.3, %._crit_edge94 ]
  %110 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv47, i64 %indvars.iv
  %111 = bitcast double* %110 to i64*
  %112 = load i64, i64* %111, align 8
  %113 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv47, i64 %indvars.iv
  %114 = bitcast double* %113 to i64*
  store i64 %112, i64* %114, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %115 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv47, i64 %indvars.iv.next
  %116 = bitcast double* %115 to i64*
  %117 = load i64, i64* %116, align 8
  %118 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv47, i64 %indvars.iv.next
  %119 = bitcast double* %118 to i64*
  store i64 %117, i64* %119, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %120 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv47, i64 %indvars.iv.next.1
  %121 = bitcast double* %120 to i64*
  %122 = load i64, i64* %121, align 8
  %123 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv47, i64 %indvars.iv.next.1
  %124 = bitcast double* %123 to i64*
  store i64 %122, i64* %124, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %125 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv47, i64 %indvars.iv.next.2
  %126 = bitcast double* %125 to i64*
  %127 = load i64, i64* %126, align 8
  %128 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv47, i64 %indvars.iv.next.2
  %129 = bitcast double* %128 to i64*
  store i64 %127, i64* %129, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond46.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond46.3, label %._crit_edge.us.loopexit.unr-lcssa, label %._crit_edge94, !llvm.loop !22

._crit_edge.us.loopexit.unr-lcssa:                ; preds = %._crit_edge94
  br label %._crit_edge.us.loopexit

._crit_edge.us.loopexit:                          ; preds = %._crit_edge94.prol.loopexit, %._crit_edge.us.loopexit.unr-lcssa
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block112
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond = icmp eq i64 %indvars.iv.next48, 2000
  br i1 %exitcond, label %._crit_edge17.loopexit, label %.preheader.us

._crit_edge17.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17.loopexit, %._crit_edge42.thread
  %130 = phi i8* [ %2, %._crit_edge42.thread ], [ %18, %._crit_edge17.loopexit ]
  tail call void @free(i8* %130) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky([2000 x double]* nocapture) unnamed_addr #0 {
  br i1 true, label %.preheader4.preheader, label %._crit_edge11

.preheader4.preheader:                            ; preds = %1
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader4.preheader, %._crit_edge9
  %indvars.iv57 = phi i2 [ 0, %.preheader4.preheader ], [ %indvars.iv.next58, %._crit_edge9 ]
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %._crit_edge9 ], [ 0, %.preheader4.preheader ]
  %2 = zext i2 %indvars.iv57 to i64
  %3 = add nsw i64 %indvars.iv34, -1
  %4 = icmp sgt i64 %indvars.iv34, 0
  br i1 %4, label %.preheader.preheader, label %.preheader3.._crit_edge9_crit_edge

.preheader.preheader:                             ; preds = %.preheader4
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv34, i64 0
  br label %.preheader

.preheader3.._crit_edge9_crit_edge:               ; preds = %.preheader4
  %.phi.trans.insert42 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv34, i64 %indvars.iv34
  %.pre43 = load double, double* %.phi.trans.insert42, align 8
  br label %._crit_edge9

.lr.ph8:                                          ; preds = %._crit_edge
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv34, i64 %indvars.iv34
  %.pre41 = load double, double* %6, align 8
  %xtraiter51 = and i64 %indvars.iv34, 3
  %lcmp.mod52 = icmp eq i64 %xtraiter51, 0
  br i1 %lcmp.mod52, label %._crit_edge39.prol.loopexit, label %._crit_edge39.prol.preheader

._crit_edge39.prol.preheader:                     ; preds = %.lr.ph8
  br label %._crit_edge39.prol

._crit_edge39.prol:                               ; preds = %._crit_edge39.prol, %._crit_edge39.prol.preheader
  %7 = phi double [ %.pre41, %._crit_edge39.prol.preheader ], [ %11, %._crit_edge39.prol ]
  %indvars.iv26.prol = phi i64 [ 0, %._crit_edge39.prol.preheader ], [ %indvars.iv.next27.prol, %._crit_edge39.prol ]
  %prol.iter = phi i64 [ %xtraiter51, %._crit_edge39.prol.preheader ], [ %prol.iter.sub, %._crit_edge39.prol ]
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv34, i64 %indvars.iv26.prol
  %9 = load double, double* %8, align 8
  %10 = fmul double %9, %9
  %11 = fsub double %7, %10
  store double %11, double* %6, align 8
  %indvars.iv.next27.prol = add nuw nsw i64 %indvars.iv26.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge39.prol.loopexit.unr-lcssa, label %._crit_edge39.prol, !llvm.loop !23

._crit_edge39.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge39.prol
  br label %._crit_edge39.prol.loopexit

._crit_edge39.prol.loopexit:                      ; preds = %.lr.ph8, %._crit_edge39.prol.loopexit.unr-lcssa
  %.lcssa50.unr = phi double [ undef, %.lr.ph8 ], [ %11, %._crit_edge39.prol.loopexit.unr-lcssa ]
  %.unr53 = phi double [ %.pre41, %.lr.ph8 ], [ %11, %._crit_edge39.prol.loopexit.unr-lcssa ]
  %indvars.iv26.unr = phi i64 [ 0, %.lr.ph8 ], [ %2, %._crit_edge39.prol.loopexit.unr-lcssa ]
  %12 = icmp ult i64 %3, 3
  br i1 %12, label %._crit_edge9.loopexit, label %.lr.ph8.new

.lr.ph8.new:                                      ; preds = %._crit_edge39.prol.loopexit
  br label %._crit_edge39

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv18 = phi i64 [ %indvars.iv.next19, %._crit_edge ], [ 0, %.preheader.preheader ]
  %13 = icmp sgt i64 %indvars.iv18, 0
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv34, i64 %indvars.iv18
  %.pre = load double, double* %14, align 8
  br i1 %13, label %._crit_edge38.preheader, label %._crit_edge

._crit_edge38.preheader:                          ; preds = %.preheader
  %xtraiter = and i64 %indvars.iv18, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge38.prol.loopexit.unr-lcssa, label %._crit_edge38.prol.preheader

._crit_edge38.prol.preheader:                     ; preds = %._crit_edge38.preheader
  br label %._crit_edge38.prol

._crit_edge38.prol:                               ; preds = %._crit_edge38.prol.preheader
  %15 = load double, double* %5, align 8
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv18, i64 0
  %17 = load double, double* %16, align 8
  %18 = fmul double %15, %17
  %19 = fsub double %.pre, %18
  store double %19, double* %14, align 8
  br label %._crit_edge38.prol.loopexit.unr-lcssa

._crit_edge38.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge38.preheader, %._crit_edge38.prol
  %.lcssa.unr.ph = phi double [ %19, %._crit_edge38.prol ], [ undef, %._crit_edge38.preheader ]
  %.unr.ph = phi double [ %19, %._crit_edge38.prol ], [ %.pre, %._crit_edge38.preheader ]
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge38.prol ], [ 0, %._crit_edge38.preheader ]
  br label %._crit_edge38.prol.loopexit

._crit_edge38.prol.loopexit:                      ; preds = %._crit_edge38.prol.loopexit.unr-lcssa
  %20 = icmp eq i64 %indvars.iv18, 1
  br i1 %20, label %._crit_edge.loopexit, label %._crit_edge38.preheader.new

._crit_edge38.preheader.new:                      ; preds = %._crit_edge38.prol.loopexit
  br label %._crit_edge38

._crit_edge38:                                    ; preds = %._crit_edge38, %._crit_edge38.preheader.new
  %21 = phi double [ %.unr.ph, %._crit_edge38.preheader.new ], [ %33, %._crit_edge38 ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %._crit_edge38.preheader.new ], [ %indvars.iv.next.1, %._crit_edge38 ]
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv34, i64 %indvars.iv
  %23 = load double, double* %22, align 8
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv18, i64 %indvars.iv
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = fsub double %21, %26
  store double %27, double* %14, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv34, i64 %indvars.iv.next
  %29 = load double, double* %28, align 8
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv18, i64 %indvars.iv.next
  %31 = load double, double* %30, align 8
  %32 = fmul double %29, %31
  %33 = fsub double %27, %32
  store double %33, double* %14, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond17.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv18
  br i1 %exitcond17.1, label %._crit_edge.loopexit.unr-lcssa, label %._crit_edge38

._crit_edge.loopexit.unr-lcssa:                   ; preds = %._crit_edge38
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge38.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %._crit_edge38.prol.loopexit ], [ %33, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %34 = phi double [ %.pre, %.preheader ], [ %.lcssa, %._crit_edge.loopexit ]
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv18, i64 %indvars.iv18
  %36 = load double, double* %35, align 8
  %37 = fdiv double %34, %36
  store double %37, double* %14, align 8
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next19, %indvars.iv34
  br i1 %exitcond25, label %.lr.ph8, label %.preheader

._crit_edge39:                                    ; preds = %._crit_edge39, %.lr.ph8.new
  %38 = phi double [ %.unr53, %.lr.ph8.new ], [ %54, %._crit_edge39 ]
  %indvars.iv26 = phi i64 [ %indvars.iv26.unr, %.lr.ph8.new ], [ %indvars.iv.next27.3, %._crit_edge39 ]
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv34, i64 %indvars.iv26
  %40 = load double, double* %39, align 8
  %41 = fmul double %40, %40
  %42 = fsub double %38, %41
  store double %42, double* %6, align 8
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv34, i64 %indvars.iv.next27
  %44 = load double, double* %43, align 8
  %45 = fmul double %44, %44
  %46 = fsub double %42, %45
  store double %46, double* %6, align 8
  %indvars.iv.next27.1 = add nsw i64 %indvars.iv26, 2
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv34, i64 %indvars.iv.next27.1
  %48 = load double, double* %47, align 8
  %49 = fmul double %48, %48
  %50 = fsub double %46, %49
  store double %50, double* %6, align 8
  %indvars.iv.next27.2 = add nsw i64 %indvars.iv26, 3
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv34, i64 %indvars.iv.next27.2
  %52 = load double, double* %51, align 8
  %53 = fmul double %52, %52
  %54 = fsub double %50, %53
  store double %54, double* %6, align 8
  %indvars.iv.next27.3 = add nuw nsw i64 %indvars.iv26, 4
  %exitcond33.3 = icmp eq i64 %indvars.iv.next27.3, %indvars.iv34
  br i1 %exitcond33.3, label %._crit_edge9.loopexit.unr-lcssa, label %._crit_edge39

._crit_edge9.loopexit.unr-lcssa:                  ; preds = %._crit_edge39
  br label %._crit_edge9.loopexit

._crit_edge9.loopexit:                            ; preds = %._crit_edge39.prol.loopexit, %._crit_edge9.loopexit.unr-lcssa
  %.lcssa50 = phi double [ %.lcssa50.unr, %._crit_edge39.prol.loopexit ], [ %54, %._crit_edge9.loopexit.unr-lcssa ]
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit, %.preheader3.._crit_edge9_crit_edge
  %.pre-phi44 = phi double* [ %.phi.trans.insert42, %.preheader3.._crit_edge9_crit_edge ], [ %6, %._crit_edge9.loopexit ]
  %55 = phi double [ %.pre43, %.preheader3.._crit_edge9_crit_edge ], [ %.lcssa50, %._crit_edge9.loopexit ]
  %56 = tail call double @sqrt(double %55) #3
  store double %56, double* %.pre-phi44, align 8
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next35, 2000
  %indvars.iv.next58 = add i2 %indvars.iv57, 1
  br i1 %exitcond37, label %._crit_edge11.loopexit, label %.preheader4

._crit_edge11.loopexit:                           ; preds = %._crit_edge9
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.loopexit, %1
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br i1 true, label %.preheader.preheader, label %._crit_edge4

.preheader.preheader:                             ; preds = %1
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv13 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next14, %._crit_edge ]
  %indvars.iv11 = phi i64 [ 1, %.preheader.preheader ], [ %indvars.iv.next12, %._crit_edge ]
  %6 = mul nsw i64 %indvars.iv13, 2000
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %._crit_edge17, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge17 ]
  %7 = add nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge17

; <label>:11:                                     ; preds = %._crit_edge18
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge18, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv13, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next, %indvars.iv11
  br i1 %exitcond10, label %._crit_edge, label %._crit_edge18

._crit_edge:                                      ; preds = %._crit_edge17
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next14, 2000
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  br i1 %exitcond16, label %._crit_edge4.loopexit, label %.lr.ph

._crit_edge4.loopexit:                            ; preds = %._crit_edge
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %1
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
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
