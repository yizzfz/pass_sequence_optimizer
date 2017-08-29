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
  br i1 true, label %.preheader64.lr.ph, label %._crit_edge92.thread

._crit_edge92.thread:                             ; preds = %2
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %._crit_edge67

.preheader64.lr.ph:                               ; preds = %2
  br label %.lr.ph86

.lr.ph86:                                         ; preds = %._crit_edge90, %.preheader64.lr.ph
  %indvars.iv132 = phi i64 [ 0, %.preheader64.lr.ph ], [ %indvars.iv.next133, %._crit_edge90 ]
  %indvars.iv130 = phi i64 [ 1, %.preheader64.lr.ph ], [ %indvars.iv.next131, %._crit_edge90 ]
  %4 = mul nuw nsw i64 %indvars.iv132, 2001
  %5 = add nuw nsw i64 %4, 1
  %6 = sub i64 1998, %indvars.iv132
  %7 = shl i64 %6, 3
  br label %._crit_edge

.preheader63:                                     ; preds = %._crit_edge
  %scevgep149 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %5
  %8 = and i64 %7, 34359738360
  %scevgep149150 = bitcast double* %scevgep149 to i8*
  %9 = add nuw nsw i64 %8, 8
  %indvars.iv.next133 = add nuw nsw i64 %indvars.iv132, 1
  %10 = icmp slt i64 %indvars.iv.next133, 2000
  br i1 %10, label %._crit_edge90.loopexit, label %._crit_edge90

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph86
  %indvars.iv118 = phi i64 [ 0, %.lr.ph86 ], [ %indvars.iv.next119, %._crit_edge ]
  %11 = sub nsw i64 0, %indvars.iv118
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 2000
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, 2.000000e+03
  %16 = fadd double %15, 1.000000e+00
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv132, i64 %indvars.iv118
  store double %16, double* %17, align 8
  %indvars.iv.next119 = add nuw nsw i64 %indvars.iv118, 1
  %exitcond123 = icmp eq i64 %indvars.iv.next119, %indvars.iv130
  br i1 %exitcond123, label %.preheader63, label %._crit_edge

._crit_edge90.loopexit:                           ; preds = %.preheader63
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep149150, i8 0, i64 %9, i32 8, i1 false)
  br label %._crit_edge90

._crit_edge90:                                    ; preds = %.preheader63, %._crit_edge90.loopexit
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv132, i64 %indvars.iv132
  store double 1.000000e+00, double* %18, align 8
  %exitcond154 = icmp eq i64 %indvars.iv.next133, 2000
  %indvars.iv.next131 = add nuw nsw i64 %indvars.iv130, 1
  br i1 %exitcond154, label %._crit_edge92, label %.lr.ph86

._crit_edge92:                                    ; preds = %._crit_edge90
  %19 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br i1 true, label %._crit_edge83.us.prol.loopexit, label %._crit_edge83.us.prol.preheader

._crit_edge83.us.prol.preheader:                  ; preds = %._crit_edge92
  br label %._crit_edge83.us.prol

._crit_edge83.us.prol:                            ; preds = %._crit_edge83.us.prol, %._crit_edge83.us.prol.preheader
  %indvars.iv114.prol = phi i64 [ %indvars.iv.next115.prol, %._crit_edge83.us.prol ], [ 0, %._crit_edge83.us.prol.preheader ]
  %prol.iter208 = phi i64 [ %prol.iter208.sub, %._crit_edge83.us.prol ], [ 0, %._crit_edge83.us.prol.preheader ]
  %20 = mul nuw nsw i64 %indvars.iv114.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %19, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next115.prol = add nuw nsw i64 %indvars.iv114.prol, 1
  %prol.iter208.sub = add nsw i64 %prol.iter208, -1
  %prol.iter208.cmp = icmp eq i64 %prol.iter208.sub, 0
  br i1 %prol.iter208.cmp, label %._crit_edge83.us.prol.loopexit.unr-lcssa, label %._crit_edge83.us.prol, !llvm.loop !1

