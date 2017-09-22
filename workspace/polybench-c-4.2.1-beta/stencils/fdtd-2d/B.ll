; ModuleID = 'A.ll'
source_filename = "fdtd-2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"ex\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"ey\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"hz\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 500, i32 8) #4
  %7 = bitcast i8* %3 to [1200 x double]*
  %8 = bitcast i8* %4 to [1200 x double]*
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  tail call fastcc void @init_array(i32 500, i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_fdtd_2d(i32 500, i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %16

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %16

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9)
  br label %16

; <label>:16:                                     ; preds = %12, %15, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture) unnamed_addr #2 {
  %8 = sext i32 %0 to i64
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %.lr.ph12.preheader, label %._crit_edge13

.lr.ph12.preheader:                               ; preds = %7
  %10 = add nsw i64 %8, -1
  %xtraiter = and i64 %8, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph12.prol.loopexit, label %.lr.ph12.prol.preheader

.lr.ph12.prol.preheader:                          ; preds = %.lr.ph12.preheader
  br label %.lr.ph12.prol

.lr.ph12.prol:                                    ; preds = %.lr.ph12.prol.preheader, %.lr.ph12.prol
  %indvars.iv410.prol = phi i64 [ %indvars.iv.next5.prol, %.lr.ph12.prol ], [ 0, %.lr.ph12.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph12.prol ], [ %xtraiter, %.lr.ph12.prol.preheader ]
  %11 = trunc i64 %indvars.iv410.prol to i32
  %12 = sitofp i32 %11 to double
  %13 = getelementptr inbounds double, double* %6, i64 %indvars.iv410.prol
  store double %12, double* %13, align 8
  %indvars.iv.next5.prol = add nuw nsw i64 %indvars.iv410.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph12.prol.loopexit.loopexit, label %.lr.ph12.prol, !llvm.loop !1

.lr.ph12.prol.loopexit.loopexit:                  ; preds = %.lr.ph12.prol
  br label %.lr.ph12.prol.loopexit

.lr.ph12.prol.loopexit:                           ; preds = %.lr.ph12.prol.loopexit.loopexit, %.lr.ph12.preheader
  %indvars.iv410.unr = phi i64 [ 0, %.lr.ph12.preheader ], [ %xtraiter, %.lr.ph12.prol.loopexit.loopexit ]
  %14 = icmp ult i64 %10, 7
  br i1 %14, label %._crit_edge13, label %.lr.ph12.preheader20

.lr.ph12.preheader20:                             ; preds = %.lr.ph12.prol.loopexit
  br label %.lr.ph12

.lr.ph12:                                         ; preds = %.lr.ph12.preheader20, %.lr.ph12
  %indvars.iv410 = phi i64 [ %indvars.iv.next5.7, %.lr.ph12 ], [ %indvars.iv410.unr, %.lr.ph12.preheader20 ]
  %15 = trunc i64 %indvars.iv410 to i32
  %16 = sitofp i32 %15 to double
  %17 = getelementptr inbounds double, double* %6, i64 %indvars.iv410
  store double %16, double* %17, align 8
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv410, 1
  %18 = trunc i64 %indvars.iv.next5 to i32
  %19 = sitofp i32 %18 to double
  %20 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next5
  store double %19, double* %20, align 8
  %indvars.iv.next5.1 = add nsw i64 %indvars.iv410, 2
  %21 = trunc i64 %indvars.iv.next5.1 to i32
  %22 = sitofp i32 %21 to double
  %23 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next5.1
  store double %22, double* %23, align 8
  %indvars.iv.next5.2 = add nsw i64 %indvars.iv410, 3
  %24 = trunc i64 %indvars.iv.next5.2 to i32
  %25 = sitofp i32 %24 to double
  %26 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next5.2
  store double %25, double* %26, align 8
  %indvars.iv.next5.3 = add nsw i64 %indvars.iv410, 4
  %27 = trunc i64 %indvars.iv.next5.3 to i32
  %28 = sitofp i32 %27 to double
  %29 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next5.3
  store double %28, double* %29, align 8
  %indvars.iv.next5.4 = add nsw i64 %indvars.iv410, 5
  %30 = trunc i64 %indvars.iv.next5.4 to i32
  %31 = sitofp i32 %30 to double
  %32 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next5.4
  store double %31, double* %32, align 8
  %indvars.iv.next5.5 = add nsw i64 %indvars.iv410, 6
  %33 = trunc i64 %indvars.iv.next5.5 to i32
  %34 = sitofp i32 %33 to double
  %35 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next5.5
  store double %34, double* %35, align 8
  %indvars.iv.next5.6 = add nsw i64 %indvars.iv410, 7
  %36 = trunc i64 %indvars.iv.next5.6 to i32
  %37 = sitofp i32 %36 to double
  %38 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next5.6
  store double %37, double* %38, align 8
  %indvars.iv.next5.7 = add nsw i64 %indvars.iv410, 8
  %exitcond17.7 = icmp eq i64 %indvars.iv.next5.7, %8
  br i1 %exitcond17.7, label %._crit_edge13.loopexit, label %.lr.ph12

._crit_edge13.loopexit:                           ; preds = %.lr.ph12
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %.lr.ph12.prol.loopexit, %7
  %39 = sext i32 %2 to i64
  %40 = sext i32 %1 to i64
  %41 = icmp sgt i32 %1, 0
  br i1 %41, label %.preheader.lr.ph, label %._crit_edge9

