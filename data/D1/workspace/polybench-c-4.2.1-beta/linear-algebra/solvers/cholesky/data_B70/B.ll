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
  br i1 true, label %.preheader14.lr.ph, label %._crit_edge42.thread

._crit_edge42.thread:                             ; preds = %2
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %._crit_edge17

.preheader14.lr.ph:                               ; preds = %2
  br label %.lr.ph36

.lr.ph36:                                         ; preds = %._crit_edge40, %.preheader14.lr.ph
  %indvars.iv92 = phi i64 [ %indvars.iv.next93, %._crit_edge40 ], [ 0, %.preheader14.lr.ph ]
  %indvars.iv90 = phi i64 [ %indvars.iv.next91, %._crit_edge40 ], [ 1, %.preheader14.lr.ph ]
  %4 = mul nuw nsw i64 %indvars.iv92, 2001
  %5 = add nuw nsw i64 %4, 1
  %6 = sub i64 1998, %indvars.iv92
  %7 = shl i64 %6, 3
  br label %._crit_edge

.preheader13:                                     ; preds = %._crit_edge
  %scevgep86 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %5
  %8 = and i64 %7, 34359738360
  %scevgep8687 = bitcast double* %scevgep86 to i8*
  %9 = add nuw nsw i64 %8, 8
  %indvars.iv.next93 = add nuw nsw i64 %indvars.iv92, 1
  %10 = icmp slt i64 %indvars.iv.next93, 2000
  br i1 %10, label %._crit_edge40.loopexit, label %._crit_edge40

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph36
  %indvars.iv74 = phi i64 [ 0, %.lr.ph36 ], [ %indvars.iv.next75, %._crit_edge ]
  %11 = sub nsw i64 0, %indvars.iv74
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 2000
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, 2.000000e+03
  %16 = fadd double %15, 1.000000e+00
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv92, i64 %indvars.iv74
  store double %16, double* %17, align 8
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %exitcond81 = icmp eq i64 %indvars.iv.next75, %indvars.iv90
  br i1 %exitcond81, label %.preheader13, label %._crit_edge

._crit_edge40.loopexit:                           ; preds = %.preheader13
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep8687, i8 0, i64 %9, i32 8, i1 false)
  br label %._crit_edge40

._crit_edge40:                                    ; preds = %.preheader13, %._crit_edge40.loopexit
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv92, i64 %indvars.iv92
  store double 1.000000e+00, double* %18, align 8
  %exitcond95 = icmp eq i64 %indvars.iv.next93, 2000
  %indvars.iv.next91 = add nuw nsw i64 %indvars.iv90, 1
  br i1 %exitcond95, label %._crit_edge42, label %.lr.ph36

._crit_edge42:                                    ; preds = %._crit_edge40
  %19 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br i1 true, label %._crit_edge33.us.prol.loopexit, label %._crit_edge33.us.prol.preheader

._crit_edge33.us.prol.preheader:                  ; preds = %._crit_edge42
  br label %._crit_edge33.us.prol

._crit_edge33.us.prol:                            ; preds = %._crit_edge33.us.prol, %._crit_edge33.us.prol.preheader
  %indvars.iv70.prol = phi i64 [ 0, %._crit_edge33.us.prol.preheader ], [ %indvars.iv.next71.prol, %._crit_edge33.us.prol ]
  %prol.iter146 = phi i64 [ 0, %._crit_edge33.us.prol.preheader ], [ %prol.iter146.sub, %._crit_edge33.us.prol ]
  %20 = mul nuw nsw i64 %indvars.iv70.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %19, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next71.prol = add nuw nsw i64 %indvars.iv70.prol, 1
  %prol.iter146.sub = add nsw i64 %prol.iter146, -1
  %prol.iter146.cmp = icmp eq i64 %prol.iter146.sub, 0
  br i1 %prol.iter146.cmp, label %._crit_edge33.us.prol.loopexit.unr-lcssa, label %._crit_edge33.us.prol, !llvm.loop !1