._crit_edge83.us.prol.loopexit.unr-lcssa:         ; preds = %._crit_edge83.us.prol
  br label %._crit_edge83.us.prol.loopexit

._crit_edge83.us.prol.loopexit:                   ; preds = %._crit_edge92, %._crit_edge83.us.prol.loopexit.unr-lcssa
  br i1 false, label %.preheader60.lr.ph, label %._crit_edge92.new

._crit_edge92.new:                                ; preds = %._crit_edge83.us.prol.loopexit
  br label %._crit_edge83.us

._crit_edge83.us:                                 ; preds = %._crit_edge83.us, %._crit_edge92.new
  %indvars.iv114 = phi i64 [ 0, %._crit_edge92.new ], [ %indvars.iv.next115.7, %._crit_edge83.us ]
  %21 = mul nuw nsw i64 %indvars.iv114, 16000
  %scevgep = getelementptr i8, i8* %19, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %22 = mul i64 %indvars.iv114, 16000
  %23 = add i64 %22, 16000
  %scevgep.1 = getelementptr i8, i8* %19, i64 %23
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %24 = mul i64 %indvars.iv114, 16000
  %25 = add i64 %24, 32000
  %scevgep.2 = getelementptr i8, i8* %19, i64 %25
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %26 = mul i64 %indvars.iv114, 16000
  %27 = add i64 %26, 48000
  %scevgep.3 = getelementptr i8, i8* %19, i64 %27
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %28 = mul i64 %indvars.iv114, 16000
  %29 = add i64 %28, 64000
  %scevgep.4 = getelementptr i8, i8* %19, i64 %29
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %30 = mul i64 %indvars.iv114, 16000
  %31 = add i64 %30, 80000
  %scevgep.5 = getelementptr i8, i8* %19, i64 %31
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %32 = mul i64 %indvars.iv114, 16000
  %33 = add i64 %32, 96000
  %scevgep.6 = getelementptr i8, i8* %19, i64 %33
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next115.6 = add nsw i64 %indvars.iv114, 7
  %34 = mul nuw nsw i64 %indvars.iv.next115.6, 16000
  %scevgep.7 = getelementptr i8, i8* %19, i64 %34
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %exitcond159.7 = icmp eq i64 %indvars.iv.next115.6, 1999
  %indvars.iv.next115.7 = add nsw i64 %indvars.iv114, 8
  br i1 %exitcond159.7, label %.preheader60.lr.ph.unr-lcssa, label %._crit_edge83.us

.preheader60.lr.ph.unr-lcssa:                     ; preds = %._crit_edge83.us
  br label %.preheader60.lr.ph

.preheader60.lr.ph:                               ; preds = %._crit_edge83.us.prol.loopexit, %.preheader60.lr.ph.unr-lcssa
  %35 = bitcast i8* %19 to [2000 x [2000 x double]]*
  br label %.preheader59.us.us.preheader

.preheader59.us.us.preheader:                     ; preds = %._crit_edge72.us, %.preheader60.lr.ph
  %indvars.iv106 = phi i64 [ 0, %.preheader60.lr.ph ], [ %indvars.iv.next107, %._crit_edge72.us ]
  %scevgep163 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv106
  %scevgep163164 = bitcast double* %scevgep163 to i8*
  %36 = add nsw i64 %indvars.iv106, -1999
  %scevgep165 = getelementptr [2000 x double], [2000 x double]* %1, i64 2000, i64 %36
  %scevgep165166 = bitcast double* %scevgep165 to i8*
  br label %.preheader59.us.us

._crit_edge72.us:                                 ; preds = %._crit_edge70.us.us
  %indvars.iv.next107 = add nuw nsw i64 %indvars.iv106, 1
  %exitcond144 = icmp eq i64 %indvars.iv.next107, 2000
  br i1 %exitcond144, label %.preheader.lr.ph, label %.preheader59.us.us.preheader