.preheader.lr.ph:                                 ; preds = %._crit_edge13
  %42 = icmp sgt i32 %2, 0
  %43 = sitofp i32 %1 to double
  %44 = sitofp i32 %2 to double
  br i1 %42, label %.preheader.us.preheader, label %._crit_edge9

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv27.us = phi i64 [ %indvars.iv.next3.us, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %45 = trunc i64 %indvars.iv27.us to i32
  %46 = sitofp i32 %45 to double
  br label %47

; <label>:47:                                     ; preds = %47, %.preheader.us
  %indvars.iv6.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %47 ]
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv6.us, 1
  %48 = trunc i64 %indvars.iv.next.us to i32
  %49 = sitofp i32 %48 to double
  %50 = fmul double %46, %49
  %51 = fdiv double %50, %43
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv27.us, i64 %indvars.iv6.us
  store double %51, double* %52, align 8
  %53 = add nuw nsw i64 %indvars.iv6.us, 2
  %54 = trunc i64 %53 to i32
  %55 = sitofp i32 %54 to double
  %56 = fmul double %46, %55
  %57 = fdiv double %56, %44
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv27.us, i64 %indvars.iv6.us
  store double %57, double* %58, align 8
  %59 = add nuw nsw i64 %indvars.iv6.us, 3
  %60 = trunc i64 %59 to i32
  %61 = sitofp i32 %60 to double
  %62 = fmul double %46, %61
  %63 = fdiv double %62, %43
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv27.us, i64 %indvars.iv6.us
  store double %63, double* %64, align 8
  %exitcond = icmp eq i64 %indvars.iv.next.us, %39
  br i1 %exitcond, label %._crit_edge.us, label %47

._crit_edge.us:                                   ; preds = %47
  %indvars.iv.next3.us = add nuw nsw i64 %indvars.iv27.us, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next3.us, %40
  br i1 %exitcond15, label %._crit_edge9.loopexit, label %.preheader.us

._crit_edge9.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit, %.preheader.lr.ph, %._crit_edge13
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_fdtd_2d(i32, i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture readonly) unnamed_addr #2 {
  %8 = sext i32 %2 to i64
  %9 = sext i32 %1 to i64
  %10 = sext i32 %0 to i64
  %11 = icmp sgt i32 %0, 0
  br i1 %11, label %.preheader24.lr.ph, label %._crit_edge42

.preheader24.lr.ph:                               ; preds = %7
  %12 = add nsw i32 %1, -1
  %13 = sext i32 %12 to i64
  %14 = add nsw i32 %2, -1
  %15 = sext i32 %14 to i64
  %16 = add nsw i64 %8, -1
  %17 = icmp sgt i32 %2, 0
  %xtraiter = and i64 %8, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %18 = icmp ult i64 %16, 7
  %sunkaddr62 = ptrtoint double* %6 to i64
  %xtraiter48 = and i64 %8, 1
  %lcmp.mod49 = icmp eq i64 %xtraiter48, 0
  %19 = icmp eq i64 %16, 0
  %xtraiter55 = and i64 %16, 1
  %lcmp.mod56 = icmp eq i64 %xtraiter55, 0
  %20 = icmp eq i32 %2, 2
  %21 = icmp sgt i64 %15, 1
  %smax = select i1 %21, i64 %15, i64 1
  %22 = icmp sgt i64 %15, 1
  %smax74 = select i1 %22, i64 %15, i64 1
  %23 = add nuw nsw i64 %smax74, 1
  %24 = add nsw i64 %8, -2
  %25 = add nsw i64 %8, -2
  %26 = add nsw i64 %8, -2
  %27 = add nsw i64 %8, -2
  %.not = icmp slt i32 %1, 2
  %.not66 = icmp slt i32 %2, 1
  %brmerge = or i1 %.not, %.not66
  %.not67 = icmp slt i32 %1, 1
  %.not68 = icmp slt i32 %2, 2
  %brmerge69 = or i1 %.not67, %.not68
  %brmerge72 = or i1 %.not, %.not68
  %min.iters.check = icmp ult i64 %smax, 4
  %n.vec = and i64 %smax, 9223372036854775804
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %smax, %n.vec
  br label %.preheader24

.preheader24:                                     ; preds = %._crit_edge40, %.preheader24.lr.ph
  %indvars.iv1741 = phi i64 [ 0, %.preheader24.lr.ph ], [ %indvars.iv.next18, %._crit_edge40 ]
  br i1 %17, label %.lr.ph, label %.preheader23

.lr.ph:                                           ; preds = %.preheader24
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  %sunkaddr59 = shl i64 %indvars.iv1741, 3
  %sunkaddr60 = add i64 %sunkaddr62, %sunkaddr59
  %sunkaddr61 = inttoptr i64 %sunkaddr60 to i64*
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv25.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %28 = load i64, i64* %sunkaddr61, align 8
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv25.prol
  %30 = bitcast double* %29 to i64*
  store i64 %28, i64* %30, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv25.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %indvars.iv25.unr = phi i64 [ 0, %.lr.ph ], [ %xtraiter, %.prol.loopexit.loopexit ]
  br i1 %18, label %.preheader23, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  %sunkaddr63 = shl i64 %indvars.iv1741, 3
  %sunkaddr64 = add i64 %sunkaddr62, %sunkaddr63
  %sunkaddr65 = inttoptr i64 %sunkaddr64 to i64*
  br label %.lr.ph.new

.preheader23.loopexit:                            ; preds = %.lr.ph.new
  br label %.preheader23

