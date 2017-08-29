; ModuleID = 'A.ll'
source_filename = "covariance.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"cov\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #3
  %7 = bitcast i8* %4 to [1200 x double]*
  call fastcc void @init_array(i32 1400, double* nonnull %3, [1200 x double]* %7)
  call void (...) @polybench_timer_start() #3
  %8 = load double, double* %3, align 8
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  call fastcc void @kernel_covariance(i32 1200, i32 1400, double %8, [1200 x double]* %7, [1200 x double]* %9, double* %10)
  call void (...) @polybench_timer_stop() #3
  call void (...) @polybench_timer_print() #3
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @print_array(i32 1200, [1200 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  call void @free(i8* %4) #3
  call void @free(i8* %5) #3
  call void @free(i8* %6) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, double*, [1200 x double]*) unnamed_addr #0 {
  store double 1.400000e+03, double* %1, align 8
  br label %.preheader

.preheader:                                       ; preds = %19, %3
  %indvars.iv112 = phi i64 [ 0, %3 ], [ %indvars.iv.next12, %19 ]
  %4 = trunc i64 %indvars.iv112 to i32
  %5 = sitofp i32 %4 to double
  %6 = insertelement <2 x double> undef, double %5, i32 0
  %7 = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv1 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %._crit_edge ]
  %8 = trunc i64 %indvars.iv1 to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv112, i64 %indvars.iv1
  %11 = trunc i64 %indvars.iv1 to i32
  %12 = or i32 %11, 1
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %9, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fmul <2 x double> %7, %15
  %17 = fdiv <2 x double> %16, <double 1.200000e+03, double 1.200000e+03>
  %18 = bitcast double* %10 to <2 x double>*
  store <2 x double> %17, <2 x double>* %18, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv1, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %._crit_edge
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv112, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next12, 1400
  br i1 %exitcond13, label %20, label %.preheader

; <label>:20:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_covariance(i32, i32, double, [1200 x double]*, [1200 x double]*, double*) unnamed_addr #0 {
.lr.ph118.split.us.preheader:
  %6 = ptrtoint double* %5 to i64
  %sunkaddr = ptrtoint double* %5 to i64
  %sunkaddr162 = ptrtoint double* %5 to i64
  br label %.lr.ph118.split.us

.lr.ph118.split.us:                               ; preds = %._crit_edge114.us, %.lr.ph118.split.us.preheader
  %indvars.iv84115.us = phi i64 [ 0, %.lr.ph118.split.us.preheader ], [ %indvars.iv.next85.us, %._crit_edge114.us ]
  %7 = getelementptr inbounds double, double* %5, i64 %indvars.iv84115.us
  store double 0.000000e+00, double* %7, align 8
  %sunkaddr65.us = shl i64 %indvars.iv84115.us, 3
  %sunkaddr66.us = add i64 %6, %sunkaddr65.us
  %sunkaddr67.us = inttoptr i64 %sunkaddr66.us to double*
  %.pre = load double, double* %sunkaddr67.us, align 8
  %sunkaddr159 = shl i64 %indvars.iv84115.us, 3
  %sunkaddr160 = add i64 %sunkaddr, %sunkaddr159
  %sunkaddr161 = inttoptr i64 %sunkaddr160 to double*
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph118.split.us
  %8 = phi double [ %.pre, %.lr.ph118.split.us ], [ %20, %._crit_edge ]
  %indvars.iv82111.us = phi i64 [ 0, %.lr.ph118.split.us ], [ %indvars.iv.next83.us.3, %._crit_edge ]
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv82111.us, i64 %indvars.iv84115.us
  %10 = load double, double* %9, align 8
  %11 = fadd double %10, %8
  store double %11, double* %sunkaddr161, align 8
  %indvars.iv.next83.us = or i64 %indvars.iv82111.us, 1
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next83.us, i64 %indvars.iv84115.us
  %13 = load double, double* %12, align 8
  %14 = fadd double %13, %11
  store double %14, double* %sunkaddr161, align 8
  %indvars.iv.next83.us.1 = or i64 %indvars.iv82111.us, 2
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next83.us.1, i64 %indvars.iv84115.us
  %16 = load double, double* %15, align 8
  %17 = fadd double %16, %14
  store double %17, double* %sunkaddr161, align 8
  %indvars.iv.next83.us.2 = or i64 %indvars.iv82111.us, 3
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next83.us.2, i64 %indvars.iv84115.us
  %19 = load double, double* %18, align 8
  %20 = fadd double %19, %17
  store double %20, double* %sunkaddr161, align 8
  %indvars.iv.next83.us.3 = add nsw i64 %indvars.iv82111.us, 4
  %exitcond128.3 = icmp eq i64 %indvars.iv.next83.us.3, 1400
  br i1 %exitcond128.3, label %._crit_edge114.us, label %._crit_edge