.preheader59.us.us:                               ; preds = %._crit_edge70.us.us, %.preheader59.us.us.preheader
  %indvars.iv102 = phi i64 [ 0, %.preheader59.us.us.preheader ], [ %indvars.iv.next103, %._crit_edge70.us.us ]
  %37 = mul nuw nsw i64 %indvars.iv102, 16000
  %scevgep161 = getelementptr i8, i8* %19, i64 %37
  %38 = add i64 16000, %37
  %scevgep162 = getelementptr i8, i8* %19, i64 %38
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv102, i64 %indvars.iv106
  br i1 false, label %scalar.ph.preheader, label %min.iters.checked

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader59.us.us
  %indvars.iv98.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader59.us.us ], [ 2000, %middle.block ]
  br i1 true, label %scalar.ph.prol.loopexit.unr-lcssa, label %scalar.ph.prol.preheader

scalar.ph.prol.preheader:                         ; preds = %scalar.ph.preheader
  br label %scalar.ph.prol

scalar.ph.prol:                                   ; preds = %scalar.ph.prol.preheader
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv98.ph, i64 %indvars.iv106
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %35, i64 0, i64 %indvars.iv102, i64 %indvars.iv98.ph
  %45 = load double, double* %44, align 8
  %46 = fadd double %45, %43
  store double %46, double* %44, align 8
  %indvars.iv.next99.prol = add nuw nsw i64 %indvars.iv98.ph, 1
  br label %scalar.ph.prol.loopexit.unr-lcssa

scalar.ph.prol.loopexit.unr-lcssa:                ; preds = %scalar.ph.preheader, %scalar.ph.prol
  %indvars.iv98.unr.ph = phi i64 [ %indvars.iv.next99.prol, %scalar.ph.prol ], [ %indvars.iv98.ph, %scalar.ph.preheader ]
  br label %scalar.ph.prol.loopexit

scalar.ph.prol.loopexit:                          ; preds = %scalar.ph.prol.loopexit.unr-lcssa
  br i1 false, label %._crit_edge70.us.us.loopexit, label %scalar.ph.preheader.new

scalar.ph.preheader.new:                          ; preds = %scalar.ph.prol.loopexit
  br label %scalar.ph

min.iters.checked:                                ; preds = %.preheader59.us.us
  br i1 false, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult i8* %scevgep161, %scevgep165166
  %bound1 = icmp ult i8* %scevgep163164, %scevgep162
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %39 to i8*
  %bc167 = bitcast double* %39 to i8*
  %bound0168 = icmp ult i8* %scevgep161, %bc167
  %bound1169 = icmp ult i8* %bc, %scevgep162
  %found.conflict170 = and i1 %bound0168, %bound1169
  %conflict.rdx = or i1 %found.conflict, %found.conflict170
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %47 = or i64 %index, 1
  %48 = or i64 %index, 2
  %49 = or i64 %index, 3
  %50 = load double, double* %39, align 8, !alias.scope !3
  %51 = insertelement <2 x double> undef, double %50, i32 0
  %52 = shufflevector <2 x double> %51, <2 x double> undef, <2 x i32> zeroinitializer
  %53 = insertelement <2 x double> undef, double %50, i32 0
  %54 = shufflevector <2 x double> %53, <2 x double> undef, <2 x i32> zeroinitializer
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %index, i64 %indvars.iv106
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %47, i64 %indvars.iv106
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %48, i64 %indvars.iv106
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %49, i64 %indvars.iv106
  %59 = load double, double* %55, align 8, !alias.scope !6
  %60 = load double, double* %56, align 8, !alias.scope !6
  %61 = load double, double* %57, align 8, !alias.scope !6
  %62 = load double, double* %58, align 8, !alias.scope !6
  %63 = insertelement <2 x double> undef, double %59, i32 0
  %64 = insertelement <2 x double> %63, double %60, i32 1
  %65 = insertelement <2 x double> undef, double %61, i32 0
  %66 = insertelement <2 x double> %65, double %62, i32 1
  %67 = fmul <2 x double> %52, %64
  %68 = fmul <2 x double> %54, %66
  %69 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %35, i64 0, i64 %indvars.iv102, i64 %index
  %70 = bitcast double* %69 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %70, align 8, !alias.scope !8, !noalias !10
  %71 = getelementptr double, double* %69, i64 2
  %72 = bitcast double* %71 to <2 x double>*
  %wide.load172 = load <2 x double>, <2 x double>* %72, align 8, !alias.scope !8, !noalias !10
  %73 = fadd <2 x double> %wide.load, %67
  %74 = fadd <2 x double> %wide.load172, %68
  %75 = bitcast double* %69 to <2 x double>*
  store <2 x double> %73, <2 x double>* %75, align 8, !alias.scope !8, !noalias !10
  %76 = bitcast double* %71 to <2 x double>*
  store <2 x double> %74, <2 x double>* %76, align 8, !alias.scope !8, !noalias !10
  %index.next = add i64 %index, 4
  %77 = icmp eq i64 %index.next, 2000
  br i1 %77, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  br i1 true, label %._crit_edge70.us.us, label %scalar.ph.preheader