.preheader23:                                     ; preds = %.preheader23.loopexit, %.prol.loopexit, %.preheader24
  br i1 %brmerge, label %.preheader22, label %.preheader20.us.preheader

.preheader20.us.preheader:                        ; preds = %.preheader23
  br label %.preheader20.us

.preheader20.us:                                  ; preds = %.preheader20.us.preheader, %._crit_edge.us
  %indvar = phi i64 [ %indvar.next, %._crit_edge.us ], [ 0, %.preheader20.us.preheader ]
  %indvars.iv728.us = phi i64 [ %indvars.iv.next8.us, %._crit_edge.us ], [ 1, %.preheader20.us.preheader ]
  %31 = add i64 %indvar, 1
  %scevgep151 = getelementptr [1200 x double], [1200 x double]* %4, i64 %31, i64 2
  %scevgep157 = getelementptr [1200 x double], [1200 x double]* %5, i64 %31, i64 2
  %32 = add nsw i64 %indvars.iv728.us, -1
  br i1 %lcmp.mod49, label %.prol.loopexit47, label %.prol.preheader46

.prol.preheader46:                                ; preds = %.preheader20.us
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv728.us, i64 0
  %34 = load double, double* %33, align 8
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv728.us, i64 0
  %36 = load double, double* %35, align 8
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %32, i64 0
  %38 = load double, double* %37, align 8
  %39 = fsub double %36, %38
  %40 = fmul double %39, 5.000000e-01
  %41 = fsub double %34, %40
  store double %41, double* %33, align 8
  br label %.prol.loopexit47

.prol.loopexit47:                                 ; preds = %.prol.preheader46, %.preheader20.us
  %indvars.iv526.us.unr.ph = phi i64 [ 1, %.prol.preheader46 ], [ 0, %.preheader20.us ]
  br i1 %19, label %._crit_edge.us, label %.preheader20.us.new.preheader

.preheader20.us.new.preheader:                    ; preds = %.prol.loopexit47
  %42 = sub nsw i64 %26, %indvars.iv526.us.unr.ph
  %43 = lshr i64 %42, 1
  %44 = add nuw i64 %43, 1
  %min.iters.check142 = icmp ult i64 %44, 2
  br i1 %min.iters.check142, label %.preheader20.us.new.preheader186, label %min.iters.checked143

min.iters.checked143:                             ; preds = %.preheader20.us.new.preheader
  %n.mod.vf144 = and i64 %44, 1
  %n.vec145 = sub i64 %44, %n.mod.vf144
  %cmp.zero146 = icmp eq i64 %n.vec145, 0
  br i1 %cmp.zero146, label %.preheader20.us.new.preheader186, label %vector.memcheck164

vector.memcheck164:                               ; preds = %min.iters.checked143
  %scevgep149 = getelementptr [1200 x double], [1200 x double]* %4, i64 %31, i64 %indvars.iv526.us.unr.ph
  %45 = sub nsw i64 %27, %indvars.iv526.us.unr.ph
  %46 = and i64 %45, -2
  %47 = or i64 %indvars.iv526.us.unr.ph, %46
  %scevgep152 = getelementptr double, double* %scevgep151, i64 %47
  %scevgep155 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvar, i64 %indvars.iv526.us.unr.ph
  %scevgep158 = getelementptr double, double* %scevgep157, i64 %47
  %bound0160 = icmp ult double* %scevgep149, %scevgep158
  %bound1161 = icmp ult double* %scevgep155, %scevgep152
  %memcheck.conflict163 = and i1 %bound0160, %bound1161
  %48 = or i64 %indvars.iv526.us.unr.ph, 2
  %49 = shl nuw i64 %43, 1
  %50 = add i64 %48, %49
  %51 = shl nuw nsw i64 %n.mod.vf144, 1
  %ind.end169 = sub i64 %50, %51
  br i1 %memcheck.conflict163, label %.preheader20.us.new.preheader186, label %vector.body139.preheader

vector.body139.preheader:                         ; preds = %vector.memcheck164
  br label %vector.body139

vector.body139:                                   ; preds = %vector.body139.preheader, %vector.body139
  %index166 = phi i64 [ %index.next167, %vector.body139 ], [ 0, %vector.body139.preheader ]
  %52 = shl i64 %index166, 1
  %offset.idx171 = or i64 %indvars.iv526.us.unr.ph, %52
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv728.us, i64 %offset.idx171
  %54 = bitcast double* %53 to <4 x double>*
  %wide.vec175 = load <4 x double>, <4 x double>* %54, align 8, !alias.scope !4, !noalias !7
  %strided.vec176 = shufflevector <4 x double> %wide.vec175, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec177 = shufflevector <4 x double> %wide.vec175, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv728.us, i64 %offset.idx171
  %56 = bitcast double* %55 to <4 x double>*
  %wide.vec178 = load <4 x double>, <4 x double>* %56, align 8, !alias.scope !7
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %32, i64 %offset.idx171
  %58 = bitcast double* %57 to <4 x double>*
  %wide.vec181 = load <4 x double>, <4 x double>* %58, align 8, !alias.scope !7
  %59 = fsub <4 x double> %wide.vec178, %wide.vec181
  %60 = shufflevector <4 x double> %59, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %61 = fmul <2 x double> %60, <double 5.000000e-01, double 5.000000e-01>
  %62 = fsub <2 x double> %strided.vec176, %61
  %63 = add nuw nsw i64 %offset.idx171, 1
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv728.us, i64 %63
  %65 = fsub <4 x double> %wide.vec178, %wide.vec181
  %66 = shufflevector <4 x double> %65, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %67 = fmul <2 x double> %66, <double 5.000000e-01, double 5.000000e-01>
  %68 = fsub <2 x double> %strided.vec177, %67
  %69 = getelementptr double, double* %64, i64 -1
  %70 = bitcast double* %69 to <4 x double>*
  %interleaved.vec184 = shufflevector <2 x double> %62, <2 x double> %68, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec184, <4 x double>* %70, align 8, !alias.scope !4, !noalias !7
  %index.next167 = add i64 %index166, 2
  %71 = icmp eq i64 %index.next167, %n.vec145
  br i1 %71, label %middle.block140, label %vector.body139, !llvm.loop !9