._crit_edge33.us.prol.loopexit.unr-lcssa:         ; preds = %._crit_edge33.us.prol
  br label %._crit_edge33.us.prol.loopexit

._crit_edge33.us.prol.loopexit:                   ; preds = %._crit_edge42, %._crit_edge33.us.prol.loopexit.unr-lcssa
  br i1 false, label %.preheader10.us.preheader, label %._crit_edge42.new

._crit_edge42.new:                                ; preds = %._crit_edge33.us.prol.loopexit
  br label %._crit_edge33.us

._crit_edge33.us:                                 ; preds = %._crit_edge33.us, %._crit_edge42.new
  %indvars.iv70 = phi i64 [ 0, %._crit_edge42.new ], [ %indvars.iv.next71.7, %._crit_edge33.us ]
  %21 = mul nuw nsw i64 %indvars.iv70, 16000
  %scevgep = getelementptr i8, i8* %19, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %22 = mul i64 %indvars.iv70, 16000
  %23 = add i64 %22, 16000
  %scevgep.1 = getelementptr i8, i8* %19, i64 %23
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %24 = mul i64 %indvars.iv70, 16000
  %25 = add i64 %24, 32000
  %scevgep.2 = getelementptr i8, i8* %19, i64 %25
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %26 = mul i64 %indvars.iv70, 16000
  %27 = add i64 %26, 48000
  %scevgep.3 = getelementptr i8, i8* %19, i64 %27
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %28 = mul i64 %indvars.iv70, 16000
  %29 = add i64 %28, 64000
  %scevgep.4 = getelementptr i8, i8* %19, i64 %29
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %30 = mul i64 %indvars.iv70, 16000
  %31 = add i64 %30, 80000
  %scevgep.5 = getelementptr i8, i8* %19, i64 %31
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %32 = mul i64 %indvars.iv70, 16000
  %33 = add i64 %32, 96000
  %scevgep.6 = getelementptr i8, i8* %19, i64 %33
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %34 = mul i64 %indvars.iv70, 16000
  %35 = add i64 %34, 112000
  %scevgep.7 = getelementptr i8, i8* %19, i64 %35
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next71.7 = add nsw i64 %indvars.iv70, 8
  %exitcond73.7 = icmp eq i64 %indvars.iv.next71.7, 2000
  br i1 %exitcond73.7, label %.preheader10.us.preheader.unr-lcssa, label %._crit_edge33.us

.preheader10.us.preheader.unr-lcssa:              ; preds = %._crit_edge33.us
  br label %.preheader10.us.preheader

.preheader10.us.preheader:                        ; preds = %._crit_edge33.us.prol.loopexit, %.preheader10.us.preheader.unr-lcssa
  %36 = bitcast i8* %19 to [2000 x [2000 x double]]*
  br label %.preheader10.us

.preheader10.us:                                  ; preds = %.preheader10.us.preheader, %._crit_edge22.us
  %indvars.iv62 = phi i64 [ %indvars.iv.next63, %._crit_edge22.us ], [ 0, %.preheader10.us.preheader ]
  %scevgep101 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv62
  %scevgep101102 = bitcast double* %scevgep101 to i8*
  %37 = add nsw i64 %indvars.iv62, -1999
  %scevgep103 = getelementptr [2000 x double], [2000 x double]* %1, i64 2000, i64 %37
  %scevgep103104 = bitcast double* %scevgep103 to i8*
  br label %.preheader9.us.us

._crit_edge22.us:                                 ; preds = %._crit_edge20.us.us
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %exitcond65 = icmp eq i64 %indvars.iv.next63, 2000
  br i1 %exitcond65, label %.preheader.us.preheader, label %.preheader10.us