._crit_edge70.us.us.loopexit.unr-lcssa:           ; preds = %scalar.ph
  br label %._crit_edge70.us.us.loopexit

._crit_edge70.us.us.loopexit:                     ; preds = %scalar.ph.prol.loopexit, %._crit_edge70.us.us.loopexit.unr-lcssa
  br label %._crit_edge70.us.us

._crit_edge70.us.us:                              ; preds = %._crit_edge70.us.us.loopexit, %middle.block
  %indvars.iv.next103 = add nuw nsw i64 %indvars.iv102, 1
  %exitcond142 = icmp eq i64 %indvars.iv.next103, 2000
  br i1 %exitcond142, label %._crit_edge72.us, label %.preheader59.us.us

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader.new
  %indvars.iv98 = phi i64 [ %indvars.iv98.unr.ph, %scalar.ph.preheader.new ], [ %indvars.iv.next99.1, %scalar.ph ]
  %78 = load double, double* %39, align 8
  %79 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv98, i64 %indvars.iv106
  %80 = load double, double* %79, align 8
  %81 = fmul double %78, %80
  %82 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %35, i64 0, i64 %indvars.iv102, i64 %indvars.iv98
  %83 = load double, double* %82, align 8
  %84 = fadd double %83, %81
  store double %84, double* %82, align 8
  %indvars.iv.next99 = add nuw nsw i64 %indvars.iv98, 1
  %85 = load double, double* %39, align 8
  %86 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next99, i64 %indvars.iv106
  %87 = load double, double* %86, align 8
  %88 = fmul double %85, %87
  %89 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %35, i64 0, i64 %indvars.iv102, i64 %indvars.iv.next99
  %90 = load double, double* %89, align 8
  %91 = fadd double %90, %88
  store double %91, double* %89, align 8
  %exitcond158.1 = icmp eq i64 %indvars.iv.next99, 1999
  %indvars.iv.next99.1 = add nsw i64 %indvars.iv98, 2
  br i1 %exitcond158.1, label %._crit_edge70.us.us.loopexit.unr-lcssa, label %scalar.ph, !llvm.loop !14

.preheader.lr.ph:                                 ; preds = %._crit_edge72.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv94 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next95, %._crit_edge.us ]
  %scevgep182 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv94, i64 0
  %scevgep182183 = bitcast double* %scevgep182 to i8*
  %scevgep184 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv94, i64 2000
  %scevgep184185 = bitcast double* %scevgep184 to i8*
  %92 = mul nuw nsw i64 %indvars.iv94, 16000
  %scevgep186 = getelementptr i8, i8* %19, i64 %92
  %93 = add i64 16000, %92
  %scevgep187 = getelementptr i8, i8* %19, i64 %93
  br i1 false, label %scalar.ph175.preheader, label %min.iters.checked177

min.iters.checked177:                             ; preds = %.preheader.us
  br i1 false, label %scalar.ph175.preheader, label %vector.memcheck192