middle.block140:                                  ; preds = %vector.body139
  %cmp.n170 = icmp eq i64 %n.mod.vf144, 0
  br i1 %cmp.n170, label %._crit_edge.us, label %.preheader20.us.new.preheader186

.preheader20.us.new.preheader186:                 ; preds = %middle.block140, %vector.memcheck164, %min.iters.checked143, %.preheader20.us.new.preheader
  %indvars.iv526.us.ph = phi i64 [ %indvars.iv526.us.unr.ph, %vector.memcheck164 ], [ %indvars.iv526.us.unr.ph, %min.iters.checked143 ], [ %indvars.iv526.us.unr.ph, %.preheader20.us.new.preheader ], [ %ind.end169, %middle.block140 ]
  br label %.preheader20.us.new

.preheader20.us.new:                              ; preds = %.preheader20.us.new.preheader186, %.preheader20.us.new
  %indvars.iv526.us = phi i64 [ %indvars.iv.next6.us.1, %.preheader20.us.new ], [ %indvars.iv526.us.ph, %.preheader20.us.new.preheader186 ]
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv728.us, i64 %indvars.iv526.us
  %73 = load double, double* %72, align 8
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv728.us, i64 %indvars.iv526.us
  %75 = load double, double* %74, align 8
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %32, i64 %indvars.iv526.us
  %77 = load double, double* %76, align 8
  %78 = fsub double %75, %77
  %79 = fmul double %78, 5.000000e-01
  %80 = fsub double %73, %79
  store double %80, double* %72, align 8
  %indvars.iv.next6.us = add nuw nsw i64 %indvars.iv526.us, 1
  %81 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv728.us, i64 %indvars.iv.next6.us
  %82 = load double, double* %81, align 8
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv728.us, i64 %indvars.iv.next6.us
  %84 = load double, double* %83, align 8
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %32, i64 %indvars.iv.next6.us
  %86 = load double, double* %85, align 8
  %87 = fsub double %84, %86
  %88 = fmul double %87, 5.000000e-01
  %89 = fsub double %82, %88
  store double %89, double* %81, align 8
  %indvars.iv.next6.us.1 = add nuw nsw i64 %indvars.iv526.us, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next6.us.1, %8
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader20.us.new, !llvm.loop !12

._crit_edge.us.loopexit:                          ; preds = %.preheader20.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block140, %.prol.loopexit47
  %indvars.iv.next8.us = add nuw nsw i64 %indvars.iv728.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next8.us, %9
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond, label %.preheader22.loopexit, label %.preheader20.us

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv25 = phi i64 [ %indvars.iv.next.7, %.lr.ph.new ], [ %indvars.iv25.unr, %.lr.ph.new.preheader ]
  %90 = load i64, i64* %sunkaddr65, align 8
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv25
  %92 = bitcast double* %91 to i64*
  store i64 %90, i64* %92, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv25, 1
  %93 = load i64, i64* %sunkaddr65, align 8
  %94 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next
  %95 = bitcast double* %94 to i64*
  store i64 %93, i64* %95, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv25, 2
  %96 = load i64, i64* %sunkaddr65, align 8
  %97 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.1
  %98 = bitcast double* %97 to i64*
  store i64 %96, i64* %98, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv25, 3
  %99 = load i64, i64* %sunkaddr65, align 8
  %100 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.2
  %101 = bitcast double* %100 to i64*
  store i64 %99, i64* %101, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv25, 4
  %102 = load i64, i64* %sunkaddr65, align 8
  %103 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.3
  %104 = bitcast double* %103 to i64*
  store i64 %102, i64* %104, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv25, 5
  %105 = load i64, i64* %sunkaddr65, align 8
  %106 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.4
  %107 = bitcast double* %106 to i64*
  store i64 %105, i64* %107, align 8
  %indvars.iv.next.5 = add nsw i64 %indvars.iv25, 6
  %108 = load i64, i64* %sunkaddr65, align 8
  %109 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.5
  %110 = bitcast double* %109 to i64*
  store i64 %108, i64* %110, align 8
  %indvars.iv.next.6 = add nsw i64 %indvars.iv25, 7
  %111 = load i64, i64* %sunkaddr65, align 8
  %112 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.6
  %113 = bitcast double* %112 to i64*
  store i64 %111, i64* %113, align 8
  %indvars.iv.next.7 = add nuw nsw i64 %indvars.iv25, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.7, %8
  br i1 %exitcond.7, label %.preheader23.loopexit, label %.lr.ph.new

.preheader22.loopexit:                            ; preds = %._crit_edge.us
  br label %.preheader22

.preheader22:                                     ; preds = %.preheader22.loopexit, %.preheader23
  br i1 %brmerge69, label %.preheader21, label %.preheader19.us.preheader

.preheader19.us.preheader:                        ; preds = %.preheader22
  br label %.preheader19.us