._crit_edge114.us:                                ; preds = %._crit_edge
  %21 = fdiv double %20, %2
  %sunkaddr163 = shl i64 %indvars.iv84115.us, 3
  %sunkaddr164 = add i64 %sunkaddr162, %sunkaddr163
  %sunkaddr165 = inttoptr i64 %sunkaddr164 to double*
  store double %21, double* %sunkaddr165, align 8
  %indvars.iv.next85.us = add nuw nsw i64 %indvars.iv84115.us, 1
  %exitcond129 = icmp eq i64 %indvars.iv.next85.us, 1200
  br i1 %exitcond129, label %._crit_edge114.us..preheader63.us_crit_edge, label %.lr.ph118.split.us

._crit_edge114.us..preheader63.us_crit_edge:      ; preds = %._crit_edge114.us
  %scevgep147 = getelementptr double, double* %5, i64 1200
  br label %.preheader63.us

.preheader63.us:                                  ; preds = %._crit_edge108.us, %._crit_edge114.us..preheader63.us_crit_edge
  %indvars.iv80109.us = phi i64 [ 0, %._crit_edge114.us..preheader63.us_crit_edge ], [ %22, %._crit_edge108.us ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv80109.us, i64 0
  %22 = add i64 %indvars.iv80109.us, 1
  %scevgep145 = getelementptr [1200 x double], [1200 x double]* %3, i64 %22, i64 0
  %bound0 = icmp ult double* %scevgep, %scevgep147
  %bound1 = icmp ugt double* %scevgep145, %5
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge132.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader63.us
  br label %vector.body

._crit_edge132.preheader:                         ; preds = %.preheader63.us
  br label %._crit_edge132

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = shl i64 %index, 2
  %23 = getelementptr inbounds double, double* %5, i64 %offset.idx
  %24 = bitcast double* %23 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %24, align 8, !alias.scope !1
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv80109.us, i64 %offset.idx
  %26 = bitcast double* %25 to <8 x double>*
  %wide.vec152 = load <8 x double>, <8 x double>* %26, align 8, !alias.scope !4, !noalias !1
  %27 = fsub <8 x double> %wide.vec152, %wide.vec
  %28 = shufflevector <8 x double> %27, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %29 = shufflevector <8 x double> %27, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %30 = shufflevector <8 x double> %27, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %31 = or i64 %offset.idx, 3
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv80109.us, i64 %31
  %33 = shufflevector <8 x double> %27, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %34 = getelementptr double, double* %32, i64 -3
  %35 = bitcast double* %34 to <8 x double>*
  %36 = shufflevector <2 x double> %28, <2 x double> %29, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %37 = shufflevector <2 x double> %30, <2 x double> %33, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %36, <4 x double> %37, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %35, align 8, !alias.scope !4, !noalias !1
  %index.next = add i64 %index, 2
  %38 = icmp eq i64 %index.next, 300
  br i1 %38, label %._crit_edge108.us.loopexit166, label %vector.body, !llvm.loop !6

._crit_edge132:                                   ; preds = %._crit_edge132.preheader, %._crit_edge132
  %indvars.iv78106.us = phi i64 [ %indvars.iv.next79.us.3, %._crit_edge132 ], [ 0, %._crit_edge132.preheader ]
  %39 = getelementptr inbounds double, double* %5, i64 %indvars.iv78106.us
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv80109.us, i64 %indvars.iv78106.us
  %42 = load double, double* %41, align 8
  %43 = fsub double %42, %40
  store double %43, double* %41, align 8
  %indvars.iv.next79.us = or i64 %indvars.iv78106.us, 1
  %44 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next79.us
  %45 = load double, double* %44, align 8
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv80109.us, i64 %indvars.iv.next79.us
  %47 = load double, double* %46, align 8
  %48 = fsub double %47, %45
  store double %48, double* %46, align 8
  %indvars.iv.next79.us.1 = or i64 %indvars.iv78106.us, 2
  %49 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next79.us.1
  %50 = load double, double* %49, align 8
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv80109.us, i64 %indvars.iv.next79.us.1
  %52 = load double, double* %51, align 8
  %53 = fsub double %52, %50
  store double %53, double* %51, align 8
  %indvars.iv.next79.us.2 = or i64 %indvars.iv78106.us, 3
  %54 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next79.us.2
  %55 = load double, double* %54, align 8
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv80109.us, i64 %indvars.iv.next79.us.2
  %57 = load double, double* %56, align 8
  %58 = fsub double %57, %55
  store double %58, double* %56, align 8
  %indvars.iv.next79.us.3 = add nsw i64 %indvars.iv78106.us, 4
  %exitcond125.3 = icmp eq i64 %indvars.iv.next79.us.3, 1200
  br i1 %exitcond125.3, label %._crit_edge108.us.loopexit, label %._crit_edge132, !llvm.loop !9

._crit_edge108.us.loopexit:                       ; preds = %._crit_edge132
  br label %._crit_edge108.us

._crit_edge108.us.loopexit166:                    ; preds = %vector.body
  br label %._crit_edge108.us

._crit_edge108.us:                                ; preds = %._crit_edge108.us.loopexit166, %._crit_edge108.us.loopexit
  %exitcond126 = icmp eq i64 %22, 1400
  br i1 %exitcond126, label %.preheader.us.preheader, label %.preheader63.us

.preheader.us.preheader:                          ; preds = %._crit_edge108.us
  %59 = fadd double %2, -1.000000e+00
  br label %.lr.ph.us.us.preheader

.lr.ph.us.us.preheader:                           ; preds = %._crit_edge91.us-lcssa.us.us, %.preheader.us.preheader
  %indvars.iv7692.us = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next77.us, %._crit_edge91.us-lcssa.us.us ]
  br label %.lr.ph.us.us