vector.memcheck192:                               ; preds = %min.iters.checked177
  %bound0188 = icmp ult i8* %scevgep182183, %scevgep187
  %bound1189 = icmp ult i8* %scevgep186, %scevgep184185
  %memcheck.conflict191 = and i1 %bound0188, %bound1189
  br i1 %memcheck.conflict191, label %scalar.ph175.preheader, label %vector.body173.preheader

vector.body173.preheader:                         ; preds = %vector.memcheck192
  br label %vector.body173

vector.body173:                                   ; preds = %vector.body173.preheader, %vector.body173
  %index194 = phi i64 [ %index.next195, %vector.body173 ], [ 0, %vector.body173.preheader ]
  %94 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %35, i64 0, i64 %indvars.iv94, i64 %index194
  %95 = bitcast double* %94 to <2 x i64>*
  %wide.load202 = load <2 x i64>, <2 x i64>* %95, align 8, !alias.scope !15
  %96 = getelementptr double, double* %94, i64 2
  %97 = bitcast double* %96 to <2 x i64>*
  %wide.load203 = load <2 x i64>, <2 x i64>* %97, align 8, !alias.scope !15
  %98 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv94, i64 %index194
  %99 = bitcast double* %98 to <2 x i64>*
  store <2 x i64> %wide.load202, <2 x i64>* %99, align 8, !alias.scope !18, !noalias !15
  %100 = getelementptr double, double* %98, i64 2
  %101 = bitcast double* %100 to <2 x i64>*
  store <2 x i64> %wide.load203, <2 x i64>* %101, align 8, !alias.scope !18, !noalias !15
  %index.next195 = add i64 %index194, 4
  %102 = icmp eq i64 %index.next195, 2000
  br i1 %102, label %middle.block174, label %vector.body173, !llvm.loop !20

middle.block174:                                  ; preds = %vector.body173
  br i1 true, label %._crit_edge.us, label %scalar.ph175.preheader

scalar.ph175.preheader:                           ; preds = %middle.block174, %vector.memcheck192, %min.iters.checked177, %.preheader.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck192 ], [ 0, %min.iters.checked177 ], [ 0, %.preheader.us ], [ 2000, %middle.block174 ]
  %103 = sub nsw i64 1999, %indvars.iv.ph
  br i1 true, label %scalar.ph175.prol.loopexit, label %scalar.ph175.prol.preheader

scalar.ph175.prol.preheader:                      ; preds = %scalar.ph175.preheader
  br label %scalar.ph175.prol

scalar.ph175.prol:                                ; preds = %scalar.ph175.prol, %scalar.ph175.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %scalar.ph175.prol ], [ %indvars.iv.ph, %scalar.ph175.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %scalar.ph175.prol ], [ 0, %scalar.ph175.prol.preheader ]
  %104 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %35, i64 0, i64 %indvars.iv94, i64 %indvars.iv.prol
  %105 = bitcast double* %104 to i64*
  %106 = load i64, i64* %105, align 8
  %107 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv94, i64 %indvars.iv.prol
  %108 = bitcast double* %107 to i64*
  store i64 %106, i64* %108, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %scalar.ph175.prol.loopexit.unr-lcssa, label %scalar.ph175.prol, !llvm.loop !21

scalar.ph175.prol.loopexit.unr-lcssa:             ; preds = %scalar.ph175.prol
  br label %scalar.ph175.prol.loopexit

scalar.ph175.prol.loopexit:                       ; preds = %scalar.ph175.preheader, %scalar.ph175.prol.loopexit.unr-lcssa
  %109 = icmp ult i64 %103, 3
  br i1 %109, label %._crit_edge.us.loopexit, label %scalar.ph175.preheader.new

scalar.ph175.preheader.new:                       ; preds = %scalar.ph175.prol.loopexit
  br label %scalar.ph175