.preheader19.us:                                  ; preds = %.preheader19.us.preheader, %._crit_edge32.us
  %indvars.iv1133.us = phi i64 [ %indvars.iv.next12.us, %._crit_edge32.us ], [ 0, %.preheader19.us.preheader ]
  %scevgep110 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv1133.us, i64 2
  %scevgep113 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv1133.us, i64 -1
  %scevgep116 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv1133.us, i64 2
  br i1 %lcmp.mod56, label %.prol.loopexit54, label %.prol.preheader53

.prol.preheader53:                                ; preds = %.preheader19.us
  %114 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv1133.us, i64 1
  %115 = load double, double* %114, align 8
  %116 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv1133.us, i64 1
  %117 = load double, double* %116, align 8
  %118 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv1133.us, i64 0
  %119 = load double, double* %118, align 8
  %120 = fsub double %117, %119
  %121 = fmul double %120, 5.000000e-01
  %122 = fsub double %115, %121
  store double %122, double* %114, align 8
  br label %.prol.loopexit54

.prol.loopexit54:                                 ; preds = %.prol.preheader53, %.preheader19.us
  %indvars.iv930.us.unr.ph = phi i64 [ 2, %.prol.preheader53 ], [ 1, %.preheader19.us ]
  br i1 %20, label %._crit_edge32.us, label %.preheader19.us.new.preheader

.preheader19.us.new.preheader:                    ; preds = %.prol.loopexit54
  %123 = sub nsw i64 %24, %indvars.iv930.us.unr.ph
  %124 = lshr i64 %123, 1
  %125 = add nuw i64 %124, 1
  %min.iters.check101 = icmp ult i64 %125, 2
  br i1 %min.iters.check101, label %.preheader19.us.new.preheader185, label %min.iters.checked102

min.iters.checked102:                             ; preds = %.preheader19.us.new.preheader
  %n.mod.vf103 = and i64 %125, 1
  %n.vec104 = sub i64 %125, %n.mod.vf103
  %cmp.zero105 = icmp eq i64 %n.vec104, 0
  br i1 %cmp.zero105, label %.preheader19.us.new.preheader185, label %vector.memcheck123

vector.memcheck123:                               ; preds = %min.iters.checked102
  %scevgep108 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv1133.us, i64 %indvars.iv930.us.unr.ph
  %126 = sub nsw i64 %25, %indvars.iv930.us.unr.ph
  %127 = and i64 %126, -2
  %128 = add nsw i64 %indvars.iv930.us.unr.ph, %127
  %scevgep111 = getelementptr double, double* %scevgep110, i64 %128
  %scevgep114 = getelementptr double, double* %scevgep113, i64 %indvars.iv930.us.unr.ph
  %scevgep117 = getelementptr double, double* %scevgep116, i64 %128
  %bound0119 = icmp ult double* %scevgep108, %scevgep117
  %bound1120 = icmp ult double* %scevgep114, %scevgep111
  %memcheck.conflict122 = and i1 %bound0119, %bound1120
  %129 = add nuw nsw i64 %indvars.iv930.us.unr.ph, 2
  %130 = shl nuw i64 %124, 1
  %131 = add i64 %129, %130
  %132 = shl nuw nsw i64 %n.mod.vf103, 1
  %ind.end = sub i64 %131, %132
  br i1 %memcheck.conflict122, label %.preheader19.us.new.preheader185, label %vector.body98.preheader

vector.body98.preheader:                          ; preds = %vector.memcheck123
  br label %vector.body98

vector.body98:                                    ; preds = %vector.body98.preheader, %vector.body98
  %index125 = phi i64 [ %index.next126, %vector.body98 ], [ 0, %vector.body98.preheader ]
  %133 = shl i64 %index125, 1
  %offset.idx = or i64 %indvars.iv930.us.unr.ph, %133
  %134 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv1133.us, i64 %offset.idx
  %135 = bitcast double* %134 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %135, align 8, !alias.scope !13, !noalias !16
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec132 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %136 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv1133.us, i64 %offset.idx
  %137 = getelementptr double, double* %136, i64 -1
  %138 = bitcast double* %137 to <4 x double>*
  %wide.vec133 = load <4 x double>, <4 x double>* %138, align 8, !alias.scope !16
  %strided.vec134 = shufflevector <4 x double> %wide.vec133, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec135 = shufflevector <4 x double> %wide.vec133, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %139 = fsub <2 x double> %strided.vec135, %strided.vec134
  %140 = fmul <2 x double> %139, <double 5.000000e-01, double 5.000000e-01>
  %141 = fsub <2 x double> %strided.vec, %140
  %142 = add nuw nsw i64 %offset.idx, 1
  %143 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv1133.us, i64 %142
  %144 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv1133.us, i64 %142
  %145 = getelementptr double, double* %144, i64 -1
  %146 = bitcast double* %145 to <4 x double>*
  %wide.vec136 = load <4 x double>, <4 x double>* %146, align 8, !alias.scope !16
  %strided.vec137 = shufflevector <4 x double> %wide.vec136, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec138 = shufflevector <4 x double> %wide.vec136, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %147 = fsub <2 x double> %strided.vec138, %strided.vec137
  %148 = fmul <2 x double> %147, <double 5.000000e-01, double 5.000000e-01>
  %149 = fsub <2 x double> %strided.vec132, %148
  %150 = getelementptr double, double* %143, i64 -1
  %151 = bitcast double* %150 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %141, <2 x double> %149, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %151, align 8, !alias.scope !13, !noalias !16
  %index.next126 = add i64 %index125, 2
  %152 = icmp eq i64 %index.next126, %n.vec104
  br i1 %152, label %middle.block99, label %vector.body98, !llvm.loop !18