.preheader9.us.us:                                ; preds = %.preheader10.us, %._crit_edge20.us.us
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %._crit_edge20.us.us ], [ 0, %.preheader10.us ]
  %38 = mul nuw nsw i64 %indvars.iv58, 16000
  %scevgep99 = getelementptr i8, i8* %19, i64 %38
  %39 = add i64 16000, %38
  %scevgep100 = getelementptr i8, i8* %19, i64 %39
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv58, i64 %indvars.iv62
  br i1 false, label %._crit_edge96.preheader, label %min.iters.checked

._crit_edge96.preheader:                          ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader9.us.us
  %indvars.iv54.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader9.us.us ], [ 2000, %middle.block ]
  br i1 true, label %._crit_edge96.prol.loopexit.unr-lcssa, label %._crit_edge96.prol.preheader

._crit_edge96.prol.preheader:                     ; preds = %._crit_edge96.preheader
  br label %._crit_edge96.prol

._crit_edge96.prol:                               ; preds = %._crit_edge96.prol.preheader
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv54.ph, i64 %indvars.iv62
  %43 = load double, double* %42, align 8
  %44 = fmul double %41, %43
  %45 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %36, i64 0, i64 %indvars.iv58, i64 %indvars.iv54.ph
  %46 = load double, double* %45, align 8
  %47 = fadd double %46, %44
  store double %47, double* %45, align 8
  %indvars.iv.next55.prol = add nuw nsw i64 %indvars.iv54.ph, 1
  br label %._crit_edge96.prol.loopexit.unr-lcssa

._crit_edge96.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge96.preheader, %._crit_edge96.prol
  %indvars.iv54.unr.ph = phi i64 [ %indvars.iv.next55.prol, %._crit_edge96.prol ], [ %indvars.iv54.ph, %._crit_edge96.preheader ]
  br label %._crit_edge96.prol.loopexit

._crit_edge96.prol.loopexit:                      ; preds = %._crit_edge96.prol.loopexit.unr-lcssa
  br i1 false, label %._crit_edge20.us.us.loopexit, label %._crit_edge96.preheader.new

._crit_edge96.preheader.new:                      ; preds = %._crit_edge96.prol.loopexit
  br label %._crit_edge96

min.iters.checked:                                ; preds = %.preheader9.us.us
  br i1 false, label %._crit_edge96.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult i8* %scevgep99, %scevgep103104
  %bound1 = icmp ult i8* %scevgep101102, %scevgep100
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %40 to i8*
  %bc105 = bitcast double* %40 to i8*
  %bound0106 = icmp ult i8* %scevgep99, %bc105
  %bound1107 = icmp ult i8* %bc, %scevgep100
  %found.conflict108 = and i1 %bound0106, %bound1107
  %conflict.rdx = or i1 %found.conflict, %found.conflict108
  br i1 %conflict.rdx, label %._crit_edge96.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %48 = load double, double* %40, align 8, !alias.scope !3
  %49 = insertelement <2 x double> undef, double %48, i32 0
  %50 = shufflevector <2 x double> %49, <2 x double> undef, <2 x i32> zeroinitializer
  %51 = insertelement <2 x double> undef, double %48, i32 0
  %52 = shufflevector <2 x double> %51, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %53 = or i64 %index, 1
  %54 = or i64 %index, 2
  %55 = or i64 %index, 3
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %index, i64 %indvars.iv62
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %53, i64 %indvars.iv62
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %54, i64 %indvars.iv62
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %55, i64 %indvars.iv62
  %60 = load double, double* %56, align 8, !alias.scope !6
  %61 = load double, double* %57, align 8, !alias.scope !6
  %62 = load double, double* %58, align 8, !alias.scope !6
  %63 = load double, double* %59, align 8, !alias.scope !6
  %64 = insertelement <2 x double> undef, double %60, i32 0
  %65 = insertelement <2 x double> %64, double %61, i32 1
  %66 = insertelement <2 x double> undef, double %62, i32 0
  %67 = insertelement <2 x double> %66, double %63, i32 1
  %68 = fmul <2 x double> %50, %65
  %69 = fmul <2 x double> %52, %67
  %70 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %36, i64 0, i64 %indvars.iv58, i64 %index
  %71 = bitcast double* %70 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %71, align 8, !alias.scope !8, !noalias !10
  %72 = getelementptr double, double* %70, i64 2
  %73 = bitcast double* %72 to <2 x double>*
  %wide.load110 = load <2 x double>, <2 x double>* %73, align 8, !alias.scope !8, !noalias !10
  %74 = fadd <2 x double> %wide.load, %68
  %75 = fadd <2 x double> %wide.load110, %69
  %76 = bitcast double* %70 to <2 x double>*
  store <2 x double> %74, <2 x double>* %76, align 8, !alias.scope !8, !noalias !10
  %77 = bitcast double* %72 to <2 x double>*
  store <2 x double> %75, <2 x double>* %77, align 8, !alias.scope !8, !noalias !10
  %index.next = add i64 %index, 4
  %78 = icmp eq i64 %index.next, 2000
  br i1 %78, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  br i1 true, label %._crit_edge20.us.us, label %._crit_edge96.preheader