scalar.ph175:                                     ; preds = %scalar.ph175, %scalar.ph175.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.ph, %scalar.ph175.preheader.new ], [ %indvars.iv.next.3, %scalar.ph175 ]
  %110 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %35, i64 0, i64 %indvars.iv94, i64 %indvars.iv
  %111 = bitcast double* %110 to i64*
  %112 = load i64, i64* %111, align 8
  %113 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv94, i64 %indvars.iv
  %114 = bitcast double* %113 to i64*
  store i64 %112, i64* %114, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %115 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %35, i64 0, i64 %indvars.iv94, i64 %indvars.iv.next
  %116 = bitcast double* %115 to i64*
  %117 = load i64, i64* %116, align 8
  %118 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv94, i64 %indvars.iv.next
  %119 = bitcast double* %118 to i64*
  store i64 %117, i64* %119, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %120 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %35, i64 0, i64 %indvars.iv94, i64 %indvars.iv.next.1
  %121 = bitcast double* %120 to i64*
  %122 = load i64, i64* %121, align 8
  %123 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv94, i64 %indvars.iv.next.1
  %124 = bitcast double* %123 to i64*
  store i64 %122, i64* %124, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %125 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %35, i64 0, i64 %indvars.iv94, i64 %indvars.iv.next.2
  %126 = bitcast double* %125 to i64*
  %127 = load i64, i64* %126, align 8
  %128 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv94, i64 %indvars.iv.next.2
  %129 = bitcast double* %128 to i64*
  store i64 %127, i64* %129, align 8
  %exitcond157.3 = icmp eq i64 %indvars.iv.next.2, 1999
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  br i1 %exitcond157.3, label %._crit_edge.us.loopexit.unr-lcssa, label %scalar.ph175, !llvm.loop !22

._crit_edge.us.loopexit.unr-lcssa:                ; preds = %scalar.ph175
  br label %._crit_edge.us.loopexit

._crit_edge.us.loopexit:                          ; preds = %scalar.ph175.prol.loopexit, %._crit_edge.us.loopexit.unr-lcssa
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block174
  %indvars.iv.next95 = add nuw nsw i64 %indvars.iv94, 1
  %exitcond = icmp eq i64 %indvars.iv.next95, 2000
  br i1 %exitcond, label %._crit_edge67.loopexit, label %.preheader.us

._crit_edge67.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge67

._crit_edge67:                                    ; preds = %._crit_edge67.loopexit, %._crit_edge92.thread
  %130 = phi i8* [ %3, %._crit_edge92.thread ], [ %19, %._crit_edge67.loopexit ]
  tail call void @free(i8* %130) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  br i1 true, label %.preheader36.preheader, label %._crit_edge45

.preheader36.preheader:                           ; preds = %2
  br label %.preheader36

.preheader36:                                     ; preds = %.preheader36.preheader, %._crit_edge42
  %indvars.iv73 = phi i2 [ 0, %.preheader36.preheader ], [ %indvars.iv.next74, %._crit_edge42 ]
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %._crit_edge42 ], [ 0, %.preheader36.preheader ]
  %3 = zext i2 %indvars.iv73 to i64
  %4 = add nsw i64 %indvars.iv59, -1
  %5 = icmp sgt i64 %indvars.iv59, 0
  br i1 %5, label %.preheader.preheader, label %._crit_edge42

.preheader.preheader:                             ; preds = %.preheader36
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv59, i64 0
  br label %.preheader

.lr.ph41:                                         ; preds = %._crit_edge
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv59, i64 %indvars.iv59
  %.pre67 = load double, double* %7, align 8
  %xtraiter68 = and i64 %indvars.iv59, 3
  %lcmp.mod69 = icmp eq i64 %xtraiter68, 0
  br i1 %lcmp.mod69, label %._crit_edge65.prol.loopexit, label %._crit_edge65.prol.preheader

._crit_edge65.prol.preheader:                     ; preds = %.lr.ph41
  br label %._crit_edge65.prol