middle.block99:                                   ; preds = %vector.body98
  %cmp.n128 = icmp eq i64 %n.mod.vf103, 0
  br i1 %cmp.n128, label %._crit_edge32.us, label %.preheader19.us.new.preheader185

.preheader19.us.new.preheader185:                 ; preds = %middle.block99, %vector.memcheck123, %min.iters.checked102, %.preheader19.us.new.preheader
  %indvars.iv930.us.ph = phi i64 [ %indvars.iv930.us.unr.ph, %vector.memcheck123 ], [ %indvars.iv930.us.unr.ph, %min.iters.checked102 ], [ %indvars.iv930.us.unr.ph, %.preheader19.us.new.preheader ], [ %ind.end, %middle.block99 ]
  br label %.preheader19.us.new

.preheader19.us.new:                              ; preds = %.preheader19.us.new.preheader185, %.preheader19.us.new
  %indvars.iv930.us = phi i64 [ %indvars.iv.next10.us.1, %.preheader19.us.new ], [ %indvars.iv930.us.ph, %.preheader19.us.new.preheader185 ]
  %153 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv1133.us, i64 %indvars.iv930.us
  %154 = load double, double* %153, align 8
  %155 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv1133.us, i64 %indvars.iv930.us
  %156 = load double, double* %155, align 8
  %157 = add nsw i64 %indvars.iv930.us, -1
  %158 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv1133.us, i64 %157
  %159 = load double, double* %158, align 8
  %160 = fsub double %156, %159
  %161 = fmul double %160, 5.000000e-01
  %162 = fsub double %154, %161
  store double %162, double* %153, align 8
  %indvars.iv.next10.us = add nuw nsw i64 %indvars.iv930.us, 1
  %163 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv1133.us, i64 %indvars.iv.next10.us
  %164 = load double, double* %163, align 8
  %165 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv1133.us, i64 %indvars.iv.next10.us
  %166 = load double, double* %165, align 8
  %167 = load double, double* %155, align 8
  %168 = fsub double %166, %167
  %169 = fmul double %168, 5.000000e-01
  %170 = fsub double %164, %169
  store double %170, double* %163, align 8
  %indvars.iv.next10.us.1 = add nsw i64 %indvars.iv930.us, 2
  %exitcond52.1 = icmp eq i64 %indvars.iv.next10.us.1, %8
  br i1 %exitcond52.1, label %._crit_edge32.us.loopexit, label %.preheader19.us.new, !llvm.loop !19

._crit_edge32.us.loopexit:                        ; preds = %.preheader19.us.new
  br label %._crit_edge32.us

._crit_edge32.us:                                 ; preds = %._crit_edge32.us.loopexit, %middle.block99, %.prol.loopexit54
  %indvars.iv.next12.us = add nuw nsw i64 %indvars.iv1133.us, 1
  %exitcond57 = icmp eq i64 %indvars.iv.next12.us, %9
  br i1 %exitcond57, label %.preheader21.loopexit, label %.preheader19.us

.preheader21.loopexit:                            ; preds = %._crit_edge32.us
  br label %.preheader21

.preheader21:                                     ; preds = %.preheader21.loopexit, %.preheader22
  br i1 %brmerge72, label %._crit_edge40, label %.preheader.us.preheader