._crit_edge91.us-lcssa.us.us:                     ; preds = %._crit_edge.us.us
  %indvars.iv.next77.us = add nuw nsw i64 %indvars.iv7692.us, 1
  %exitcond123 = icmp eq i64 %indvars.iv.next77.us, 1200
  br i1 %exitcond123, label %._crit_edge95, label %.lr.ph.us.us.preheader

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph.us.us.preheader
  %indvars.iv7488.us.us = phi i64 [ %indvars.iv7692.us, %.lr.ph.us.us.preheader ], [ %indvars.iv.next75.us.us, %._crit_edge.us.us ]
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv7692.us, i64 %indvars.iv7488.us.us
  store double 0.000000e+00, double* %60, align 8
  br label %._crit_edge133

._crit_edge.us.us:                                ; preds = %._crit_edge133
  %61 = fdiv double %75, %59
  store double %61, double* %60, align 8
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv7488.us.us, i64 %indvars.iv7692.us
  store double %61, double* %62, align 8
  %indvars.iv.next75.us.us = add nuw nsw i64 %indvars.iv7488.us.us, 1
  %exitcond.us.us = icmp eq i64 %indvars.iv.next75.us.us, 1200
  br i1 %exitcond.us.us, label %._crit_edge91.us-lcssa.us.us, label %.lr.ph.us.us

._crit_edge133:                                   ; preds = %._crit_edge133, %.lr.ph.us.us
  %63 = phi double [ 0.000000e+00, %.lr.ph.us.us ], [ %75, %._crit_edge133 ]
  %indvars.iv86.us.us = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.us.us.1, %._crit_edge133 ]
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv86.us.us, i64 %indvars.iv7692.us
  %65 = load double, double* %64, align 8
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv86.us.us, i64 %indvars.iv7488.us.us
  %67 = load double, double* %66, align 8
  %68 = fmul double %65, %67
  %69 = fadd double %63, %68
  store double %69, double* %60, align 8
  %indvars.iv.next.us.us = or i64 %indvars.iv86.us.us, 1
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next.us.us, i64 %indvars.iv7692.us
  %71 = load double, double* %70, align 8
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next.us.us, i64 %indvars.iv7488.us.us
  %73 = load double, double* %72, align 8
  %74 = fmul double %71, %73
  %75 = fadd double %69, %74
  store double %75, double* %60, align 8
  %indvars.iv.next.us.us.1 = add nsw i64 %indvars.iv86.us.us, 2
  %exitcond122.1 = icmp eq i64 %indvars.iv.next.us.us.1, 1400
  br i1 %exitcond122.1, label %._crit_edge.us.us, label %._crit_edge133

._crit_edge95:                                    ; preds = %._crit_edge91.us-lcssa.us.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]*) unnamed_addr #0 {
.preheader.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #4
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv1216.us = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next13.us, %._crit_edge.us ]
  %6 = mul nuw nsw i64 %indvars.iv1216.us, 1200
  br label %._crit_edge20

._crit_edge20:                                    ; preds = %._crit_edge, %.preheader.us
  %indvars.iv15.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %._crit_edge ]
  %7 = add nuw nsw i64 %indvars.iv15.us, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %._crit_edge20
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge20, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv1216.us, i64 %indvars.iv15.us
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #5
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv15.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond.us, label %._crit_edge.us, label %._crit_edge20

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next13.us = add nuw nsw i64 %indvars.iv1216.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next13.us, 1200
  br i1 %exitcond, label %._crit_edge18, label %.preheader.us

._crit_edge18:                                    ; preds = %._crit_edge.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #5
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