._crit_edge65.prol:                               ; preds = %._crit_edge65.prol, %._crit_edge65.prol.preheader
  %8 = phi double [ %.pre67, %._crit_edge65.prol.preheader ], [ %12, %._crit_edge65.prol ]
  %indvars.iv54.prol = phi i64 [ 0, %._crit_edge65.prol.preheader ], [ %indvars.iv.next55.prol, %._crit_edge65.prol ]
  %prol.iter = phi i64 [ %xtraiter68, %._crit_edge65.prol.preheader ], [ %prol.iter.sub, %._crit_edge65.prol ]
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv59, i64 %indvars.iv54.prol
  %10 = load double, double* %9, align 8
  %11 = fmul double %10, %10
  %12 = fsub double %8, %11
  store double %12, double* %7, align 8
  %indvars.iv.next55.prol = add nuw nsw i64 %indvars.iv54.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge65.prol.loopexit.unr-lcssa, label %._crit_edge65.prol, !llvm.loop !23

._crit_edge65.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge65.prol
  br label %._crit_edge65.prol.loopexit

._crit_edge65.prol.loopexit:                      ; preds = %.lr.ph41, %._crit_edge65.prol.loopexit.unr-lcssa
  %.unr70 = phi double [ %.pre67, %.lr.ph41 ], [ %12, %._crit_edge65.prol.loopexit.unr-lcssa ]
  %indvars.iv54.unr = phi i64 [ 0, %.lr.ph41 ], [ %3, %._crit_edge65.prol.loopexit.unr-lcssa ]
  %13 = icmp ult i64 %4, 3
  br i1 %13, label %._crit_edge42.loopexit, label %.lr.ph41.new

.lr.ph41.new:                                     ; preds = %._crit_edge65.prol.loopexit
  br label %._crit_edge65

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %._crit_edge ], [ 0, %.preheader.preheader ]
  %14 = icmp sgt i64 %indvars.iv48, 0
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv59, i64 %indvars.iv48
  %.pre = load double, double* %15, align 8
  br i1 %14, label %._crit_edge64.preheader, label %._crit_edge

._crit_edge64.preheader:                          ; preds = %.preheader
  %xtraiter = and i64 %indvars.iv48, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge64.prol.loopexit.unr-lcssa, label %._crit_edge64.prol.preheader

._crit_edge64.prol.preheader:                     ; preds = %._crit_edge64.preheader
  br label %._crit_edge64.prol

._crit_edge64.prol:                               ; preds = %._crit_edge64.prol.preheader
  %16 = load double, double* %6, align 8
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv48, i64 0
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = fsub double %.pre, %19
  store double %20, double* %15, align 8
  br label %._crit_edge64.prol.loopexit.unr-lcssa

._crit_edge64.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge64.preheader, %._crit_edge64.prol
  %.lcssa.unr.ph = phi double [ %20, %._crit_edge64.prol ], [ undef, %._crit_edge64.preheader ]
  %.unr.ph = phi double [ %20, %._crit_edge64.prol ], [ %.pre, %._crit_edge64.preheader ]
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge64.prol ], [ 0, %._crit_edge64.preheader ]
  br label %._crit_edge64.prol.loopexit

._crit_edge64.prol.loopexit:                      ; preds = %._crit_edge64.prol.loopexit.unr-lcssa
  %21 = icmp eq i64 %indvars.iv48, 1
  br i1 %21, label %._crit_edge.loopexit, label %._crit_edge64.preheader.new

._crit_edge64.preheader.new:                      ; preds = %._crit_edge64.prol.loopexit
  br label %._crit_edge64

._crit_edge64:                                    ; preds = %._crit_edge64, %._crit_edge64.preheader.new
  %22 = phi double [ %.unr.ph, %._crit_edge64.preheader.new ], [ %34, %._crit_edge64 ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %._crit_edge64.preheader.new ], [ %indvars.iv.next.1, %._crit_edge64 ]
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv59, i64 %indvars.iv
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv48, i64 %indvars.iv
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fsub double %22, %27
  store double %28, double* %15, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv59, i64 %indvars.iv.next
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv48, i64 %indvars.iv.next
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = fsub double %28, %33
  store double %34, double* %15, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv48
  br i1 %exitcond.1, label %._crit_edge.loopexit.unr-lcssa, label %._crit_edge64