._crit_edge20.us.us.loopexit.unr-lcssa:           ; preds = %._crit_edge96
  br label %._crit_edge20.us.us.loopexit

._crit_edge20.us.us.loopexit:                     ; preds = %._crit_edge96.prol.loopexit, %._crit_edge20.us.us.loopexit.unr-lcssa
  br label %._crit_edge20.us.us

._crit_edge20.us.us:                              ; preds = %._crit_edge20.us.us.loopexit, %middle.block
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond61 = icmp eq i64 %indvars.iv.next59, 2000
  br i1 %exitcond61, label %._crit_edge22.us, label %.preheader9.us.us

._crit_edge96:                                    ; preds = %._crit_edge96, %._crit_edge96.preheader.new
  %indvars.iv54 = phi i64 [ %indvars.iv54.unr.ph, %._crit_edge96.preheader.new ], [ %indvars.iv.next55.1, %._crit_edge96 ]
  %79 = load double, double* %40, align 8
  %80 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv54, i64 %indvars.iv62
  %81 = load double, double* %80, align 8
  %82 = fmul double %79, %81
  %83 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %36, i64 0, i64 %indvars.iv58, i64 %indvars.iv54
  %84 = load double, double* %83, align 8
  %85 = fadd double %84, %82
  store double %85, double* %83, align 8
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %86 = load double, double* %40, align 8
  %87 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next55, i64 %indvars.iv62
  %88 = load double, double* %87, align 8
  %89 = fmul double %86, %88
  %90 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %36, i64 0, i64 %indvars.iv58, i64 %indvars.iv.next55
  %91 = load double, double* %90, align 8
  %92 = fadd double %91, %89
  store double %92, double* %90, align 8
  %indvars.iv.next55.1 = add nsw i64 %indvars.iv54, 2
  %exitcond57.1 = icmp eq i64 %indvars.iv.next55.1, 2000
  br i1 %exitcond57.1, label %._crit_edge20.us.us.loopexit.unr-lcssa, label %._crit_edge96, !llvm.loop !14

.preheader.us.preheader:                          ; preds = %._crit_edge22.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %scevgep120 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv50, i64 0
  %scevgep120121 = bitcast double* %scevgep120 to i8*
  %scevgep122 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv50, i64 2000
  %scevgep122123 = bitcast double* %scevgep122 to i8*
  %93 = mul nuw nsw i64 %indvars.iv50, 16000
  %scevgep124 = getelementptr i8, i8* %19, i64 %93
  %94 = add i64 16000, %93
  %scevgep125 = getelementptr i8, i8* %19, i64 %94
  br i1 false, label %._crit_edge97.preheader, label %min.iters.checked115

min.iters.checked115:                             ; preds = %.preheader.us
  br i1 false, label %._crit_edge97.preheader, label %vector.memcheck130

