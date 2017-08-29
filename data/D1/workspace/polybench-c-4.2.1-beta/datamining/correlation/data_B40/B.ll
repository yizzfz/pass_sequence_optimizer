; ModuleID = 'A.ll'
source_filename = "correlation.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"corr\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %8 = bitcast i8* %4 to [1200 x double]*
  call fastcc void @init_array(double* nonnull %3, [1200 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = bitcast i8* %5 to [1200 x double]*
  %11 = bitcast i8* %6 to double*
  %12 = bitcast i8* %7 to double*
  tail call fastcc void @kernel_correlation(i32 1200, i32 1400, double %9, [1200 x double]* %8, [1200 x double]* %10, double* %11, double* %12)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.400000e+03, double* %0, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %19, %2
  %indvars.iv8 = phi i64 [ 0, %2 ], [ %indvars.iv.next9, %19 ]
  %3 = trunc i64 %indvars.iv8 to i32
  %4 = sitofp i32 %3 to double
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge1, %._crit_edge
  %indvars.iv = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next.1, %._crit_edge1 ]
  %7 = mul nuw nsw i64 %indvars.iv, %indvars.iv8
  %8 = trunc i64 %7 to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv8, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %11 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv8
  %12 = trunc i64 %11 to i32
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %9, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fdiv <2 x double> %15, <double 1.200000e+03, double 1.200000e+03>
  %17 = fadd <2 x double> %6, %16
  %18 = bitcast double* %10 to <2 x double>*
  store <2 x double> %17, <2 x double>* %18, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %19, label %._crit_edge1

; <label>:19:                                     ; preds = %._crit_edge1
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next9, 1400
  br i1 %exitcond10, label %20, label %._crit_edge

; <label>:20:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(i32, i32, double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph141, label %._crit_edge104

.lr.ph141:                                        ; preds = %7
  %9 = icmp sgt i32 %1, 0
  %sunkaddr92 = ptrtoint double* %5 to i64
  br i1 %9, label %.lr.ph141.split.us.preheader, label %.lr.ph141.split.preheader

.lr.ph141.split.preheader:                        ; preds = %.lr.ph141
  %xtraiter212 = and i32 %0, 1
  %lcmp.mod213 = icmp eq i32 %xtraiter212, 0
  br i1 %lcmp.mod213, label %.lr.ph141.split.prol.loopexit, label %.lr.ph141.split.prol

.lr.ph141.split.prol:                             ; preds = %.lr.ph141.split.preheader
  %10 = fdiv double 0.000000e+00, %2
  store double %10, double* %5, align 8
  br label %.lr.ph141.split.prol.loopexit

.lr.ph141.split.prol.loopexit:                    ; preds = %.lr.ph141.split.preheader, %.lr.ph141.split.prol
  %indvars.iv195.unr = phi i64 [ 1, %.lr.ph141.split.prol ], [ 0, %.lr.ph141.split.preheader ]
  %11 = icmp eq i32 %0, 1
  br i1 %11, label %.lr.ph134, label %.lr.ph141.split.preheader218

.lr.ph141.split.preheader218:                     ; preds = %.lr.ph141.split.prol.loopexit
  %wide.trip.count197.1 = zext i32 %0 to i64
  br label %.lr.ph141.split

.lr.ph141.split.us.preheader:                     ; preds = %.lr.ph141
  %12 = add i32 %1, -1
  %xtraiter209 = and i32 %1, 3
  %lcmp.mod210 = icmp eq i32 %xtraiter209, 0
  %13 = icmp ult i32 %12, 3
  %wide.trip.count193 = zext i32 %0 to i64
  %wide.trip.count189.3 = zext i32 %1 to i64
  %14 = add nsw i32 %xtraiter209, -1
  %15 = zext i32 %14 to i64
  %16 = add nuw nsw i64 %15, 1
  br label %.lr.ph141.split.us

.lr.ph141.split.us:                               ; preds = %._crit_edge138.us, %.lr.ph141.split.us.preheader
  %indvars.iv191 = phi i64 [ 0, %.lr.ph141.split.us.preheader ], [ %indvars.iv.next192, %._crit_edge138.us ]
  %17 = getelementptr inbounds double, double* %5, i64 %indvars.iv191
  store double 0.000000e+00, double* %17, align 8
  %sunkaddr89.us = shl nsw i64 %indvars.iv191, 3
  %sunkaddr90.us = add i64 %sunkaddr89.us, %sunkaddr92
  %sunkaddr91.us = inttoptr i64 %sunkaddr90.us to double*
  %.pre221.pre = load double, double* %sunkaddr91.us, align 8
  br i1 %lcmp.mod210, label %.prol.loopexit208, label %.prol.preheader207.preheader

.prol.preheader207.preheader:                     ; preds = %.lr.ph141.split.us
  br label %.prol.preheader207

.prol.preheader207:                               ; preds = %.prol.preheader207.preheader, %.prol.preheader207..prol.preheader207_crit_edge
  %18 = phi double [ %21, %.prol.preheader207..prol.preheader207_crit_edge ], [ %.pre221.pre, %.prol.preheader207.preheader ]
  %indvars.iv187.prol = phi i64 [ %indvars.iv.next188.prol, %.prol.preheader207..prol.preheader207_crit_edge ], [ 0, %.prol.preheader207.preheader ]
  %prol.iter211 = phi i32 [ %prol.iter211.sub, %.prol.preheader207..prol.preheader207_crit_edge ], [ %xtraiter209, %.prol.preheader207.preheader ]
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv187.prol, i64 %indvars.iv191
  %20 = load double, double* %19, align 8
  %21 = fadd double %20, %18
  store double %21, double* %sunkaddr91.us, align 8
  %prol.iter211.sub = add nsw i32 %prol.iter211, -1
  %prol.iter211.cmp = icmp eq i32 %prol.iter211.sub, 0
  br i1 %prol.iter211.cmp, label %.prol.loopexit208.loopexit, label %.prol.preheader207..prol.preheader207_crit_edge, !llvm.loop !1

.prol.preheader207..prol.preheader207_crit_edge:  ; preds = %.prol.preheader207
  %indvars.iv.next188.prol = add nuw nsw i64 %indvars.iv187.prol, 1
  br label %.prol.preheader207

.prol.loopexit208.loopexit:                       ; preds = %.prol.preheader207
  br label %.prol.loopexit208

.prol.loopexit208:                                ; preds = %.prol.loopexit208.loopexit, %.lr.ph141.split.us
  %.pre221 = phi double [ %.pre221.pre, %.lr.ph141.split.us ], [ %21, %.prol.loopexit208.loopexit ]
  %indvars.iv187.unr = phi i64 [ 0, %.lr.ph141.split.us ], [ %16, %.prol.loopexit208.loopexit ]
  br i1 %13, label %._crit_edge138.us, label %.lr.ph141.split.us.new.preheader

.lr.ph141.split.us.new.preheader:                 ; preds = %.prol.loopexit208
  br label %.lr.ph141.split.us.new

.lr.ph141.split.us.new:                           ; preds = %.lr.ph141.split.us.new.preheader, %.lr.ph141.split.us.new
  %22 = phi double [ %34, %.lr.ph141.split.us.new ], [ %.pre221, %.lr.ph141.split.us.new.preheader ]
  %indvars.iv187 = phi i64 [ %indvars.iv.next188.3, %.lr.ph141.split.us.new ], [ %indvars.iv187.unr, %.lr.ph141.split.us.new.preheader ]
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv187, i64 %indvars.iv191
  %24 = load double, double* %23, align 8
  %25 = fadd double %24, %22
  store double %25, double* %sunkaddr91.us, align 8
  %indvars.iv.next188 = add nuw nsw i64 %indvars.iv187, 1
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next188, i64 %indvars.iv191
  %27 = load double, double* %26, align 8
  %28 = fadd double %27, %25
  store double %28, double* %sunkaddr91.us, align 8
  %indvars.iv.next188.1 = add nsw i64 %indvars.iv187, 2
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next188.1, i64 %indvars.iv191
  %30 = load double, double* %29, align 8
  %31 = fadd double %30, %28
  store double %31, double* %sunkaddr91.us, align 8
  %indvars.iv.next188.2 = add nsw i64 %indvars.iv187, 3
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next188.2, i64 %indvars.iv191
  %33 = load double, double* %32, align 8
  %34 = fadd double %33, %31
  store double %34, double* %sunkaddr91.us, align 8
  %indvars.iv.next188.3 = add nsw i64 %indvars.iv187, 4
  %exitcond190.3 = icmp eq i64 %indvars.iv.next188.3, %wide.trip.count189.3
  br i1 %exitcond190.3, label %._crit_edge138.us.loopexit, label %.lr.ph141.split.us.new

._crit_edge138.us.loopexit:                       ; preds = %.lr.ph141.split.us.new
  br label %._crit_edge138.us

._crit_edge138.us:                                ; preds = %._crit_edge138.us.loopexit, %.prol.loopexit208
  %35 = phi double [ %.pre221, %.prol.loopexit208 ], [ %34, %._crit_edge138.us.loopexit ]
  %36 = fdiv double %35, %2
  store double %36, double* %sunkaddr91.us, align 8
  %indvars.iv.next192 = add nuw nsw i64 %indvars.iv191, 1
  %exitcond194 = icmp eq i64 %indvars.iv.next192, %wide.trip.count193
  br i1 %exitcond194, label %.lr.ph134.loopexit, label %.lr.ph141.split.us

.lr.ph134.loopexit:                               ; preds = %._crit_edge138.us
  br label %.lr.ph134

.lr.ph134.loopexit245:                            ; preds = %.lr.ph141.split
  br label %.lr.ph134

.lr.ph134:                                        ; preds = %.lr.ph134.loopexit245, %.lr.ph134.loopexit, %.lr.ph141.split.prol.loopexit
  %sunkaddr100 = ptrtoint double* %6 to i64
  br i1 %9, label %.lr.ph134.split.us.preheader, label %.lr.ph134.split.preheader

.lr.ph134.split.preheader:                        ; preds = %.lr.ph134
  %wide.trip.count185 = zext i32 %0 to i64
  br label %.lr.ph134.split

.lr.ph134.split.us.preheader:                     ; preds = %.lr.ph134
  %xtraiter205 = and i32 %1, 1
  %lcmp.mod206 = icmp eq i32 %xtraiter205, 0
  %37 = icmp eq i32 %1, 1
  %wide.trip.count181 = zext i32 %0 to i64
  %wide.trip.count177.1 = zext i32 %1 to i64
  br label %.lr.ph134.split.us

.lr.ph134.split.us:                               ; preds = %._crit_edge132.us, %.lr.ph134.split.us.preheader
  %indvars.iv179 = phi i64 [ 0, %.lr.ph134.split.us.preheader ], [ %indvars.iv.next180, %._crit_edge132.us ]
  %38 = getelementptr inbounds double, double* %6, i64 %indvars.iv179
  store double 0.000000e+00, double* %38, align 8
  %39 = getelementptr inbounds double, double* %5, i64 %indvars.iv179
  %sunkaddr97.us = shl nsw i64 %indvars.iv179, 3
  %sunkaddr98.us = add i64 %sunkaddr97.us, %sunkaddr100
  %sunkaddr99.us = inttoptr i64 %sunkaddr98.us to double*
  br i1 %lcmp.mod206, label %.lr.ph134.split.us..prol.loopexit204_crit_edge, label %.prol.preheader203

.lr.ph134.split.us..prol.loopexit204_crit_edge:   ; preds = %.lr.ph134.split.us
  %.pre223.pre = load double, double* %sunkaddr99.us, align 8
  br label %.prol.loopexit204

.prol.preheader203:                               ; preds = %.lr.ph134.split.us
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv179
  %41 = load double, double* %40, align 8
  %42 = load double, double* %39, align 8
  %43 = fsub double %41, %42
  %44 = fmul double %43, %43
  %45 = load double, double* %sunkaddr99.us, align 8
  %46 = fadd double %45, %44
  store double %46, double* %sunkaddr99.us, align 8
  br label %.prol.loopexit204

.prol.loopexit204:                                ; preds = %.lr.ph134.split.us..prol.loopexit204_crit_edge, %.prol.preheader203
  %.pre223 = phi double [ %46, %.prol.preheader203 ], [ %.pre223.pre, %.lr.ph134.split.us..prol.loopexit204_crit_edge ]
  %indvars.iv175.unr.ph = phi i64 [ 1, %.prol.preheader203 ], [ 0, %.lr.ph134.split.us..prol.loopexit204_crit_edge ]
  br i1 %37, label %._crit_edge132.us, label %.lr.ph134.split.us.new.preheader

.lr.ph134.split.us.new.preheader:                 ; preds = %.prol.loopexit204
  br label %.lr.ph134.split.us.new

.lr.ph134.split.us.new:                           ; preds = %.lr.ph134.split.us.new.preheader, %.lr.ph134.split.us.new
  %47 = phi double [ %59, %.lr.ph134.split.us.new ], [ %.pre223, %.lr.ph134.split.us.new.preheader ]
  %indvars.iv175 = phi i64 [ %indvars.iv.next176.1, %.lr.ph134.split.us.new ], [ %indvars.iv175.unr.ph, %.lr.ph134.split.us.new.preheader ]
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv175, i64 %indvars.iv179
  %49 = load double, double* %48, align 8
  %50 = load double, double* %39, align 8
  %51 = fsub double %49, %50
  %52 = fmul double %51, %51
  %53 = fadd double %47, %52
  store double %53, double* %sunkaddr99.us, align 8
  %indvars.iv.next176 = add nuw nsw i64 %indvars.iv175, 1
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next176, i64 %indvars.iv179
  %55 = load double, double* %54, align 8
  %56 = load double, double* %39, align 8
  %57 = fsub double %55, %56
  %58 = fmul double %57, %57
  %59 = fadd double %53, %58
  store double %59, double* %sunkaddr99.us, align 8
  %indvars.iv.next176.1 = add nuw nsw i64 %indvars.iv175, 2
  %exitcond178.1 = icmp eq i64 %indvars.iv.next176.1, %wide.trip.count177.1
  br i1 %exitcond178.1, label %._crit_edge132.us.loopexit, label %.lr.ph134.split.us.new

._crit_edge132.us.loopexit:                       ; preds = %.lr.ph134.split.us.new
  br label %._crit_edge132.us

._crit_edge132.us:                                ; preds = %._crit_edge132.us.loopexit, %.prol.loopexit204
  %60 = phi double [ %.pre223, %.prol.loopexit204 ], [ %59, %._crit_edge132.us.loopexit ]
  %61 = fdiv double %60, %2
  store double %61, double* %sunkaddr99.us, align 8
  %62 = tail call double @sqrt(double %61) #4
  %63 = fcmp ugt double %62, 1.000000e-01
  %64 = select i1 %63, double %62, double 1.000000e+00
  store double %64, double* %sunkaddr99.us, align 8
  %indvars.iv.next180 = add nuw nsw i64 %indvars.iv179, 1
  %exitcond182 = icmp eq i64 %indvars.iv.next180, %wide.trip.count181
  br i1 %exitcond182, label %._crit_edge104.loopexit, label %.lr.ph134.split.us

.lr.ph141.split:                                  ; preds = %.lr.ph141.split, %.lr.ph141.split.preheader218
  %indvars.iv195 = phi i64 [ %indvars.iv195.unr, %.lr.ph141.split.preheader218 ], [ %indvars.iv.next196.1, %.lr.ph141.split ]
  %65 = getelementptr inbounds double, double* %5, i64 %indvars.iv195
  %66 = bitcast double* %65 to <2 x double>*
  %sunkaddr93 = shl i64 %indvars.iv195, 3
  %sunkaddr94 = add i64 %sunkaddr93, %sunkaddr92
  %sunkaddr95 = inttoptr i64 %sunkaddr94 to double*
  store <2 x double> zeroinitializer, <2 x double>* %66, align 8
  %67 = load double, double* %sunkaddr95, align 8
  %68 = fdiv double %67, %2
  store double %68, double* %sunkaddr95, align 8
  %sunkaddr93.1 = add i64 %sunkaddr93, 8
  %sunkaddr94.1 = add i64 %sunkaddr93.1, %sunkaddr92
  %sunkaddr95.1 = inttoptr i64 %sunkaddr94.1 to double*
  %69 = load double, double* %sunkaddr95.1, align 8
  %70 = fdiv double %69, %2
  store double %70, double* %sunkaddr95.1, align 8
  %indvars.iv.next196.1 = add nuw nsw i64 %indvars.iv195, 2
  %exitcond198.1 = icmp eq i64 %indvars.iv.next196.1, %wide.trip.count197.1
  br i1 %exitcond198.1, label %.lr.ph134.loopexit245, label %.lr.ph141.split

._crit_edge104.loopexit:                          ; preds = %._crit_edge132.us
  br label %._crit_edge104

._crit_edge104.loopexit244:                       ; preds = %.lr.ph134.split
  br label %._crit_edge104

._crit_edge104:                                   ; preds = %._crit_edge104.loopexit244, %._crit_edge104.loopexit, %7
  %71 = icmp sgt i32 %1, 0
  br i1 %71, label %._crit_edge105.lr.ph, label %._crit_edge106

._crit_edge105.lr.ph:                             ; preds = %._crit_edge104
  br i1 %8, label %._crit_edge105.us.preheader, label %._crit_edge106.thread

._crit_edge105.us.preheader:                      ; preds = %._crit_edge105.lr.ph
  %wide.trip.count168 = zext i32 %0 to i64
  %wide.trip.count172 = zext i32 %1 to i64
  br label %._crit_edge105.us

._crit_edge106.thread:                            ; preds = %._crit_edge105.lr.ph
  %72 = add nsw i32 %0, -1
  br label %._crit_edge117

._crit_edge105.us:                                ; preds = %._crit_edge127.us, %._crit_edge105.us.preheader
  %indvars.iv170 = phi i64 [ 0, %._crit_edge105.us.preheader ], [ %indvars.iv.next171, %._crit_edge127.us ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge105.us
  %indvars.iv166 = phi i64 [ 0, %._crit_edge105.us ], [ %indvars.iv.next167, %._crit_edge ]
  %73 = getelementptr inbounds double, double* %5, i64 %indvars.iv166
  %74 = load double, double* %73, align 8
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv170, i64 %indvars.iv166
  %76 = load double, double* %75, align 8
  %77 = fsub double %76, %74
  store double %77, double* %75, align 8
  %78 = tail call double @sqrt(double %2) #4
  %79 = getelementptr inbounds double, double* %6, i64 %indvars.iv166
  %80 = load double, double* %79, align 8
  %81 = fmul double %78, %80
  %82 = load double, double* %75, align 8
  %83 = fdiv double %82, %81
  store double %83, double* %75, align 8
  %indvars.iv.next167 = add nuw nsw i64 %indvars.iv166, 1
  %exitcond169 = icmp eq i64 %indvars.iv.next167, %wide.trip.count168
  br i1 %exitcond169, label %._crit_edge127.us, label %._crit_edge

._crit_edge127.us:                                ; preds = %._crit_edge
  %indvars.iv.next171 = add nuw nsw i64 %indvars.iv170, 1
  %exitcond173 = icmp eq i64 %indvars.iv.next171, %wide.trip.count172
  br i1 %exitcond173, label %._crit_edge106.loopexit, label %._crit_edge105.us

.lr.ph134.split:                                  ; preds = %.lr.ph134.split, %.lr.ph134.split.preheader
  %indvars.iv183 = phi i64 [ 0, %.lr.ph134.split.preheader ], [ %indvars.iv.next184, %.lr.ph134.split ]
  %84 = getelementptr inbounds double, double* %6, i64 %indvars.iv183
  store double 0.000000e+00, double* %84, align 8
  %sunkaddr101 = shl nsw i64 %indvars.iv183, 3
  %sunkaddr102 = add i64 %sunkaddr101, %sunkaddr100
  %sunkaddr103 = inttoptr i64 %sunkaddr102 to double*
  %85 = load double, double* %sunkaddr103, align 8
  %86 = fdiv double %85, %2
  store double %86, double* %sunkaddr103, align 8
  %87 = tail call double @sqrt(double %86) #4
  %88 = fcmp ugt double %87, 1.000000e-01
  %89 = select i1 %88, double %87, double 1.000000e+00
  store double %89, double* %sunkaddr103, align 8
  %indvars.iv.next184 = add nuw nsw i64 %indvars.iv183, 1
  %exitcond186 = icmp eq i64 %indvars.iv.next184, %wide.trip.count185
  br i1 %exitcond186, label %._crit_edge104.loopexit244, label %.lr.ph134.split

._crit_edge106.loopexit:                          ; preds = %._crit_edge127.us
  br label %._crit_edge106

._crit_edge106:                                   ; preds = %._crit_edge106.loopexit, %._crit_edge104
  %90 = add nsw i32 %0, -1
  %91 = icmp sgt i32 %0, 1
  br i1 %91, label %.lr.ph116, label %._crit_edge117

.lr.ph116:                                        ; preds = %._crit_edge106
  %92 = sext i32 %0 to i64
  br i1 %71, label %.lr.ph116.split.us.preheader, label %.lr.ph116.split.preheader

.lr.ph116.split.preheader:                        ; preds = %.lr.ph116
  %93 = zext i32 %90 to i64
  %94 = add i32 %0, -2
  %95 = zext i32 %94 to i64
  %wide.trip.count160.3 = zext i32 %0 to i64
  %96 = trunc i32 %90 to i2
  br label %.lr.ph116.split

.lr.ph116.split.us.preheader:                     ; preds = %.lr.ph116
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %97 = icmp eq i32 %1, 1
  %wide.trip.count150 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %1 to i64
  %wide.trip.count154 = zext i32 %90 to i64
  br label %.lr.ph116.split.us

.lr.ph116.split.us:                               ; preds = %._crit_edge114.us-lcssa.us.us..lr.ph116.split.us_crit_edge, %.lr.ph116.split.us.preheader
  %indvars.iv152 = phi i64 [ 0, %.lr.ph116.split.us.preheader ], [ %indvars.iv.next153, %._crit_edge114.us-lcssa.us.us..lr.ph116.split.us_crit_edge ]
  %indvars.iv146 = phi i64 [ 1, %.lr.ph116.split.us.preheader ], [ %indvars.iv.next147, %._crit_edge114.us-lcssa.us.us..lr.ph116.split.us_crit_edge ]
  %98 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv152, i64 %indvars.iv152
  store double 1.000000e+00, double* %98, align 8
  %indvars.iv.next153 = add nuw nsw i64 %indvars.iv152, 1
  %99 = icmp slt i64 %indvars.iv.next153, %92
  br i1 %99, label %.lr.ph.us.us.preheader, label %._crit_edge114.us-lcssa.us.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph116.split.us
  %100 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv152
  br label %.lr.ph.us.us

._crit_edge114.us-lcssa.us.us.loopexit:           ; preds = %._crit_edge109.us.us
  br label %._crit_edge114.us-lcssa.us.us

._crit_edge114.us-lcssa.us.us:                    ; preds = %._crit_edge114.us-lcssa.us.us.loopexit, %.lr.ph116.split.us
  %exitcond155 = icmp eq i64 %indvars.iv.next153, %wide.trip.count154
  br i1 %exitcond155, label %._crit_edge117.loopexit, label %._crit_edge114.us-lcssa.us.us..lr.ph116.split.us_crit_edge

._crit_edge114.us-lcssa.us.us..lr.ph116.split.us_crit_edge: ; preds = %._crit_edge114.us-lcssa.us.us
  %indvars.iv.next147 = add nuw nsw i64 %indvars.iv146, 1
  br label %.lr.ph116.split.us

.lr.ph.us.us:                                     ; preds = %._crit_edge109.us.us, %.lr.ph.us.us.preheader
  %indvars.iv148 = phi i64 [ %indvars.iv146, %.lr.ph.us.us.preheader ], [ %indvars.iv.next149, %._crit_edge109.us.us ]
  %101 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv152, i64 %indvars.iv148
  store double 0.000000e+00, double* %101, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %102 = load double, double* %100, align 8
  %103 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv148
  %104 = load double, double* %103, align 8
  %105 = fmul double %102, %104
  %106 = fadd double %105, 0.000000e+00
  store double %106, double* %101, align 8
  %107 = bitcast double %106 to i64
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us.us, %.prol.preheader
  %108 = phi i64 [ %107, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  %109 = phi double [ %106, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %97, label %._crit_edge109.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge109.us.us.loopexit:                    ; preds = %.lr.ph.us.us.new
  %110 = bitcast double %126 to i64
  br label %._crit_edge109.us.us

._crit_edge109.us.us:                             ; preds = %.prol.loopexit, %._crit_edge109.us.us.loopexit
  %111 = phi i64 [ %110, %._crit_edge109.us.us.loopexit ], [ %108, %.prol.loopexit ]
  %112 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv148, i64 %indvars.iv152
  %113 = bitcast double* %112 to i64*
  store i64 %111, i64* %113, align 8
  %indvars.iv.next149 = add nuw nsw i64 %indvars.iv148, 1
  %exitcond151 = icmp eq i64 %indvars.iv.next149, %wide.trip.count150
  br i1 %exitcond151, label %._crit_edge114.us-lcssa.us.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %114 = phi double [ %126, %.lr.ph.us.us.new ], [ %109, %.lr.ph.us.us.new.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %115 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv152
  %116 = load double, double* %115, align 8
  %117 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv148
  %118 = load double, double* %117, align 8
  %119 = fmul double %116, %118
  %120 = fadd double %114, %119
  store double %120, double* %101, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %121 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv152
  %122 = load double, double* %121, align 8
  %123 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv148
  %124 = load double, double* %123, align 8
  %125 = fmul double %122, %124
  %126 = fadd double %120, %125
  store double %126, double* %101, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge109.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph116.split:                                  ; preds = %._crit_edge114..lr.ph116.split_crit_edge, %.lr.ph116.split.preheader
  %indvars.iv235 = phi i2 [ %indvars.iv.next236, %._crit_edge114..lr.ph116.split_crit_edge ], [ %96, %.lr.ph116.split.preheader ]
  %indvars.iv233 = phi i64 [ %indvars.iv.next234, %._crit_edge114..lr.ph116.split_crit_edge ], [ 2, %.lr.ph116.split.preheader ]
  %indvars.iv162 = phi i64 [ %indvars.iv.next163, %._crit_edge114..lr.ph116.split_crit_edge ], [ 0, %.lr.ph116.split.preheader ]
  %indvars.iv156 = phi i64 [ %indvars.iv.next157, %._crit_edge114..lr.ph116.split_crit_edge ], [ 1, %.lr.ph116.split.preheader ]
  %127 = zext i2 %indvars.iv235 to i64
  %128 = add nuw nsw i64 %127, 4294967295
  %129 = and i64 %128, 4294967295
  %130 = add i64 %indvars.iv233, %129
  %131 = sub i64 %95, %indvars.iv162
  %132 = trunc i64 %131 to i32
  %133 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv162, i64 %indvars.iv162
  store double 1.000000e+00, double* %133, align 8
  %indvars.iv.next163 = add nuw nsw i64 %indvars.iv162, 1
  %134 = icmp slt i64 %indvars.iv.next163, %92
  br i1 %134, label %.lr.ph113.split.preheader, label %._crit_edge114

.lr.ph113.split.preheader:                        ; preds = %.lr.ph116.split
  %135 = sub i64 %93, %indvars.iv162
  %136 = trunc i64 %135 to i32
  %xtraiter201 = and i32 %136, 3
  %lcmp.mod202 = icmp eq i32 %xtraiter201, 0
  br i1 %lcmp.mod202, label %.lr.ph113.split.prol.loopexit, label %.lr.ph113.split.prol.preheader

.lr.ph113.split.prol.preheader:                   ; preds = %.lr.ph113.split.preheader
  br label %.lr.ph113.split.prol

.lr.ph113.split.prol:                             ; preds = %.lr.ph113.split.prol.preheader, %.lr.ph113.split.prol..lr.ph113.split.prol_crit_edge
  %indvars.iv158.prol = phi i64 [ %indvars.iv.next159.prol, %.lr.ph113.split.prol..lr.ph113.split.prol_crit_edge ], [ %indvars.iv156, %.lr.ph113.split.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph113.split.prol..lr.ph113.split.prol_crit_edge ], [ %xtraiter201, %.lr.ph113.split.prol.preheader ]
  %137 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv162, i64 %indvars.iv158.prol
  store double 0.000000e+00, double* %137, align 8
  %138 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv158.prol, i64 %indvars.iv162
  %139 = bitcast double* %138 to i64*
  store i64 0, i64* %139, align 8
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph113.split.prol.loopexit.loopexit, label %.lr.ph113.split.prol..lr.ph113.split.prol_crit_edge, !llvm.loop !3

.lr.ph113.split.prol..lr.ph113.split.prol_crit_edge: ; preds = %.lr.ph113.split.prol
  %indvars.iv.next159.prol = add nuw nsw i64 %indvars.iv158.prol, 1
  br label %.lr.ph113.split.prol

.lr.ph113.split.prol.loopexit.loopexit:           ; preds = %.lr.ph113.split.prol
  br label %.lr.ph113.split.prol.loopexit

.lr.ph113.split.prol.loopexit:                    ; preds = %.lr.ph113.split.prol.loopexit.loopexit, %.lr.ph113.split.preheader
  %indvars.iv158.unr = phi i64 [ %indvars.iv156, %.lr.ph113.split.preheader ], [ %130, %.lr.ph113.split.prol.loopexit.loopexit ]
  %140 = icmp ult i32 %132, 3
  br i1 %140, label %._crit_edge114, label %.lr.ph113.split.preheader242

.lr.ph113.split.preheader242:                     ; preds = %.lr.ph113.split.prol.loopexit
  br label %.lr.ph113.split

.lr.ph113.split:                                  ; preds = %.lr.ph113.split.preheader242, %.lr.ph113.split
  %indvars.iv158 = phi i64 [ %indvars.iv.next159.3, %.lr.ph113.split ], [ %indvars.iv158.unr, %.lr.ph113.split.preheader242 ]
  %141 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv162, i64 %indvars.iv158
  store double 0.000000e+00, double* %141, align 8
  %142 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv158, i64 %indvars.iv162
  %143 = bitcast double* %142 to i64*
  store i64 0, i64* %143, align 8
  %indvars.iv.next159 = add nuw nsw i64 %indvars.iv158, 1
  %144 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv162, i64 %indvars.iv.next159
  store double 0.000000e+00, double* %144, align 8
  %145 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next159, i64 %indvars.iv162
  %146 = bitcast double* %145 to i64*
  store i64 0, i64* %146, align 8
  %indvars.iv.next159.1 = add nsw i64 %indvars.iv158, 2
  %147 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv162, i64 %indvars.iv.next159.1
  store double 0.000000e+00, double* %147, align 8
  %148 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next159.1, i64 %indvars.iv162
  %149 = bitcast double* %148 to i64*
  store i64 0, i64* %149, align 8
  %indvars.iv.next159.2 = add nsw i64 %indvars.iv158, 3
  %150 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv162, i64 %indvars.iv.next159.2
  store double 0.000000e+00, double* %150, align 8
  %151 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next159.2, i64 %indvars.iv162
  %152 = bitcast double* %151 to i64*
  store i64 0, i64* %152, align 8
  %indvars.iv.next159.3 = add nsw i64 %indvars.iv158, 4
  %exitcond161.3 = icmp eq i64 %indvars.iv.next159.3, %wide.trip.count160.3
  br i1 %exitcond161.3, label %._crit_edge114.loopexit, label %.lr.ph113.split

._crit_edge114.loopexit:                          ; preds = %.lr.ph113.split
  br label %._crit_edge114

._crit_edge114:                                   ; preds = %._crit_edge114.loopexit, %.lr.ph113.split.prol.loopexit, %.lr.ph116.split
  %exitcond165 = icmp eq i64 %indvars.iv.next163, %93
  br i1 %exitcond165, label %._crit_edge117.loopexit243, label %._crit_edge114..lr.ph116.split_crit_edge

._crit_edge114..lr.ph116.split_crit_edge:         ; preds = %._crit_edge114
  %indvars.iv.next236 = add i2 %indvars.iv235, -1
  %indvars.iv.next234 = add nuw i64 %indvars.iv233, 1
  %indvars.iv.next157 = add nuw nsw i64 %indvars.iv156, 1
  br label %.lr.ph116.split

._crit_edge117.loopexit:                          ; preds = %._crit_edge114.us-lcssa.us.us
  br label %._crit_edge117

._crit_edge117.loopexit243:                       ; preds = %._crit_edge114
  br label %._crit_edge117

._crit_edge117:                                   ; preds = %._crit_edge117.loopexit243, %._crit_edge117.loopexit, %._crit_edge106, %._crit_edge106.thread
  %153 = phi i32 [ %72, %._crit_edge106.thread ], [ %90, %._crit_edge106 ], [ %90, %._crit_edge117.loopexit ], [ %90, %._crit_edge117.loopexit243 ]
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %154, i64 %154
  store double 1.000000e+00, double* %155, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %._crit_edge.us.preheader, label %._crit_edge13

._crit_edge.us.preheader:                         ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge11.us, %._crit_edge.us.preheader
  %indvars.iv14 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next15, %._crit_edge11.us ]
  %9 = mul nsw i64 %indvars.iv14, %8
  br label %._crit_edge9.us._crit_edge

._crit_edge9.us._crit_edge:                       ; preds = %._crit_edge9.us, %._crit_edge.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next, %._crit_edge9.us ]
  %10 = add nsw i64 %indvars.iv, %9
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge9.us

; <label>:14:                                     ; preds = %._crit_edge9.us._crit_edge
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %._crit_edge9.us._crit_edge, %14
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv14, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge11.us, label %._crit_edge9.us._crit_edge

._crit_edge11.us:                                 ; preds = %._crit_edge9.us
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next15, %wide.trip.count
  br i1 %exitcond17, label %._crit_edge13.loopexit, label %._crit_edge.us

._crit_edge13.loopexit:                           ; preds = %._crit_edge11.us
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %2
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
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