.preheader.us.preheader:                          ; preds = %.preheader21
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge37.us
  %indvars.iv1538.us = phi i64 [ %172, %._crit_edge37.us ], [ 0, %.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv1538.us, i64 0
  %scevgep75 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv1538.us, i64 %smax74
  %scevgep77 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv1538.us, i64 0
  %scevgep79 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv1538.us, i64 %23
  %scevgep81 = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv1538.us, i64 0
  %171 = add i64 %indvars.iv1538.us, 1
  %scevgep83 = getelementptr [1200 x double], [1200 x double]* %4, i64 %171, i64 %smax74
  %172 = add nuw nsw i64 %indvars.iv1538.us, 1
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep79
  %bound1 = icmp ult double* %scevgep77, %scevgep75
  %found.conflict = and i1 %bound0, %bound1
  %bound085 = icmp ult double* %scevgep, %scevgep83
  %bound186 = icmp ult double* %scevgep81, %scevgep75
  %found.conflict87 = and i1 %bound085, %bound186
  %conflict.rdx = or i1 %found.conflict, %found.conflict87
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %173 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv1538.us, i64 %index
  %174 = bitcast double* %173 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %174, align 8, !alias.scope !20, !noalias !23
  %175 = getelementptr double, double* %173, i64 2
  %176 = bitcast double* %175 to <2 x double>*
  %wide.load89 = load <2 x double>, <2 x double>* %176, align 8, !alias.scope !20, !noalias !23
  %177 = or i64 %index, 1
  %178 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv1538.us, i64 %177
  %179 = bitcast double* %178 to <2 x double>*
  %wide.load90 = load <2 x double>, <2 x double>* %179, align 8, !alias.scope !26
  %180 = getelementptr double, double* %178, i64 2
  %181 = bitcast double* %180 to <2 x double>*
  %wide.load91 = load <2 x double>, <2 x double>* %181, align 8, !alias.scope !26
  %182 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv1538.us, i64 %index
  %183 = bitcast double* %182 to <2 x double>*
  %wide.load92 = load <2 x double>, <2 x double>* %183, align 8, !alias.scope !26
  %184 = getelementptr double, double* %182, i64 2
  %185 = bitcast double* %184 to <2 x double>*
  %wide.load93 = load <2 x double>, <2 x double>* %185, align 8, !alias.scope !26
  %186 = fsub <2 x double> %wide.load90, %wide.load92
  %187 = fsub <2 x double> %wide.load91, %wide.load93
  %188 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %172, i64 %index
  %189 = bitcast double* %188 to <2 x double>*
  %wide.load94 = load <2 x double>, <2 x double>* %189, align 8, !alias.scope !27
  %190 = getelementptr double, double* %188, i64 2
  %191 = bitcast double* %190 to <2 x double>*
  %wide.load95 = load <2 x double>, <2 x double>* %191, align 8, !alias.scope !27
  %192 = fadd <2 x double> %186, %wide.load94
  %193 = fadd <2 x double> %187, %wide.load95
  %194 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1538.us, i64 %index
  %195 = bitcast double* %194 to <2 x double>*
  %wide.load96 = load <2 x double>, <2 x double>* %195, align 8, !alias.scope !27
  %196 = getelementptr double, double* %194, i64 2
  %197 = bitcast double* %196 to <2 x double>*
  %wide.load97 = load <2 x double>, <2 x double>* %197, align 8, !alias.scope !27
  %198 = fsub <2 x double> %192, %wide.load96
  %199 = fsub <2 x double> %193, %wide.load97
  %200 = fmul <2 x double> %198, <double 7.000000e-01, double 7.000000e-01>
  %201 = fmul <2 x double> %199, <double 7.000000e-01, double 7.000000e-01>
  %202 = fsub <2 x double> %wide.load, %200
  %203 = fsub <2 x double> %wide.load89, %201
  %204 = bitcast double* %173 to <2 x double>*
  store <2 x double> %202, <2 x double>* %204, align 8, !alias.scope !20, !noalias !23
  %205 = bitcast double* %175 to <2 x double>*
  store <2 x double> %203, <2 x double>* %205, align 8, !alias.scope !20, !noalias !23
  %index.next = add i64 %index, 4
  %206 = icmp eq i64 %index.next, %n.vec
  br i1 %206, label %middle.block, label %vector.body, !llvm.loop !28

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge37.us, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us
  %indvars.iv1335.us.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader.us ], [ %n.vec, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv1335.us = phi i64 [ %indvars.iv.next14.us, %scalar.ph ], [ %indvars.iv1335.us.ph, %scalar.ph.preheader ]
  %207 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv1538.us, i64 %indvars.iv1335.us
  %208 = load double, double* %207, align 8
  %indvars.iv.next14.us = add nuw nsw i64 %indvars.iv1335.us, 1
  %209 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv1538.us, i64 %indvars.iv.next14.us
  %210 = load double, double* %209, align 8
  %211 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv1538.us, i64 %indvars.iv1335.us
  %212 = load double, double* %211, align 8
  %213 = fsub double %210, %212
  %214 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %172, i64 %indvars.iv1335.us
  %215 = load double, double* %214, align 8
  %216 = fadd double %213, %215
  %217 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1538.us, i64 %indvars.iv1335.us
  %218 = load double, double* %217, align 8
  %219 = fsub double %216, %218
  %220 = fmul double %219, 7.000000e-01
  %221 = fsub double %208, %220
  store double %221, double* %207, align 8
  %222 = icmp slt i64 %indvars.iv.next14.us, %15
  br i1 %222, label %scalar.ph, label %._crit_edge37.us.loopexit, !llvm.loop !29

._crit_edge37.us.loopexit:                        ; preds = %scalar.ph
  br label %._crit_edge37.us

._crit_edge37.us:                                 ; preds = %._crit_edge37.us.loopexit, %middle.block
  %223 = icmp slt i64 %172, %13
  br i1 %223, label %.preheader.us, label %._crit_edge40.loopexit

._crit_edge40.loopexit:                           ; preds = %._crit_edge37.us
  br label %._crit_edge40

._crit_edge40:                                    ; preds = %._crit_edge40.loopexit, %.preheader21
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv1741, 1
  %exitcond58 = icmp eq i64 %indvars.iv.next18, %10
  br i1 %exitcond58, label %._crit_edge42.loopexit, label %.preheader24

._crit_edge42.loopexit:                           ; preds = %._crit_edge40
  br label %._crit_edge42

._crit_edge42:                                    ; preds = %._crit_edge42.loopexit, %7
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %6) #5
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %10 = sext i32 %1 to i64
  %11 = sext i32 %0 to i64
  %12 = icmp sgt i32 %0, 0
  %13 = icmp sgt i32 %1, 0
  %or.cond = and i1 %12, %13
  br i1 %or.cond, label %.preheader21.us.preheader, label %._crit_edge31.critedge

.preheader21.us.preheader:                        ; preds = %5
  br label %.preheader21.us

.preheader21.us:                                  ; preds = %.preheader21.us.preheader, %._crit_edge34.us
  %indvars.iv1235.us = phi i64 [ %indvars.iv.next13.us, %._crit_edge34.us ], [ 0, %.preheader21.us.preheader ]
  %14 = mul nsw i64 %indvars.iv1235.us, %11
  br label %15

; <label>:15:                                     ; preds = %22, %.preheader21.us
  %indvars.iv1032.us = phi i64 [ 0, %.preheader21.us ], [ %indvars.iv.next11.us, %22 ]
  %16 = add nsw i64 %indvars.iv1032.us, %14
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, 20
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %22