vector.memcheck130:                               ; preds = %min.iters.checked115
  %bound0126 = icmp ult i8* %scevgep120121, %scevgep125
  %bound1127 = icmp ult i8* %scevgep124, %scevgep122123
  %memcheck.conflict129 = and i1 %bound0126, %bound1127
  br i1 %memcheck.conflict129, label %._crit_edge97.preheader, label %vector.body111.preheader

vector.body111.preheader:                         ; preds = %vector.memcheck130
  br label %vector.body111

vector.body111:                                   ; preds = %vector.body111.preheader, %vector.body111
  %index132 = phi i64 [ %index.next133, %vector.body111 ], [ 0, %vector.body111.preheader ]
  %95 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %36, i64 0, i64 %indvars.iv50, i64 %index132
  %96 = bitcast double* %95 to <2 x i64>*
  %wide.load140 = load <2 x i64>, <2 x i64>* %96, align 8, !alias.scope !15
  %97 = getelementptr double, double* %95, i64 2
  %98 = bitcast double* %97 to <2 x i64>*
  %wide.load141 = load <2 x i64>, <2 x i64>* %98, align 8, !alias.scope !15
  %99 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv50, i64 %index132
  %100 = bitcast double* %99 to <2 x i64>*
  store <2 x i64> %wide.load140, <2 x i64>* %100, align 8, !alias.scope !18, !noalias !15
  %101 = getelementptr double, double* %99, i64 2
  %102 = bitcast double* %101 to <2 x i64>*
  store <2 x i64> %wide.load141, <2 x i64>* %102, align 8, !alias.scope !18, !noalias !15
  %index.next133 = add i64 %index132, 4
  %103 = icmp eq i64 %index.next133, 2000
  br i1 %103, label %middle.block112, label %vector.body111, !llvm.loop !20

middle.block112:                                  ; preds = %vector.body111
  br i1 true, label %._crit_edge.us, label %._crit_edge97.preheader

._crit_edge97.preheader:                          ; preds = %middle.block112, %vector.memcheck130, %min.iters.checked115, %.preheader.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck130 ], [ 0, %min.iters.checked115 ], [ 0, %.preheader.us ], [ 2000, %middle.block112 ]
  %104 = sub nsw i64 1999, %indvars.iv.ph
  br i1 true, label %._crit_edge97.prol.loopexit, label %._crit_edge97.prol.preheader

._crit_edge97.prol.preheader:                     ; preds = %._crit_edge97.preheader
  br label %._crit_edge97.prol

._crit_edge97.prol:                               ; preds = %._crit_edge97.prol, %._crit_edge97.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %._crit_edge97.prol ], [ %indvars.iv.ph, %._crit_edge97.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %._crit_edge97.prol ], [ 0, %._crit_edge97.prol.preheader ]
  %105 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %36, i64 0, i64 %indvars.iv50, i64 %indvars.iv.prol
  %106 = bitcast double* %105 to i64*
  %107 = load i64, i64* %106, align 8
  %108 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv50, i64 %indvars.iv.prol
  %109 = bitcast double* %108 to i64*
  store i64 %107, i64* %109, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge97.prol.loopexit.unr-lcssa, label %._crit_edge97.prol, !llvm.loop !21

._crit_edge97.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge97.prol
  br label %._crit_edge97.prol.loopexit

._crit_edge97.prol.loopexit:                      ; preds = %._crit_edge97.preheader, %._crit_edge97.prol.loopexit.unr-lcssa
  %110 = icmp ult i64 %104, 3
  br i1 %110, label %._crit_edge.us.loopexit, label %._crit_edge97.preheader.new

._crit_edge97.preheader.new:                      ; preds = %._crit_edge97.prol.loopexit
  br label %._crit_edge97