._crit_edge.loopexit.unr-lcssa:                   ; preds = %._crit_edge64
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge64.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %._crit_edge64.prol.loopexit ], [ %34, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %35 = phi double [ %.pre, %.preheader ], [ %.lcssa, %._crit_edge.loopexit ]
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv48, i64 %indvars.iv48
  %37 = load double, double* %36, align 8
  %38 = fdiv double %35, %37
  store double %38, double* %15, align 8
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next49, %indvars.iv59
  br i1 %exitcond53, label %.lr.ph41, label %.preheader

._crit_edge65:                                    ; preds = %._crit_edge65, %.lr.ph41.new
  %39 = phi double [ %.unr70, %.lr.ph41.new ], [ %55, %._crit_edge65 ]
  %indvars.iv54 = phi i64 [ %indvars.iv54.unr, %.lr.ph41.new ], [ %indvars.iv.next55.3, %._crit_edge65 ]
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv59, i64 %indvars.iv54
  %41 = load double, double* %40, align 8
  %42 = fmul double %41, %41
  %43 = fsub double %39, %42
  store double %43, double* %7, align 8
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv59, i64 %indvars.iv.next55
  %45 = load double, double* %44, align 8
  %46 = fmul double %45, %45
  %47 = fsub double %43, %46
  store double %47, double* %7, align 8
  %indvars.iv.next55.1 = add nsw i64 %indvars.iv54, 2
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv59, i64 %indvars.iv.next55.1
  %49 = load double, double* %48, align 8
  %50 = fmul double %49, %49
  %51 = fsub double %47, %50
  store double %51, double* %7, align 8
  %indvars.iv.next55.2 = add nsw i64 %indvars.iv54, 3
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv59, i64 %indvars.iv.next55.2
  %53 = load double, double* %52, align 8
  %54 = fmul double %53, %53
  %55 = fsub double %51, %54
  store double %55, double* %7, align 8
  %indvars.iv.next55.3 = add nuw nsw i64 %indvars.iv54, 4
  %exitcond58.3 = icmp eq i64 %indvars.iv.next55.3, %indvars.iv59
  br i1 %exitcond58.3, label %._crit_edge42.loopexit.unr-lcssa, label %._crit_edge65

._crit_edge42.loopexit.unr-lcssa:                 ; preds = %._crit_edge65
  br label %._crit_edge42.loopexit

._crit_edge42.loopexit:                           ; preds = %._crit_edge65.prol.loopexit, %._crit_edge42.loopexit.unr-lcssa
  br label %._crit_edge42

._crit_edge42:                                    ; preds = %._crit_edge42.loopexit, %.preheader36
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv59, i64 %indvars.iv59
  %57 = load double, double* %56, align 8
  %58 = tail call double @sqrt(double %57) #3
  store double %58, double* %56, align 8
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond63 = icmp eq i64 %indvars.iv.next60, 2000
  %indvars.iv.next74 = add i2 %indvars.iv73, 1
  br i1 %exitcond63, label %._crit_edge45.loopexit, label %.preheader36

._crit_edge45.loopexit:                           ; preds = %._crit_edge42
  br label %._crit_edge45

._crit_edge45:                                    ; preds = %._crit_edge45.loopexit, %2
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
  br i1 true, label %.preheader.preheader, label %._crit_edge13

.preheader.preheader:                             ; preds = %2
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv18 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next19, %._crit_edge ]
  %indvars.iv16 = phi i64 [ 1, %.preheader.preheader ], [ %indvars.iv.next17, %._crit_edge ]
  %7 = mul nsw i64 %indvars.iv18, 2000
  br label %._crit_edge24

._crit_edge24:                                    ; preds = %._crit_edge23, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge23 ]
  %8 = add nsw i64 %indvars.iv, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge23

; <label>:12:                                     ; preds = %._crit_edge24
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge23

._crit_edge23:                                    ; preds = %._crit_edge24, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv18, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %indvars.iv16
  br i1 %exitcond, label %._crit_edge, label %._crit_edge24

._crit_edge:                                      ; preds = %._crit_edge23
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next19, 2000
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  br i1 %exitcond22, label %._crit_edge13.loopexit, label %.lr.ph

._crit_edge13.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %2
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