; <label>:20:                                     ; preds = %15
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc19.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %21) #5
  br label %22

; <label>:22:                                     ; preds = %20, %15
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1235.us, i64 %indvars.iv1032.us
  %25 = load double, double* %24, align 8
  %26 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %25) #5
  %indvars.iv.next11.us = add nuw nsw i64 %indvars.iv1032.us, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next11.us, %10
  br i1 %exitcond46, label %._crit_edge34.us, label %15

._crit_edge34.us:                                 ; preds = %22
  %indvars.iv.next13.us = add nuw nsw i64 %indvars.iv1235.us, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next13.us, %11
  br i1 %exitcond47, label %._crit_edge37, label %.preheader21.us

._crit_edge37:                                    ; preds = %._crit_edge34.us
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %30 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %29) #5
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  br i1 %or.cond, label %.preheader20.us.preheader, label %._crit_edge25.critedge

.preheader20.us.preheader:                        ; preds = %._crit_edge37
  br label %.preheader20.us

.preheader20.us:                                  ; preds = %.preheader20.us.preheader, %._crit_edge28.us
  %indvars.iv829.us = phi i64 [ %indvars.iv.next9.us, %._crit_edge28.us ], [ 0, %.preheader20.us.preheader ]
  %33 = mul nsw i64 %indvars.iv829.us, %11
  br label %34

; <label>:34:                                     ; preds = %41, %.preheader20.us
  %indvars.iv626.us = phi i64 [ 0, %.preheader20.us ], [ %indvars.iv.next7.us, %41 ]
  %35 = add nsw i64 %indvars.iv626.us, %33
  %36 = trunc i64 %35 to i32
  %37 = srem i32 %36, 20
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %39, label %41

; <label>:39:                                     ; preds = %34
  %40 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc16.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %40) #5
  br label %41

; <label>:41:                                     ; preds = %39, %34
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv829.us, i64 %indvars.iv626.us
  %44 = load double, double* %43, align 8
  %45 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %42, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %44) #5
  %indvars.iv.next7.us = add nuw nsw i64 %indvars.iv626.us, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next7.us, %10
  br i1 %exitcond43, label %._crit_edge28.us, label %34

._crit_edge28.us:                                 ; preds = %41
  %indvars.iv.next9.us = add nuw nsw i64 %indvars.iv829.us, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next9.us, %11
  br i1 %exitcond44, label %._crit_edge31.loopexit, label %.preheader20.us

._crit_edge31.critedge:                           ; preds = %5
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %47 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %46, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %48 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %49 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %48) #5
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %51 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %50, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  br label %._crit_edge31

._crit_edge31.loopexit:                           ; preds = %._crit_edge28.us
  br label %._crit_edge31

._crit_edge31:                                    ; preds = %._crit_edge31.loopexit, %._crit_edge31.critedge
  %52 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %53 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %52, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  %54 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %55 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %54, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge25

.preheader.us.preheader:                          ; preds = %._crit_edge31
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv423.us = phi i64 [ %indvars.iv.next5.us, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %56 = mul nsw i64 %indvars.iv423.us, %11
  br label %57

; <label>:57:                                     ; preds = %64, %.preheader.us
  %indvars.iv22.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %64 ]
  %58 = add nsw i64 %indvars.iv22.us, %56
  %59 = trunc i64 %58 to i32
  %60 = srem i32 %59, 20
  %61 = icmp eq i32 %60, 0
  br i1 %61, label %62, label %64

; <label>:62:                                     ; preds = %57
  %63 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %63) #5
  br label %64

; <label>:64:                                     ; preds = %62, %57
  %65 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv423.us, i64 %indvars.iv22.us
  %67 = load double, double* %66, align 8
  %68 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %65, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %67) #5
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv22.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us, %10
  br i1 %exitcond, label %._crit_edge.us, label %57

._crit_edge.us:                                   ; preds = %64
  %indvars.iv.next5.us = add nuw nsw i64 %indvars.iv423.us, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next5.us, %11
  br i1 %exitcond41, label %._crit_edge25.loopexit, label %.preheader.us

._crit_edge25.critedge:                           ; preds = %._crit_edge37
  %69 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %70 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %69, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  %71 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %72 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %71, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
  br label %._crit_edge25

._crit_edge25.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge25

._crit_edge25:                                    ; preds = %._crit_edge25.loopexit, %._crit_edge25.critedge, %._crit_edge31
  %73 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %74 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %73, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
!4 = !{!5}
!5 = distinct !{!5, !6}
!6 = distinct !{!6, !"LVerDomain"}
!7 = !{!8}
!8 = distinct !{!8, !6}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.vectorize.width", i32 1}
!11 = !{!"llvm.loop.interleave.count", i32 1}
!12 = distinct !{!12, !10, !11}
!13 = !{!14}
!14 = distinct !{!14, !15}
!15 = distinct !{!15, !"LVerDomain"}
!16 = !{!17}
!17 = distinct !{!17, !15}
!18 = distinct !{!18, !10, !11}
!19 = distinct !{!19, !10, !11}
!20 = !{!21}
!21 = distinct !{!21, !22}
!22 = distinct !{!22, !"LVerDomain"}
!23 = !{!24, !25}
!24 = distinct !{!24, !22}
!25 = distinct !{!25, !22}
!26 = !{!24}
!27 = !{!25}
!28 = distinct !{!28, !10, !11}
!29 = distinct !{!29, !10, !11}