._crit_edge97:                                    ; preds = %._crit_edge97, %._crit_edge97.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.ph, %._crit_edge97.preheader.new ], [ %indvars.iv.next.3, %._crit_edge97 ]
  %111 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %36, i64 0, i64 %indvars.iv50, i64 %indvars.iv
  %112 = bitcast double* %111 to i64*
  %113 = load i64, i64* %112, align 8
  %114 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv50, i64 %indvars.iv
  %115 = bitcast double* %114 to i64*
  store i64 %113, i64* %115, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %116 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %36, i64 0, i64 %indvars.iv50, i64 %indvars.iv.next
  %117 = bitcast double* %116 to i64*
  %118 = load i64, i64* %117, align 8
  %119 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv50, i64 %indvars.iv.next
  %120 = bitcast double* %119 to i64*
  store i64 %118, i64* %120, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %121 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %36, i64 0, i64 %indvars.iv50, i64 %indvars.iv.next.1
  %122 = bitcast double* %121 to i64*
  %123 = load i64, i64* %122, align 8
  %124 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv50, i64 %indvars.iv.next.1
  %125 = bitcast double* %124 to i64*
  store i64 %123, i64* %125, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %126 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %36, i64 0, i64 %indvars.iv50, i64 %indvars.iv.next.2
  %127 = bitcast double* %126 to i64*
  %128 = load i64, i64* %127, align 8
  %129 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv50, i64 %indvars.iv.next.2
  %130 = bitcast double* %129 to i64*
  store i64 %128, i64* %130, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond49.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond49.3, label %._crit_edge.us.loopexit.unr-lcssa, label %._crit_edge97, !llvm.loop !22

._crit_edge.us.loopexit.unr-lcssa:                ; preds = %._crit_edge97
  br label %._crit_edge.us.loopexit

._crit_edge.us.loopexit:                          ; preds = %._crit_edge97.prol.loopexit, %._crit_edge.us.loopexit.unr-lcssa
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block112
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next51, 2000
  br i1 %exitcond53, label %._crit_edge17.loopexit, label %.preheader.us

._crit_edge17.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17.loopexit, %._crit_edge42.thread
  %131 = phi i8* [ %3, %._crit_edge42.thread ], [ %19, %._crit_edge17.loopexit ]
  tail call void @free(i8* %131) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  br i1 true, label %.preheader4.preheader, label %._crit_edge11

.preheader4.preheader:                            ; preds = %2
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader4.preheader, %._crit_edge9
  %indvars.iv49 = phi i2 [ 0, %.preheader4.preheader ], [ %indvars.iv.next50, %._crit_edge9 ]
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %._crit_edge9 ], [ 0, %.preheader4.preheader ]
  %3 = zext i2 %indvars.iv49 to i64
  %4 = add nsw i64 %indvars.iv36, -1
  %5 = icmp sgt i64 %indvars.iv36, 0
  br i1 %5, label %.preheader.preheader, label %._crit_edge9

.preheader.preheader:                             ; preds = %.preheader4
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv36, i64 0
  br label %.preheader

.lr.ph8:                                          ; preds = %._crit_edge
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv36, i64 %indvars.iv36
  %.pre43 = load double, double* %7, align 8
  %xtraiter44 = and i64 %indvars.iv36, 3
  %lcmp.mod45 = icmp eq i64 %xtraiter44, 0
  br i1 %lcmp.mod45, label %._crit_edge41.prol.loopexit, label %._crit_edge41.prol.preheader

._crit_edge41.prol.preheader:                     ; preds = %.lr.ph8
  br label %._crit_edge41.prol

._crit_edge41.prol:                               ; preds = %._crit_edge41.prol, %._crit_edge41.prol.preheader
  %8 = phi double [ %.pre43, %._crit_edge41.prol.preheader ], [ %12, %._crit_edge41.prol ]
  %indvars.iv28.prol = phi i64 [ 0, %._crit_edge41.prol.preheader ], [ %indvars.iv.next29.prol, %._crit_edge41.prol ]
  %prol.iter = phi i64 [ %xtraiter44, %._crit_edge41.prol.preheader ], [ %prol.iter.sub, %._crit_edge41.prol ]
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv36, i64 %indvars.iv28.prol
  %10 = load double, double* %9, align 8
  %11 = fmul double %10, %10
  %12 = fsub double %8, %11
  store double %12, double* %7, align 8
  %indvars.iv.next29.prol = add nuw nsw i64 %indvars.iv28.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge41.prol.loopexit.unr-lcssa, label %._crit_edge41.prol, !llvm.loop !23

._crit_edge41.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge41.prol
  br label %._crit_edge41.prol.loopexit

._crit_edge41.prol.loopexit:                      ; preds = %.lr.ph8, %._crit_edge41.prol.loopexit.unr-lcssa
  %.unr46 = phi double [ %.pre43, %.lr.ph8 ], [ %12, %._crit_edge41.prol.loopexit.unr-lcssa ]
  %indvars.iv28.unr = phi i64 [ 0, %.lr.ph8 ], [ %3, %._crit_edge41.prol.loopexit.unr-lcssa ]
  %13 = icmp ult i64 %4, 3
  br i1 %13, label %._crit_edge9.loopexit, label %.lr.ph8.new

.lr.ph8.new:                                      ; preds = %._crit_edge41.prol.loopexit
  br label %._crit_edge41

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv20 = phi i64 [ %indvars.iv.next21, %._crit_edge ], [ 0, %.preheader.preheader ]
  %14 = icmp sgt i64 %indvars.iv20, 0
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv36, i64 %indvars.iv20
  %.pre = load double, double* %15, align 8
  br i1 %14, label %._crit_edge40.preheader, label %._crit_edge

._crit_edge40.preheader:                          ; preds = %.preheader
  %xtraiter = and i64 %indvars.iv20, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge40.prol.loopexit.unr-lcssa, label %._crit_edge40.prol.preheader

._crit_edge40.prol.preheader:                     ; preds = %._crit_edge40.preheader
  br label %._crit_edge40.prol

._crit_edge40.prol:                               ; preds = %._crit_edge40.prol.preheader
  %16 = load double, double* %6, align 8
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv20, i64 0
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = fsub double %.pre, %19
  store double %20, double* %15, align 8
  br label %._crit_edge40.prol.loopexit.unr-lcssa

._crit_edge40.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge40.preheader, %._crit_edge40.prol
  %.lcssa.unr.ph = phi double [ %20, %._crit_edge40.prol ], [ undef, %._crit_edge40.preheader ]
  %.unr.ph = phi double [ %20, %._crit_edge40.prol ], [ %.pre, %._crit_edge40.preheader ]
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge40.prol ], [ 0, %._crit_edge40.preheader ]
  br label %._crit_edge40.prol.loopexit

._crit_edge40.prol.loopexit:                      ; preds = %._crit_edge40.prol.loopexit.unr-lcssa
  %21 = icmp eq i64 %indvars.iv20, 1
  br i1 %21, label %._crit_edge.loopexit, label %._crit_edge40.preheader.new

._crit_edge40.preheader.new:                      ; preds = %._crit_edge40.prol.loopexit
  br label %._crit_edge40

._crit_edge40:                                    ; preds = %._crit_edge40, %._crit_edge40.preheader.new
  %22 = phi double [ %.unr.ph, %._crit_edge40.preheader.new ], [ %34, %._crit_edge40 ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %._crit_edge40.preheader.new ], [ %indvars.iv.next.1, %._crit_edge40 ]
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv36, i64 %indvars.iv
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv20, i64 %indvars.iv
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fsub double %22, %27
  store double %28, double* %15, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv36, i64 %indvars.iv.next
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv20, i64 %indvars.iv.next
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = fsub double %28, %33
  store double %34, double* %15, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond19.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv20
  br i1 %exitcond19.1, label %._crit_edge.loopexit.unr-lcssa, label %._crit_edge40

._crit_edge.loopexit.unr-lcssa:                   ; preds = %._crit_edge40
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge40.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %._crit_edge40.prol.loopexit ], [ %34, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %35 = phi double [ %.pre, %.preheader ], [ %.lcssa, %._crit_edge.loopexit ]
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv20, i64 %indvars.iv20
  %37 = load double, double* %36, align 8
  %38 = fdiv double %35, %37
  store double %38, double* %15, align 8
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next21, %indvars.iv36
  br i1 %exitcond27, label %.lr.ph8, label %.preheader

._crit_edge41:                                    ; preds = %._crit_edge41, %.lr.ph8.new
  %39 = phi double [ %.unr46, %.lr.ph8.new ], [ %55, %._crit_edge41 ]
  %indvars.iv28 = phi i64 [ %indvars.iv28.unr, %.lr.ph8.new ], [ %indvars.iv.next29.3, %._crit_edge41 ]
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv36, i64 %indvars.iv28
  %41 = load double, double* %40, align 8
  %42 = fmul double %41, %41
  %43 = fsub double %39, %42
  store double %43, double* %7, align 8
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv36, i64 %indvars.iv.next29
  %45 = load double, double* %44, align 8
  %46 = fmul double %45, %45
  %47 = fsub double %43, %46
  store double %47, double* %7, align 8
  %indvars.iv.next29.1 = add nsw i64 %indvars.iv28, 2
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv36, i64 %indvars.iv.next29.1
  %49 = load double, double* %48, align 8
  %50 = fmul double %49, %49
  %51 = fsub double %47, %50
  store double %51, double* %7, align 8
  %indvars.iv.next29.2 = add nsw i64 %indvars.iv28, 3
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv36, i64 %indvars.iv.next29.2
  %53 = load double, double* %52, align 8
  %54 = fmul double %53, %53
  %55 = fsub double %51, %54
  store double %55, double* %7, align 8
  %indvars.iv.next29.3 = add nuw nsw i64 %indvars.iv28, 4
  %exitcond35.3 = icmp eq i64 %indvars.iv.next29.3, %indvars.iv36
  br i1 %exitcond35.3, label %._crit_edge9.loopexit.unr-lcssa, label %._crit_edge41

._crit_edge9.loopexit.unr-lcssa:                  ; preds = %._crit_edge41
  br label %._crit_edge9.loopexit

._crit_edge9.loopexit:                            ; preds = %._crit_edge41.prol.loopexit, %._crit_edge9.loopexit.unr-lcssa
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit, %.preheader4
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv36, i64 %indvars.iv36
  %57 = load double, double* %56, align 8
  %58 = tail call double @sqrt(double %57) #3
  store double %58, double* %56, align 8
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next37, 2000
  %indvars.iv.next50 = add i2 %indvars.iv49, 1
  br i1 %exitcond39, label %._crit_edge11.loopexit, label %.preheader4

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
  br i1 true, label %..preheader_crit_edge, label %._crit_edge5

..preheader_crit_edge:                            ; preds = %2
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge3, %..preheader_crit_edge
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %._crit_edge3 ], [ 0, %..preheader_crit_edge ]
  %indvars.iv12 = phi i64 [ %indvars.iv.next13, %._crit_edge3 ], [ 1, %..preheader_crit_edge ]
  %7 = mul nsw i64 %indvars.iv14, 2000
  br label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge ]
  %8 = add nsw i64 %indvars.iv, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %._crit_edge._crit_edge
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge._crit_edge, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv14, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next, %indvars.iv12
  br i1 %exitcond11, label %._crit_edge3, label %._crit_edge._crit_edge

._crit_edge3:                                     ; preds = %._crit_edge
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next15, 2000
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  br i1 %exitcond17, label %._crit_edge5.loopexit, label %.lr.ph

._crit_edge5.loopexit:                            ; preds = %._crit_edge3
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.loopexit, %2
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
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
